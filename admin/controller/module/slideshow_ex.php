<?php
class ControllerModuleslideshowex extends Controller {
	private $error = array();

	public function index() {
		$this->load->language('module/slideshow_ex');

		$this->document->setTitle($this->language->get('heading_title'));

		$this->load->model('extension/module');

		$this->load->model('design/banner');
		$image_des=$this->model_design_banner->getBannerImages(9);
		print_r($image_des);die;

		if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validate()) {
			if (!isset($this->request->get['module_id'])) {
				$var_post=$this->request->post;		
				print_r($var_post);die;		
				$a= array_map(null,$var_post['title'],$var_post['content'])	;
				$arrcb=array_combine($var_post['images'], $a);	
				$sender=array(
					"name"=>$var_post['name'],
					"banner_id"=>$var_post['banner_id'],
					"width"=>$var_post['width'],
					"height"=>$var_post['height'],
					"status"=>$var_post['status'],
					"images_des"=>$arrcb
				);

				$this->model_extension_module->addModule('slideshow_ex',$sender);
			} else {

				$var_post=$this->request->post;	
				print_r($var_post)					;
				$a= array_map(null,$var_post['title'],$var_post['content'])	;
				$arrcb=array_combine($var_post['images'], $a);
				$sender=array(
					"name"=>$var_post['name'],
					"banner_id"=>$var_post['banner_id'],
					"width"=>$var_post['width'],
					"height"=>$var_post['height'],
					"status"=>$var_post['status'],
					"images_des"=>$arrcb
				);	
			
				$this->model_extension_module->editModule($this->request->get['module_id'], $sender);

			}

			$this->session->data['success'] = $this->language->get('text_success');

			$this->response->redirect($this->url->link('extension/module', 'token=' . $this->session->data['token'], 'SSL'));
		}

		$data['heading_title'] = $this->language->get('heading_title');
		
		$data['text_edit'] = $this->language->get('text_edit');
		$data['text_enabled'] = $this->language->get('text_enabled');
		$data['text_disabled'] = $this->language->get('text_disabled');

		$data['entry_name'] = $this->language->get('entry_name');
		$data['entry_banner'] = $this->language->get('entry_banner');
		$data['entry_width'] = $this->language->get('entry_width');
		$data['entry_height'] = $this->language->get('entry_height');
		$data['entry_status'] = $this->language->get('entry_status');

		$data['button_save'] = $this->language->get('button_save');
		$data['button_cancel'] = $this->language->get('button_cancel');

		if(isset($this->request->get['module_id'])){
			$data['module_id']=$this->request->get['module_id'];
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

		if (isset($this->error['width'])) {
			$data['error_width'] = $this->error['width'];
		} else {
			$data['error_width'] = '';
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
				'href' => $this->url->link('module/slideshow_ex', 'token=' . $this->session->data['token'], 'SSL')
			);
		} else {
			$data['breadcrumbs'][] = array(
				'text' => $this->language->get('heading_title'),
				'href' => $this->url->link('module/slideshow_ex', 'token=' . $this->session->data['token'] . '&module_id=' . $this->request->get['module_id'], 'SSL')
			);
		}

		if (!isset($this->request->get['module_id'])) {
			$data['action'] = $this->url->link('module/slideshow_ex', 'token=' . $this->session->data['token'], 'SSL');
		} else {
			$data['action'] = $this->url->link('module/slideshow_ex', 'token=' . $this->session->data['token'] . '&module_id=' . $this->request->get['module_id'], 'SSL');
		}

		$data['url_banner'] = $this->url->link('bigbom/ajax_category/getBanner', 'token=' . $this->session->data['token'], 'SSL');

		$data['cancel'] = $this->url->link('extension/module', 'token=' . $this->session->data['token'], 'SSL');

		if (isset($this->request->get['module_id']) && ($this->request->server['REQUEST_METHOD'] != 'POST')) {
			$module_info = $this->model_extension_module->getModule($this->request->get['module_id']);
		}

		if (isset($this->request->post['name'])) {
			$data['name'] = $this->request->post['name'];
		} elseif (!empty($module_info)) {
			$data['name'] = $module_info['name'];
		} else {
			$data['name'] = '';
		}

		if (isset($this->request->post['banner_id'])) {
			$data['banner_id'] = $this->request->post['banner_id'];
		} elseif (!empty($module_info)) {
			$data['banner_id'] = $module_info['banner_id'];
		} else {
			$data['banner_id'] = '';
		}

		$this->load->model('design/banner');

		$data['banners'] = $this->model_design_banner->getBanners();				

		if (isset($this->request->post['width'])) {
			$data['width'] = $this->request->post['width'];
		} elseif (!empty($module_info)) {
			$data['width'] = $module_info['width'];
		} else {
			$data['width'] = '';
		}	

		if(isset($this->request->post['images_des'])){	

			$data['images_des']=$this->request->post['images_des'];
		}
		elseif(!empty($module_info['images_des'])){

			$data['images_des']=$module_info['images_des'];
		}


		else{$data['images_des']=array();}	


		$this->load->model('tool/image');

		$image_des=$this->model_design_banner->getBannerImages($data['banner_id']);	
		//print_r($image_des);die;

		foreach ($image_des as $img_des) {				
		 	if (is_file(DIR_IMAGE . $img_des['image'])) {
				$image = $this->model_tool_image->resize($img_des['image'], 200, 200);
			} else {
				$image = $this->model_tool_image->resize('no_image.png', 200, 200);
			}	

			if(!empty($data['images_des'])){
				$arr_img[]=array(
				"image"=>$image,
				"banner_des"=>$img_des['banner_image_description'],		
				"image_des" =>$data['images_des'][$img_des['banner_image_description']['image_id']]
				);
			}
			else{
				$arr_img[]=array(
				"image"=>$image,
				"banner_des"=>$img_des['banner_image_description'],	
				);
			}
		}
		if(!empty($arr_img)){
		$data['images'] = $arr_img;}

		if (isset($this->request->post['height'])) {
			$data['height'] = $this->request->post['height'];
		} elseif (!empty($module_info)) {
			$data['height'] = $module_info['height'];
		} else {
			$data['height'] = '';
		}

		if (isset($this->request->post['status'])) {
			$data['status'] = $this->request->post['status'];
		} elseif (!empty($module_info)) {
			$data['status'] = $module_info['status'];
		} else {
			$data['status'] = '';
		}

		$data['header'] = $this->load->controller('common/header');
		$data['column_left'] = $this->load->controller('common/column_left');
		$data['footer'] = $this->load->controller('common/footer');

		$this->response->setOutput($this->load->view('module/exFeatured/slideshow_ex.tpl', $data));
	}

	protected function validate() {
		if (!$this->user->hasPermission('modify', 'module/slideshow_ex')) {
			$this->error['warning'] = $this->language->get('error_permission');
		}

		if ((utf8_strlen($this->request->post['name']) < 3) || (utf8_strlen($this->request->post['name']) > 64)) {
			$this->error['name'] = $this->language->get('error_name');
		}

		if (!$this->request->post['width']) {
			$this->error['width'] = $this->language->get('error_width');
		}

		if (!$this->request->post['height']) {
			$this->error['height'] = $this->language->get('error_height');
		}

		return !$this->error;
	}
}
