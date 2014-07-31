<?php
require_once APPLICATION_PATH . '/modules/default/controllers/IssueController.php';
class EuIssueController extends IssueController {

    public function confirmNextAction() {
        $user = Auth_Info::getUser();
        Log::infoLog('method=' . __FUNCTION__ . ';user_id=' . $user->user_id . ';Start action', $this->getRequest()->getParams());

        $issueRequest = new IssueRequest();
        $issueRequest = $this->session->getData(self::SESSION_ISSUE_REQUEST);
        $canAutoIssue = $issueRequest->checkAutoIssue();

        $assembledControlNumber = ControlNumberCreator::createControlNumber();

        $this->createManagementFolder($issueRequest, $assembledControlNumber);

        $mailcc = $this->getEmailCcFromRequest();
        $createPdfError = false;
        $customer = MCustomers::getInstance()->getEntryById(Auth_Info::getUser()->user_id);
        $db = Zynas_Db_Table::getDefaultAdapter();
        $db->beginTransaction();
        try {
            $this->saveDataToTPublishInfo($customer, $issueRequest, $assembledControlNumber, $mailcc);
            Log::infoLog('Insert data to TPublistInfo EU action=' . __FUNCTION__ . ';user_id=' . $user->user_id . ';Control number=' . $assembledControlNumber . ';Customer=' . $customer . ';End action', $this->getRequest()->getParams());
            // Write products
            $this->saveDataToTPublishProductInfo($issueRequest, $assembledControlNumber);
            Log::infoLog('Insert data to TPublishProductInfo EU action=' . __FUNCTION__ . ';user_id=' . $user->user_id . ';Control number=' . $assembledControlNumber . ';End action', $this->getRequest()->getParams());
            $db->commit();
        } catch (Exception $ex) {
            $db->rollBack();
            $e = new Zynas_Exception();
            $e->setErrors($ex->__toString());
            throw $e;
            Log::errorLog('Error Log Method=' . __FUNCTION__ . ';user_id=' . $user->user_id . ';Error Message=' . $e->getMessage() . ';End action' . $row, $this->getRequest()->getParams());
            FlashMessenger::addError($e->getMessage());
        }

        $db = Zynas_Db_Table::getDefaultAdapter();
        $db->beginTransaction();
        try {
            // Create Pdf file
            $createPdfError = $this->createPdfFile($issueRequest, $assembledControlNumber, false, !empty($issueRequest->customerFile));
            Log::infoLog('Create PDF file EU action=' . __FUNCTION__ . ';user_id=' . $user->user_id . ';Control number=' . $assembledControlNumber . ';Customer file=' . !empty($issueRequest->customerFile) . ';End action', $this->getRequest()->getParams());
            $db->commit();
        }catch(Exception $ex) {
            $db->rollBack();
            Log::errorLog('Error Log Method=' . __FUNCTION__ . ';user_id=' . $user->user_id . ';Error Message=' . $e->getMessage() . ';End action' . $row, $this->getRequest()->getParams());
        }

        $this->sendEmail($issueRequest, $assembledControlNumber, $mailcc, $createPdfError);
        Log::infoLog('Send Mail CC Method=' . __FUNCTION__ . ';Sender=' . Zynas_Registry::getConfig()->system->mail->setting->username . ';Mail CC=' . $mailcc . ';Control number=' . $assembledControlNumber . ';End action', $this->getRequest()->getParams());
        if ($createPdfError) {
            $this->redirect('/eu-issue/nonauto-issue');
            return;

        }
        if (strcmp($issueRequest->ckPdf, '1') === 0 && ($canAutoIssue) && empty($issueRequest->customerFile)) {
            $this->session->setModuleScope(self::SESSION_ISSUE_CONTROL_NUMBER, $assembledControlNumber);

            $this->redirect('/eu-issue/auto-issue');
            return;
        } else {
            $this->session->setModuleScope(self::SESSION_ISSUE_CONTROL_NUMBER, $assembledControlNumber);

            $this->redirect('/eu-issue/nonauto-issue');
            return;
        }

        Log::infoLog('method=' . __FUNCTION__ . ';user_id=' . $user->user_id . ';control_number=' . $assembledControlNumber . ';End action');
    }

