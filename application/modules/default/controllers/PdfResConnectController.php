<?php
/**
 * PDF作成処理後のC#連携用コントローラー
 * <pre>
 * </pre>
 * @author htoshimitsu
 * @package /modules/default/controller
 */

class PdfResConnectController extends Controller {

    /**
     * エラーメール送信処理
     */
    public function sendErrorMailAction(){

        try
        {
            Log::infoLog('Start action;',$this->getRequest()->getParams());

            $controlNumber = $this->_getParam('controlNumber');
            $publishType = $this->_getParam('publishType');
            Log::infoLog('params: control_number = ' . $controlNumber . ' publishType = ' . $publishType, $this->getRequest()->getParams());

            if (Zynas_String::isEmpty($controlNumber) || Zynas_String::isEmpty($publishType)){
                Log::errorLog('paramsが設定されていない為、処理を異常終了します。',$this->getRequest()->getParams());
                Log::infoLog('End action;',$this->getRequest()->getParams());
                die;
            }

            Log::infoLog('メール送信開始', $this->getRequest()->getParams());
            $instance = new SendErrorMail();
            $instance->sendPdfError($controlNumber, $publishType, $this->view);
            Log::infoLog('メール送信終了', $this->getRequest()->getParams());

            Log::infoLog('End action;',$this->getRequest()->getParams());
            die;

        }catch(Exception $e){
            Log::errorLog($e,$this->getRequest()->getParams());
            Log::infoLog('End action;',$this->getRequest()->getParams());
            die;
        }
    }
    /**
     *
     * PDF作成終了処理
     */
    public function completePdfAction(){

        try
        {
            Log::infoLog('Start action;',$this->getRequest()->getParams());

            //パラメーターの取得
            $controlNumber = $this->_getParam('controlNumber');
            $publishType = $this->_getParam('publishType');
            $fileName = $this->_getParam('fileName');
            $classificationCnt = $this->_getParam('classificationCnt'); //該当製品件数（通常０件）

            Log::infoLog('params: control_number = ' . $controlNumber . ' publishType = ' . $publishType .' fileName = ' . $fileName .' classificationCnt = ' . $classificationCnt, $this->getRequest()->getParams());

            //パラメータ有無チェック
            if (Zynas_String::isEmpty($controlNumber) ||
                Zynas_String::isEmpty($publishType) ||
                Zynas_String::isEmpty($fileName) ||
                Zynas_String::isEmpty($classificationCnt) ){

                Log::errorLog('paramsが設定されていない為、処理を異常終了します。。',$this->getRequest()->getParams());
                Log::infoLog('End action;',$this->getRequest()->getParams());
                die;
            }

            //DB更新処理
            $this->dbUpdate($controlNumber, $publishType, $fileName);

            //該当製品ありメール送信
            if (is_numeric($classificationCnt) && $classificationCnt > 0)
            {
                Log::infoLog('該当製品ありメール送信開始;',$this->getRequest()->getParams());
                $instance = new SendErrorMail();
                $instance->sendClassficationMail($controlNumber, $publishType, $this->view);
                Log::infoLog('該当製品ありメール送信終了;',$this->getRequest()->getParams());
            }

            Log::infoLog('End action;',$this->getRequest()->getParams());
            die;

        }catch(Exception $e){
            Log::errorLog($e,$this->getRequest()->getParams());
            Log::infoLog('End action;',$this->getRequest()->getParams());
            die;
        }

    }

    /**
     * 該当製品ありメール送信処理
     */
    public function sendClassificationMailAction(){

        try
        {
            Log::infoLog('Start action;',$this->getRequest()->getParams());

            $controlNumber = $this->_getParam('controlNumber');
            $publishType = $this->_getParam('publishType');
            Log::infoLog('params: control_number = ' . $controlNumber . ' publishType = ' . $publishType, $this->getRequest()->getParams());

            if (Zynas_String::isEmpty($controlNumber) || Zynas_String::isEmpty($publishType)){
                Log::errorLog('paramsが設定されていない為、処理を異常終了します。',$this->getRequest()->getParams());
                Log::infoLog('End action;',$this->getRequest()->getParams());
                die;
            }

            Log::infoLog('該当製品ありメール送信開始;',$this->getRequest()->getParams());
            $instance = new SendErrorMail();
            $instance->sendClassficationMail($controlNumber, $publishType, $this->view);
            Log::infoLog('該当製品ありメール送信終了;',$this->getRequest()->getParams());

            Log::infoLog('End action;',$this->getRequest()->getParams());
            die;

        }catch(Exception $e){
            Log::errorLog($e,$this->getRequest()->getParams());
            Log::infoLog('End action;',$this->getRequest()->getParams());
            die;
        }

    }

    private function dbUpdate($controlNumber, $publishType, $fileName){
        $db = Zynas_Db_Table::getDefaultAdapter();
        $db->beginTransaction();
        try {

            $row = TPublishInfos::getInstance()->getRow($controlNumber, $publishType);
            //該当データなしの場合、Exception
            if (is_null($row)) throw new Zynas_Exception('t_publish_infoに該当データが存在しません。');

            //t_publish_infoの更新
            //対応項目が一つも無い場合、ステータスを完了とする。
            if (is_null($row->do_option) &&
                is_null($row->do_coustomer_designation) &&
                is_null($row->do_coustomer_format) &&
                is_null($row->do_base_paper)){

                $row->status = TPublishInfos::STATUS_COMPLETE_ISSUE;
            }

            $row->sysmtem_parameter_sheet = $fileName;
            $row->update_date = Zynas_Date::dbDatetime();
            $row->save();

            //t_publish_histの更新
            PublishHistCreator::createFromRow($row)->save();

            $db->commit();
        } catch (Exception $e) {
            $db->rollBack();
            throw $e;
        }
    }

}
?>