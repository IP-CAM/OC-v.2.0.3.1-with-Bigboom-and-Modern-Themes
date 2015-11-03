<?php 
	class ControllerCommonTopMenu extends Controller{
		public function index(){		
			$data['pass']="pass value";
			if(file_exists(DIR_TEMPLATE . $this->config->get('config_template').'/template/common/top_menu.tpl')){
				return $this->load->view($this->config->get('config_template').'/template/common/top_menu.tpl',$data);
			}
		}
	}
 ?>