    private function saveDataToTPublishInfo($customer, $issueRequest, $assembledControlNumber, $mailcc) {
        $user = Auth_Info::getUser();
        Log::infoLog('method=' . __FUNCTION__ . ';user_id=' . $user->user_id . ';Customer=' . $customer . ';Control number=' . $assembledControlNumber . ';Maill CC=' . $mailcc . ';Start action', $this->getRequest()->getParams());
        if (strcmp($issueRequest->ckPdf, '1') === 0) {
            $row = $this->setDataToRow($customer, $issueRequest, $assembledControlNumber, $mailcc);
            Log::infoLog('Insert data to TPublishInfo with PDF type- EU method=' . __FUNCTION__ . ';user_id=' . $user->user_id . ';Control number=' . $assembledControlNumber . ';Customer=' . $customer . ';End action', $this->getRequest()->getParams());
            $row->publish_type = TPublishInfos::PUBLISH_TYPE_PDF;
            $row->save();
            //Write a record to T_Publish_Hist
            PublishHistCreator::createFromRow($row)->save();
        }
        if (strcmp($issueRequest->ckPaper, '1') === 0) {
            $row = $this->setDataToRow($customer, $issueRequest, $assembledControlNumber, $mailcc);
            Log::infoLog('Insert data to TPublishInfo with PAPER type- EU method=' . __FUNCTION__ . ';user_id=' . $user->user_id . ';Control number=' . $assembledControlNumber . ';Customer=' . $customer, $this->getRequest()->getParams());
            $row->do_base_paper = TPublishInfos::DO_PAPER_PENDING;
            $row->publish_type = TPublishInfos::PUBLISH_TYPE_PAPER;
            $row->save();
            //Write a record to T_Publish_Hist
            PublishHistCreator::createFromRow($row)->save();
        }
        Log::infoLog('method=' . __FUNCTION__ . ';user_id=' . $user->user_id . ';Customer=' . $customer . ';Control number=' . $assembledControlNumber . ';Maill CC=' . $mailcc . ';End action', $this->getRequest()->getParams());
    }

