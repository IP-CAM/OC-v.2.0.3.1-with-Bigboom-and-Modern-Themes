<div id="footer-ads-wrapper">
	<div class="container">	
		<?php if(isset($cms_block[6])) { echo html_entity_decode($cms_block[6]['content']);} ?>			
	</div>
</div>
<footer class="footer-2">
	<div class="footer-top">
		<div class="container">
			<div class="row">
				<div class="col-lg-6 col-sm-5">
					<div class="get-in-touch">
						<h3 class="title">Get in touch !</h3>
						<div class="icon">
							<a href="#" data-toggle="tooltip" title="Facebook"><i class="fa fa-facebook"></i></a>
							<a href="#" data-toggle="tooltip" title="Twitter"><i class="fa fa-twitter"></i></a>
							<a href="#" data-toggle="tooltip" title="RSS"><i class="fa fa-rss"></i></a>
							<a href="#" data-toggle="tooltip" title="Pinterest"><i class="fa fa-pinterest-square"></i></a>
							<a href="#" data-toggle="tooltip" title="Instagram"><i class="fa fa-instagram"></i></a>
						</div>
					</div>
				</div>
				<div class="col-lg-6 col-sm-7">
					<div class="newsletter">
						<h5 class="footer-list-title">Our newsletter</h5>
						<form action=" ">
							<input type="text" name="" class="input-email" placeholder="Your email address">
							<a  class="subcribe-button" href="<?php echo $url_new_letter; ?>">SUBCRIBE</a>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="footer-main-wrapper">
		<div class="container">
			<div class="main-footer">
				<div class="row">
					<div class="main-footer-col footer-logo-img col-md-3 col-xsl-5">
						<img src="<?php echo $info['footer_logo']; ?>">
						<p><?php echo $info['footer_slogan']; ?></p>
					</div>
					<div class="main-footer-col col-md-3 col-xsl-7">
						<?php echo $info['contact_info']; ?>
					</div>
					<?php foreach ($links as $link) { ?>					
					<div class="main-footer-col  col-md-2 col-xsl-4 col-xs-6">
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
					
				</div>
			</div>
			<div class="footer-bottom">
				<div class="row">
					<div class="footer-bottom-col col-sm-6">
						<div class="footer-copyright">
							<?php echo $powered; ?>
						</div>
					</div>
					<div class="footer-bottom-col col-sm-6">
						<div class="icon-payment-wrapper">
							<a class="icon-payment paypal-icon" href="#" data-toggle="tooltip" title="Paypal">paypal</a>
							<a class="icon-payment visa-icon" href="#" data-toggle="tooltip" title="Visa">visa</a>
							<a class="icon-payment maestro-icon" href="#" data-toggle="tooltip" title="Maestro">maestro</a>
							<a class="icon-payment mastercard-icon" href="#" data-toggle="tooltip" title="Mastercard">mastercard</a>
							<a class="icon-payment discover-icon" href="#" data-toggle="tooltip" title="Discover">discover</a>
						</div>
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
						<button class="btn-wishlist btn-link wishlist" type="button" data-toggle="tooltip" title="Add to wish list"><i class="fa fa-heart"></i></button>    
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
