<h3 style="margin-top:0;"><?php echo $heading_title ?></h3>
<style type="text/css">
	.items-seller ul{display:inline-flex;padding-left:0;}
	.items-seller ul li{list-style:none;float:left;}
	.items-seller:hover{opacity:0.7;}
	.items-seller{transition: all 0.3s ease;border:none;}
</style>
<div class="list-content">
	<?php if(!empty($product)) {
		foreach ($products as $product) { ?>
		<div class="items-seller product-thumb">  
		  
		  <ul>          
		     <li class="image-best"><a href="<?php echo $product['href']; ?>"><img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>"></a></li>
		     <li>
		        <h4><?php echo $product['name']; ?></h4>
		        <div class="best-seller-price"><span><?php echo $product['price']; ?></span></div>
		         <div class="best-seller-price"><span>Ex Tax:<?php echo $product['tax']; ?></span></div>
		     </li>
		  </ul>
		
		</div>
	<?php }} else { ?><h5>Out of date</h5><?php } ?>
</div>