<?php 
	class ModelDesignLinksFooter extends Model{

		public function addLink($data){
			
				$this->db->query("INSERT INTO ".DB_PREFIX."footer_link SET status='".(int)$data['status']."'");		
				$link_id=$this->db->getLastId();				
			foreach ($data['name'] as $language_id => $d) {
				$this->db->query("INSERT INTO ".DB_PREFIX."footer_link_title SET link_id='".$link_id."',language_id='".$language_id."',title='".$this->db->escape($d['title'])."'");								
			}

			if(isset($data['link'])){
				foreach ($data['link'] as $k => $sub_link) {
					$sub=(10*$link_id+$k);
					$this->db->query("INSERT INTO ".DB_PREFIX."footer_sub_link SET link_id='".$sub."',sort_order='".(int)$sub_link['sort_order']."',href='".$this->db->escape($sub_link['href'])."',parent_id='".$link_id."'");
					foreach ($sub_link['link_desc'] as $language_id=>$title) {
						$this->db->query("INSERT INTO ".DB_PREFIX."footer_link_title SET link_id='".$sub."',language_id='".$language_id."',title='".$this->db->escape($title['title'])."',parent_id='".$link_id."'");
					}
				}
			}
		}

		public function editLink($link_id,$data){
			$this->db->query("UPDATE ".DB_PREFIX."footer_link SET status='".(int)$data['status']."' WHERE link_id='".(int)$link_id."'");
			$this->db->query("DELETE FROM ".DB_PREFIX."footer_sub_link WHERE parent_id='".(int)$link_id."'");	
			$this->db->query("DELETE FROM ".DB_PREFIX."footer_link_title WHERE parent_id='".(int)$link_id."'");

			if(isset($data['link'])){
				foreach ($data['link'] as $k => $link) {
					$sub=(10*$link_id+$k);
						if(!empty($link['link_desc'])){
							$this->db->query("INSERT INTO ".DB_PREFIX."footer_sub_link SET link_id='".$sub."',parent_id='".$link_id."'");
							foreach ($link['link_desc'] as $language_id=>$link_desc) {
								$this->db->query("INSERT INTO ".DB_PREFIX."footer_link_title SET title='".$this->db->escape($link_desc['title'])."',link_id='".$sub."',language_id='".$language_id."',parent_id='".$link_id."'");
							}	

							if(!empty($link['href'])){
							$this->db->query("UPDATE ".DB_PREFIX."footer_sub_link SET href='".$this->db->escape($link['href'])."' WHERE link_id='".$sub."'" );
							}

							if(!empty($link['sort_order'])){
							$this->db->query("UPDATE ".DB_PREFIX."footer_sub_link SET sort_order='".$this->db->escape($link['sort_order'])."' WHERE link_id='".$sub."'");
							}
						}
					}			
				}
		}		

		public function deleteLink($link_id){
			$this->db->query("DELETE FROM ".DB_PREFIX."footer_link WHERE link_id='".(int)$link_id."'");
			$this->db->query("DELETE FROM ".DB_PREFIX."footer_sub_link WHERE parent_id='".(int)$link_id."'");			
			$this->db->query("DELETE FROM ".DB_PREFIX."footer_link_title WHERE link_id='".(int)$link_id."' OR parent_id='".(int)$link_id."'");
		}

		public function getLinkInfo($link_id){
			$title		=	$this->db->query("SELECT title,language_id FROM ".DB_PREFIX."footer_link_title WHERE link_id='".(int)$link_id."'")->rows;
			$status 	=	$this->db->query("SELECT status FROM ".DB_PREFIX."footer_link WHERE link_id='".(int)$link_id."'")->row;
			$sublink 	=	$this->db->query("SELECT link_id FROM ".DB_PREFIX."footer_sub_link WHERE parent_id='".(int)$link_id."'")->rows;
			$sub_link_info =array();
			$lang=array();
			foreach ($title as $n) {
				array_push($lang, $n['language_id']);				
			}
			$title=array_combine($lang, $title);

			foreach ($sublink as $sub) {
				$sub_link_title 	=	$this->db->query("SELECT title,language_id FROM ".DB_PREFIX."footer_link_title WHERE link_id='".(int)$sub['link_id']."'")->rows;
				$sub_link_order		=	$this->db->query("SELECT sort_order,href FROM ".DB_PREFIX."footer_sub_link WHERE link_id='".(int)$sub['link_id']."'");
				$sub_link_title		=	array_combine($lang, $sub_link_title);
				$sub_link_info[]	=	array(
					"link_desc"			=>	$sub_link_title,
					"sort_order"		=>	$sub_link_order->row['sort_order'],
					"href"				=> 	$sub_link_order->row['href']
					);
			}

			$link_info=array(
				"title"		=>	$title,
				"status"	=>	$status['status'],
				"link"	=>	$sub_link_info
				);
			return $link_info;
		}

		public function getFooterLink(){
			return $this->db->query("SELECT * FROM ".DB_PREFIX."footer_link fl inner JOIN ".DB_PREFIX."footer_link_title flt WHERE fl.link_id = flt.link_id AND flt.language_id= '".(int)$this->config->get('config_language_id')."'")->rows;
		}		
	}
 ?>