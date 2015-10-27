<?php 
	class ControllerModuleTagsProducts extends Controller{
		public function index($setting){

			$this->load->model('design/footer_contact');

			$product_tags = $this->model_design_footer_contact->getProductTag();		
		
			$data['tags']=array();
			if($product_tags){
				foreach ($product_tags as $pt) {
					$tag=explode(',', $pt['tag']);
					foreach ($tag as $t) {
						array_push($data['tags'], $t)	;
					}							
				}
			}

			$data['product_tags']=array();
			foreach (array_unique($data['tags']) as $tag) {
				$data['product_tags'][]=array(
					"name"	=> $tag,
					"href"	=> $this->url->link('product/search&tag='.$tag)
				);
			}			
			if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/module/tags_products.tpl')) {
				return $this->load->view($this->config->get('config_template') . '/template/module/tags_products.tpl', $data);
			} 
		}
	}
		
 ?>