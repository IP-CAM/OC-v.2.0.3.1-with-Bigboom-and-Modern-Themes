<?php 
	class ControllerBigbomAjaxCategory extends Controller{
		public function index(){

			$this->load->model('catalog/product');
			$this->load->model('tool/image');
			$id=$_POST['category_id'];	
			$products=$this->model_catalog_product->getProductsByCate($id);

			foreach ($products as $prd) {
				if(is_file(DIR_IMAGE.$prd['image'])){
					$image=$this->model_tool_image->resize($prd['image'],40,40);
				}
				else{
					$image = $this->model_tool_image->resize('no_image.png', 40, 40);
				}

				$respone[]=array(
					'product_id'=>$prd['product_id'],
					'image'=>$image,
					'name'=>$prd['name'],

				);
			}

			echo json_encode($respone);
			
		}

		public function getAllProduct(){
			$this->load->model('catalog/product');
			$this->load->model('tool/image');
			$filter=array();
			$products=$this->model_catalog_product->getProducts($filter);
			$respone=array();
			foreach ($products  as $product) {

				if(is_file(DIR_IMAGE.$product['image'])){
					$image=$this->model_tool_image->resize($product['image'],40,40);
				}
				else{
					$image = $this->model_tool_image->resize('no_image.png', 40, 40);
				}
				$respone[]=array(
					'product_id'=>$product['product_id'],
					'image'		=>$image,
					'name'		=>$product['name']
					);
			}

			echo json_encode($respone);
		}		

		public function getProductab(){
			$this->load->model('catalog/product');
			$this->load->model('tool/image');			
			$ip_pro_tab=$_POST['productab_id'];
			$limit=8;
			switch ($ip_pro_tab) {
			case 0:	
				$products_by_tab=$this->model_catalog_product->adgetBestSellerProducts($limit);
				break;					
			case 1:
				$products_by_tab=$this->model_catalog_product->adgetProductSpecials(array());
				break;
			case 2:
				$products_by_tab=$this->model_catalog_product->adgetLatestProducts($limit);
				break;
			case 3:
				$products_by_tab=$this->model_catalog_product->adgetPopularProducts($limit);
				break;
			}	

			if(!empty($products_by_tab)){
				foreach ($products_by_tab as $pbt) {
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

		public function getBanner(){
			$this->load->model('design/banner');
			$this->load->model('tool/image');

			$banner_id=$_POST['banner_id'];				
			$image_des=$this->model_design_banner->getBannerImages($banner_id);		
								
			foreach ($image_des as $img_des) {				
			 	if (is_file(DIR_IMAGE . $img_des['image'])) {
					$image = $this->model_tool_image->resize($img_des['image'], 200, 200);
				} else {
					$image = $this->model_tool_image->resize('no_image.png', 200, 200);
				}	

			$arr_img[]=array(
				"image"=>$image,
				"banner_des"=>$img_des['banner_image_description']		
			);

			}

			echo json_encode($arr_img);
		}
	}
 ?>