<?php 
	class ModelCatalogBlogs extends Controller{

		public function getBlogInfo($post_id){
			$sql="SELECT tb.post_id,tbd.title,tb.icon_image,tbd.post_content,tb.status,tb.created_time,tbd.short_content,tb.user FROM ".DB_PREFIX."themevast_blog tb inner JOIN ".DB_PREFIX."themevast_blog_desc tbd on tb.post_id = tbd.post_id WHERE tb.post_id='".(int)$post_id."' AND tbd.language_id='".(int)$this->config->get('config_language_id')."'";	
			return $this->db->query($sql)->row;			
		}

		public function getBlogCate($post_id){
			$cate_id	=$this->db->query("SELECT cat_id FROM " .DB_PREFIX. "themevast_blog_post_cat WHERE post_id='".$post_id."'")->row['cat_id'];
			return $this->db->query("SELECT cat_id,title FROM " .DB_PREFIX. "themevast_blog_cat WHERE cat_id='".$cate_id."'")->row;
		}

		//get some info of blog send to lastest blogs module
		public function getInfoAllBlog($limit){
			$sql="SELECT tb.icon_image,tbd.short_content,tb.post_id,tbd.title,tb.created_time FROM ".DB_PREFIX."themevast_blog tb inner JOIN ".DB_PREFIX."themevast_blog_desc tbd on tb.post_id = tbd.post_id WHERE tb.status=1 AND tbd.language_id=".(int)$this->config->get('config_language_id')."  order by tb.created_time desc limit 0,".$limit;						
			return $this->db->query($sql)->rows;
		}

		public function getTotalBlogs($data=array()){	

			$sql="SELECT tb.post_id FROM ".DB_PREFIX."themevast_blog_post_cat tbp inner JOIN ".DB_PREFIX."themevast_blog tb ON tbp.post_id=tb.post_id ";
			if(!empty($data['category']))		{
				$sql.=" WHERE tbp.cat_id='".(int)$data['category']."'";
			}
			if (isset($data['start']) || isset($data['limit'])) {
				if ($data['start'] < 0) {
					$data['start'] = 0;
				}

				if ($data['limit'] < 1) {
					$data['limit'] = 2;
				}

				$sql.= " limit ".(int)$data['start'].",".(int)$data['limit'];
			}

			return $this->db->query($sql)->rows;
		}

		public function getBlogsEnabled($data=array()){
			if(!empty($data['category'])){
				$sql="SELECT count(*) as total FROM ".DB_PREFIX."themevast_blog tb inner JOIN ".DB_PREFIX."themevast_blog_post_cat tbp ON tb.post_id=tbp.post_id WHERE tb.status=1 AND tbp.cat_id='".(int)$data['category']."'";
				return ($this->db->query($sql)->row['total']);
			}
			else
			{
				$sql="SELECT count(*) as total FROM ".DB_PREFIX."themevast_blog WHERE status=1";
				return ($this->db->query($sql)->row['total']);
			}
		}
	}
 ?>