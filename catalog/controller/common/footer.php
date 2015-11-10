<?php

class ControllerCommonFooter extends Controller {

	public function index() {

		$this->load->language('common/footer');

		

		if ($this->request->server['HTTPS']) {

			$server = $this->config->get('config_ssl');

		} else {

			$server = $this->config->get('config_url');

		}

		$this->load->model('design/cms_block');
			$cms_block = $this->model_design_cms_block->getBlocks();	
			$blocks_id=array();
			foreach ($cms_block as $block) {
				array_push($blocks_id, $block['id']);
			}	
		$data['cms_block']= array_combine($blocks_id, $cms_block);

		$data['text_information'] = $this->language->get('text_information');

		$data['text_service'] = $this->language->get('text_service');

		$data['text_extra'] = $this->language->get('text_extra');

		$data['text_contact'] = $this->language->get('text_contact');

		$data['text_return'] = $this->language->get('text_return');

		$data['text_sitemap'] = $this->language->get('text_sitemap');

		$data['text_manufacturer'] = $this->language->get('text_manufacturer');

		$data['text_voucher'] = $this->language->get('text_voucher');

		$data['text_affiliate'] = $this->language->get('text_affiliate');

		$data['text_special'] = $this->language->get('text_special');

		$data['text_account'] = $this->language->get('text_account');

		$data['text_order'] = $this->language->get('text_order');

		$data['text_wishlist'] = $this->language->get('text_wishlist');

		$data['text_newsletter'] = $this->language->get('text_newsletter');

		$data['url_new_letter']   = $this->url->link('account/login');

		$data['button_cart'] = $this->language->get('button_cart');

		if (is_file(DIR_IMAGE . $this->config->get('config_logo'))) {

			$data['logo'] = $server . 'image/' . $this->config->get('config_logo');

		} else {

			$data['logo'] = '';

		}



		$this->load->model('catalog/information');

		$this->load->model('design/links_footer');

		$this->load->model('design/footer_contact');



		$contact_info	=$this->model_design_footer_contact->getContact();



		if(!empty($contact_info)){

			$info=$contact_info;

		}

		else{

			$info	=array();

		}	



		$data['links'] =$this->model_design_links_footer->getLink();

		$data['informations'] = array();



		if(!empty($info[0]['footer_logo'])){

			$image=$info[0]['footer_logo'];

		}	

		else{

			$image='';

		}		



		if ($this->request->server['HTTPS']) {

			$new_image= $this->config->get('config_ssl') . 'image/' . $image;

		} else {

			$new_image= $this->config->get('config_url') . 'image/' . $image;

		}



		$data['info']	=array(

			"footer_logo"	=>	$new_image,

			"footer_slogan"	=>	html_entity_decode($info[0]['footer_slogan']),

			"contact_info"	=> html_entity_decode($info[0]['contact_info'])

			);



		foreach ($this->model_catalog_information->getInformations() as $result) {

			if ($result['bottom']) {

				$data['informations'][] = array(

					'title' => $result['title'],

					'href'  => $this->url->link('information/information', 'information_id=' . $result['information_id'])

				);

			}

		}



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

				"href"	=> $this->url->link('product/search','tag='.urlencode($tag))

			);

		}

	

		$data['contact'] = $this->url->link('information/contact');

		$data['return'] = $this->url->link('account/return/add', '', 'SSL');

		$data['sitemap'] = $this->url->link('information/sitemap');

		$data['manufacturer'] = $this->url->link('product/manufacturer');

		$data['voucher'] = $this->url->link('account/voucher', '', 'SSL');

		$data['affiliate'] = $this->url->link('affiliate/account', '', 'SSL');

		$data['special'] = $this->url->link('product/special');

		$data['account'] = $this->url->link('account/account', '', 'SSL');

		$data['order'] = $this->url->link('account/order', '', 'SSL');

		$data['wishlist'] = $this->url->link('account/wishlist', '', 'SSL');

		$data['newsletter'] = $this->url->link('account/newsletter', '', 'SSL');



		//$data['powered'] = sprintf($this->language->get('text_powered'), $this->config->get('config_name'), date('Y', time()));

		$data['powered']	= html_entity_decode($info[0]['footer_text']);

		// Whos Online

		if ($this->config->get('config_customer_online')) {

			$this->load->model('tool/online');



			if (isset($this->request->server['REMOTE_ADDR'])) {

				$ip = $this->request->server['REMOTE_ADDR'];

			} else {

				$ip = '';

			}



			if (isset($this->request->server['HTTP_HOST']) && isset($this->request->server['REQUEST_URI'])) {

				$url = 'http://' . $this->request->server['HTTP_HOST'] . $this->request->server['REQUEST_URI'];

			} else {

				$url = '';

			}



			if (isset($this->request->server['HTTP_REFERER'])) {

				$referer = $this->request->server['HTTP_REFERER'];

			} else {

				$referer = '';

			}



			$this->model_tool_online->whosonline($ip, $this->customer->getId(), $url, $referer);

		}



		if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/common/footer.tpl')) {

			return $this->load->view($this->config->get('config_template') . '/template/common/footer.tpl', $data);

		} else {

			return $this->load->view('default/template/common/footer.tpl', $data);

		}

	}

}