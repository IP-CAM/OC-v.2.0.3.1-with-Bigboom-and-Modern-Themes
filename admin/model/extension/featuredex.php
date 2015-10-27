<?php 
	class ModelExtensionFeaturedex extends Model{

	public function getAllCategories(){
		$query=$this->db->query("SELECT ". DB_PREFIX ."category.category_id,name FROM ". DB_PREFIX ."category inner join ". DB_PREFIX ."category_description on ". DB_PREFIX ."category.category_id= ". DB_PREFIX. "category_description.category_id WHERE top=1");
		return $query->rows;
		}	
	}
 ?>