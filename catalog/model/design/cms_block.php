<?php 
	class ModelDesignCMSBlock extends Model{
		public function getBlocks(){
			return $this->db->query("SELECT * FROM ".DB_PREFIX."cms_block WHERE status='1'")->rows;
		}
	}
 ?>