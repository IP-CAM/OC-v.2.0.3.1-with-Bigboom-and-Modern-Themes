<div id="slideshows<?php echo $module; ?>" class="owl-carousel ypn-carousel banner-slider">
  <?php foreach ($banners as $k=>$banner) { ?>
  <div class="item slideshow-custom">
    <?php if ($banner['link']) { ?>
    <a href="<?php echo $banner['link']; ?>"><img src="<?php echo $banner['image']; ?>" alt="<?php echo $banner['title']; ?>" class="img-responsive" /></a>
    <?php } else { ?>
    <img src="<?php echo $banner['image']; ?>" alt="<?php echo $banner['title']; ?>" class="img-responsive" />     
    <?php } ?>       
    <div class="slideshow-caption">
        <?php if($image_des[$k]['title']) { ?><h3><?php echo $image_des[$k]['title']; ?></h3><?php } ?>
        <?php if($image_des[$k]['content']) { ?><p><?php echo $image_des[$k]['content']; ?></p><?php } ?>
        <?php if($image_des[$k]['html_code']) { ?><div class="butt-caption-<?php echo $k; ?>"></div>       
        <script type="text/javascript">
          var k  = <?php echo $k; ?>;    
          var html_code    = "<?php echo $image_des[$k]['html_code']; ?>";          
          $('.butt-caption-'+k).html($('<div />').html(html_code).text());
        </script> 
        <?php } ?>
    </div>  
  </div>  
  <?php } ?>
</div>
<script type="text/javascript">
  $('#slideshows<?php echo $module; ?>').owlCarousel({
      items: 1,    	 
      nav:true,   
      loop:true,       
      autoplay:3000,
      onChange: callback,  
  });

  function callback(event){        
      TweenMax.killAll();
      TweenMax.from('.slideshow-caption p',0.9,{y:"-100px",opacity:0,ease:Elastic.easeOut});
      TweenMax.from('.slideshow-caption h3',0.7,{y:"-100px",opacity:0,ease:Bounce.easeOut,delay:0.5});
      TweenMax.from('.slideshow-caption .butt-caption',1,{opacity:0,delay:0.5});         
  }

</script>