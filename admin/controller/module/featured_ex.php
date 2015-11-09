<?php
class ControllerModulefeaturedEx extends Controller {
	private $error = array();

	protected function importModel(){		

		$this->load->model('extension/module');
		$this->load->model('catalog/product');
		$this->load->model('catalog/category');
		$this->load->model('extension/featuredex');
		$this->load->model('tool/image');
	}

	public function index() {

		//$this->response->setOutput($this->load->view('module/exFeatured/demo.tpl'));
		$this->importModel();	
		$this->load->language('module/featured_ex');		
		$this->document->setTitle($this->language->get('heading_title'));
		$this->document->addScript('view/javascript/modules/featured_ex.js');	
		$result=$this->model_extension_featuredex->getAllCategories();	

		//print_r($this->request->post);die;

		if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validate()) {
			if (!isset($this->request->get['module_id'])) {	
				$this->model_extension_module->addModule('featured_ex', $this->request->post);								
			} else {	
				$this->model_extension_module->editModule($this->request->get['module_id'], $this->request->post);
			}
			
			$this->session->data['success'] = $this->language->get('text_success');
			$this->response->redirect($this->url->link('extension/module', 'token=' . $this->session->data['token'], 'SSL'));
		}

		$data['heading_title'] = $this->language->get('heading_title');		
		$data['text_edit'] = $this->language->get('text_edit');
		$data['text_enabled'] = $this->language->get('text_enabled');
		$data['text_disabled'] = $this->language->get('text_disabled');				
		$data['entry_name'] = $this->language->get('entry_name');
		$data['entry_product'] = $this->language->get('entry_product');
		$data['entry_limit'] = $this->language->get('entry_limit');
		$data['entry_width'] = $this->language->get('entry_width');
		$data['entry_height'] = $this->language->get('entry_height');
		$data['entry_status'] = $this->language->get('entry_status');
		$data['text_slider']=$this->language->get('text_slider');
		$data['text_grid']=$this->language->get('text_grid');
		$data['text_other']=$this->language->get('text_other');
		$data['text_style']=$this->language->get('text_style');
		$data['entry_row']=$this->language->get('entry_row');
		$data['help_product'] = $this->language->get('help_product');
		$data['button_save'] = $this->language->get('button_save');
		$data['button_cancel'] = $this->language->get('button_cancel');
		$data['category_id']=$result;			
		$data['entry_title']=$this->language->get('text_title');
		$data['token']=$this->session->data['token'];

		//$ypn_demo =$this->model_catalog_product->adgetLatestProducts(8);
		
		if (isset($this->error['warning'])) {
			$data['error_warning'] = $this->error['warning'];
		} else {
			$data['error_warning'] = '';
		}

		if (isset($this->error['name'])) {
			$data['error_name'] = $this->error['name'];
		} else {
			$data['error_name'] = '';
		}
		if (isset($this->error['title'])) {
			$data['error_title'] = $this->error['title'];
		} else {
			$data['error_title'] = '';
		}
		if (isset($this->error['width'])) {
			$data['error_width'] = $this->error['width'];
		} else {
			$data['error_width'] = '';
		}
		if (isset($this->error['row'])) {
			$data['error_row'] = $this->error['row'];
		} else {
			$data['error_row'] = '';
		}
			if (isset($this->error['item'])) {
			$data['error_item'] = $this->error['item'];
		} else {
			$data['error_item'] = '';
		}

		if (isset($this->error['height'])) {
			$data['error_height'] = $this->error['height'];
		} else {
			$data['error_height'] = '';
		}

