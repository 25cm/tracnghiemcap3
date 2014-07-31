<?php

class IssueController extends Controller {

    const SESSION_MAIN_CATEGORY = "MAIN_CATEGORY";
    const SESSION_PRODUCT_NUMBER = "PRODUCT_NUMBER";
    const SESSION_CATEGORY_NAME2 = "CATEGORY_NAME2";
    const SESSION_ISSUE_REQUEST = "ISSUE_REQUEST";
    const SESSION_ISSUE_CONTROL_NUMBER = "ISSUE_CONTROL_NUMBER";
    const FOLDER_PARAMETER_SHEET = "/var/parameterSheet/";
    const SESSION_ORDER_PRODUCT = "SESSION_ORDER_PRODUCT";
    const SESSION_CUSTOMER_CODE = "SESSION_CUSTOMER_CODE";

    public function indexAction() {

    }

    public function newproductAction() {
        $user = Auth_Info::getUser();
        Log::infoLog('method=' . __FUNCTION__ . ';user_id=' . $user->user_id . ';Start action;', $this->getRequest()->getParams());

        $ajaxContext = $this->_helper->getHelper('AjaxContext');
        $ajaxContext->addActionContext('newproduct', 'html')->initContext();
        $id = $this->_getParam('index', null);
        $issueProduct = new IssueProduct($id);
        $this->view->issue_product = $issueProduct;

        Log::infoLog('method=' . __FUNCTION__ . ';user_id=' . $user->user_id . ';End action;', $this->getRequest()->getParams());
    }

    public function newfileAction() {
        $user = Auth_Info::getUser();
        Log::infoLog('method=' . __FUNCTION__ . ';user_id=' . $user->user_id . ';Start action;', $this->getRequest()->getParams());

        $ajaxContext = $this->_helper->getHelper('AjaxContext');
        $ajaxContext->addActionContext('newfile', 'html')->initContext();
        $id = $this->_getParam('index', null);
        $this->view->index = $id;

        Log::infoLog('method=' . __FUNCTION__ . ';user_id=' . $user->user_id . ';End action;', $this->getRequest()->getParams());
    }

    public function autoIssueAction() {
        $user = Auth_Info::getUser();
        Log::infoLog('method=' . __FUNCTION__ . ';user_id=' . $user->user_id . ';Start action;', $this->getRequest()->getParams());

        $controlNumber = $this->session->getData(self::SESSION_ISSUE_CONTROL_NUMBER);
        $this->session->removeData(self::SESSION_ISSUE_REQUEST);
        $this->session->removeData(self::SESSION_ISSUE_CONTROL_NUMBER);
        $tPublishInfoRow = TPublishInfos::getInstance()->getRow($controlNumber, TPublishInfos::PUBLISH_TYPE_PDF);
        $tPublishInfoRowPaper = TPublishInfos::getInstance()->getRow($controlNumber, TPublishInfos::PUBLISH_TYPE_PAPER);
        $this->view->row = $tPublishInfoRow;
        $this->view->rowPaper = $tPublishInfoRowPaper;
        $this->view->contact = Zynas_Registry::getConfig()->constants->contact;

        Log::infoLog('method=' . __FUNCTION__ . ';user_id=' . $user->user_id . ';End action;', $this->getRequest()->getParams());
    }

    public function nonautoIssueAction() {
        $user = Auth_Info::getUser();
        Log::infoLog('method=' . __FUNCTION__ . ';user_id=' . $user->user_id . ';Start action;', $this->getRequest()->getParams());

        $this->session->removeData(self::SESSION_ISSUE_REQUEST);
        $controlNumber = $this->session->getData(self::SESSION_ISSUE_CONTROL_NUMBER);
        $this->session->removeData(self::SESSION_ISSUE_CONTROL_NUMBER);

        Log::infoLog('method=' . __FUNCTION__ . ';user_id=' . $user->user_id . ';Start action;', $this->getRequest()->getParams());
    }

