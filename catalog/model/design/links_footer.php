<?php 
	class ModelDesignLinksFooter extends Controller{
		public function getLink(){
			$link_ena = $this->db->query("SELECT link_id FROM ".DB_PREFIX."footer_link WHERE status=1")->rows;		
			/* get sub link */	
			$link_info=array();		
			foreach ($link_ena as $link) {
				$link_id=$link['link_id'];
				$title		=	$this->db->query("SELECT title FROM ".DB_PREFIX."footer_link_title WHERE link_id='".(int)$link_id."' AND language_id='".(int)$this->config->get('config_language_id')."'")->rows;
				$sublink 	=	$this->db->query("SELECT link_id FROM ".DB_PREFIX."footer_sub_link WHERE parent_id='".(int)$link_id."'  ORDER BY sort_order")->rows;				
				/*$lang=array();
				foreach ($title as $n) {
					array_push($lang, $n['language_id']);				
				}
				$title=array_combine($lang, $title)*/;

				$sub_link_info =array();
				foreach ($sublink as $sub) {
					$sub_link_title 	=	$this->db->query("SELECT title FROM ".DB_PREFIX."footer_link_title WHERE link_id='".(int)$sub['link_id']."' AND language_id='".(int)$this->config->get('config_language_id')."'")->rows;
					$sub_link_order		=	$this->db->query("SELECT href FROM ".DB_PREFIX."footer_sub_link WHERE link_id='".(int)$sub['link_id']."'");					
					$sub_link_info[]	=	array(
						"sub_link"			=>	$sub_link_title[0]['title'],						
						"href"				=> 	$sub_link_order->row['href']
						);
				}

					$link_info[]=array(
					"title"		=>	$title[0]['title'],				
					"link"	=>	$sub_link_info
				);

				
			}		

			return $link_info;

		}

	}
 ?>