<?php 
	class ControllerModuleProductstab extends Controller{
		public function index($setting){
			$data['pass']="pass";
			if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/module/products_tab.tpl')) {
				return $this->load->view($this->config->get('config_template') . '/template/module/products_tab.tpl', $data);
			} else {
				return $this->load->view('default/template/module/featured.tpl', $data);
			}
		}
	}
		
 ?>