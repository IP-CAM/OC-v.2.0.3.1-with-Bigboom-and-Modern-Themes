<?php 
	class ModelDesignFooterContact extends Model{
		public function addContact($language_id){	

			//print_r($language_id);die;
			$avaiable = $this->db->query("SELECT language_id FROM ".DB_PREFIX."contact_info")->rows;
			$lang_avai	= array();

			foreach ($avaiable as $avai) {
				array_push($lang_avai, $avai['language_id']);
			}	
			if(!in_array($language_id, $lang_avai)){				
				$this->db->query("INSERT INTO ".DB_PREFIX."contact_info SET language_id='".(int)$language_id."'");				
			}			
		}

		public function editContact($data){		
			foreach ($data['info'] as $language_id=>$slogan) {
				$this->db->query("UPDATE ".DB_PREFIX."contact_info SET footer_slogan='".$this->db->escape($slogan['footer_slogan'])."', contact_info='".$this->db->escape($slogan['contact_info'])."',footer_text='".$this->db->escape($slogan['footer_text'])."',footer_logo='".$this->db->escape($slogan['footer_logo'])."' WHERE language_id='".$language_id."'");				
			}
		}

		public function getContactInfo(){
			return $info = $this->db->query("SELECT * FROM ".DB_PREFIX."contact_info")->rows;		
		}
	}
 ?>