		$data['breadcrumbs'] = array();

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('text_home'),
			'href' => $this->url->link('common/dashboard', 'token=' . $this->session->data['token'], 'SSL')
		);

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('text_module'),
			'href' => $this->url->link('extension/module', 'token=' . $this->session->data['token'], 'SSL')
		);

		if (!isset($this->request->get['module_id'])) {
			$data['breadcrumbs'][] = array(
				'text' => $this->language->get('heading_title'),
				'href' => $this->url->link('module/featured_ex', 'token=' . $this->session->data['token'], 'SSL')
			);
		} else {
			$data['breadcrumbs'][] = array(
				'text' => $this->language->get('heading_title'),
				'href' => $this->url->link('module/featured_ex', 'token=' . $this->session->data['token'] . '&module_id=' . $this->request->get['module_id'], 'SSL')
			);
		}

		if (!isset($this->request->get['module_id'])) {
			$data['action'] = $this->url->link('module/featured_ex', 'token=' . $this->session->data['token'], 'SSL');
		} else {
			$data['action'] = $this->url->link('module/featured_ex', 'token=' . $this->session->data['token'] . '&module_id=' . $this->request->get['module_id'], 'SSL');
		}		
		$data['action_demo']=$data['action_demo'] = $this->url->link('bigbom/ajax_category', 'token=' . $this->session->data['token'], 'SSL');
		
		$data['cancel'] = $this->url->link('extension/module', 'token=' . $this->session->data['token'], 'SSL');

		if (isset($this->request->get['module_id']) && ($this->request->server['REQUEST_METHOD'] != 'POST')) {
			$module_info = $this->model_extension_module->getModule($this->request->get['module_id']);			
		}	

		$data['token'] = $this->session->data['token'];

		if (isset($this->request->post['name'])) {
			$data['name'] = $this->request->post['name'];
		} elseif (!empty($module_info)) {
			$data['name'] = $module_info['name'];
		} else {
			$data['name'] = '';
		}

		if (isset($this->request->post['title'])) {
			$data['title'] = $this->request->post['title'];
		} elseif (!empty($module_info)) {
			$data['title'] = $module_info['title'];
		} else {
			$data['title'] = '';
		}

		if(isset($this->request->post['products'])){
			$data['cate_products']=$this->request->post['products'];
		}
		elseif(!empty($module_info['products'])){
			$data['cate_products']=$module_info['products'];
		}
		else{$data['cate_products']='ypn';}

		if (isset($this->request->post['categories'])) {
			$data['category_sl'] = $this->request->post['categories'];			
		} elseif (!empty($module_info)&&isset($module_info['categories'])){			
			$data['category_sl'] = $module_info['categories'];			
		} else {
			$data['category_sl'] =$result[1]['category_id'] ;			
		}

		$data['product_by_cate']=$this->getProductByCate($data['category_sl']);

		if(!empty($this->request->post['selected'])){
			$data['product_selected']=$this->request->post['selected'];
		}
		elseif(!empty($module_info)&&isset($module_info['selected'])){
			$data['product_selected']=$module_info['selected'];
		}
		else{$data['product_selected']=array();}

		$this->load->model('catalog/product');

		$data['products'] = array();		

		/*if (isset($this->request->post['product'])) {	
				
			
			$products = $this->request->post['product'];
		} elseif (!empty($module_info)) {			
			$products = $module_info['product'];				
		} else {
			$products = array();
		}

		if(!empty($products)){			
			foreach ($products as $product_id) {
				$product_info = $this->model_catalog_product->$thiuct($product_id);
				if ($product_info) {
					$data['products'][] = array(
						  'product_id' => $product_info['product_id'],
						  'name'       => $product_info['name']
					);
				}
			}
		}*/		
					
		if (isset($this->request->post['limit'])) {
			$data['limit'] = $this->request->post['limit'];
		} elseif (!empty($module_info)) {			
			$data['limit'] = $module_info['limit'];
		} else {
			$data['limit'] = 5;
		}

		if (isset($this->request->post['width'])) {
			$data['width'] = $this->request->post['width'];
		} elseif (!empty($module_info)) {
			$data['width'] = $module_info['width'];
		} else {
			$data['width'] = 200;
		}

		if (isset($this->request->post['height'])) {
			$data['height'] = $this->request->post['height'];
		} elseif (!empty($module_info)) {
			$data['height'] = $module_info['height'];
		} else {
			$data['height'] = 200;
		}

		if (isset($this->request->post['row'])) {
			$data['row'] = $this->request->post['row'];
		} elseif (!empty($module_info)) {
			$data['row'] = $module_info['row'];
		} else {
			$data['row'] = 3;
		}

		if (isset($this->request->post['item'])) {
			$data['item'] = $this->request->post['item'];
		} elseif (!empty($module_info)) {
			$data['item'] = $module_info['item'];
		} else {
			$data['item'] = 4;
		}

		if(isset($this->request->post['resp0'])){
			$data['resp0'] = $this->request->post['resp0'];
		}
		else if(isset($module_info['resp0'])){
			$data['resp0'] = $module_info['resp0'];
		}
		else{
			$data['resp0']=1;
		}

		if(isset($this->request->post['resp480'])){
			$data['resp480']= $this->request->post['resp480'];
		}
		else if(isset($module_info['resp480'])){
			$data['resp480']	= $module_info['resp480'];
		}
		else{
			$data['resp480']	= 2;
		}

		if(isset($this->request->post['resp640'])){
			$data['resp640']= $this->request->post['resp640'];
		}
		else if(isset($module_info['resp640'])){
			$data['resp640'] = $module_info['resp640'];
		}
		else {
			$data['resp640'] = 3;
		}

		if (isset($this->request->post['uncarousel'])) {
			$data['stcarousel'] = $this->request->post['uncarousel'];
		} elseif (!empty($module_info)) {
			$data['stcarousel'] = $module_info['uncarousel'];
		} else {
			$data['stcarousel'] = 'no';
		}

		if (isset($this->request->post['status'])) {
			$data['status'] = $this->request->post['status'];
		} elseif (!empty($module_info)) {
			$data['status'] = $module_info['status'];
		} else {
			$data['status'] = '';
		}
		
		if (isset($this->request->post['style'])) {
			$data['style'] = $this->request->post['style'];
		} elseif (!empty($module_info)) {
			$data['style'] = $module_info['style'];			
		} else {
			$data['style'] = '';

		}		

		if (isset($this->request->get['sort'])) {
			$sort = $this->request->get['sort'];
		} else {
			$sort = 'pd.name';
		}

		if (isset($this->request->get['order'])) {
			$order = $this->request->get['order'];
		} else {
			$order = 'ASC';
		}

		if (isset($this->request->get['page'])) {					
			$page = $this->request->get['page'];
		} else {
			$page = 1;
		}

		$url = '';			
		
		if (isset($this->request->get['sort'])) {
			$url .= '&sort=' . $this->request->get['sort'];
		}

		if (isset($this->request->get['order'])) {
			$url .= '&order=' . $this->request->get['order'];
		}

		if (isset($this->request->get['page'])) {
			$url .= '&page=' . $this->request->get['page'];
		}		

		//$data['add'] = $this->url->link('catalog/product/add', 'token=' . $this->session->data['token'] . $url, 'SSL');
		//$data['copy'] = $this->url->link('catalog/product/copy', 'token=' . $this->session->data['token'] . $url, 'SSL');
		//$data['delete'] = $this->url->link('catalog/product/delete', 'token=' . $this->session->data['token'] . $url, 'SSL');

		$data['products'] = array();

		$filter_data = array(			
			//'sort'            => $sort,
			//'order'           => $order,
			//'start'           => ($page - 1) * $this->config->get('config_limit_admin'),
			//'limit'           => $this->config->get('config_limit_admin')
		);	

		//$product_total = $this->model_catalog_product->getTotalProducts($filter_data);

		$results = $this->model_catalog_product->getProducts($filter_data);

		foreach ($results as $result) {
			if (is_file(DIR_IMAGE . $result['image'])) {
				$image = $this->model_tool_image->resize($result['image'], 40, 40);
			} else {
				$image = $this->model_tool_image->resize('no_image.png', 40, 40);
			}

			$special = false;

			$product_specials = $this->model_catalog_product->getProductSpecials($result['product_id']);

			foreach ($product_specials  as $product_special) {
				if (($product_special['date_start'] == '0000-00-00' || strtotime($product_special['date_start']) < time()) && ($product_special['date_end'] == '0000-00-00' || strtotime($product_special['date_end']) > time())) {
					$special = $product_special['price'];
					break;
				}
			}

			$data['products'][] = array(
				'product_id' => $result['product_id'],
				'image'      => $image,
				'name'       => $result['name']				
			);
		}		
		$data['column_image'] = $this->language->get('column_image');
		$data['column_name'] = $this->language->get('column_name');			

		//$data['token'] = $this->session->data['token'];


		if (isset($this->request->post['selected'])) {
			$data['selected'] = (array)$this->request->post['selected'];
		} else {
			$data['selected'] = array();
		}	
		
		/*$pagination = new Pagination();
		$pagination->total = $product_total;
		$pagination->page = $page;
		$pagination->limit = $this->config->get('config_limit_admin');
		$pagination->url = $this->url->link('module/featured_ex', 'token=' . $this->session->data['token'] . $url . '&page={page}', 'SSL');

		$data['pagination'] = $pagination->render();

		$data['results'] = sprintf($this->language->get('text_pagination'), ($product_total) ? (($page - 1) * $this->config->get('config_limit_admin')) + 1 : 0, ((($page - 1) * $this->config->get('config_limit_admin')) > ($product_total - $this->config->get('config_limit_admin'))) ? $product_total : ((($page - 1) * $this->config->get('config_limit_admin')) + $this->config->get('config_limit_admin')), $product_total, ceil($product_total / $this->config->get('config_limit_admin')));	*/
		$data['sort'] = $sort;	

		/*product-tab */	
		$data['selected_products']=array("Best seller","Special","Lastest","Popular");	

		if(isset($this->request->post['select-product'])){
			$data['tab_select']=$this->request->post['select-product'];
		}
		elseif(!empty($module_info)&&isset($module_info['select-product'])){
			$data['tab_select']=$module_info['select-product'];
		}
		else{$data['tab_select']=array();}

		$data['product_by_tab']=$this->getProductTab($data['tab_select'],1000);		

		$data['header'] = $this->load->controller('common/header');
		$data['column_left'] = $this->load->controller('common/column_left');
		$data['footer'] = $this->load->controller('common/footer');

		$this->response->setOutput($this->load->view('module/exFeatured/featured_ex.tpl', $data));
		
		
	}
	protected function getProductByCate($ip_cate_id){
		
		$productbyId=$this->model_catalog_product->getProductsByCate($ip_cate_id);
		if(!empty($productbyId)){
			foreach ($productbyId as $pid) {
				if(is_file(DIR_IMAGE.$pid['image'])){
					$image=$this->model_tool_image->resize($pid['image'],40,40);
				}else
				{
					$image=$this->model_tool_image->resize('no_image.jpg',20,20);
				}

				$product_by_cate[]=array(
					'product_id' => $pid['product_id'],
					'image'      => $image,
					'name'       => $pid['name'],

				);
			}		
			return $product_by_cate;
			}
			else return array();
	}

	protected function getProductTab($ip_pro_tab,$limit){		
		$this->importModel();		
		switch ($ip_pro_tab) {
			case 0:	
				$products_by_tab=$this->model_catalog_product->adgetBestSellerProducts($limit);
				break;					
			case 1:
				$products_by_tab=$this->model_catalog_product->adgetProductSpecials(array());
				break;
			case 2:
				$products_by_tab=$this->model_catalog_product->adgetLatestProducts($limit);
				break;
			case 3:
				$products_by_tab=$this->model_catalog_product->adgetPopularProducts($limit);
				break;
		}
		if(!empty($products_by_tab)){
			foreach ($products_by_tab as $pbt) {
				if(is_file(DIR_IMAGE.$pbt['image'])){
					$image=$this->model_tool_image->resize($pbt['image'],40,40);
				}
				else $image=$this->model_tool_image->resize('no_image',40,40);

				$pbt_rs[]=array(
				"image"=>$image,
				"product_id"=>$pbt['product_id'],
				"name"=>$pbt['name']
				);
			}
			return $pbt_rs;
		}

		else{return array();}
	}
	protected function validate() {
		if (!$this->user->hasPermission('modify', 'module/featured_ex')) {
			$this->error['warning'] = $this->language->get('error_permission');
		}

		if ((utf8_strlen($this->request->post['name']) < 3) || (utf8_strlen($this->request->post['name']) > 64)) {
			$this->error['name'] = $this->language->get('error_name');
		}

		if (utf8_strlen(utf8_strlen($this->request->post['title']) > 64)) {
			$this->error['title'] = $this->language->get('error_title');
		}

		if (!$this->request->post['width']) {
			$this->error['width'] = $this->language->get('error_width');
		}

		if (!$this->request->post['height']) {
			$this->error['height'] = $this->language->get('error_height');
		}

		if (!$this->request->post['height']) {
			$this->error['height'] = $this->language->get('error_height');
		}

		if (!$this->request->post['row']) {
			$this->error['row'] = $this->language->get('error_row');
		}
		if (!$this->request->post['item']) {
			$this->error['item'] = $this->language->get('error_item');
		}
		return !$this->error;
	}
}