    private function setDataToRow($customer, $issueRequest, $assembledControlNumber, $mailcc) {
        $user = Auth_Info::getUser();
        Log::infoLog('method=' . __FUNCTION__ . ';user_id=' . $user->user_id . ';Start action', $this->getRequest()->getParams());
        $row = TPublishInfos::getInstance()->createRow();
        $row->create_date = Zynas_Date::dbDatetime();
        $row->create_user = Auth_Info::getUser()->user_id;
        $row->control_number = $assembledControlNumber;
        if (!empty($issueRequest->customerFile)) {
            $row->is_coustomer_format = TPublishInfos::IS_CUSTOMER_FORMAT;
        } else {
            $row->is_coustomer_format = TPublishInfos::IS_NOT_CUSTOMER_FORMAT;
        }
        $row->export_person = TPublishInfos::EXPORT_PERSON_CUSTOMER;
        $arrayFileUpload = $issueRequest->customerFile;
        if (!empty($arrayFileUpload)) {
            //Need to user for loop because name of row is different ( coustomer_format1 ; coustomer_format2 ; coustomer_format3)
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
        if (!empty($mailcc) && strcmp($mailcc[0], '') !== 0) {
            //Need to user for loop because name of row is different ( send_cc_mail1 ; send_cc_mail2 ; send_cc_mail3)
            for ($i = 0; $i < count($mailcc); $i++) {
                if (strcmp($i, 0) === 0)
                    $row->send_cc_mail1 = $mailcc[0];
                if (strcmp($i, 1) === 0)
                    $row->send_cc_mail2 = $mailcc[1];
                if (strcmp($i, 2) === 0)
                    $row->send_cc_mail3 = $mailcc[2];
            }
        }
        //In the requirement , if any field is blank, it will get data exist from DB and write to t_publish_info
        $row->customer_code = isset($this->_input->customer_code) ? $this->_input->customer_code : isset($customer->customer_code) ? $customer->customer_code : '';
        $row->customer_name = $customer->customer_name;
        $row->send_customer_name = isset($this->_input->customer_name) ? $this->_input->customer_name : $customer->customer_name;
        $row->send_postal_code = isset($this->_input->postal_code) ? $this->_input->postal_code : $customer->postal_code;
        $row->send_address = isset($this->_input->customer_address) ? $this->_input->customer_address : $customer->address1 . $customer->address2 . $customer->address3 . $customer->address4;
        $row->send_tel = isset($this->_input->customer_tel) ? $this->_input->customer_tel : $customer->tel;
        $row->send_mail = isset($this->_input->user_mail) ? $this->_input->user_mail : Auth_Info::getUser()->email;
        $row->send_user_name = isset($this->_input->user_name) ? $this->_input->user_name : Auth_Info::getUser()->name_jp;
        $row->send_unit_name = isset($this->_input->unit_name) ? $this->_input->unit_name : Auth_Info::getUser()->unit_name;
        if ($issueRequest->canAutoIssue && empty($issueRequest->customerFile) && strcmp($issueRequest->ckPdf, '1') === 0)
            $row->status = TPublishInfos::STATUS_COMPLETE_ISSUE;
        else {
            $row->status = TPublishInfos::STATUS_NOT_ISSUE;
        }
        //Check doOption
        if ($issueRequest->canAutoIssue) {
            $row->do_option = TPublishInfos::DO_OPTION_PENDING;
        }
        if (!empty($arrayFileUpload)) {
            $row->do_coustomer_format = TPublishInfos::DO_COUSTOMER_FORMAT_PENDING;
        }
        Log::infoLog('method=' . __FUNCTION__ . ';user_id=' . $user->user_id . ';Control number=' . $assembledControlNumber . ';End action', $this->getRequest()->getParams());
        return $row;
    }

    private function getEmailCcFromRequest() {
        $user = Auth_Info::getUser();
        Log::infoLog('method=' . __FUNCTION__ . ';user_id=' . $user->user_id . ';Start action', $this->getRequest()->getParams());
        function findEmailCc($field) {
            if (strpos($field, 'text_email_cc') !== false) {
                return $field;
            }
        }

        $mailcc = array();
        $data = $this->_input->getEscaped();
        $fields = array_filter(array_keys($data), 'findEmailCc');
        foreach ($fields as $fieldName) {
            $index = ltrim($fieldName, 'text_email_cc');
            $mailcc[] = $data['text_email_cc' . $index];
        }
        Log::infoLog('method=' . __FUNCTION__ . ';user_id=' . $user->user_id . ';End action', $this->getRequest()->getParams());
        return $mailcc;
    }

    private function sendEmail($issueRequest, $assembledControlNumber, $mailcc, $createPdfError) {
        $user = Auth_Info::getUser();
        Log::infoLog('method=' . __FUNCTION__ . ';user_id=' . $user->user_id . ';Control number=' . $assembledControlNumber . ';Start method', $this->getRequest()->getParams());
        /* Send email source code - skip this step for debug*/
        //If publish type is paper
        if (strcmp($issueRequest->ckPaper, '1') === 0 || $createPdfError) {
            // Send email to customer
            $data = array('name' => array('{$control_number}', '{$contact}'), 'value' => array($assembledControlNumber, Zynas_Registry::getConfig()->constants->contact_text));
            Mail::getInstance('receipt_issue', $this->view)->sendCc($this->_input->user_mail, $this->_input->user_name, $mailcc, null, null, $data);

            // Send email to DA
            $emailDA = Zynas_Registry::getConfig()->system->mail->admin_to_email;
            $nameDA = Zynas_Registry::getConfig()->system->mail->admin_to_name;
            Mail::getInstance('receipt_issue', $this->view)->send($emailDA, $nameDA, null, null, $data);
            // Send another email to DA
            $data = array('name' => array('{$control_number}', '{$fqdn}'), 'value' => array($assembledControlNumber, Zynas_Registry::getConfig()->system->fqdn));
            Mail::getInstance('notify_receipt_to_admin', $this->view)->send($emailDA, $nameDA, null, null, $data);
            //h.toshimitsu 該当製品ありメールはPDF作成時に送信する為削除
            // 		} else {
            // 			//Send email to admin if m_summary_before_opinion.result =1
            // 			$sendMail = $issueRequest->checkNeededSendMail();
            // 			if ($sendMail) {
            // 				$data = array('name' => array('{$control_number}', '{$fqdn}'), 'value' => array($assembledControlNumber, Zynas_Registry::getConfig()->system->fqdn));
            // 				$emailDA = Zynas_Registry::getConfig()->system->mail->admin_to_email;
            // 				$nameDA = Zynas_Registry::getConfig()->system->mail->admin_to_name;
            // 				Mail::getInstance('notify_fall_under_to_admin', $this->view)->send($emailDA, $toName, $nameDA, null, $data);
            // 			}
        }
        Log::infoLog('method=' . __FUNCTION__ . ';user_id=' . $user->user_id . ';Control number=' . $assembledControlNumber . ';End action', $this->getRequest()->getParams());
    }

}
