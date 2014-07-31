<?php
require_once APPLICATION_PATH . '/modules/default/controllers/IssueController.php';
class DuIssueController extends IssueController {

    public function confirmNextAction() {
        $user = Auth_Info::getUser();
        Log::infoLog('method=' . __FUNCTION__ . ';user_id=' . $user->user_id . ';Start action', $this->getRequest()->getParams());

        $issueRequest = new DuIssueRequest();
        $issueRequest = $this->session->getData(self::SESSION_ISSUE_REQUEST);

        $canAutoIssue = $issueRequest->checkAutoIssue();

        $assembledControlNumber = ControlNumberCreator::createControlNumber();

        $this->createManagementFolder($issueRequest, $assembledControlNumber);
        $createPdfError = false;
        $customer = MCustomers::getInstance()->getEntryByCode($issueRequest->customer['customer_code']);
        $db = Zynas_Db_Table::getDefaultAdapter();
        $db->beginTransaction();
        try {
            $this->saveDataToTPublishInfo($customer, $issueRequest, $assembledControlNumber);
            $this->saveDataToTPublishProductInfo($issueRequest, $assembledControlNumber);
            $db->commit();
        } catch (Exception $ex) {
            $db->rollBack();
            $e = new Zynas_Exception();
            $e->setErrors($ex->__toString());
            throw $e;
            Log::errorLog('Error log method=' . __FUNCTION__ . ';user_id=' . $user->user_id . ';Error Message=' . $ex->getMessage() . ';End action', $this->getRequest()->getParams());
            FlashMessenger::addError($e->getMessage());
        }

        $db = Zynas_Db_Table::getDefaultAdapter();
        $db->beginTransaction();
        try {
            // Create Pdf file
            $createPdfError = $this->createPdfFile($issueRequest, $assembledControlNumber, $issueRequest->isCustomerDesignation(), $issueRequest->isCustomerFormat());
            Log::infoLog('method=' . __FUNCTION__ . ';user_id=' . $user->user_id . ';Control number=' . $assembledControlNumber, $this->getRequest()->getParams());
            $db->commit();
        }catch (Exception $ex){
            $db->rollBack();
            $createPdfError = true;
            Log::errorLog('Error log method=' . __FUNCTION__ . ';user_id=' . $user->user_id . ';Error Message=' . $ex->getMessage() . ';End action', $this->getRequest()->getParams());
        }

        $this->sendEmail($issueRequest, $assembledControlNumber);

        Log::infoLog('method=' . __FUNCTION__ . ';user_id=' . $user->user_id . ';End action', $this->getRequest()->getParams());

        if ($createPdfError) {
            $this->redirect('/du-issue/nonauto-issue');
            return;
        }
        if (strcmp($issueRequest->ckPdf, '1') === 0 && ($canAutoIssue) && empty($issueRequest->customerFile) && !$issueRequest->isCustomerDesignation()) {
            $this->session->setModuleScope(self::SESSION_ISSUE_CONTROL_NUMBER, $assembledControlNumber);
            $this->redirect('/du-issue/auto-issue');
            return;
        } else {
            $this->session->setModuleScope(self::SESSION_ISSUE_CONTROL_NUMBER, $assembledControlNumber);
            $this->redirect('/du-issue/nonauto-issue');
            return;
        }

    }

    private function sendEmail($issueRequest, $assembledControlNumber) {
        $user = Auth_Info::getUser();
        Log::infoLog('method=' . __FUNCTION__ . ';user_id=' . $user->user_id . ';Control number=' . $assembledControlNumber . ';Start action', $this->getRequest()->getParams());
        //Send email source code - skip this step for debug
        //Send email to login DU
        $data = array('name' => array('{$control_number}', '{$contact}'), 'value' => array($assembledControlNumber, Zynas_Registry::getConfig()->constants->contact_text));
        Mail::getInstance('receipt_issue', $this->view)->send(Auth_Info::getUser()->user_id, Auth_Info::getUser()->name_jp, null, null, $data);

        //Send email to DA
        $emailDA = Zynas_Registry::getConfig()->system->mail->admin_to_email;
        $nameDA = Zynas_Registry::getConfig()->system->mail->admin_to_name;
        Mail::getInstance('receipt_issue', $this->view)->send($emailDA, $nameDA, null, null, $data);
        // Send another email to DA
        $data = array('name' => array('{$control_number}', '{$fqdn}'), 'value' => array($assembledControlNumber, Zynas_Registry::getConfig()->system->fqdn));
        Mail::getInstance('notify_receipt_to_admin', $this->view)->send($emailDA, $nameDA, null, null, $data);

        //h.toshimitsu 該当製品ありメールはPDF作成時に送信する為削除
        //        //Send email to admin if m_summary_before_opinion.result =1
        //         $sendMail = $issueRequest->checkNeededSendMail();
        //         if ($sendMail) {
        //             $data = array('name' => array('{$control_number}', '{$fqdn}'), 'value' => array($assembledControlNumber, Zynas_Registry::getConfig()->system->fqdn));
        //             $emailDA = Zynas_Registry::getConfig()->system->mail->admin_to_email;
        //             $nameDA = Zynas_Registry::getConfig()->system->mail->admin_to_name;
        //             Mail::getInstance('notify_fall_under_to_admin', $this->view)->send($emailDA, $toName, $nameDA, null, $data);
        //         }
        Log::infoLog('method=' . __FUNCTION__ . ';user_id=' . $user->user_id . ';Control number=' . $assembledControlNumber . ';End action', $this->getRequest()->getParams());
    }

