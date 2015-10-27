<link rel="stylesheet" type="text/css" href="catalog/view/javascript/owl.carousel.2.0.0-beta.2.4/assets/owl.carousel.css">
<style type="text/css">
.mystyle{width:188px;}
</style>
<div>
<div class="owl-carousel product-slider-custom" id="ypn-carousel-other" data-items="<?php echo $item; ?>">
  <?php for ($k=0;$k<count($products);$k+=$row) {  ?>
  <div class="item mystyle">
  <?php for($j=$k;$j<$k+$row;$j++){if($j<count($products))$product=$products[$j];    
      
   ?>
    <div class="product-layout" data-special="<?php echo $special; ?>"><!--col-lg-3 col-md-3 col-sm-6 col-xs-12-->     
      <div class="product-thumb transition">      
        <div class="image"><a href="<?php echo $product['href']; ?>"><img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" title="<?php echo $product['name']; ?>" class="img-responsive" /></a></div>
        <div class="caption">
          <h4><a href="<?php echo $product['href']; ?>"><?php echo html_entity_decode($product['name']); ?></a></h4>
          <!--<p><?php echo $product['description']; ?></p>-->
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
          <?php if ($product['price']) { ?>
          <p class="price">
            <?php if (!$product['special']) { ?>
            <?php echo $product['price']; ?>
            <?php } else { ?>
         <span class="price-old"><?php echo $product['price']; ?></span><!--<span class="price-new"><?php echo $product['special']; ?></span>-->
            <?php } ?>
            <!--<?php if ($product['tax']) { ?>
            <span class="price-tax"><?php echo $text_tax; ?> <?php echo $product['tax']; ?></span>
            <?php } ?>-->
          </p>
          <?php } ?>
        </div>       
       <!-- <hr class="sep"></hr>-->
       <!-- <div class="button-group">
          <button class="add-to-cart" type="button" onclick="cart.add('<?php echo $product['product_id']; ?>');"><i class="fa fa-shopping-cart"></i> <span class="hidden-xs hidden-sm hidden-md"><?php echo $button_cart; ?></span></button>  
          <div style="float:right;color:#aaa!important;">        
            <button type="button" data-toggle="tooltip" title="<?php echo $button_compare; ?>" onclick="compare.add('<?php echo $product['product_id']; ?>');"><i class="fa fa-exchange"></i></button>
            <button type="button" data-toggle="tooltip" title="<?php echo $button_wishlist; ?>" onclick="wishlist.add('<?php echo $product['product_id']; ?>');"><i class="fa fa-heart"></i></button>
          </div>
        </div>-->
       <!-- <?php if(!empty($product['attributes'])) {
              $attributes=$product['attributes'];
              if($attributes[0]['attribute_group_id']==7) {
          ?>
        <h6><?php echo $product['name']; ?></h6>
        <?php }} ?>-->
      </div>
    </div>    
  <?php } ?>
  </div>
  <?php } ?>
  </div>
</div>
<script type="text/javascript" src="catalog/view/javascript/owl.carousel.2.0.0-beta.2.4/owl.
carousel.js"></script>
  <script type="text/javascript">
    $('.owl-carousel').owlCarousel({
        loop:true,
        //margin:20,
        nav:true,         
        responsive:{
            0:{
                items:1
            },
            600:{
                items:2
            },
            1000:{
                items:$('#ypn-carousel-other').data("items")
            }
        }
    })
  </script>