    public function orderAddAction() {
        $user = Auth_Info::getUser();
        Log::infoLog('method=' . __FUNCTION__ . ';user_id=' . $user->user_id . ';Start action;', $this->getRequest()->getParams());

        $arrOrderId = $this->_input->select;
        $this->session->setModuleScope(self::SESSION_ORDER_PRODUCT, $arrOrderId);

        Log::infoLog('method=' . __FUNCTION__ . ';user_id=' . $user->user_id . ';End action;', $this->getRequest()->getParams());
    }

    public function downloadAction() {
        $user = Auth_Info::getUser();
        Log::infoLog('method=' . __FUNCTION__ . ';user_id=' . $user->user_id . ';Start action;', $this->getRequest()->getParams());

        $this->_helper->layout->disableLayout();
        $this->_helper->viewRenderer->setNoRender(true);
        if ($this->getRequest()->isGet()) {
            $fileName = $this->_input->filename;
            $controlNumber = $this->_input->controlnumber;
            $tPublishInfoRow = TPublishInfos::getInstance()->getRow($controlNumber, TPublishInfos::PUBLISH_TYPE_PDF);
            $date = DateTime::createFromFormat('Y-m-d H:i:s', $tPublishInfoRow->create_date);
            $yymm = $date->format("Ym");
            $tfile = APPLICATION_PATH . self::FOLDER_PARAMETER_SHEET . $yymm . "/" . $controlNumber . "/" . $fileName;
            // Set header for each type of files
            header("Content-Type: application/pdf");
            $tp = pathinfo($tfile);

            header("Content-Length: " . filesize($tfile));

            header('Content-Transfer-Encoding: Binary');
            header('Accept-Ranges: bytes');

            header('ETag: "' . md5($tfile) . '"');
            header("Cache-Control: no-cache, must-revalidate");
            header("Pragma: no-cache");
            Log::infoLog('Download file method=' . __FUNCTION__ . ';user_id=' . $user->user_id . ';Control number=' . $controlNumber . ';File name=' . $fileName . ';Start action;', $this->getRequest()->getParams());
            FileManager::readfileChunked($tfile);
        }

        Log::infoLog('method=' . __FUNCTION__ . ';user_id=' . $user->user_id . ';End action;', $this->getRequest()->getParams());
    }

    public function handleErrorRequest() {
        $user = Auth_Info::getUser();

    }

    public function handleErrorConfirmRequest() {
        $user = Auth_Info::getUser();

    }

    public function addCustomerAction() {
        $user = Auth_Info::getUser();
        Log::infoLog('method=' . __FUNCTION__ . ';user_id=' . $user->user_id . ';Start action;', $this->getRequest()->getParams());
        $this->_helper->layout->disableLayout();
        $this->_helper->viewRenderer->setNoRender(TRUE);
        $customerCode = $this->_input->customer_code;
        $this->session->setModuleScope(self::SESSION_CUSTOMER_CODE, $customerCode);
        Log::infoLog('method=' . __FUNCTION__ . ';user_id=' . $user->user_id . ';End action;', $this->getRequest()->getParams());
    }

    public function getcustomerAction() {
        $user = Auth_Info::getUser();
        Log::infoLog('method=' . __FUNCTION__ . ';user_id=' . $user->user_id . ';Start action;', $this->getRequest()->getParams());
        $this->_helper->layout->disableLayout();
        $this->_helper->viewRenderer->setNoRender(TRUE);
        $customerCode = $this->session->getData(self::SESSION_CUSTOMER_CODE);
        $this->session->removeData(self::SESSION_CUSTOMER_CODE);
        if ($customerCode) {
            $customer = MCustomers::getInstance()->getEntryByCode($customerCode);
            $customerJson = Zend_Json::encode(array('customer_name' => $customer->customer_name, 'customer_code' => $customer->customer_code));
            echo $customerJson;
            return;
        } else {
            return;
        }
        Log::infoLog('method=' . __FUNCTION__ . ';user_id=' . $user->user_id . ';End action;', $this->getRequest()->getParams());
    }

