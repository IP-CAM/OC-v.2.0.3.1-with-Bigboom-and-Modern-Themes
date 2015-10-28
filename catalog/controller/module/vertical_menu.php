<?php 
	class ControllerModuleVerticalMenu extends Controller{
		public function index($setting){	

			$this->document->addStyle('catalog/view/javascript/bootstrap/css/bootstrap.min.css');
			$this->document->addStyle('catalog/view/theme/default/stylesheet/main.css');		
			//$this->document->addScript('catalog/view/javascript/vertical_menu.js');

			$data['categories']=$this->load->controller('bigbom/categories');
			$data['awesome']=$setting['awesome'];
						
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
					$filter_data = array(
						'filter_category_id'  => $child['category_id'],
						'filter_sub_category' => true
					);		

					$children_data[] = array(
						'child_cate_id'=>$child['category_id'],
						'name'  => $child['name'] . ($this->config->get('config_product_count') ? ' (' . $this->model_catalog_product->getTotalProducts($filter_data) . ')' : ''),
						'href'  => $this->url->link('product/category', 'path=' . $category['category_id'] . '_' . $child['category_id']),
						'product_id'=>$this->model_catalog_product->getProductbyCate($child['category_id'])					);			
				}
				// Level 1

				if (is_file(DIR_IMAGE . $category['image'])) {
				$image =  $this->config->get('config_ssl') . 'image/' . $category['image'];
				} else {
					$image = $this->model_tool_image->resize('no_image.png', 200, 300);
				}

				$data['categories'][] = array(
					'category_id'=>$category['category_id'],
					'name'     => $category['name'],					
					'children' => $children_data,
					'column'   => $category['column'] ? $category['column'] : 1,
					'href'     => $this->url->link('product/category', 'path=' . $category['category_id']),
					'image'    => $image
				);
			}
		}
			if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/module/exFeatured/vertical_menu.tpl')) {
				return $this->load->view($this->config->get('config_template') . '/template/module/exFeatured/vertical_menu.tpl',$data);
			} 
		}
	}
 ?>