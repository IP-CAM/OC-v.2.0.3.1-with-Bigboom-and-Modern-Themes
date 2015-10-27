<?php 
	class ControllerCommonMenu extends Controller{
		public function index(){
			$this->load->model('catalog/category');

			$this->load->model('catalog/product');

			$data['home1'] = $this->url->link('common/home');
			$data['home2'] = $this->url->link('common/home2');			
			$data['blog_href']	=$this->url->link('blogs/blogs');
			$data['text_all'] = $this->language->get('text_all');
			$data['contact_href']=$this->url->link('information/contact');

			$data['categories'] = array();

			$categories = $this->model_catalog_category->getCategories(0);
			//print_r($this->model_catalog_category->getCategories(52));die;
			
			foreach ($categories as $category) {
				if ($category['top']) {

					if($category['image']){
						$image=$this->model_tool_image->resize($category['image'],200,300);
					}
					else{
						$image='';
					}

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
								'name'  => $sub['name'] . ($this->config->get('config_product_count') ? ' (' . $this->model_catalog_product->getTotalProducts($filter_data) . ')' : ''),
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
						'href'     => $this->url->link('product/category', 'path=' . $category['category_id']),						
						'image'	   => $image
					);
				}
			}

			if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/common/menu.tpl')) {
				return $this->load->view($this->config->get('config_template') . '/template/common/menu.tpl', $data);
			} /*else {
				return $this->load->view('default/template/common/menu.tpl', $data);
			}*/
		}
	}
 ?>