    public function addorderproductAction() {
        $user = Auth_Info::getUser();
        Log::infoLog('method=' . __FUNCTION__ . ';user_id=' . $user->user_id . ';Start action;', $this->getRequest()->getParams());
        $arrayOrderProductData = $this->session->getData(self::SESSION_ORDER_PRODUCT);
        $this->session->removeData(self::SESSION_ORDER_PRODUCT);
        if ($arrayOrderProductData) {
            $ajaxContext = $this->_helper->getHelper('AjaxContext');
            $ajaxContext->addActionContext('addorderproduct', 'html')->initContext();
            $id = $this->_getParam('index', null);
            $noProduct = $this->_getParam('noproduct', null);
            $arrayIssueProduct = array();
            foreach ($arrayOrderProductData as $key => $orderProductId) {
                $tOrderRow = TOrders::getInstance()->getEntryById($orderProductId);
                if (!empty($tOrderRow)) {
                    $mProductRow = MProducts::getInstance()->getProduct($tOrderRow->product_number);
                    if (!empty($mProductRow)) {

                        switch ($mProductRow->product_category) {
                            case MCategorys::CATEGORY_DEVICE :
                                $issueProduct = new IssueProduct($id + $key, MCategorys::CATEGORY_DEVICE, $tOrderRow->product_number, isset($tOrderRow->serial_number) ? $tOrderRow->serial_number : '');
                                $arrayIssueProduct[] = $issueProduct;
                                break;
                            case MCategorys::CATEGORY_SUBDEVICE :
                                $issueProduct = new IssueProduct($id + $key, MCategorys::CATEGORY_SUBDEVICE, null, null, isset($mProductRow->product_number_view) ? $mProductRow->product_number_view : '');
                                $arrayIssueProduct[] = $issueProduct;
                                break;
                            case MCategorys::CATEGORY_PWP :
                                $issueProduct = new IssueProduct($id + $key, MCategorys::CATEGORY_PWP, null, null, null, '01', $mProductRow->product_number);
                                $arrayIssueProduct[] = $issueProduct;
                                break;
                            default :
                                break;
                        }
                    }
                }
            }

            $this->view->arrOrderProduct = $arrayIssueProduct;
            $this->view->newNoProduct = $noProduct + count($arrayOrderProductData);
            $this->view->currentProductIndex = $id;
        } else {
            $this->_helper->layout->disableLayout();
            $this->_helper->viewRenderer->setNoRender(true);
        }

        Log::infoLog('method=' . __FUNCTION__ . ';user_id=' . $user->user_id . ';End action;', $this->getRequest()->getParams());
    }

    public function nextAction() {
        $user = Auth_Info::getUser();
        Log::infoLog('method=' . __FUNCTION__ . ';user_id=' . $user->user_id . ';Start action;', $this->getRequest()->getParams());

        $customer = MCustomers::getInstance()->getEntryById(Auth_Info::getUser()->user_id);
        $this->view->customer = $customer;
        $this->view->user = Auth_Info::getUser();
        $issueRequest = $this->session->getData(self::SESSION_ISSUE_REQUEST);
        $issueRequest->generateDisplayName();
        $this->view->issue_request = $issueRequest;
        $this->view->auto_issue = $issueRequest->checkAutoIssue();

        Log::infoLog('method=' . __FUNCTION__ . ';user_id=' . $user->user_id . ';End action;', $this->getRequest()->getParams());
    }

