<div class="banner-slider">
  <div class="owl-carousel">
    <?php foreach ($banners as $banner) { ?>
    <div class="item">
      <?php if ($banner['link']) { ?>
      <a href="<?php echo $banner['link']; ?>"><img src="<?php echo $banner['image']; ?>" alt="<?php echo $banner['title']; ?>" class="img-responsive" /></a>
      <?php } else { ?>
      <img src="<?php echo $banner['image']; ?>" alt="<?php echo $banner['title']; ?>" class="img-responsive" />
      <?php } ?>
    </div>
    <?php } ?>
  </div>
  <script type="text/javascript">
    $('.banner-slider .owl-carousel').owlCarousel({
          items: 1,
          nav:true,
          loop:true,  
      });
  </script>
</div>