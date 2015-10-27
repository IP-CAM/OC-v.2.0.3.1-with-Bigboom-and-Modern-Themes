<?php 
	class ModelDesignFooterContact extends Model{
		public function getContact(){
			return $info = $this->db->query("SELECT * FROM ".DB_PREFIX."contact_info WHERE language_id='".(int)$this->config->get('config_language_id')."'")->rows;
		}
		public function getProductTag(){
			return $this->db->query("SELECT tag FROM ".DB_PREFIX."product_description WHERE tag !=''")->rows;
		}
	}
 ?>