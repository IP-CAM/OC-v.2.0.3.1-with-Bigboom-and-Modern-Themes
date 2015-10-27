<?php 

	class ControllerModuleBlogLastest extends Controller{

		public function index($setting){

			$this->load->model('catalog/blogs');			

			$this->load->model('tool/image');

			$blog_prop=$this->model_catalog_blogs->getInfoAllBlog($setting['limit']);



			$data['item_display']=$setting['amount'];

			$data['blogs']=array();



			foreach ($blog_prop as $bp) {

				if(isset($bp['icon_image'])&&is_file(DIR_IMAGE .$bp['icon_image'])){

					$image=$this->model_tool_image->resize($bp['icon_image'],$setting['width'],$setting['height']);

				}			

				else{

					$image=$this->model_tool_image->resize('no_image.png',$setting['width'],$setting['height']);

				}	



				if(!empty($bp['short_content'])){

					if($setting['length']< strlen($bp['short_content'])){

						$short_content=substr($bp['short_content'], 0,$setting['length'])."...";

					}					

					else{

						$short_content=$bp['short_content'];

					}

				}

				else{

					$short_content='';

				}



				$day_created= new DateTime($bp['created_time']);

				$date 	=$day_created->format('d');				

				$month	=substr($day_created->format('F'), 0,3);

				$year	=$day_created->format('Y');			



				$data['blogs'][]=array(

					"image"				=>$image,

					"title"				=>$bp['title'],

					"short_desc"		=>$short_content,	

					"href"				=>$this->url->link('blogs/blogs','blog_id='.$bp['post_id']),

					'date'				=>$date,

					'month'				=>$month,

					'year'				=>$year

					);

			}



			if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/module/blogs/blog_lastest_slider.tpl')) {

			return $this->load->view($this->config->get('config_template') . '/template/module/blogs/blog_lastest_slider.tpl', $data);

			} /*else {

				return $this->load->view('bigbom/template/module/blogs/blog_lastest_slider.tpl', $data);

			}*/

		}

	}



 ?>