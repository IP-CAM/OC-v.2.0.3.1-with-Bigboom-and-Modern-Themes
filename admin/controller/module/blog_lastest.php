<?php 
	class ControllerModuleBlogLastest extends Controller{
		private $error=array();
		public function index(){
			$this->load->language('module/blog_lastest');
			$this->load->model('extension/module');
			$this->document->setTitle($this->language->get('heading_title'));

			if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validate()) {

				if (!isset($this->request->get['module_id'])) {					
					$this->model_extension_module->addModule('blog_lastest', $this->request->post);
				} else {					
					$this->model_extension_module->editModule($this->request->get['module_id'], $this->request->post);
				}

				$this->session->data['success'] = $this->language->get('text_success');
				$this->response->redirect($this->url->link('extension/module', 'token=' . $this->session->data['token'], 'SSL'));
			}

			$data['heading_title']			=$this->language->get('heading_title');
			$data['button_save']			=$this->language->get('button_save');
			$data['button_cancel']			=$this->language->get('button_cancel');
			$data['text_edit']				=$this->language->get('text_edit');
			$data['entry_name']				=$this->language->get('entry_name');
			$data['entry_amount']			=$this->language->get('entry_amount');
			$data['entry_limit']			=$this->language->get('entry_limit');
			$data['entry_width']			=$this->language->get('entry_width');
			$data['entry_height']			=$this->language->get('entry_height');
			$data['entry_length']			=$this->language->get('entry_length');
			$data['text_type_display']		=$this->language->get('text_type_display');
			$data['entry_status']			=$this->language->get('entry_status');
			$data['text_enabled']			=$this->language->get('text_enabled');
			$data['text_disabled']			=$this->language->get('text_disabled');

			$data['cancel']=$this->url->link('extension/module','token='.$this->session->data['token'],'SSL');

			if (isset($this->request->get['module_id']) && ($this->request->server['REQUEST_METHOD'] != 'POST')) {
			$module_info = $this->model_extension_module->getModule($this->request->get['module_id']);}

			if(isset($this->error['warning'])){
				$data['error_warning']=$this->error['warning'];
			}
			else{
				$data['error_warning']='';
			}
			if(isset($this->error['name'])){
				$data['error_name']=$this->error['name'];
			}
			else{
				$data['error_name']='';
			}

			if(isset($this->error['amount'])){
				$data['error_amount']=$this->error['amount'];
			}
			else{
				$data['error_amount']='';
			}

			if(isset($this->error['width'])){
				$data['error_width']=$this->error['width'];
			}
			else{
				$data['error_width']='';
			}

			if(isset($this->error['height'])){
				$data['error_height']=$this->error['height'];
			}
			else{
				$data['error_height']='';
			}

			if(isset($this->error['length'])){
				$data['error_length']=$this->error['length'];
			}
			else{
				$data['error_length']='';
			}

			if(isset($this->error['limit'])){
				$data['error_limit']=$this->error['limit'];
			}
			else{
				$data['error_limit']='';
			}

			if (isset($this->request->post['status'])) {
				$data['status'] = $this->request->post['status'];
			} elseif (!empty($module_info)) {
				$data['status'] = $module_info['status'];
			} else {
				$data['status'] = '';
			}

			if(isset($this->request->post['name'])){
				$data['name']=$this->request->post['name'];
			}
			elseif(!empty($module_info)){
				$data['name']=$module_info['name'];
			}
			else{
				$data['name']='';
			}

			if(isset($this->request->post['width'])){
				$data['width']=$this->request->post['width'];
			}
			elseif(!empty($module_info)){
				$data['width']=$module_info['width'];
			}
			else{
				$data['width']='';
			}

			if(isset($this->request->post['height'])){
				$data['height']=$this->request->post['height'];
			}
			elseif(!empty($module_info)){
				$data['height']=$module_info['height'];
			}
			else{
				$data['height']='';
			}

			if(isset($this->request->post['length'])){
				$data['length']=$this->request->post['length'];
			}
			elseif(!empty($module_info)){
				$data['length']=$module_info['length'];
			}
			else{
				$data['length']='';
			}

			if(isset($this->request->post['amount'])){
				$data['amount']=$this->request->post['amount'];
			}
			elseif(!empty($module_info)){
				$data['amount']=$module_info['amount'];
			}
			else{
				$data['amount']='';
			}

			if(isset($this->request->post['display_type'])){
				$data['display_type']=$this->request->post['display_type'];
			}
			elseif(!empty($module_info)){
				$data['display_type']=$module_info['display_type'];
			}
			else{
				$data['display_type']='';
			}

			if(isset($this->request->post['limit'])){
				$data['limit']=$this->request->post['limit'];
			}
			elseif(!empty($module_info)){
				$data['limit']=$module_info['limit'];
			}
			else{
				$data['limit']='';
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
					"href"	=>$this->url->link('module/blog_lastest','token='.$this->session->data['token'],'SSL')
				);
			}

			if(!isset($this->request->get['module_id'])){
				$data['action']=$this->url->link('module/blog_lastest','token='.$this->session->data['token'],'SSL');
			}
			else{
				$data['action']=$this->url->link('module/blog_lastest','token='.$this->session->data['token'].'&module_id='.$this->request->get['module_id'],'SSL');
			}

			$data['header']=$this->load->controller('common/header');
			$data['column_left']=$this->load->controller('common/column_left');
			$data['footer']=$this->load->controller('common/footer');

			$this->response->setOutput($this->load->view('module/blogs/blog_lastest.tpl',$data));
		}

		protected function validate(){

			if (!$this->user->hasPermission('modify', 'module/blog_lastest')) {					
				$this->error['warning'] = $this->language->get('error_permission');
			}

			if ((utf8_strlen($this->request->post['name']) < 3) || (utf8_strlen($this->request->post['name']) > 64)) {
				$this->error['name'] = $this->language->get('error_name');
			}

			if(!is_numeric($this->request->post['limit'])){
				$this->error['limit']=$this->language->get('error_limit');
			}

			if(!is_numeric($this->request->post['amount'])){
				$this->error['amount']=$this->language->get('error_amount');
			}

			if(!is_numeric($this->request->post['length'])){
				$this->error['length']=$this->language->get('error_length');
			}

			if(!is_numeric($this->request->post['width'])){
				$this->error['width']=$this->language->get('error_width');
			}

			if(!is_numeric($this->request->post['height'])){
				$this->error['height']=$this->language->get('error_height');
			}

			return !$this->error;
		}
	}
 ?>