<div class="deal-of-day">
	<h3 class="heading-title featured-title"><?php echo $title; ?></h3>
	<div class="row">
		<?php foreach ($deal_total as $deal_item) {  $prod_quick_view=json_encode($deal_item); ?>
		<div class="deal-product col-sm-12 col-xs-6">	
			<div class="row">
				<div class="product-grid col-sm-12">
					<div class="product-thumb">
							<div class="product-label">
							  <div class="label label-hot">
							    <span>hot</span>
							  </div>
							</div>
							<div class="product-image-box">
								<a href="<?php echo $deal_item['href']; ?>" class="product-image-link"></a>
								<img class="product-image product-image-1 img-responsive" src="<?php echo $deal_item['thumb']; ?>" alt=" ">
								<img class="product-image product-image-2 img-responsive" src="<?php echo $deal_item['thumb1']; ?>" alt=" ">
								<div class="product-quickview">
									<span style="display:inline-block;" data-toggle="tooltip" title="<?php echo $button_quickview ?>">
										<a class="btn-quickview btn-link quickview" data-toggle="modal"  data-target="#product-quickview" data-productinfo='<?php echo $prod_quick_view; ?>'>
											<i class="fa fa-search"></i>Quick view
										</a>
									</span>			
								</div>
							</div>
							<div class="product-info">
								<h3 class="product-name"><a href="<?php echo $deal_item['href']; ?>"><?php echo $deal_item['name']; ?></a></h3>
								 <?php if ($deal_item['rating']) { ?>
							            <div class="rating">
							            <?php for ($i = 1; $i <= 5; $i++) { ?>
							            <?php if ($deal_item['rating'] < $i) { ?>
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
									<h5 class="product-price old-price"><?php echo $deal_item['price']; ?></h5>
									<h5 class="product-price new-price"><?php echo $deal_item['special']; ?></h5>
								</div>
								<div class="countdown-wrapper ">	
									<ul class="countdown deal-of-day-timer clearfix" data-datend="<?php echo $deal_item['date_end']; ?>">
										<li>
											<p><span class="days timer-box">00</span></p>
											<p><em class="timer-title">Days</em></p>
										</li>
										<li>
											<p><span class="hours timer-box">00</span></p>
											<p><em class="timer-title">Hrs </em></p>
										</li>
										<li>
											<p><span class="minutes timer-box">00</span></p>
											<p><em class="timer-title">Mins</em></p>
										</li>
										<li>
											<p><span class="seconds timer-box">00</span></p>
											<p><em class="timer-title">Secs</em></p>
										</li>
									</ul>		
								</div>
							</div>
							<div class="button-action clearfix">
								<a data-toggle="tooltip" class="btn-wishlist btn-link wishlist" type="button" data-toggle="tooltip" title="<?php echo $button_wishlist; ?>" onclick="wishlist.add('<?php echo $deal_item['product_id']; ?>');">
									<i class="fa fa-heart">Add to Wish List</i>
								</a>
								<a data-toggle="tooltip" type="button" data-toggle="tooltip" title="<?php echo $button_compare; ?>" class="btn-compare btn-link compare" onclick="compare.add('<?php echo $deal_item['product_id']; ?>');"> 
									<i class="fa fa-exchange"></i>						
								</a>
							</div>
					</div>
				</div>
			</div>
			<script type="text/javascript">		
			 	$(".countdown").each(function(){
			 		$(this).jCounter({ 		
			 		date: $(this).data('datend'),		 		
			 		twoDigits:"on",
			  		fallback: function() { console.log("count finished!")}
					});	
			 	});
			</script>
		</div>
		<?php } ?>
	</div>
</div>