    protected function confirmRequestAction() {
        $user = Auth_Info::getUser();
        Log::infoLog('method=' . __FUNCTION__ . ';user_id=' . $user->user_id . ';Start action;', $this->getRequest()->getParams());

        if ($this->getRequest()->isGet()) {
            switch ($user->user_type) {
                case MUsers::DISCO_USER :
                    $this->_redirect("/du-issue/request");
                    break;
                case MUsers::DISCO_ADMIN :
                    $this->_redirect("/du-issue/request");
                    break;
                case MUsers::END_USER :
                    $this->_redirect("/eu-issue/request");
                    break;
                default :
                    break;
            }
            return;
        }

        if (!empty($this->view->errors)) {
            function findErrorProduct($field) {
                if (strpos($field, 'select_main_product_category_') !== false || strpos($field, 'select_product_number_') !== false || strpos($field, 'text_serial_number_') !== false || strpos($field, 'text_product_number_view_') !== false || strpos($field, 'select_model_serial_') !== false || strpos($field, 'text_product_number_') !== false || strpos($field, 'select_category_name2_') !== false) {
                    return $field;
                }
            }

            $errors = $this->view->errors;
            $fields = array_filter(array_keys($errors), 'findErrorProduct');
            if ($fields) {
                $errors['product_error'] = E079V;
                $this->view->errors = $errors;
            }
        }
        $adapter = new Zend_File_Transfer_Adapter_Http();
        $files = $adapter->getFileInfo();

        if (!empty($files)) {
            $adapter->addValidator('Extension', false, Zynas_Registry::getConfig()->document->type);
            if (!$adapter->isValid()) {
                $errors = $this->view->errors;
                $errors['customer_file'] = E026V;
                $this->view->errors = $errors;
            } else {
                foreach ($files as $fieldname => $fileinfo) {
                    if (strlen($fileinfo['name']) > 255) {
                        $errors = $this->view->errors;
                        $errors['customer_file'] = E027V;
                        $this->view->errors = $errors;
                    }
                }
            }
        }
        if (!isset($this->view->errors) || empty($this->view->errors)) {
            if ($this->getRequest()->isPost()) {
                $issueRequest;
                switch ($user->user_type) {
                    case MUsers::DISCO_USER :
                        $issueRequest = new DuIssueRequest();
                        break;
                    case MUsers::DISCO_ADMIN :
                        $issueRequest = new DuIssueRequest();
                        break;
                    case MUsers::END_USER :
                        $issueRequest = new IssueRequest();
                        break;
                    default :
                        break;
                }
                $this->preValidateIssue($issueRequest);
                $this->session->setModuleScope(self::SESSION_ISSUE_REQUEST, $issueRequest);

                switch ($user->user_type) {
                    case MUsers::DISCO_USER :
                        $this->_redirect("/du-issue/next");
                        break;
                    case MUsers::DISCO_ADMIN :
                        $this->_redirect("/du-issue/next");
                        break;
                    case MUsers::END_USER :
                        $this->_redirect("/eu-issue/next");
                        break;
                    default :
                        break;
                }
            } else {
                $this->_redirect("/error");
            }
        } else {
            return $this->handleErrorConfirmRequest();
        }
        Log::infoLog('method=' . __FUNCTION__ . ';user_id=' . $user->user_id . ';End action;', $this->getRequest()->getParams());
    }

    public function requestAction() {
        $user = Auth_Info::getUser();
        Log::infoLog('method=' . __FUNCTION__ . ';user_id=' . $user->user_id . ';Start action;', $this->getRequest()->getParams());

        switch ($user->user_type) {
            case MUsers::DISCO_USER :
                $issueRequest = new DuIssueRequest(null, null, null, array('postal_unit' => $user->unit_name, 'postal_name' => $user->name_jp));
                break;
            case MUsers::DISCO_ADMIN :
                $issueRequest = new DuIssueRequest(null, null, null, array('postal_unit' => $user->unit_name, 'postal_name' => $user->name_jp));
                break;
            case MUsers::END_USER :
                $issueRequest = new IssueRequest();
                break;
            default :
                break;
        }

        $issue = $this->session->getData(self::SESSION_ISSUE_REQUEST);
        if (isset($this->_input->target)) {
            $this->view->issue_request = $issue;
        } else {
            $this->view->issue_request = $issueRequest;
        }
        $this->session->removeData(self::SESSION_ISSUE_REQUEST);
        Log::infoLog('method=' . __FUNCTION__ . ';user_id=' . $user->user_id . ';End action;', $this->getRequest()->getParams());
    }

