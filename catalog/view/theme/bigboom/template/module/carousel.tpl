<div class="brand">
  <h3 class="heading-title heading-slide-title brand-title"><?php echo $title; ?></h3>
  <div id="carousel<?php echo $module; ?>" class="owl-carousel">
    <?php foreach ($banners as $banner) { ?>
    <div class="item text-center">
      <?php if ($banner['link']) { ?>
      <a href="<?php echo $banner['link']; ?>"><img src="<?php echo $banner['image']; ?>" alt="<?php echo $banner['title']; ?>" class="img-responsive" /></a>
      <?php } else { ?>
      <img src="<?php echo $banner['image']; ?>" alt="<?php echo $banner['title']; ?>" class="img-responsive" />
      <?php } ?>
    </div>
    <?php } ?>
  </div>
  <script type="text/javascript"><!--
  $('#carousel<?php echo $module; ?>').owlCarousel({
  	autoPlay: 3000,
  	nav: true,
  	/*navigationText: ['<i class="fa fa-chevron-left fa-5x"></i>', '<i class="fa fa-chevron-right fa-5x"></i>'],*/
  	pagination: true,
    margin:12,
    responsive:{
        0:{
            items:1
        },
        480:{
            items:3
        }, 
        640: {
          items: 5
        },      
        1000:{
            items:6
        }
    }
  });
  --></script>
</div>