<?php
	class ModelCatalogBlogs extends Model{

		public function getAllBlogs($data=array()){		
			$sql="SELECT * from ".DB_PREFIX."themevast_blog tb inner JOIN ".DB_PREFIX."themevast_blog_desc tbd on tb.post_id = tbd.post_id WHERE tbd.language_id = ". (int)$this->config->get('config_language_id')." order by ".$data['sort']." ".$data['order'];
			$query=$this->db->query($sql);			
			return $query->rows;
		}

		public function addBlogs($data){	
			$this->event->trigger('pre.admin.blogs.add',$data);
			$this->db->query("INSERT INTO ".DB_PREFIX."themevast_blog SET status='".$data['status']."',created_time=NOW(),icon_image='".$this->db->escape($data['icon_image'])."',user='".$this->user->getUserName()."'");
			$post_id =$this->db->getLastId();	
			foreach ($data['blog_description'] as $language_id => $value) {			
				$this->db->query("INSERT INTO ".DB_PREFIX."themevast_blog_desc SET post_id='".(int)$post_id."',language_id='".(int)$language_id."',title='".$this->db->escape($value['name'])."',post_content='".$this->db->escape($value['content'])."',meta_description='".$this->db->escape($value['meta_description'])."',meta_tag_title='".$this->db->escape($value['meta_title'])."',short_content='".$this->db->escape($value['short_content'])."',meta_keywords='".$this->db->escape($value['meta_keyword'])."'");
			}	

			if(isset($data['blog_store'])){
				foreach ($data['blog_store'] as $store_id) {
					$this->db->query("INSERT INTO ".DB_PREFIX."themevast_blog_store SET post_id='".$post_id."',store_id='".$store_id."'");
				}
			}		

			$blog_cate_id=$data['blog_cate'];

			if(isset($data['blog_new_cate'])){
				$this->db->query("INSERT INTO ".DB_PREFIX."themevast_blog_cat SET title='".$this->db->escape($data['blog_new_cate'])."'");				
				$blog_cate_id =$this->db->getLastId();	
			}
			
			$this->db->query("INSERT INTO ".DB_PREFIX."themevast_blog_post_cat SET cat_id='".(int)$blog_cate_id."',post_id='".(int)$post_id."'");					

			if (!empty($data['keyword'])) {
			$this->db->query("INSERT INTO " . DB_PREFIX . "url_alias SET query = 'post_id=" . (int)$post_id . "', keyword = '" . $this->db->escape($data['keyword']) . "'");
			}

			$this->cache->delete('blogs');
			$this->event->trigger('post.admin.blogs.add',$blog_id);
			return $blog_id;
		}

		public function getBlogCate(){
			return $this->db->query('SELECT cat_id,title FROM '.DB_PREFIX."themevast_blog_cat")->rows;
		}

		public function editBlogs($blog_id,$data=array()){	

			$this->event->trigger('pre.admin.blogs.add',$data);		

			$this->db->query("UPDATE ".DB_PREFIX."themevast_blog SET status='".(int)$data['status']."',update_time=NOW(),icon_image='".$this->db->escape($data['icon_image'])."',update_user='".$this->user->getUserName()."' WHERE post_id='".(int)$blog_id."'");

			$this->db->query("DELETE FROM ".DB_PREFIX."themevast_blog_desc WHERE post_id='".(int)$blog_id."'");

			foreach ($data['blog_description'] as $language_id => $value) {
				$this->db->query("INSERT INTO ".DB_PREFIX."themevast_blog_desc SET post_id='".(int)$blog_id."',language_id='".(int)$language_id."',title='".$this->db->escape($value['name'])."',post_content='".$this->db->escape($value['content'])."',meta_description='".$this->db->escape($value['meta_description'])."',meta_tag_title='".$this->db->escape($value['meta_title'])."',short_content='".$this->db->escape($value['short_content'])."',meta_keywords='".$this->db->escape($value['meta_keyword'])."'");				
			}				

			$this->db->query("DELETE FROM ".DB_PREFIX."url_alias WHERE query='post_id=".(int)$blog_id."'");

			if($data['keyword']){
				$this->db->query("INSERT INTO " . DB_PREFIX . "url_alias SET query = 'post_id=" . (int)$blog_id . "', keyword = '" . $this->db->escape($data['keyword']) . "'");
			}

			$blog_cate_id=$data['blog_cate'];

			if(isset($data['blog_new_cate'])){
				$this->db->query("INSERT INTO ".DB_PREFIX."themevast_blog_cat SET title='".$this->db->escape($data['blog_new_cate'])."'");				
				$blog_cate_id =$this->db->getLastId();	
			}

			$this->db->query("UPDATE ".DB_PREFIX."themevast_blog_post_cat SET cat_id='".(int)$blog_cate_id."' WHERE post_id='".(int)$blog_id."'");

			if(isset($data['blog_store'])){
				foreach ($data['blog_store'] as $store_id) {
					$this->db->query('UPDATE '.DB_PREFIX."themevast_blog_store SET store_id='".(int)$store_id."' WHERE post_id='".(int)$blog_id."'");
				}
			}

			$this->cache->delete('blogs');
			$this->event->trigger('post.admin.blogs.edit',$blog_id);
		}

		public function getBlogsInfo($post_id){
			$sql="SELECT tb.post_id,tb.icon_image,tb.status,tbc.cat_id,(SELECT keyword FROM ".DB_PREFIX."url_alias WHERE query='post_id=".(int)$post_id."') as keyword FROM ".DB_PREFIX."themevast_blog tb inner JOIN ".DB_PREFIX."themevast_blog_post_cat tbc ON tb.post_id=tbc.post_id WHERE tb.post_id=".$post_id;									
			return $this->db->query($sql)->row;
		}

		public function getBlogStore($post_id){

			$blog_store_data=array();

			$sql=$this->db->query("SELECT * from ".DB_PREFIX."themevast_blog_store WHERE post_id=".$post_id);
			foreach ($sql->rows as $result) {
				$blog_store_data[]=$result['store_id'];
			}
			return $blog_store_data;
		}

		public function getBlogsDescription($post_id){

			$blog_description_data=array();
			$sql="SELECT tbd.language_id,tbd.title,tb.post_id,tbd.post_content,tbd.meta_tag_title,tbd.meta_keywords,tbd.meta_description,tbd.short_content FROM ".DB_PREFIX."themevast_blog tb inner JOIN ".DB_PREFIX."themevast_blog_desc tbd on tb.post_id = tbd.post_id WHERE tb.post_id=".$post_id;
			$query=$this->db->query($sql);
						
			foreach ($query->rows as $result) {
				$blog_description_data[$result['language_id']]=array(
					'name'=>$result['title'],
					'content'=>$result['post_content'],
					'short_content'=>$result['short_content'],
					'meta_title'=>$result['meta_tag_title'],
					'meta_keyword'=>$result['meta_keywords'],
					'meta_description'=>$result['meta_description'],					
					);				
			}

			return $blog_description_data;

		}

		public function deleteBlogs($post_id){					
			$this->event->trigger('pre.admin.blogs.delete',$post_id);
			$this->db->query("DELETE FROM ".DB_PREFIX."themevast_blog WHERE post_id='".(int)$post_id."'");
			$this->db->query("DELETE FROM ".DB_PREFIX."themevast_blog_store WHERE post_id='".(int)$post_id."'");
			$this->db->query("DELETE FROM ".DB_PREFIX."themevast_blog_comment WHERE post_id='".(int)$post_id."'");
			$this->db->query("DELETE FROM ".DB_PREFIX."themevast_blog_post_cat WHERE post_id='".(int)$post_id."'");
			$this->db->query("DELETE FROM ".DB_PREFIX."url_alias WHERE query='post_id=".(int)$post_id."'");
			$this->db->query("DELETE FROM ".DB_PREFIX."themevast_blog_desc WHERE post_id='".(int)$post_id."'");
			$this->cache->delete('blogs');
			$this->event->trigger('post.admin.blogs.delete',$post_id);
		}

		public function getTotalBlogs(){
			$query=$this->db->query("SELECT COUNT(*) AS total FROM ".DB_PREFIX."themevast_blog");
			return $query->row['total'];
		}
	}
  ?>