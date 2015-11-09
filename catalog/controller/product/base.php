<?php 
	class ControllerProductBase extends Controller{
		public function index($products){
			$data['products']	=$products['products'];
			$data['layout']		=$products['layout'];	
			$column_left		=$products['column_left'];
			$column_right		=$products['column_right'];	

			$data['button_cart'] = $this->language->get('button_cart');
			$data['button_wishlist'] = $this->language->get('button_wishlist');
			$data['button_compare'] = $this->language->get('button_compare');	
			$data['button_quickview']="Quick view";

			if($column_left && $column_right){
				$data['grid_layout']='col-lg-6 col-md-6 col-sm-12 col-xs-6'; 
			}
			else if($column_left||$column_right){
				$data['grid_layout']='col-lg-3 col-md-3 col-sm-6 col-xs-6';
			}
			else{
				$data['grid_layout']='col-lg-3 col-md-3 col-sm-6 col-xs-6';
			}

			if(file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/product/base.tpl')){	
				return $this->load->view($this->config->get('config_template') . '/template/product/base.tpl', $data);
			}			
		}
	}
 ?>