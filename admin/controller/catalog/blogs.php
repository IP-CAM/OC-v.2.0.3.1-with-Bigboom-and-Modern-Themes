<?php 
	class ControllerCatalogBlogs extends Controller{

		private $error=array();

		public function index(){

			$this->load->language('catalog/blogs');							
			$this->getList();			
		}	

		//select tb.post_id,tb.post_content, tbc.cat_id from oc_themevast_blog tb inner JOIN oc_themevast_blog_post_cat tbc on tb.post_id = tbc.post_id

		public function add(){
			$this->load->language('catalog/blogs');
			$this->load->model('catalog/blogs');
			$this->document->setTitle('heading_title');					
			if(($this->request->server['REQUEST_METHOD']=='POST')&&$this->validateForm()){			
				$this->model_catalog_blogs->addBlogs($this->request->post);
				$this->session->data['success']=$this->language->get('text_success');
				$this->response->redirect($this->url->link('catalog/blogs','token='.$this->session->data['token'],'SSL'));
			}

			$this->getForm();
		}
		public function edit(){	
			$this->load->language('catalog/blogs')	;
			$this->load->model('catalog/blogs');
			if(($this->request->server['REQUEST_METHOD']=='POST')&&$this->validateForm()){					
				$this->model_catalog_blogs->editBlogs($this->request->get['blog_id'],$this->request->post);
				$this->session->data['success']=$this->language->get('text_success');
				$this->response->redirect($this->url->link('catalog/blogs','token='.$this->session->data['token'],'SSL'));
			}
			$this->getForm();
		}
		public function delete(){

			$this->load->language('catalog/blogs');
			$this->load->model('catalog/blogs');
			$this->document->setTitle($this->language->get('heading_title'));	

			if(isset($this->request->post['selected'])&&$this->validateDelete()){
				foreach ($this->request->post['selected'] as $post_id) {
					$this->model_catalog_blogs->deleteBlogs($post_id);
				}

				$this->session->data['success']=$this->language->get('text_success');

				$this->response->redirect($this->url->link('catalog/blogs','token='.$this->session->data['token'],'SSL'));
			}					

			$this->getList();
		}
		protected function getList(){
			$this->load->model('catalog/blogs');
			$this->load->model('tool/image');

			$data['heading_title']=$this->language->get('heading_title');

			if(isset($this->request->get['sort'])){
				$sort=$this->request->get['sort'];
			}
			else{
				$sort='title';
			}

			if(isset($this->request->get['order'])){
				$order=$this->request->get['order'];
			}
			else{
				$order='ASC';
			}

			if(isset($this->request->get['page'])){
				$page=$this->request->get['page'];
			}

			else{$page=1;}

			$url='';

			if(isset($this->request->get['sort'])){
				$url.='&sort='.$this->request->get['sort'];
			}

			if(isset($this->request->get['order'])){
				$url.='&order='.$this->request->get['order'];
			}

			if(isset($this->request->get['page'])){
				$url.='$page='.$this->request->get['page'];
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

			$data['breadcrumbs']=array();
			$data['breadcrumbs'][]=array(
				'text'=>$this->language->get('text_home'),
				'href'=>$this->url->link('common/dashboard','token=' .$this->session->data['token'],'SSL')

				);
			$data['breadcrumbs'][]=array(
				'text'=>$this->language->get('heading_title'),
				'href'=>$this->url->link('catalog/blogs','token='.$this->session->data['token'],'SSL')
				);	

			$filter_data=array(
				'sort'	=>$sort,
				'order'	=>$order,
				'start'	=>($page-1) * $this->config->get('config_limit_admin'),
				'limit'	=>$this->config->get('config_limit_admin')
				);	

			$data['entry_blog_title']	=$this->language->get('entry_blog_title');
			$data['entry_initial']		=$this->language->get('entry_initial');
			$data['entry_update']		=$this->language->get('entry_update');
			$data['entry_user']			=$this->language->get('entry_user');
			$data['entry_user_update']	=$this->language->get('entry_user_update');
			$data['entry_action']		=$this->language->get('entry_action');
			$data['tip_blog_title']		=$this->language->get('tip_blog_title');
			$data['tip_initial']		=$this->language->get('tip_initial');
			$data['tip_update']			=$this->language->get('tip_update');
			$data['tip_user']			=$this->language->get('tip_user');
			$data['tip_user_update']	=$this->language->get('tip_user_update');

			$data['button_add']			=$this->language->get('button_add');		
			$data['button_delete']		=$this->language->get('button_delete');
			$data['button_edit']		=$this->language->get('button_edit');
			$data['text_confirm']		=$this->language->get('text_confirm');
			$data['text_list']			=$this->language->get('text_list');
			$blogs 						=$this->model_catalog_blogs->getAllBlogs($filter_data);
			$data['blogs']=array();

			foreach ($blogs as $blog) {

				if(isset($blog['image'])&&is_file(DIR_IMAGE . $blog['image'])){
					$image=$this->model_tool_image->resize($blog['image'],50,50);
				}
				else{
					$image=$this->model_tool_image->resize('no_image.png',50,50);
				}

				if(isset($blog['icon_image'])&&is_file(DIR_IMAGE . $blog['icon_image'])){
					$icon_image=$this->model_tool_image->resize($blog['icon_image'],50,50);
				}
				else{
					$icon_image=$this->model_tool_image->resize('no_image.png',50,50);
				}

			$data['blogs'][]=array(
				'post_id'		=>$blog['post_id'],
				'image'			=>$image,
				'icon_image'	=>$icon_image,
				'title'			=>$blog['title'],
				'created_time'	=>$blog['created_time'],
				'update_time'	=>$blog['update_time'],
				'create_user'	=>$blog['user'],
				'update_user'	=>$blog['update_user'],
				'blog_edit'		=>$this->url->link('catalog/blogs/edit','token='.$this->session->data['token'].'&blog_id='.$blog['post_id'],'SSL')
				);				
			}

			
			$data['add']=$this->url->link('catalog/blogs/add','token='.$this->session->data['token'],'SSL');
			$data['delete']=$this->url->link('catalog/blogs/delete','token='.$this->session->data['token'],'SSL');
			//$data['edit']=$this->url->link('catalog/blogs/edit','token='.$this->session->data['token'],'SSL');

			if (isset($this->request->post['selected'])) {
				$data['selected'] = (array)$this->request->post['selected'];
			} else {
				$data['selected'] = array();
			}

			$url='';

			if($order=='ASC'){
				$url.='&order=DESC';
			}
			else{
				$url.="&order=ASC";
			}

			if(isset($this->request->get['page'])){
				$url.="&page=".$this->request->get['page'];	
			}

			$blogs_total=$this->model_catalog_blogs->getTotalBlogs();

			$pagination = new Pagination();
			$pagination->total = $blogs_total;
			$pagination->page = $page;
			$pagination->limit = $this->config->get('config_limit_admin');
			$pagination->url = $this->url->link('catalog/blogs', 'token=' . $this->session->data['token'] . $url . '&page={page}', 'SSL');

			$data['results'] = sprintf($this->language->get('text_pagination'), ($blogs_total) ? (($page - 1) * $this->config->get('config_limit_admin')) + 1 : 0, ((($page - 1) * $this->config->get('config_limit_admin')) > ($blogs_total - $this->config->get('config_limit_admin'))) ? $blogs_total : ((($page - 1) * $this->config->get('config_limit_admin')) + $this->config->get('config_limit_admin')), $blogs_total, ceil($blogs_total / $this->config->get('config_limit_admin')));

			$data['pagination'] = $pagination->render();

			$data['sort_name']=$this->url->link('catalog/blogs','token='.$this->session->data['token'].'&sort=title'.$url,'SSL');
			$data['sort_user']=$this->url->link('catalog/blogs','token='.$this->session->data['token'].'&sort=user'.$url,'SSl');
			$data['sort_created_time']=$this->url->link('catalog/blogs','token='.$this->session->data['token'].'&sort=created_time'.$url,'SSL');
			$data['sort_update_time']=$this->url->link('catalog/blogs','token='.$this->session->data['token'].'&sort=update_time'.$url,'SSL');

			$data['header']=$this->load->controller('common/header');
			$data['footer']=$this->load->controller('common/footer');
			$data['column_left']=$this->load->controller('common/column_left');		

			$this->response->setOutput($this->load->view('catalog/blogs_list.tpl',$data));

		}
		protected function getForm(){
			$this->load->model('localisation/language');
			$this->load->model('tool/image');
			$this->document->setTitle($this->language->get('heading_title'));

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
				if(isset($this->request->get['blog_id'])&&($this->request->server['REQUEST_METHOD'])!='POST'){
				$blog_info=$this->model_catalog_blogs->getBlogsInfo($this->request->get['blog_id']);
			}	
			$data['button_save']=$this->language->get('button_save');
			$data['button_cancel']=$this->language->get('button_cancel');
			$data['heading_title']=$this->language->get('heading_title');
			$data['tab_general']=$this->language->get('tab_general');
			$data['tab_data']=$this->language->get('tab_data');
			$data['tab_design']=$this->language->get('tab_design');
			$data['entry_meta_keyword']=$this->language->get('entry_meta_keyword');
			$data['text_enabled']=$this->language->get('text_enabled');
			$data['text_disabled']=$this->language->get('text_disabled');
			$data['help_keyword']=$this->language->get('help_keyword');
			$data['entry_blog_cate']=$this->language->get('entry_blog_cate');
			$data['entry_banner']=$this->language->get('entry_banner');
			$data['entry_iframe']=$this->language->get('entry_iframe');
			$data['image_warning']=$this->language->get('image_warning');
			$data['view_video']=$this->language->get('view_video');
			$data['entry_icon']=$this->language->get('entry_icon');
			$data['entry_short_desc']=$this->language->get('entry_short_desc');
			$data['blogs_cate']=$this->model_catalog_blogs->getBlogCate();

			$data['entry_status']=$this->language->get('entry_status');
			$data['entry_store']=$this->language->get('entry_store');
			$data['text_default']=$this->language->get('text_default');
			$data['entry_image']=$this->language->get('entry_image');
			$data['tab_image']=$this->language->get('entry_image');
			$data['cancel']=$this->url->link('catalog/blogs','token='.$this->session->data['token'],'SSL');

			$data['meta_tag_keyword']=$this->language->get('meta_tag_keyword');
			$data['entry_meta_description']=$this->language->get('entry_meta_description');
			$data['entry_keyword']=$this->language->get('entry_keyword');
			$data['entry_name']=$this->language->get('entry_name');
			$data['entry_content']=$this->language->get('entry_content');
			$data['entry_short_content']=$this->language->get('entry_short_content');
			$data['entry_meta_title']=$this->language->get('entry_meta_title');
			$data['languages'] = $this->model_localisation_language->getLanguages();	
			$data['text_form']=!isset($this->request->get['blog_id']) ? $this->language->get('text_add'):$this->language->get('text_edit');
			
			$this->load->model('tool/image');

			if(isset($this->request->post['icon_image'])&&is_file(DIR_IMAGE.$this->request->post['icon_image'])){
				$data['icon_thumb']=$this->model_tool_image->resize($this->request->post['icon_image'],100,100);
			}
			else if(!empty($blog_info)&&is_file(DIR_IMAGE.$blog_info['icon_image'])){
				$data['icon_thumb']=$this->model_tool_image->resize($blog_info['icon_image'],100,100);
			}
			else
			{
				$data['icon_thumb']=$this->model_tool_image->resize('no_image.png',100,100);
			}

			if(isset($this->request->post['icon_image'])){				
				$data['icon_image']=$this->request->post['icon_image'];
			}
			else if(!empty($blog_info)&&$blog_info['icon_image']!=null){
				$data['icon_image']=$blog_info['icon_image'];
			}
			else{
				$data['icon_image']='';
			}			

			$data['placeholder']=$this->model_tool_image->resize('no_image.png',100,100);

			if(isset($this->error['name'])){
				$data['error_name']=$this->error['name'];
			}

			else{$data['error_name']=array();}

			if(isset($this->error['meta_title'])){
				$data['error_meta_title']=$this->error['meta_title'];
			}
			else{$data['error_meta_title']=array();}

			if(!isset($this->request->get['blog_id'])){
				$data['action']=$this->url->link('catalog/blogs/add','token='.$this->session->data['token'],'SSL');
			}						
			else{
				$data['action']=$this->url->link('catalog/blogs/edit','token='.$this->session->data['token'].'&blog_id='.$this->request->get['blog_id'],'SSL');
			}

			if(isset($this->error['blog_new_cate'])){
				$data['error_blog_new_cate']=$this->error['blog_new_cate'];
			}
			else{
				$data['error_blog_new_cate']='';
			}

			$data['breadcrumbs']=array();
			$data['breadcrumbs'][]=array(
				"text"=>$this->language->get('text_home'),
				"href"=>$this->url->link('common/dashboard','token='.$this->session->data['token'],'SSL')
				);
			$data['breadcrumbs'][]=array(
				"text"=>$this->language->get('heading_title'),
				"href"=>$this->url->link('catalog/blogs','token='.$this->session->data['token'],'SSL')
				);

			if(isset($this->request->post['blog_description']))		{
				$data['blog_description']=$this->request->post['blog_description'];
			}
			else if(isset($this->request->get['blog_id'])){
				$data['blog_description']=$this->model_catalog_blogs->getBlogsDescription($this->request->get['blog_id']);
			}

			else{$data['blog_description']=array();	}
			
			$this->load->model('setting/store');
			$data['stores']=$this->model_setting_store->getStores();

			if(isset($this->request->post['blog_store'])){
				$data['blog_store']=$this->request->post['blog_store'];
			}

			else if(isset($this->request->get['blog_id'])){
				$data['blog_store']=$this->model_catalog_blogs->getBlogStore($this->request->get['blog_id']);
			}
			else{
				$data['blog_store']=array(0);
			}		

			if(isset($this->request->post['keyword'])){
				$data['keyword']=$this->request->post['keyword'];
			}			
			elseif(!empty($blog_info['keyword'])){
				$data['keyword']=$blog_info['keyword'];
			}
			else{
				$data['keyword']='';
			}

			if(isset($this->request->post['status'])){
				$data['status']=$this->request->post['status'];
			}
			elseif(!empty($blog_info)){
				$data['status']=$blog_info['status'];
			}
			else{
				$data['status']=true;
			}
			if(isset($this->request->post['blog_cate']))			{
				$data['blog_cat']=$this->request->post['blog_cate'];
			}
			elseif(!empty($blog_info)){
				$data['blog_cat']=$blog_info['cat_id'];
			}
			else{$data['blog_cat']=1;}

			if(isset($this->error['keyword'])){
				$data['error_keyword']=$this->error['keyword'];
			}
			else{
				$data['error_keyword']='';
			}

			$this->load->model('design/banner')		;
			$data['banners']=$this->model_design_banner->getBanners();

			$data['header']=$this->load->controller('common/header');
			$data['column_left']=$this->load->controller('common/column_left');
			$data['footer']=$this->load->controller('common/footer');

			$this->response->setOutput($this->load->view('catalog/blogs_form.tpl',$data));
		}

		protected function validateForm() {		

		if (!$this->user->hasPermission('modify', 'catalog/blogs')) {
			$this->error['warning'] = $this->language->get('error_permission');
		}

		foreach ($this->request->post['blog_description'] as $language_id => $value) {
		
			if ((utf8_strlen($value['name']) < 2) || (utf8_strlen($value['name']) > 255)) {
				$this->error['name'][$language_id] = $this->language->get('error_name');
			}

			if ((utf8_strlen($value['meta_title']) < 3) || (utf8_strlen($value['meta_title']) > 255)) {
				$this->error['meta_title'][$language_id] = $this->language->get('error_meta_title');
			}
		}	

		if (utf8_strlen($this->request->post['keyword']) > 0) {

			$this->load->model('catalog/url_alias');

			$url_alias_info = $this->model_catalog_url_alias->getUrlAlias($this->request->post['keyword']);

			if ($url_alias_info && isset($this->request->get['blog_id']) && $url_alias_info['query'] != 'post_id=' . $this->request->get['blog_id']) {				
				$this->error['keyword'] = sprintf($this->language->get('error_keyword'));
			}

			if ($url_alias_info && !isset($this->request->get['blog_id'])) {
				
				$this->error['keyword'] = sprintf($this->language->get('error_keyword'));
			}

			if ($this->error && !isset($this->error['warning'])) {				
				$this->error['warning'] = $this->language->get('error_warning');
			}
		}

		if(isset($this->request->post['blog_new_cate'])){
			if((utf8_strlen($this->request->post['blog_new_cate'])) < 2||(utf8_strlen($this->request->post['blog_new_cate'])>255)){
			$this->error['blog_new_cate']="Your category blog name is wrong";
		}

		}	

		return !$this->error;
		}

		protected function validateDelete(){
			if(!$this->user->hasPermission('modify','catalog/blogs')){
				$this->error['warning']=$this->language->get('error_permission');
			}
			return !$this->error;
		}
	}

 ?>