    private function saveDataToTPublishInfo($customer, $issueRequest, $assembledControlNumber) {
        $user = Auth_Info::getUser();
        Log::infoLog('method=' . __FUNCTION__ . ';user_id=' . $user->user_id . ';Control number=' . $assembledControlNumber . ';Customer=' . $customer . ';Start action', $this->getRequest()->getParams());
        //Save database here
        if (strcmp($issueRequest->ckPdf, '1') === 0) {
            $row = $this->setDataToRow($customer, $issueRequest, $assembledControlNumber);
            Log::infoLog('Insert data type PDF action=' . __FUNCTION__ . ';user_id=' . $user->user_id . ';Control number=' . $assembledControlNumber . ';Customer=' . $customer . ';End action', $this->getRequest()->getParams());
            $row->publish_type = TPublishInfos::PUBLISH_TYPE_PDF;
            //Write a record to T_Publish_Hist
            PublishHistCreator::createFromRow($row)->save();
            $row->save();
        }
        if (strcmp($issueRequest->ckPaper, '1') === 0) {
            $row = $this->setDataToRow($customer, $issueRequest, $assembledControlNumber);
            Log::infoLog('Insert data type PAPER action=' . __FUNCTION__ . ';user_id=' . $user->user_id . ';Control number=' . $assembledControlNumber . ';Customer=' . $customer . ';End action', $this->getRequest()->getParams());
            $row->do_base_paper = TPublishInfos::DO_PAPER_PENDING;

            $row->publish_type = TPublishInfos::PUBLISH_TYPE_PAPER;
            $row->save();
            //Write a record to T_Publish_Hist
            PublishHistCreator::createFromRow($row)->save();
            Log::infoLog('method=' . __FUNCTION__ . ';user_id=' . $user->user_id . ';Control number=' . $assembledControlNumber . ';End action', $this->getRequest()->getParams());
        }
    }

    private function setDataToRow($customer, $issueRequest, $assembledControlNumber) {
        $user = Auth_Info::getUser();
        Log::infoLog('method=' . __FUNCTION__ . ';user_id=' . $user->user_id . ';Start action', $this->getRequest()->getParams());
        $row = TPublishInfos::getInstance()->createRow();
        $row->create_date = Zynas_Date::dbDatetime();
        $row->create_user = Auth_Info::getUser()->user_id;
        $row->control_number = $assembledControlNumber;
        if ($issueRequest->isCustomerDesignation()) {
            $row->is_coustomer_designation = TPublishInfos::IS_CUSTOMER_DESIGNATION;
            $row->coustomer_designation = $issueRequest->getCustomerDesignationText();
        } else {
            $row->is_coustomer_designation = TPublishInfos::IS_NOT_CUSTOMER_DESIGNATION;
        }
        if (!empty($issueRequest->customerFile)) {
            $row->is_coustomer_format = TPublishInfos::IS_CUSTOMER_FORMAT;
        } else {
            $row->is_coustomer_format = TPublishInfos::IS_NOT_CUSTOMER_FORMAT;
        }
        if ($issueRequest->isCustomerFormat()) {
            $row->export_person = TPublishInfos::EXPORT_PERSON_CUSTOMER;
        } else {
            $row->export_person = TPublishInfos::EXPORT_PERSON_DISCO;
        }
        $arrayFileUpload = $issueRequest->customerFile;
        if (!empty($arrayFileUpload)) {
            for ($j = 0; $j < count($arrayFileUpload); $j++) {
                if (strcmp($j, 0) === 0) {
                    $row->coustomer_format1 = $arrayFileUpload[0]['fileName'];
                }
                if (strcmp($j, 1) === 0) {
                    $row->coustomer_format2 = $arrayFileUpload[1]['fileName'];
                }
                if (strcmp($j, 2) === 0) {
                    $row->coustomer_format3 = $arrayFileUpload[2]['fileName'];
                }
            }
        }

        $row->customer_code = isset($this->_input->customer_code) ? $this->_input->customer_code : isset($customer->customer_code) ? $customer->customer_code : '';
        $row->customer_name = $customer->customer_name;
        if ($issueRequest->canAutoIssue && !$issueRequest->isCustomerDesignation() && !$issueRequest->isCustomerFormat() && strcmp($issueRequest->ckPdf, '1') === 0)
            $row->status = TPublishInfos::STATUS_COMPLETE_ISSUE;
        else {
            $row->status = TPublishInfos::STATUS_NOT_ISSUE;
        }
        //Check doOption
        if (!$issueRequest->canAutoIssue) {
            $row->do_option = TPublishInfos::DO_OPTION_PENDING;
        }
        if (!empty($arrayFileUpload)) {
            $row->do_coustomer_format = TPublishInfos::DO_COUSTOMER_FORMAT_PENDING;
        }
        if ($issueRequest->isCustomerDesignation()) {
            $row->do_coustomer_designation = TPublishInfos::DO_COUSTOMER_DESIGNATION_PENDING;
        }
        Log::infoLog('method=' . __FUNCTION__ . ';user_id=' . $user->user_id . ';Control number=' . $assembledControlNumber . ';End action', $this->getRequest()->getParams());
        return $row;
    }

}
