<?php 
	class ControllerModuleImageBlocks extends Controller{
		public function index($setting){
			$this->load->model('tool/image');

			if($setting['image']){
				$image = $this->model_tool_image->resize($setting['image'], $setting['width'], $setting['height']);
				} else {
					$image = $this->model_tool_image->resize('placeholder.png', $setting['width'], $setting['height']);
				}
	
			$data['image']=$image;
			if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/module/image_blocks.tpl')) {
				return $this->load->view($this->config->get('config_template') . '/template/module/image_blocks.tpl',$data);
			} /*else {
				return $this->load->view('default/template/module/image_blocks.tpl',$data);
			}	*/	
		}
	}
 ?>