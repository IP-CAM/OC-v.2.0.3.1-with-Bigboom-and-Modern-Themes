<?php

class ControllerModulefeaturedEx extends Controller {

	public function index($setting) {



		$this->load->language('module/featured_ex');							

		$data['heading_title'] = $setting['title'];

		$data['text_tax'] = $this->language->get('text_tax');	

		$data['button_cart'] = $this->language->get('button_cart');

		$data['button_wishlist'] = $this->language->get('button_wishlist');

		$data['button_compare'] = $this->language->get('button_compare');

		$data['button_quickview']="Quick view";

		$data['row']=$setting['row'];



		$data['item']=$setting['item'];



		$this->load->model('catalog/product');



		$this->load->model('tool/image');



		$data['products'] = array();	

		$new_products	=	$this->model_catalog_product->getLatestProducts(8);
		$spec_products	=	$this->model_catalog_product->getProductSpecials();
	
		$data['new_product_id']=array();
		$data['spec_product_id']=array();
		foreach ($new_products as $new_product) {
			array_push($data['new_product_id'], $new_product['product_id']);
		}

		foreach ($spec_products as $spec_product) {
			array_push($data['spec_product_id'], $spec_product['product_id']);
		}
		
		if (!empty($setting['selected'])) {

			$products = array_slice($setting['selected'], 0, (int)$setting['limit']);



			foreach ($products as $product_id) {

				$product_info = $this->model_catalog_product->getProduct($product_id);

				$product_image =$this->model_catalog_product->getProductImages($product_id);

				$pro_img=array();

				foreach ($product_image as $pi) {

					$img=$this->model_tool_image->resize($pi['image'],$setting['width'],$setting['height']);					

					array_push($pro_img, $img);

				}


				if ($product_info) {

					if ($product_info['image']) {

						$image = $this->model_tool_image->resize($product_info['image'], $setting['width'], $setting['height']);

					} else {

						$image = $this->model_tool_image->resize('placeholder.png', $setting['width'], $setting['height']);

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



					$data['products'][] = array(

						'product_id'  => $product_info['product_id'],

						'thumb'       => htmlentities ($image),

						'thumb1'	  =>htmlentities ($thumb1),

						'name'        =>htmlentities($product_info['name']),

						'description_modal' => htmlentities($product_info['description'], ENT_QUOTES),

						'price'       => $price,

						'special'     => $special,

						'discount'	  => '-'.(100-(round($product_info['discount']*100))).'%',

						'tax'         => $tax,

						'rating'      => $rating,

						'href'        => $this->url->link('product/product', 'product_id=' . $product_info['product_id']),

						'attributes'  =>$this->model_catalog_product->getProductAttributes($product_info['product_id']),						

						'images'=>$pro_img

					);

				}

			}

		

		}	

		if ($data['products']) {

			if(($setting['style']==1)){				

				switch ($setting['uncarousel']) {					

					case 'yes':											

						if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/module/exFeatured/featured_default.tpl')) {

							return $this->load->view($this->config->get('config_template') . '/template/module/exFeatured/featured_default.tpl', $data);

						} /*else {

							return $this->load->view('bigbom/template/module/exFeatured/featured_default.tpl', $data);

						}*/

						break;

					

					case 'no':



						if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/module/exFeatured/featured_ex.tpl')) {							

							return $this->load->view($this->config->get('config_template') . '/template/module/exFeatured/featured_ex.tpl', $data);

						}/* else {

							return $this->load->view('bigbom/template/module/exFeatured/featured_ex.tpl', $data);

						}*/

						break;

					default:

						if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/module/exFeatured/featured_ex.tpl')) {

							return $this->load->view($this->config->get('config_template') . '/template/module/exFeatured/featured_ex.tpl', $data);

						} /*else {

							return $this->load->view('bigbom/template/module/exFeatured/featured_ex.tpl', $data);

						}*/

						break;

				}

				

			}

			elseif($setting['style']==0){

				if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/module/exFeatured/featured_list.tpl')) {

					return $this->load->view($this->config->get('config_template') . '/template/module/exFeatured/featured_list.tpl', $data);

				} /*else {

					return $this->load->view('bigbom/template/module/exFeatured/featured_list.tpl', $data);

				}*/

			}

			else{

				if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/module/exFeatured/featured_other.tpl')) {

					return $this->load->view($this->config->get('config_template') . '/template/module/exFeatured/featured_other.tpl', $data);

				}/* else {

					return $this->load->view('bigbom/template/module/exFeatured/featured_other.tpl', $data);

				}*/

			}

			

		}

	}

}