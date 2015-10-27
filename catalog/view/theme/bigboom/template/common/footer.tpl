<footer>
	<div class="container">
		<div class="footer-1">
			<div class="row">
				<div class="footer-1-col footer-logo-img col-sm-3">
					<img src="<?php echo $info['footer_logo']; ?>">
					<p><?php echo $info['footer_slogan']; ?></p>
				</div>
				<?php foreach ($links as $link) { ?>					
				<div class="footer-1-col col-sm-2 col-xs-6">
					<h5 class="footer-list-title"><?php echo $link['title']; ?></h5>
					<ul class="footer-list-item">	
					<?php foreach ($link['link'] as $sub_link) { ?>
						<li>
							<a href="<?php echo  $sub_link['href']; ?>">
								<i class="fa fa-caret-right"></i>
								<?php echo $sub_link['sub_link']; ?>
							</a>
						</li>								
					<?php } ?>					
					</ul>
				</div>
				<?php } ?>
				<div class="footer-1-col newsletter col-sm-3 col-xs-6">
					<h5 class="footer-list-title">Our newsletter</h5>
					<p>Sign up for Our Newsletter &amp; Promotions</p>
					<form action="">
						<input type="text" name="" class="input-email" placeholder="Your email address">
						<input type="submit" class="subcribe-button" value="SUBSCRIBE">
					</form>
				</div>
			</div>
		</div>
		<div class="footer-2">
			<div class="row">
				<div class="footer-2-col col-sm-8">
					<div class="footer-copyright">
						<?php echo $powered; ?>
					</div>
				</div>
				<div class="footer-2-col col-sm-4">
					<div class="icon-payment-wrapper">
						<a class="icon-payment paypal-icon" href="#">paypal</a>
						<a class="icon-payment visa-icon" href="#">visa</a>
						<a class="icon-payment maestro-icon" href="#">maestro</a>
						<a class="icon-payment mastercard-icon" href="#">mastercard</a>
						<a class="icon-payment discover-icon" href="#">discover</a>
					</div>
				</div>
			</div>
		</div>
	</div>
</footer>

<!--
OpenCart is open source software and you are free to remove the powered by OpenCart if you want, but its generally accepted practise to make a small donation.
Please donate via PayPal to donate@opencart.com
//-->

<!-- Theme created by Welford Media for OpenCart 2.0 www.welfordmedia.co.uk -->

<span id="scroll-top"><i class="fa fa-long-arrow-up"></i></span>
<!--Product-quickview hidden-->
<div id="product-quickview" class="modal fade" role="dialog">
  <div class="modal-dialog">    
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal">&times;</button>    
      </div>
      <div class="row modal-body">  
          <div class="col-sm-4 product-images">
            <div class="main-image"><a href="#"><img class="img-thumbnail" src=""></div></a>
            <div class="other-image">
              <ul>                
              </ul>
            </div>
          </div>
          <div class="col-sm-8 product-desc">
            <div>
                <ul>
                  <li><h3></h3></li>
                  <li><div class="rating"></div></li>
                  <li><p class="price"></p></li>
                  <li><p class="modal-description"></p></li>
                  <li class="quickview-button-wrapper">
					 <div class="add-to-cart-content">
					  	<button class="add-to-cart-button" type="button"><?php echo $button_cart; ?></button> 
                  	</div>            
					<div class="button-group button-action ">   
							<button class="btn-compare btn-link compare" type="button" data-toggle="tooltip" title="<?php echo $button_compare; ?>" ><i class="fa fa-exchange"></i></button>
							<button class="btn-wishlist btn-link wishlist" type="button" data-toggle="tooltip" title="<?php echo $button_wishlist; ?>"><i class="fa fa-heart"></i></button>    
                    </div>                    
                  </li>  
                </ul>
            </div>
          </div>       
      </div>

    </div>
  </div>
</div>
<!--end Product-quickview-->

</body>
</html>