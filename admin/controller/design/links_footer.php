<?php 
	class ControllerDesignLinksFooter extends Controller{

		private $error=array();
		public function index(){
			$this->load->language('design/links_footer');
			$this->document->setTitle($this->language->get('heading_title'));
			$this->getList();
		}

		public function add(){
			$this->load->language('design/links_footer');
			$this->document->setTitle($this->language->get('heading_title'));
			$this->load->model('design/links_footer');
			if(($this->request->server['REQUEST_METHOD']=='POST')&&$this->validateForm()){		

				$this->model_design_links_footer->addLink($this->request->post);

				$this->response->redirect($this->url->link('design/links_footer', 'token=' . $this->session->data['token'], 'SSL'));
			}
			$this->getForm();
		}

		public function edit(){
			$this->load->language('design/links_footer');
			$this->document->setTitle($this->language->get('heading_title'));
			$this->load->model('design/links_footer');			
			if(($this->request->server['REQUEST_METHOD']=="POST")&&$this->validateForm()){				
				$this->model_design_links_footer->editLink($this->request->get['link_id'],$this->request->post);

				$this->response->redirect($this->url->link('design/links_footer', 'token=' . $this->session->data['token'], 'SSL'));
			}
			$this->getForm();
		}
		public function delete(){

			$this->load->language('design/links_footer');
			$this->document->setTitle($this->language->get('heading_title'));
			$this->load->model('design/links_footer');
			if(isset($this->request->post['selected'])&&$this->validateDelete()){

				foreach ($this->request->post['selected'] as $link_id) {
					$this->model_design_links_footer->deleteLink($link_id);
				}
				$this->session->data['success'] = $this->language->get('text_success');
				$this->response->redirect($this->url->link('design/links_footer', 'token=' . $this->session->data['token'], 'SSL'));
			}
		}

		protected function getList(){

			$data['heading_title'] 	= 	$this->language->get('heading_title');
			$data['text_list']		=	$this->language->get('text_list');
			$data['button_add'] 	= 	$this->language->get('button_add');			
			$data['button_delete'] 	= 	$this->language->get('button_delete');
			$data['button_edit']	=	$this->language->get('button_edit');
			$data['text_confirm'] = $this->language->get('text_confirm');

			if (isset($this->error['warning'])) {
			$data['error_warning'] = $this->error['warning'];
			} else {
				$data['error_warning'] = '';
			}

			if (isset($this->session->data['success'])) {
				$data['success'] = $this->session->data['success'];

				unset($this->session->data['success']);
			} else {
				$data['success'] = '';
			}		

			$this->load->model('design/links_footer');

			$link_info=$this->model_design_links_footer->getFooterLink();				
			$data['links']=array();
			foreach ($link_info as $lf) {
				if($lf['status']==1){
					$link_status=$this->language->get('text_enabled');
				}
				else{
					$link_status=$this->language->get('text_disabled');	
				}

				$data['links'][]=array(
				'link_id'	=>	$lf['link_id'],
				'title'		=>	$lf['title'],
				'status'	=>	$link_status,
				'edit'		=>	$this->url->link('design/links_footer/edit', 'token=' . $this->session->data['token'] . '&link_id=' .$lf['link_id'], 'SSL')
				);					
										
			}			

			$data['breadcrumbs'] = array();

			$data['breadcrumbs'][] = array(
				'text' => $this->language->get('text_home'),
				'href' => $this->url->link('common/dashboard', 'token=' . $this->session->data['token'], 'SSL')
			);

			$data['breadcrumbs'][] = array(
				'text' => $this->language->get('heading_title'),
				'href' => $this->url->link('design/links_footer', 'token=' . $this->session->data['token'], 'SSL')
			);

			if (!isset($this->request->get['link_id'])) {
				$data['action'] = $this->url->link('design/links_footer/add', 'token=' . $this->session->data['token'], 'SSL');
			} else {
				$data['action'] = $this->url->link('design/links_footer/edit', 'token=' . $this->session->data['token'] . '&link_id=' . $this->request->get['link_id'] . $url, 'SSL');
			}

			$data['add'] = $this->url->link('design/links_footer/add', 'token=' . $this->session->data['token'], 'SSL');
			$data['delete'] = $this->url->link('design/links_footer/delete', 'token=' . $this->session->data['token'], 'SSL');

			$data['footer']		=	$this->load->controller('common/footer');
			$data['header']		=	$this->load->controller('common/header');
			$data['column_left']=	$this->load->controller('common/column_left');
			$this->response->setOutput($this->load->view('design/links_footer_list.tpl',$data));

		}

		protected function getForm(){		

			$data['heading_title'] 	= 	$this->language->get('heading_title');
			$data['text_form'] 		= 	!isset($this->request->get['link_id']) ? $this->language->get('text_add') : $this->language->get('text_edit');
			$data['entry_name']		=	$this->language->get('entry_name');
			$data['entry_status']	=	$this->language->get('entry_status');
			$data['text_enabled']	=	$this->language->get('text_enabled');
			$data['text_disabled']	=	$this->language->get('text_disabled');
			$data['text_title']		=	$this->language->get('text_title');
			$data['text_href']		=	$this->language->get('text_href');
			$data['text_sort_order']=	$this->language->get('text_sort_order');

			$data['cancel'] = $this->url->link('design/links_footer', 'token=' . $this->session->data['token'], 'SSL');

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

			$data['breadcrumbs'] = array();

			$data['breadcrumbs'][] = array(
				'text' => $this->language->get('text_home'),
				'href' => $this->url->link('common/dashboard', 'token=' . $this->session->data['token'], 'SSL')
			);

			$data['breadcrumbs'][] = array(
				'text' => $this->language->get('heading_title'),
				'href' => $this->url->link('design/links_footer', 'token=' . $this->session->data['token'], 'SSL')
			);

			$this->load->model('localisation/language');
			$data['languages'] = $this->model_localisation_language->getLanguages();

			foreach ($data['languages'] as $language) {
				$language_id[]=$language['language_id'];
			}		

			if(isset($this->request->get['link_id'])){
				$link_info =$this->model_design_links_footer->getLinkInfo($this->request->get['link_id']);	
			}	

			

			if (!isset($this->request->get['link_id'])) {
				$data['action'] = $this->url->link('design/links_footer/add', 'token=' . $this->session->data['token'], 'SSL');
			} else {
				$data['action'] = $this->url->link('design/links_footer/edit', 'token=' . $this->session->data['token'] . '&link_id=' . $this->request->get['link_id'], 'SSL');
			}

			if(isset($this->request->post['name'])){
				$data['name']=$this->request->post['name'];
			}
			elseif(!empty($link_info)){
				$data['name']=$link_info['title'];
			}
			else{
				$data['name']=array();
			}			

			if (isset($this->request->post['status'])) {
			$data['status'] = $this->request->post['status'];
			} elseif (!empty($link_info)) {
				$data['status'] = $link_info['status'];
			} else {
				$data['status'] = 1;
			}	

			if(isset($this->request->post['link'])){
				$data['links']	=	$this->request->post['link'];
			}

			else if(!empty($link_info['link'])){
				$data['links']	=	$link_info['link'];
			}
			else {
				$data['link']	=array();
			}

			$data['button_save'] 		= 	$this->language->get('button_save');
			$data['button_cancel'] 		= 	$this->language->get('button_cancel');
			$data['button_banner_add'] 	= 	$this->language->get('button_banner_add');
			$data['button_remove'] 		= 	$this->language->get('button_remove');
			$data['header']				=	$this->load->controller('common/header');
			$data['footer']				=	$this->load->controller('common/footer');
			$data['column_left']		=	$this->load->controller('common/column_left');		

			$this->response->setOutput($this->load->view('design/links_footer_form.tpl',$data));
		}

		protected function validateForm(){

			if (!$this->user->hasPermission('modify', 'design/links_footer')) {
			$this->error['warning'] = $this->language->get('error_permission');
			}			
			if(isset($this->request->post['name'])){
				foreach ($this->request->post['name'] as $language_id => $name) {
					if((utf8_strlen($name['title'])<2)||(utf8_strlen($name['title'])>64)){
						$this->error['name']=$this->language->get('error_name');
					}
				}
			}

			return !$this->error;
		}

		protected function validateDelete(){
			if (!$this->user->hasPermission('modify', 'design/links_footer')) {
				$this->error['warning'] = $this->language->get('error_permission');
			}
			return !$this->error;
		}
	}

 ?>