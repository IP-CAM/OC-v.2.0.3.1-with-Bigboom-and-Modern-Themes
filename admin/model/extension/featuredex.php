<?php 
	class ModelExtensionFeaturedex extends Model{

	public function getAllCategories(){
		$query=$this->db->query("SELECT ". DB_PREFIX ."category.category_id,name FROM ". DB_PREFIX ."category inner join ". DB_PREFIX ."category_description on ". DB_PREFIX ."category.category_id= ". DB_PREFIX. "category_description.category_id WHERE ".DB_PREFIX."category.top=1 and ".DB_PREFIX."category_description.language_id='".$this->config->get('config_language_id')."'");
		return $query->rows;
		}	
	}
 ?>