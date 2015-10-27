<div class="nav-tab-wrapper">
	<ul class="nav nav-tabs product-nav-tabs" data-tabs="tabs">
		<?php foreach ($tabs as $k=>$tab) { ?>					
			<li <?php if($k==0)echo 'class="active"'; ?>><a href="#product-tab-<?php echo $k; ?>" data-toggle="tab" class="product-tab-title" data-index="<?php echo $k; ?>" data-products='<?php echo json_encode($tab['products']); ?>'><?php echo $tab['name']; ?></a></li>		
		<?php } ?>	
	</ul>
	<div class="tab-content">
		<?php foreach ($tabs as $k => $tab) { ?>			
		<div class="tab-pane <?php if($k==0)echo "active";?>" id="product-tab-<?php echo $k; ?>">
			<div class="row">
				<?php foreach ($tab['products'] as $product) {  $prod_quick_view=json_encode($product);?>
				<div class="product-grid col-md-3 col-xsl-4 col-xs-6">
					<div id="product-content<?php echo $product['product_id']; ?>" class="product-thumb">
						<div class="product-image-box">
							<a href="<?php echo $product['href']; ?>" class="product-image-link" ></a>
							<img class="product-image product-image-1 img-responsive" src="<?php echo $product['thumb']; ?>">
							<img class="product-image product-image-2 img-responsive" src="<?php echo $product['thumb1']; ?>">
							<div class="button-action">							
									<span style="display:inline-block;" data-toggle="tooltip" title="<?php echo $button_quickview; ?>">
										<a class="btn-quickview btn-link quickview" data-toggle="modal" data-target="#product-quickview" data-productinfo='<?php echo $prod_quick_view; ?>'>
										<i class="fa fa-search"><?php echo $button_quickview; ?></i>
										</a>
									</span>									
									<a class="btn-wishlist btn-link wishlist"  type="button" data-toggle="tooltip" title="<?php echo $button_wishlist; ?>" onclick="wishlist.add('<?php echo $product['product_id']; ?>');">
										<i class="fa fa-heart"><?php echo $button_wishlist ?></i>
									</a>

									<a type="button" data-toggle="tooltip" title="<?php echo $button_compare; ?>" class="btn-compare btn-link compare" onclick="compare.add('<?php echo $product['product_id']; ?>');"> 
									<i class="fa fa-exchange"><?php echo $button_compare; ?></i>			
									</a>			
							</div>
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
							<div class="add-to-cart-content">
							<button type="button" class="add-to-cart-button" onclick="cart.add('<?php echo $product['product_id']; ?>');"><?php echo $button_cart; ?></button>
							</div>
						</div>
					</div>
				</div>
				<?php } ?>
			</div>
		</div>				
		<?php } ?>
	</div>
</div>


