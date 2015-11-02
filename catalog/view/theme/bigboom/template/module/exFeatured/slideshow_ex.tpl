<div id="slideshows<?php echo $module; ?>" class="owl-carousel ypn-carousel">
  <?php foreach ($banners as $k=>$banner) { ?>
  <div class="item slideshow-custom">
    <?php if ($banner['link']) { ?>
    <a href="<?php echo $banner['link']; ?>"><img src="<?php echo $banner['image']; ?>" alt="<?php echo $banner['title']; ?>" class="img-responsive" /></a>
    <?php } else { ?>
    <img src="<?php echo $banner['image']; ?>" alt="<?php echo $banner['title']; ?>" class="img-responsive" />     
    <?php } ?>       
    <div class="slideshow-caption">
        <h3><?php echo $image_des[$k]['title']; ?></h3>
        <p><?php echo $image_des[$k]['content']; ?></p>
        <div class="butt-caption"><a href="#">Get a look</a></div>
    </div>  
  </div>  
  <?php } ?>
</div>
<script type="text/javascript">
  $('#slideshows<?php echo $module; ?>').owlCarousel({
      items: 1,    	 
      nav:true,   
      loop:true,       
      onChanged: callback,  
  });

  function callback(event){  
      TweenMax.from('.slideshow-caption p',0.9,{y:"-100px",ease:Elastic.easeOut});
      TweenMax.from('.slideshow-caption h3',0.7,{y:"-100px",ease:Bounce.easeOut,delay:0.5});
      TweenMax.from('.slideshow-caption .butt-caption',1,{delay:0.5});
      console.log("awaa");
  }

</script>