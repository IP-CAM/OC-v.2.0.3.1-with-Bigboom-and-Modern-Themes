<?php 
	class ControllerModuleProductsTab extends Controller{
		private $error=array();
		public function index(){
			$this->load->language('module/products_tab');
			$this->load->model('catalog/product');
			$this->load->model('extension/categories');
			$this->load->model('tool/image');
			$this->load->model('extension/module');
			$this->document->setTitle($this->language->get('heading_title'));
			$this->document->addScript('view/javascript/extension/products_tab.js');
						
			//print_r($this->request->post);die;
			if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validate()) {			
				if (!isset($this->request->get['module_id'])) {
					$this->model_extension_module->addModule('products_tab', $this->request->post);
				} else {
					$this->model_extension_module->editModule($this->request->get['module_id'], $this->request->post);
				}

				$this->session->data['success'] = $this->language->get('text_success');

				$this->response->redirect($this->url->link('extension/module', 'token=' . $this->session->data['token'], 'SSL'));
			}

			$data['text_tab_name']	=$this->language->get('text_tab_name');
			$data['text_action']	=$this->language->get('text_action');
			$data['button_tab_add']	=$this->language->get('button_tab_add');
			$data['text_name']		=$this->language->get('text_name');
			$data['error_name']		=$this->language->get('error_name');
			$data['heading_title']	=$this->language->get('heading_title');
			$data['button_save']	=$this->language->get('button_save');
			$data['button_cancel']	=$this->language->get('button_cancel');
			$data['text_edit']		=$this->language->get('text_edit');
			$data['text_enabled']	=$this->language->get('text_enabled');
			$data['text_disabled']	=$this->language->get('text_disabled');
			$data['entry_status']	=$this->language->get('entry_status');
			$data['type_product']	=array('Best seller','Special','Lastest','Popular');

			$data['cancel']			=$this->url->link('extension/module','token='.$this->session->data['token'],'SSL');
			$data['token']			=$this->session->data['token'];

			if(isset($this->error['warning'])){
				$data['error_warning']=$this->error['warning'];
			}
			else{
				$data['error_warning']='';
			}

			if (isset($this->error['name'])) {
			$data['error_name'] = $this->error['name'];
			} else {
				$data['error_name'] = '';
			}

			$data['breadcrumbs']=array();
			$data['breadcrumbs'][]=array(
				"text"	=>$this->language->get('text_home'),
				"href"	=>$this->url->link('common/dashboard','token='.$this->session->data['token'],'SSL')
				);
			$data['breadcrumbs'][]=array(
				"text"	=>$this->language->get('text_module'),
				"href"	=>$this->url->link('extension/module','token='.$this->session->data['token'],'SSL')
				);
			if(isset($this->request->get['module_id'])){
				$data['breadcrumbs'][]=array(
					"text"	=>$this->language->get('heading_title'),
					"href"	=>$this->url->link('module/products_tab','token='.$this->session->data['token'],'SSL')
				);
			}

			if (isset($this->request->get['module_id']) && ($this->request->server['REQUEST_METHOD'] != 'POST')) {
				$module_info = $this->model_extension_module->getModule($this->request->get['module_id']);			
			}	

			if(isset($this->request->post['name'])){
				$data['name']=$this->request->post['name'];
			}
			else if(!empty($module_info)){
				$data['name']=$module_info['name'];
			}	
			
			else{
				$data['name']='';
			}		

			if (isset($this->request->post['status'])) {
				$data['status'] = $this->request->post['status'];
			} elseif (!empty($module_info)) {
				$data['status'] = $module_info['status'];
			} else {
				$data['status'] = '';
			}

			if(!isset($this->request->get['module_id'])){				
				$data['action']=$this->url->link('module/products_tab','token='.$this->session->data['token'],'SSL');				
			}
			else{
				$data['action']=$this->url->link('module/products_tab','token='.$this->session->data['token'].'&module_id='.$this->request->get['module_id'],'SSL');
			}			

			//print_r($module_info);die;

			if(isset($this->request->post['tab_info'])){
				$data['tabs']=$this->request->post['tab_info'];
			}
			else if(!empty($module_info)){
				$data['tabs']=$module_info['tab_info'];
			}
			else{
				$data['tabs']=array();
			}		


			$data['categories']=$this->model_extension_categories->getAllCategories();

			$result= $this->model_catalog_product->getProducts(array());

			$products=array();
			foreach ($result as $rs) {
				if(is_file(DIR_IMAGE.$rs['image'])){
					$image=$this->model_tool_image->resize($rs['image'],40,40);
				}
				else{
					$image=$this->model_tool_image->resize('no_image.png',40,40);	
				}

				$products[]=array(
					'product_id'=>$rs['product_id'],
					'name'		=>$rs['name'],
					'image'		=>$image
					);		
			}

			if(isset($this->request->post['tab_info'])){
				$tab_info =$this->request->post['tab_info'];
			}
			else if(!empty($module_info)){
				$tab_info=$module_info['tab_info'];
			}
			else {
				$tab_info=array();
			}

			$cate_sl=array();			
			foreach ($tab_info as $t) {
				if(isset($t['cate_selected'])){
					$results=$this->model_catalog_product->getProductsByCategoryId($t['cate_selected']);
					$response=array();
					foreach ($results as $rs) {
						if(is_file(DIR_IMAGE.$rs['image'])){
							$image=$this->model_tool_image->resize($rs['image'],40,40);
						}
						else{
							$image=$this->model_tool_image->resize('no_image.png',40,40);	
						}
						$response[]=array(								
							'product_id'	=>$rs['product_id'],
							'name'			=>$rs['name'],
							'image'			=>$image
							);		
					}

					$cate_sl[]=array(
							'tab_id'		=>$t['tab_id'],
							'category_id'	=>$t['cate_selected'],
							'products'		=>$response,
						);
				}				
			}	
			
			$limit=8;
			$respone_tab=array();
			$type_sl=array();
			foreach ($tab_info as $t) {
				if(isset($t['type_selected'])){
					switch ($t['type_selected']) {
						case '0':
							$product_by_type=$this->model_catalog_product->adgetBestSellerProducts($limit);							
							break;
						case '1':
							$products_by_type=$this->model_catalog_product->adgetProductSpecials(array());
							break;
						case '2':
							$products_by_type=$this->model_catalog_product->adgetLatestProducts($limit);		
							break;
						case '3':								
							$products_by_type=$this->model_catalog_product->adgetPopularProducts($limit);
							break;
					}

					if(!empty($products_by_type)){
						$pbt_rs=array();							
						foreach ($products_by_type as $pbt) {
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
						$respone_tab =  $pbt_rs;
					}	

					$type_sl[]=array(
					'tab_id'		=>$t['tab_id'],
					'type_product'	=>$t['type_selected'],
					'products'		=>$respone_tab,
					);					
				}			

			}

			$data['cate_selected']=$cate_sl;
			$data['type_selected']=$type_sl;		

			//print_r($cate_sl);die;

			$data['products']=$products;
			$data['header']		=$this->load->controller('common/header');
			$data['column_left']=$this->load->controller('common/column_left');
			$data['footer']		=$this->load->controller('common/footer');
			$this->response->setOutput($this->load->view('module/products_tab.tpl',$data));
		}

		protected function validate(){

			if (!$this->user->hasPermission('modify', 'module/products_tab')) {
			$this->error['warning'] = $this->language->get('error_permission');
			}

			if ((utf8_strlen($this->request->post['name']) < 3) || (utf8_strlen($this->request->post['name']) > 64)) {
				$this->error['name'] = $this->language->get('error_name');
			}

			return !$this->error;

		}
	}
 ?>