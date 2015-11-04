<?php 
	class ControllerDesignCMSBlock extends Controller{

		private $error = array();
		public function index(){		
			$this->getList();
		}

		public function add(){		

			$this->load->model('design/cms_block');

			if(($this->request->server['REQUEST_METHOD']=='POST')&&$this->validateForm()){			
				$this->model_design_cms_block->addBlock($this->request->post);
				$this->session->data['success'] = $this->language->get('text_success');
				$this->response->redirect($this->url->link('design/cms_block','token='.$this->session->data['token'],'SSL'));
			}		
				
			$this->getForm();
		}

		public function edit(){	

			$this->load->model('design/cms_block');	
			if(($this->request->server['REQUEST_METHOD']=='POST')&&$this->validateForm()){
				$this->model_design_cms_block->editBlock($this->request->post,$this->request->get['cms_block_id']);
				$this->session->data['success'] = $this->language->get('text_success');
				$this->response->redirect($this->url->link('design/cms_block','token='.$this->session->data['token'],'SSL'));
			}


			$this->getForm();
		}
		public function delete(){

			$this->load->model('design/cms_block');
			if(($this->request->server['REQUEST_METHOD']=='POST')&&$this->validateDelete()){
				foreach ($this->request->post['selected'] as $block_id) {
					$this->model_design_cms_block->deleteBlock($block_id);
				}
				$this->response->redirect($this->url->link('design/cms_block','token='.$this->session->data['token'],'SSL'));
			}
		}		

		public function getForm(){	

			$data['text_form'] = !isset($this->request->get['cms_block_id']) ? 'Add Block' : 'Edit Block';
			$data['entry_name']	=  "Block name";
			$data['button_save'] = $this->language->get('button_save');
			$data['button_cancel'] = $this->language->get('button_cancel');
			$data['cancel']			=$this->url->link('design/cms_block','token='. $this->session->data['token'],'SSL');
			$data['entry_status']	=	"Status";
			$data['text_disabled']	= "Disabled";
			$data['text_enabled']	=	"Enabled";
			$data['text_html_content']	=	"Html Content";

			if(isset($this->request->get['cms_block_id'])){
				$data['action'] = $this->url->link('design/cms_block/edit','token=' . $this->session->data['token'].'&cms_block_id='.$this->request->get['cms_block_id'],'SSL');
			}
			else{
				$data['action']	= $this->url->link('design/cms_block/add','token=' .$this->session->data['token'],'SSL');

			}

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

			$this->load->model('design/cms_block');

			if(isset($this->request->get['cms_block_id'])){
				$block_info= $this->model_design_cms_block->getBlockInfo($this->request->get['cms_block_id']);
			}
			
			if (isset($this->request->post['name'])) {
			$data['name'] = $this->request->post['name'];
			
			} elseif (!empty($block_info)) {
				$data['name'] = $block_info['name'];
			} else {
				$data['name'] = '';
			}

			if(isset($this->request->post['html_content'])){
				$data['html_content']= $this->request->post['html_content'];
			}
			else if(!empty($block_info['content'])){				
				$data['html_content']= $block_info['content'];
			}
			else{
				$data['html_content']	= '';
			}

			if(isset($this->request->post['status'])){

				$data['status']	=	$this->request->post['status'];
			}
			else if(!empty($block_info['status'])){
				$data['status'] = 	$block_info['status'];
			}
			else{
				$data['status']= 0;
			}

			$data['column_left']	= 	$this->load->controller('common/column_left');
			$data['footer']			=	$this->load->controller('common/footer');
			$data['header']			=	$this->load->controller('common/header');	
			$this->response->setOutput($this->load->view('design/cms_block_form.tpl',$data));
		}
		public function getList(){

			$data['add']= $this->url->link('design/cms_block/add','token=' . $this->session->data['token'],'SSL');
			$data['text_confirm'] = $this->language->get('text_confirm');
			$data['button_add'] = $this->language->get('button_add');
			$data['button_edit'] = $this->language->get('button_edit');
			$data['button_delete'] = $this->language->get('button_delete');
			$data['text_list']		="Block list";

			$this->load->model('design/cms_block');

			$list_block= $this->model_design_cms_block->getListBlock();

			$data['list_block']= array();
			foreach ($list_block as $block) {
				$data['list_block'][]=array(
					'id'	=>	$block['id'],
					'name'	=>	$block['name'],
					'status'=>	$block['status'],
					'edit'	=>	$this->url->link('design/cms_block/edit','token='.$this->session->data['token'].'&cms_block_id='.$block['id'],'SSL')
				);
			}

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

			$data['delete'] = $this->url->link('design/cms_block/delete','token='.$this->session->data['token'],'SSL');

			$data['column_left']	= $this->load->controller('common/column_left');
			$data['footer']			=	$this->load->controller('common/footet');
			$data['header']			=	 $this->load->controller('common/header');
			$this->response->setOutput($this->load->view('design/cms_block_list.tpl',$data));
		}

		public function validateForm(){
			if (!$this->user->hasPermission('modify', 'design/cms_block')) {
				$this->error['warning'] = $this->language->get('error_permission');
			}
			if ((utf8_strlen($this->request->post['name']) < 3) || (utf8_strlen($this->request->post['name']) > 64)) {				
				$this->error['name'] = $this->language->get('error_name');
			}

			return !$this->error;
		}

		protected function validateDelete() {

		if (!$this->user->hasPermission('modify', 'design/cms_block')) {
			$this->error['warning'] = $this->language->get('error_permission');
		}

		return !$this->error;
	}
	}
 ?>