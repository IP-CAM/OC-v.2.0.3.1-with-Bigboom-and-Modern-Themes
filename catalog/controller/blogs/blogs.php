<?php 
	class ControllerBlogsBlogs extends Controller{
		public function index(){

		$this->document->setTitle('Blogs');
		
		$data['column_left'] = $this->load->controller('common/column_left');		
		$data['column_right'] = $this->load->controller('common/column_right');
		$data['content_top'] = $this->load->controller('common/content_top');		
		$data['content_bottom'] = $this->load->controller('common/content_bottom');
		$data['footer'] = $this->load->controller('common/footer');
		$data['header'] = $this->load->controller('common/header');		
		$data['extension_pos']=$this->load->controller('common/extension_pos');
		$data['content_right']=$this->load->controller('common/content_right');
		$data['content_left']=$this->load->controller('common/content_left');
		$data['top_footer']=$this->load->controller('common/top_footer');	

		$data['breadcrumbs'] = array();

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('text_home'),
			'href' => $this->url->link('common/home')
		);
		$data['breadcrumbs'][]=array(
			'text'	=>"Blogs",
			'href'	=>$this->url->link('blogs/blogs')
			);
		
		if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/blogs/blogs.tpl')) {
				$this->response->setOutput($this->load->view($this->config->get('config_template') . '/template/blogs/blogs.tpl', $data));
			} else {
				$this->response->setOutput($this->load->view('default/template/blogs/blogs.tpl', $data));
			}
		}
	}

 ?>