    protected function createManagementFolder($issueRequest, $assembledControlNumber) {
        $user = Auth_Info::getUser();
        Log::infoLog('method=' . __FUNCTION__ . ';user_id=' . $user->user_id . ';Control number=' . $assembledControlNumber . ';Start action;', $this->getRequest()->getParams());
        //Create the folder which contain parameter sheet
        if (!is_dir(APPLICATION_PATH . self::FOLDER_PARAMETER_SHEET)) {
            FileManager::createDirectory(APPLICATION_PATH . self::FOLDER_PARAMETER_SHEET);
        }
        if (!is_dir(APPLICATION_PATH . self::FOLDER_PARAMETER_SHEET . date('Ym') . '/')) {
            FileManager::createDirectory(APPLICATION_PATH . self::FOLDER_PARAMETER_SHEET . date('Ym') . '/');
        }
        $folderUpload = APPLICATION_PATH . self::FOLDER_PARAMETER_SHEET . date('Ym') . '/' . $assembledControlNumber;
        if (!is_dir($folderUpload)) {
            FileManager::createDirectory($folderUpload);
        }
        //Copy customer file from temporary folder to parameterSheet/control_number/customer folder
        $arrayFileUpload = $issueRequest->customerFile;

        foreach ($arrayFileUpload as $file) {
            Log::infoLog('Upload file method=' . __FUNCTION__ . ';user_id=' . $user->user_id . ';File name=' . $file['fileName'] . ';Control number=' . $assembledControlNumber . ';Start action;', $this->getRequest()->getParams());
            FileManager::copyFile($file['fileName'], $file['tempFolder'], $folderUpload . '/customer/');
        }
        if ($arrayFileUpload) {
            $success = FileManager::deleteDirAndFile($arrayFileUpload[0]['tempFolder']);
            if (!$success) {
                throw new Zynas_Exception($arrayFileUpload[0]['tempFolder'] . 'このフォルダを削除ができません');
            }
        }
    }

    protected function saveDataToTPublishProductInfo($issueRequest, $assembledControlNumber) {
        $user = Auth_Info::getUser();
        Log::infoLog('method=' . __FUNCTION__ . ';user_id=' . $user->user_id . ';Control number=' . $assembledControlNumber . ';Start action;', $this->getRequest()->getParams());
        //Write products to T_Publish_Product_Info
        foreach ($issueRequest->arrayIssueProducts as $index => $product) {
            $tPublishProductInfoRow = TPublishProductInfos::getInstance()->createRow();
            $tPublishProductInfoRow->control_number = $assembledControlNumber;
            $tPublishProductInfoRow->control_branch_number = $index;
            $tPublishProductInfoRow->product_category = $product->mainProductCategory;

            switch ($product->mainProductCategory) {
                case MCategorys::CATEGORY_SUBDEVICE :
                    $productFromMProduct = MProducts::getInstance()->getProductByProductNumberView($product->productNumberView);
                    if (!empty($productFromMProduct)) {
                        $tPublishProductInfoRow->product_number = $productFromMProduct->product_number;
                    }
                    break;
                case MCategorys::CATEGORY_DEVICE :
                    $tPublishProductInfoRow->product_number = $product->productNumber;
                    $tPublishProductInfoRow->serial_number = $product->serialNumber;
                    break;
                case MCategorys::CATEGORY_PWP :
                    switch ($product->modelSerial) {
                        case '01' :
                            $tPublishProductInfoRow->product_number = $product->productNumberTxt;
                            break;
                        case '02' :
                            $tPublishProductInfoRow->category = $product->categoryName2;
                            $tPublishProductInfoRow->product_number = null;
                            break;
                        default :
                            break;
                    }
                default :
                    break;
            }

            $tPublishProductInfoRow->product_name_view = $product->productNameView;
            $tPublishProductInfoRow->create_date = Zynas_Date::dbDatetime();
            $tPublishProductInfoRow->create_user = Auth_Info::getUser()->user_id;
            Log::infoLog('Insert products to T_Publish_Product_Info method=' . __FUNCTION__ . ';Create user=' . $user->user_id . ';Control number=' . $assembledControlNumber . ';Product name view=' . $product->productNameView . ';Create date=' . Zynas_Date::dbDatetime() . ';End action;', $this->getRequest()->getParams());
            $tPublishProductInfoRow->save();
        }
        Log::infoLog('method=' . __FUNCTION__ . ';user_id=' . $user->user_id . ';Control number=' . $assembledControlNumber . ';End action;', $this->getRequest()->getParams());
    }

