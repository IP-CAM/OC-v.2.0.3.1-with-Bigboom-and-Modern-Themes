<div class="featured-product">
  <h2 class="heading-title heading-slide-title heading-featured"><?php echo $heading_title; ?></h2> 
    <?php $random = rand(1, 1000); //Each slide has different id?> 
    <div class="owl-carousel product-slider-custom" id="ypn-carousel-<?php echo $random ?>" data-items="<?php echo $item; ?>">
    <?php for ($k=0;$k<count($products);$k+=$row) {  ?>
    <div class="item"> 
    <?php for($j=$k;$j<$k+$row;$j++){if($j<count($products))$product=$products[$j];
        $prod_quick_view=json_encode($product);         
       
     ?>
      <div class="product-layout product-grid" data-special="<?php echo $special; ?>">
        <!--col-lg-3 col-md-3 col-sm-6 col-xs-12-->          
        <div class="product-thumb">
         <?php if(in_array($product['product_id'], $new_product_id)||in_array($product['product_id'],$spec_product_id )) { ?> 
              <div class="product-label">
              <?php if(in_array($product['product_id'], $new_product_id)) { ?>
                <div class="label label-new">
                  <span>new</span>
                </div>
                <?php } ?>
                <?php if(in_array($product['product_id'],$spec_product_id )) { ?>
                <div class="label label-sale">
                  <span><?php echo $product['discount']; ?></span>
                </div>
                <?php } ?>
              </div>
            <?php } ?>
              <div class="product-image-box">
                <a href="<?php echo $product['href']; ?>" class="product-image-link" ></a>
                <img class="product-image product-image-1 img-responsive" src="<?php echo $product['thumb']; ?>">
                <img class="product-image product-image-2 img-responsive" src="<?php echo $product['thumb1']; ?>">
                <div class="product-quickview">
                  <span style="display:inline-block;" data-toggle="tooltip" title="<?php echo $button_quickview; ?>">
                    <a class="btn-quickview btn-link quickview" data-toggle="modal" data-target="#product-quickview" data-productinfo='<?php echo $prod_quick_view; ?>'>
                    <i class="fa fa-search"></i><?php echo $button_quickview; ?>
                    </a>
                  </span>     
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
              </div>
              <div class="button-action clearfix">
                <div class="add-to-cart">
                  <button class="btn-link btn-add-cart" type="button" onclick="cart.add('<?php echo $product['product_id']; ?>');"><i class="fa fa-shopping-cart"></i><?php echo $button_cart; ?></button>
                </div>
                <div class="wishlist-compare">
                  <a  class="btn-link btn-compare" type="button" data-toggle="tooltip" title="<?php echo $button_compare; ?>" onclick="compare.add('<?php echo $product['product_id']; ?>');"> 
                    <i class="fa fa-exchange"></i><?php echo $button_compare; ?>
                  </a>      
                  <a class="btn-link btn-wishlist"  type="button" data-toggle="tooltip" title="<?php echo $button_wishlist; ?>" onclick="wishlist.add('<?php echo $product['product_id']; ?>');">
                    <i class="fa fa-heart"></i><?php echo $button_wishlist ?>
                  </a>
                </div>
              </div>
        </div>  
      </div>    
    <?php } ?>
    </div>
    <?php } ?> 
  </div> 
    <script type="text/javascript">
      $('.owl-carousel').owlCarousel({
          loop:true,
          margin:10,
          nav:true,  
          mouseDrag:false,     
          responsive:{
              0:{
                  items:1
              },
              480:{
                  items:2
              },
              640:{
                  items:3
              },
              1000:{
                  items:$('#ypn-carousel-<?php echo $random ?>').data("items")
              }
          }
      });  

    </script>
</div>