<div class="featured-list">
	<h3 class="heading-title featured-title"><?php echo $heading_title; ?></h3>	
	<div class="product-content-wrapper">
		<?php foreach ($products as $product) { ?>	
		<div class="product-thumb clearfix">
			<div class="product-image-box">
				<a href="<?php echo $product['href'] ?>" class="product-image-link"></a>
				<img class="product-image product-image-1 img-responsive" src="<?php echo $product['thumb']; ?>">
				<img class="product-image product-image-2 img-responsive" src="<?php echo $product['thumb1'] ?>">
			</div>
			<div class="product-info">
				<h3 class="product-name"><a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a></h3>
				 <?php if ($product['rating']) { ?>
			            <div class="rating">
			            <?php for ($i = 1; $i <= 5; $i++) { ?>
			            <?php if ($product['rating'] < $i) { ?>
			            <span class="fa fa-stack"><i class="fa fa-star fa-stack-2x" style="color:#999;"></i></span>
			            <?php } else { ?>
			            <span class="fa fa-stack"><i class="fa fa-star fa-stack-2x"></i><i class="fa fa-star fa-stack-2x" tyle="color:#999;"></i></span>
			            <?php } ?>
			            <?php } ?>
			          </div>
			          <?php } else {?> <div class="rating">
			            <?php for ($i=0; $i <5 ; $i++) { ?>
			                <span class="fa fa-stack"><i class="fa fa-star fa-stack-2x" style="color:#999;"></i></span>
            			<?php } ?></div><?php } ?>
				<div class="product-price-content">
					<?php if($product['special']) { ?>
						<h5 class="product-price old-price"><?php echo $product['price']; ?></h5>
						<h5 class="product-price new-price"><?php echo $product['special']; ?></h5>
						<?php } else { ?>
						<h5 class="product-price new-price"><?php echo $product['price']; ?></h5>
					<?php } ?>
				</div>
			</div>
		</div>	
		<?php  } ?>	
	</div>	
</div>
