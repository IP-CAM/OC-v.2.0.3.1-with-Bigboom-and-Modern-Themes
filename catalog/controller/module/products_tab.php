<?php 
	class ControllerModuleProductstab extends Controller{
		public function index($setting){

			$this->load->model('catalog/product');
			$this->load->model('tool/image');

			$data['button_cart'] = $this->language->get('button_cart');
			$data['button_wishlist'] = $this->language->get('button_wishlist');
			$data['button_compare'] = $this->language->get('button_compare');
			$data['button_quickview']="Quick view";

			if(isset($setting['tab_info'])){
				$tab_info=$setting['tab_info'];
			}

			$tabs=array();

			foreach ($tab_info as $tab) {

				if(isset($tab['selected'])){
					$selected= $tab['selected'];
				}
				else{
					$selected=array();
				}					

				$products=array();		
				
				foreach ($selected as $p) {
					$product_info = $this->model_catalog_product->getProduct($p);
					$product_image =$this->model_catalog_product->getProductImages($p);

					$pro_img=array();
					foreach ($product_image as $pi) {
					$img=$this->model_tool_image->resize($pi['image'],268,346);					
					array_push($pro_img, $img);
					}

					if ($product_info) {
					if ($product_info['image']) {
						$image = $this->model_tool_image->resize($product_info['image'], 268, 346);
					} else {
						$image = $this->model_tool_image->resize('placeholder.png',268, 346);
					}

					if (($this->config->get('config_customer_price') && $this->customer->isLogged()) || !$this->config->get('config_customer_price')) {
						$price = $this->currency->format($this->tax->calculate($product_info['price'], $product_info['tax_class_id'], $this->config->get('config_tax')));
					} else {
						$price = false;
					}

					if ((float)$product_info['special']) {
						$special = $this->currency->format($this->tax->calculate($product_info['special'], $product_info['tax_class_id'], $this->config->get('config_tax')));
					} else {
						$special = false;
					}

					if ($this->config->get('config_tax')) {
						$tax = $this->currency->format((float)$product_info['special'] ? $product_info['special'] : $product_info['price']);
					} else {
						$tax = false;
					}

					if ($this->config->get('config_review_status')) {
						$rating = $product_info['rating'];
					} else {
						$rating = false;
					}

					if(!empty($pro_img)){
						$thumb1=$pro_img[0];
					}
					else{
						$thumb1=$image;
					}

					$products[] = array(
						'product_id'  => $product_info['product_id'],
						'thumb'       => $image,
						'thumb1'	  =>$thumb1,
						'name'        =>htmlentities($product_info['name'],ENT_QUOTES),
						'description_modal' => htmlentities($product_info['description'], ENT_QUOTES),
						'price'       => $price,
						'special'     => $special,
						'tax'         => $tax,
						'rating'      => $rating,
						'href'        => $this->url->link('product/product', 'product_id=' . $product_info['product_id']),
						'images'	  =>$pro_img
					);
					}
				}


				$tabs[]=array(
					'name'	=>	$tab['name'],
					'products'=>$products,
				);
			}
			$data['tabs'] = $tabs;
			if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/module/products_tab.tpl')) {
				return $this->load->view($this->config->get('config_template') . '/template/module/products_tab.tpl', $data);
			} /*else {
				return $this->load->view('default/template/module/featured.tpl', $data);
			}*/
		}
	}
 ?>