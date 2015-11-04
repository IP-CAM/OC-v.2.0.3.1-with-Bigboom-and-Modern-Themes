<?php 
	class ModelDesignCMSBlock extends Model{
		public function addBlock($data){
			$sql = "INSERT INTO ".DB_PREFIX."cms_block SET name='" . $this->db->escape($data['name']). "',content='" .$this->db->escape($data['html_content'])."',status='".(int)$data['status']."'";
			$this->db->query($sql);			
		}
		public function getListBlock(){
			return $this->db->query("SELECT id,name,status FROM ".DB_PREFIX."cms_block")->rows;
		}

		public function getBlockInfo($id){
			return $this->db->query("SELECT * FROM ".DB_PREFIX."cms_block WHERE id='".(int)$id."'")->row;
		}

		public function editBlock($data,$id){
			$sql = "UPDATE ".DB_PREFIX."cms_block SET name='".$this->db->escape($data['name'])."',content='".$this->db->escape($data['html_content'])."',status='".(int)$data['status']."' WHERE id='".(int)$id."'";
			return $this->db->query($sql);
		}

		public function deleteBlock($id){
			return $this->db->query("DELETE FROM ".DB_PREFIX."cms_block WHERE id='".(int)$id."'");
		}
	}
 ?>