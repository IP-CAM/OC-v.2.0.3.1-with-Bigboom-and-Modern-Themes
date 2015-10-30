<div id="slideshows<?php echo $module; ?>" class="owl-carousel owl-carousel-slide">
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
<script type="text/javascript"><!--
$('#slideshows<?php echo $module; ?>').owlCarousel({
	//autoPlay: 6000,
	 items: 1,
    nav:true,
    loop:true, 
  /*beforeMove:function(){
    $('.slideshow-caption').find($('h3')).hide();
     $('.slideshow-caption').find($('p')).hide();
  },afterMove:function(){
      $('.slideshow-caption').find($('h3')).show(700);
      $('.slideshow-caption').find($('p')).show(1000);
  }*/
});
--></script>