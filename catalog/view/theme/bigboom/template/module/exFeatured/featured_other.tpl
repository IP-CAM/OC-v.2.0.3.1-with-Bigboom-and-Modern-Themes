<div class="random-product-slide">
  <div class="owl-carousel product-slider-custom" id="ypn-carousel-other" data-items="<?php echo $item; ?>">
    <?php for ($k=0;$k<count($products);$k+=$row) {  ?>
    <div class="item mystyle">
    <?php for($j=$k;$j<$k+$row;$j++){if($j<count($products))$product=$products[$j];    
        
     ?>
      <div class="product-layout"><!--col-lg-3 col-md-3 col-sm-6 col-xs-12-->     
          <div class="product-thumb clearfix">
            <div class="product-image-box">
              <a href="<?php echo $product['href'] ?>" class="product-image-link"></a>
              <img class="product-image product-image-1 img-responsive" src="<?php echo $product['thumb']; ?>" alt=" ">
              <img class="product-image product-image-2 img-responsive" src="<?php echo $product['thumb1'] ?>" alt=" ">
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
      </div>    
    <?php } ?>
    </div>
    <?php } ?>
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
          },
          margin:10,
      })
    </script>
</div>