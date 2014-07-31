<?php

class AdminAutoIssueController extends Controller
{

	const SESSION_KEY_SEARCH = 'search';
	const SESSION_KEY_PAGE = 'page';
	const SESSION_KEY_RETURN_DETAIL = 'return';

	public function indexAction()
	{
		$user = Auth_Info::getUser();
		Log::infoLog('method='.__FUNCTION__.';user_id='.$user->user_id.';Start action;',$this->getRequest()->getParams());
		$this->session->removeData(self::SESSION_KEY_SEARCH);
		$this->session->removeData(self::SESSION_KEY_PAGE);
		$this->session->removeData(self::SESSION_KEY_RETURN_DETAIL);
		$this->_forward('/autoissue');
		Log::infoLog('method='.__FUNCTION__.';user_id='.$user->user_id.';End action;',$this->getRequest()->getParams());
	}

	public function requestAction(){

	}

	public function autoissueAction()
	{

	}

	public function completeAction()
	{

	}
}

?>