    protected function createPdfFile($issueRequest, $assembledControlNumber, $isCustomerDesignation, $isCustomerFormat) {
        $user = Auth_Info::getUser();
        Log::infoLog('method=' . __FUNCTION__ . ';user_id=' . $user->user_id . ';Control number=' . $assembledControlNumber . ';Start action;', $this->getRequest()->getParams());
        // Create Pdf file
        $createPdfError = false;
        try {
            if ($issueRequest->canAutoIssue) {
                if (strcmp($issueRequest->ckPdf, '1') === 0) {
                    if (!$isCustomerDesignation && !$isCustomerFormat) {
                        $pdfFileNamePdf = Pdf_Connector::callSync($assembledControlNumber, TPublishInfos::PUBLISH_TYPE_PDF);
                        $tPublishInfoRow = TPublishInfos::getInstance()->getRow($assembledControlNumber, TPublishInfos::PUBLISH_TYPE_PDF);
                        $tPublishInfoRow->status = TPublishInfos::STATUS_COMPLETE_ISSUE;
                        $tPublishInfoRow->sysmtem_parameter_sheet = $pdfFileNamePdf;
                        $tPublishInfoRow->update_date = Zynas_Date::dbDatetime();
                        $tPublishInfoRow->update_user = Auth_Info::getUser()->user_id;
                        $tPublishInfoRow->save();
                        //Write a record to T_Publish_Hist
                        PublishHistCreator::createFromRow($tPublishInfoRow)->save();
                    } else {
                        Pdf_Connector::callASync($assembledControlNumber, TPublishInfos::PUBLISH_TYPE_PDF);
                    }
                }
                if (strcmp($issueRequest->ckPdf, '1') === 0) {
                    Pdf_Connector::callASync($assembledControlNumber, TPublishInfos::PUBLISH_TYPE_PAPER);
                }
            }
        } catch(Zynas_Exception $ex) {
            $createPdfError = true;
        }

        Log::infoLog('method=' . __FUNCTION__ . ';user_id=' . $user->user_id . ';Control number=' . $assembledControlNumber . ';End action;', $this->getRequest()->getParams());
        return $createPdfError;
    }

    private function preValidateIssue($issueRequest) {
        // Form has been submitted - run data through preValidation()
        $issueRequest->preValidation($_POST);
        // Get file uploaded
        if (!is_dir(TMP_PATH)) {
            FileManager::createDirectory(TMP_PATH);
        }
        $adapter = new Zend_File_Transfer_Adapter_Http();
        $files = $adapter->getFileInfo();
        if (!empty($files)) {
            if ($adapter->isValid()) {
                $currentDate = date('Ymdhisu') . '_' . microtime(true);
                $tempFolder = TMP_PATH . $currentDate . '_' . Auth_Info::getUser()->user_id . "/";
                // Create a folder /var/tmp/[date_create_issue]_[creator_user_id]
                FileManager::createDirectory($tempFolder);
                $adapter->setDestination($tempFolder);
                foreach ($files as $fieldname => $fileinfo) {
                    if (($adapter->isUploaded($fileinfo['name'])) && ($adapter->isValid($fileinfo['name']))) {
                        $issueRequest->customerFile[] = array('fileName' => $fileinfo['name'], 'tempFolder' => $tempFolder);
                        $adapter->receive($fileinfo['name']);
                    }
                }
            }
        }
    }

    public function newmailccAction() {
        $user = Auth_Info::getUser();
        Log::infoLog('method=' . __FUNCTION__ . ';user_id=' . $user->user_id . ';control_number=' . ';Start action');

        $ajaxContext = $this->_helper->getHelper('AjaxContext');
        $ajaxContext->addActionContext('newmailcc', 'html')->initContext();
        $id = $this->_getParam('index', null);
        $this->view->id_cc = $id;

        Log::infoLog('method=' . __FUNCTION__ . ';user_id=' . $user->user_id . ';control_number=' . ';End action');
    }

}
?>