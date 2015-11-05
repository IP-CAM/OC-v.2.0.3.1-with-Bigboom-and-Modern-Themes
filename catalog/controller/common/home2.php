<?php
class ControllerCommonHome2 extends Controller {
	public function index() {
		$this->document->setTitle($this->config->get('config_meta_title'));
		$this->document->setDescription($this->config->get('config_meta_description'));
		$this->document->setKeywords($this->config->get('config_meta_keyword'));

		if (isset($this->request->get['route'])) {
			$this->document->addLink(HTTP_SERVER, 'canonical');
		}		
		
		$data['column_left'] = $this->load->controller('common/column_left');
		$data['column_right'] = $this->load->controller('common/column_right');
		$data['content_top'] = $this->load->controller('common/content_top');
		$data['content_bottom'] = $this->load->controller('common/content_bottom');
		$data['footer'] = $this->load->controller('common/footer');		
		$data['header'] = $this->load->controller('common/header');
		$data['ex_position']	=$this->load->controller('common/ex_position');
		$data['two_column']		=$this->load->controller('common/two_column');
		$data['three_column']	=$this->load->controller('common/three_column');
		$data['top_footer']		=$this->load->controller('common/top_footer');
		$data['top_banner']		=$this->load->controller('common/top_banner');
		$data['home']			=$this->url->link('common/home');		
		$data['Threecolumns_1']		=$this->load->controller('common/Threecolumns_1');

	
		if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/common/home2.tpl')) {
			$this->response->setOutput($this->load->view($this->config->get('config_template') . '/template/common/home2.tpl', $data));
		} else {
			$this->response->setOutput($this->load->view('default/template/common/home.tpl', $data));
		}
	
	}
}
