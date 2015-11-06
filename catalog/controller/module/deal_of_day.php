<?php 
	class ControllerModuleDealOfDay extends Controller{		
			public function index($setting){

			$this->load->model('catalog/product');
			$this->load->model('tool/image');
			$data['pass']="value";	

			$data['button_cart'] = $this->language->get('button_cart');
			$data['button_wishlist'] = $this->language->get('button_wishlist');
			$data['button_compare'] = $this->language->get('button_compare');
			$data['button_quickview']="Quick view";			
			$specials=array_slice($this->model_catalog_product->getProductSpecials(),0,(int)$setting['limit']);		
			
			$deal_item=array();
			foreach ($specials as $sp) {	

				if (($this->config->get('config_customer_price') && $this->customer->isLogged()) || !$this->config->get('config_customer_price')) {
					$price = $this->currency->format($this->tax->calculate($sp['price'], $sp['tax_class_id'], $this->config->get('config_tax')));
				} else {
					$price = false;
				}

				if (($this->config->get('config_customer_price') && $this->customer->isLogged()) || !$this->config->get('config_customer_price')) {
					$special = $this->currency->format($this->tax->calculate($sp['special'], $sp['special'], $this->config->get('config_tax')));
				} else {
					$special= false;
				}	

				$product_image =$this->model_catalog_product->getProductImages($sp['product_id']);	
				$pro_img=array();
				foreach ($product_image as $pi) {
					$img=$this->model_tool_image->resize($pi['image'],248,248);					
					array_push($pro_img, $img);
					}

				$product_image =$this->model_catalog_product->getProductImages($sp['product_id']);

				foreach ($product_image as $pi) {
					$img=$this->model_tool_image->resize($pi['image'],248,248);					
					array_push($pro_img, $img);
					}

				$deal_item[]=array(
					'name'			=>htmlentities($sp['name'], ENT_QUOTES),
					'description_modal' 	=> htmlentities($sp['description'], ENT_QUOTES),
					'product_id'	=>$sp['product_id'],
					'thumb'			=>$this->model_tool_image->resize($sp['image'], 248, 248),
					'special'		=>$special,
					'price'			=>$price,
					'rating'		=>$sp['rating'],
					'href'			=>$this->url->link('product/product','product_id='.$sp['product_id']),
					'date_start'	=>$this->model_catalog_product->getDate($sp['product_id'])['date_start'],
					'date_end'		=>$this->model_catalog_product->getDate($sp['product_id'])['date_end'],
					'thumb1'		=>$pro_img[0],
					'images'	  	=>$pro_img
					);			
			}
			$data['deal_total']=$deal_item;

				if(file_exists(DIR_TEMPLATE . $this->config->get('config_template'). '/template/module/exFeatured/deal_of_day.tpl')){
					return $this->load->view($this->config->get('config_template'). '/template/module/exFeatured/deal_of_day.tpl',$data);
				}
				/*else{
					return $this->load->view('bigbom/template/module/exFeatured/deal_of_day.tpl',$data);
			}	*/		
		}
	}
?>