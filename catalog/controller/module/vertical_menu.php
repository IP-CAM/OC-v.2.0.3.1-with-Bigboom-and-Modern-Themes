<?php 
	class ControllerModuleVerticalMenu extends Controller{
		public function index($setting){	
				
			$this->document->addScript('catalog/view/javascript/module/vertical_menu.js');

			$data['categories']=$this->load->controller('bigbom/categories');
			$data['cate_conf']	=array();		
			$cate_conf = $setting['category'];

			$this->load->model('tool/image');
			foreach ($cate_conf as $k=>$cf) {
				if(isset($cf['image'])&&is_file(DIR_IMAGE . $cf['image'])){
					$image = $this->model_tool_image->resize($cf['image'],$cf['img_width'],$cf['img_height']);
				}
				else{
					$image = $this->model_tool_image->resize('no_image',$cf['img_width'],$cf['img_height']);
				}

				$data['cate_conf'][$k]=array(
					"awesome"	=>	$cf['awesome'],
					"image"		=> $image					
				);
			}		
						
			$this->load->model('catalog/category');
			$this->load->model('catalog/product');
			$this->load->model('tool/image');
			$data['categories']=array();
			$categories=$this->model_catalog_category->getCategories(0);				
			$name=array();
			
			foreach ($categories as $category) {
				if ($category['top']) {
					// Level 2
					$children_data = array();
					
					$children = $this->model_catalog_category->getCategories($category['category_id']);				
					foreach ($children as $child) {						
						$sub_child =$this->model_catalog_category->getCategories($child['category_id']);	

						$sub_lv2=array();
						foreach ($sub_child as $sub) {
							$filter_data = array(
							'filter_category_id'  => $sub['category_id'],
							'filter_sub_category' => false
							);	

							$sub_lv2[]=array(
								'name'  => $sub['name'],
								'href'  => $this->url->link('product/category', 'path=' . $category['category_id'] . '_' .$child['category_id'] .'_'. $sub['category_id']),						
								);
						}

						$children_data[] = array(
							'name'  => $child['name'],
							'href'  => $this->url->link('product/category', 'path=' . $category['category_id'] . '_' . $child['category_id']),
							'sub_child'=>$sub_lv2
						);
					}

					// Level 1
					
					$data['categories'][] = array(
						'name'     => $category['name'],
						'category_id'=>$category['category_id'],
						'children' => $children_data,
						'column'   => $category['column'] ? $category['column'] : 1,
						'href'     => $this->url->link('product/category', 'path=' . $category['category_id'])						
					);
				}
			}
			
			if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/module/exFeatured/vertical_menu.tpl')) {
				return $this->load->view($this->config->get('config_template') . '/template/module/exFeatured/vertical_menu.tpl',$data);
			} 
		}
	}
 ?>