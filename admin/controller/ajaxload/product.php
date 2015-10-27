<?php 
	
	class ControllerAjaxloadProduct extends Controller{
		public function getAllProduct(){
			$this->load->model('catalog/product');
			$this->load->model('catalog/category');
			$this->load->model('extension/categories');
			$this->load->model('tool/image');			
			$filter_data=array();
			$result= $this->model_catalog_product->getProducts($filter_data);
			$categories=$this->model_extension_categories->getAllCategories();	

			$products=array();
			foreach ($result as $rs) {
				if(is_file(DIR_IMAGE.$rs['image'])){
					$image=$this->model_tool_image->resize($rs['image'],40,40);
				}
				else{
					$image=$this->model_tool_image->resize('no_image.png',40,40);	
				}

				$products[]=array(
					'product_id'=>$rs['product_id'],
					'name'		=>$rs['name'],
					'image'		=>$image
					);		
			}

			$response=array(
				"categories"=>$categories,
				"products"	=>$products
				);
			echo json_encode($response);
		}

		public function productByCate(){
			$this->load->model('catalog/product');
			$this->load->model('tool/image');
				
			$cate_id=$_POST['cate_id'];
			$products=$this->model_catalog_product->getProductsByCategoryId($cate_id);
			$response=array();
			foreach ($products as $product) {
				if(is_file(DIR_IMAGE.$product['image'])){
					$image=$this->model_tool_image->resize($product['image'],40,40);
				}
				else{
					$image=$this->model_tool_image->resize('no_image.png',40,40);	
				}

				$response[]=array(
					'product_id'=>$product['product_id'],
					'name'		=>$product['name'],
					'image'		=>$image
					);		
			}

			echo json_encode($response);
		}

		public function productbyType(){
			$this->load->model('catalog/product');
			$this->load->model('tool/image');

			$type_id=$_POST['type_id'];
			$limit=8;
			switch ($type_id) {
				case 0:
					$product_by_type=$this->model_catalog_product->adgetBestSellerProducts($limit);
					break;
				case 1:
					$products_by_type=$this->model_catalog_product->adgetProductSpecials(array());
					break;					
				case 2:		
					$products_by_type=$this->model_catalog_product->adgetLatestProducts($limit);		
					break;	
				case 3:
					$products_by_type=$this->model_catalog_product->adgetPopularProducts($limit);
					break;					
			}

			if(!empty($products_by_type)){
				foreach ($products_by_type as $pbt) {
					if(is_file(DIR_IMAGE.$pbt['image'])){
						$image=$this->model_tool_image->resize($pbt['image'],40,40);
					}
					else $image=$this->model_tool_image->resize('no_image',40,40);

					$pbt_rs[]=array(
					"image"=>$image,
					"product_id"=>$pbt['product_id'],
					"name"=>$pbt['name']
					);
				}
				$respone_tab =  $pbt_rs;
			}

			else{$respone_tab = array();}

			echo json_encode($respone_tab);		
		}
	}

 ?>