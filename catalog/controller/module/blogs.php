<?php 
	class ControllerModuleBlogs extends Controller{

		public function index(){

			$this->load->model('catalog/blogs');	
			$this->load->model('design/banner')	;
			$this->load->model('tool/image');

			$this->document->addStyle('catalog/view/javascript/jquery/owl-carousel/owl.carousel.css');
			$this->document->addScript('catalog/view/javascript/jquery/owl-carousel/owl.carousel.min.js');						

			if(isset($this->request->get['blog_id'])){
					
				$blog_info=$this->model_catalog_blogs->getBlogInfo($this->request->get['blog_id']);				

				$day_created= new DateTime($blog_info['created_time']);
				$date 	=$day_created->format('d');				
				$month	=substr($day_created->format('F'), 0,3);
				$year	=$day_created->format('Y');	
				$cate=$this->model_catalog_blogs->getBlogCate($this->request->get['blog_id']);
				
				$data['blog_content']=array(
					'posts_id'		=>$blog_info['post_id'],
					'title'			=>$blog_info['title'],					
					'post_content'	=>html_entity_decode($blog_info['post_content']),
					'status'		=>$blog_info['status'],
					'date'				=>$date,
					'month'				=>$month,
					'year'				=>$year,
					'user'				=>$blog_info['user'],
					'category'			=>$cate['title'],
					'category_href'		=>$this->url->link('blogs/blogs&category='.$cate['cat_id']),
					);
					if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/module/blogs_detail.tpl')) {
							return $this->load->view($this->config->get('config_template') . '/template/module/blogs_detail.tpl', $data);
						} else {
							return $this->load->view('modern/template/module/blogs_detail.tpl', $data);
					}
				}

			else{

				if(isset($this->request->get['page'])){
					$page=$this->request->get['page'];
				}
				else{$page=1;}

				$url='';
				if(isset($this->request->get['category'])){					
					$url.='&category='. urlencode(html_entity_decode($this->request->get['category'], ENT_QUOTES, 'UTF-8'));
					$category=$this->request->get['category'];
				}
				else{
					$category='';
				}

				$config_limit_admin=6;

				$filter_data = array(					
					'start' => ($page - 1) * $config_limit_admin,
					'limit' => $config_limit_admin,
					'category'=>$category
				);

				$posts_id=$this->model_catalog_blogs->getTotalBlogs($filter_data);				
				//Pagination
				$pagination=new Pagination();
				$pagination->total=$this->model_catalog_blogs->getBlogsEnabled($filter_data);
				$pagination->page=$page;
				$pagination->limit=$config_limit_admin;				
				$pagination->url=$this->url->link('blogs/blogs',$url.'&page={page}');
				$data['pagination']=$pagination->render();

				$data['results'] = sprintf($this->language->get('text_pagination'), ($this->model_catalog_blogs->getBlogsEnabled()) ? (($page - 1) * $config_limit_admin) + 1 : 0, ((($page - 1) * $config_limit_admin) > ($this->model_catalog_blogs->getBlogsEnabled() - $config_limit_admin)) ? $this->model_catalog_blogs->getBlogsEnabled() : ((($page - 1) * $config_limit_admin) + $config_limit_admin), $this->model_catalog_blogs->getBlogsEnabled(), ceil($this->model_catalog_blogs->getBlogsEnabled() / $config_limit_admin));		

				$data['blog_content']=array();	
				foreach ($posts_id as $post_id) {
					$blog_info=$this->model_catalog_blogs->getBlogInfo($post_id['post_id']);	
					if(isset($blog_info['icon_image'])&&is_file(DIR_IMAGE .$blog_info['icon_image'])){
					$image=$this->model_tool_image->resize($blog_info['icon_image'],300,215);
					}			
					else{
						$image=$this->model_tool_image->resize('no_image.png',300,215);
					}	
					$cate=$this->model_catalog_blogs->getBlogCate($post_id['post_id']);					
					$day_created= new DateTime($blog_info['created_time']);
					$date 	=$day_created->format('d');				
					$month	=substr($day_created->format('F'), 0,3);
					$year	=$day_created->format('Y');	

					$data['blog_content'][]=array(					
						'posts_id'		=>$blog_info['post_id'],
						'title'			=>$blog_info['title'],	
						'short_content'	=>$blog_info['short_content'],
						'image'			=>$image,
						'category'		=>$cate['title'],
						'category_href'	=>$this->url->link('blogs/blogs&category='.$cate['cat_id']),
						'post_content'	=>html_entity_decode($blog_info['post_content']),
						'status'		=>$blog_info['status'],	
						'user'			=>$blog_info['user'],
						'date'			=>$date,
						'month'			=>$month,
						'year'			=>$year,				
						'submit_href'	=>$this->url->link('blogs/blogs'.'&blog_id='.$blog_info['post_id'])
					);
				}	
				if($data['blog_content']){
					if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/module/blogs.tpl')) {
						return $this->load->view($this->config->get('config_template') . '/template/module/blogs.tpl', $data);
					} else {
						return $this->load->view('modern/template/module/blogs.tpl', $data);
					}
				}
			}			
		}
		
	}
 ?>