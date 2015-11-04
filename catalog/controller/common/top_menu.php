<?php 
	class ControllerCommonTopMenu extends Controller{
		public function index(){		
			$this->load->model('design/cms_block');
			$cms_block = $this->model_design_cms_block->getBlocks();	
			$blocks_id=array();
			foreach ($cms_block as $block) {
				array_push($blocks_id, $block['id']);
			}				
			$data['cms_block']= array_combine($blocks_id, $cms_block);					
			if(file_exists(DIR_TEMPLATE . $this->config->get('config_template').'/template/common/top_menu.tpl')){
				return $this->load->view($this->config->get('config_template').'/template/common/top_menu.tpl',$data);
			}
		}
	}
 ?>