<div id="footer-ads-wrapper">
	<div class="container">	
		<?php if(isset($cms_block[6])) { echo html_entity_decode($cms_block[6]['content']);} ?>			
	</div>
</div>
<footer class="footer-1">
	<div class="container">
		<div class="main-footer">
			<div class="row">
				<div class="main-footer-col footer-logo-img col-sm-3">
					<img src="<?php echo $info['footer_logo']; ?>">
					<p><?php echo $info['footer_slogan']; ?></p>
				</div>
				<?php foreach ($links as $link) { ?>					
				<div class="main-footer-col col-sm-2 col-xs-6">
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
				<div class="main-footer-col newsletter col-sm-3 col-xs-6">
					<h5 class="footer-list-title">Our newsletter</h5>
					<p>Sign up for Our Newsletter &amp; Promotions</p>
					<form action=" ">
						<input type="text" name="" class="input-email" placeholder="Your email address">
						<input type="submit" class="subcribe-button" value="SUBSCRIBE">
					</form>
				</div>
			</div>
		</div>
		<div class="footer-bottom">
			<div class="row">
				<div class="footer-bottom-col col-sm-8">
					<div class="footer-copyright">
						<?php echo $powered; ?>
					</div>
				</div>
				<div class="footer-bottom-col col-sm-4">
					<div class="icon-payment-wrapper">
						<a class="icon-payment paypal-icon" href="#" data-toggle="tooltip" title="Paypal">paypal</a>
						<a class="icon-payment visa-icon" href="#" data-toggle="tooltip" title="Visa">visa</a>
						<a class="icon-payment maestro-icon" href="#" data-toggle="tooltip" title="Maestro">maestro</a>
						<a class="icon-payment mastercard-icon" href="#" data-toggle="tooltip" title="Master Cart">mastercard</a>
						<a class="icon-payment discover-icon" href="#" data-toggle="tooltip" title="Discover">discover</a>
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

<div id="fixed-socials">
    <a href="#" class="bb-facebook"><i class="fa fa-facebook"></i><span>Follow via facebook</span></a>
    <a href="#" class="bb-twitter"><i class="fa fa-twitter"></i><span>Follow via twitter</span></a>
    <a href="#" class="bb-google"><i class="fa fa-google-plus"></i><span>Follow via google plus</span></a>
    <a href="#" class="bb-youtube"><i class="fa fa-youtube"></i><span>Follow via youtube</span></a>
    <a href="#" class="bb-pinterest"><i class="fa fa-pinterest"></i><span>Follow via pinterest</span></a>
    <a href="#" class="bb-mail"><i class="fa fa-envelope"></i><span>Follow via mail</span></a>     
</div>

<span id="scroll-top"><i class="fa fa-long-arrow-up"></i></span>
<!--Product-quickview hidden-->
<div id="product-quickview" class="modal fade" role="dialog">
  <div class="modal-dialog">  
   <span type="button" class="close-custom" data-dismiss="modal"></span>      
    <div class="modal-content">     
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
							<button class="btn-compare btn-link compare" type="button" data-toggle="tooltip" title="Add to compare" ><i class="fa fa-exchange"></i></button>
							<button class="btn-wishlist btn-link wishlist" type="button" data-toggle="tooltip" title="Add to wishlist"><i class="fa fa-heart"></i></button>    
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
<script type="text/javascript">	
	$('#product-quickview .btn-link').tooltip({'z-index':'99999'});
</script>
</body>
</html>