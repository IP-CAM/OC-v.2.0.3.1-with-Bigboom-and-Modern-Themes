<div id="slideshows<?php echo $module; ?>" class="owl-carousel owl-carousel-slide" style="opacity: 1;margin-top:15px;margin-bottom:29px;">
  <?php foreach ($banners as $banner) { ?>
  <div class="item slideshow-custom">
    <?php if ($banner['link']) { ?>
    <a href="<?php echo $banner['link']; ?>"><img src="<?php echo $banner['image']; ?>" alt="<?php echo $banner['title']; ?>" class="img-responsive" /></a>
    <?php } else { ?>
    <img src="<?php echo $banner['image']; ?>" alt="<?php echo $banner['title']; ?>" class="img-responsive" />     
    <?php } ?>
      <?php foreach ($image_des as $key=>$img_des) {     
        if($key==$banner['banner_image_id'])
        {
      ?>
    <div class="slideshow-caption">
        <h3><?php echo $img_des[0]; ?></h3>
        <p><?php echo $img_des[1]; ?></p>
        <div class="butt-caption"><a href="#">Get a look</a></div>
    </div>
    <?php }} ?>
  </div>  
  <?php } ?>
</div>
<script type="text/javascript"><!--
$('#slideshows<?php echo $module; ?>').owlCarousel({
	items: 6,
	//autoPlay: 6000,
	singleItem: true,
	navigation: true,
	navigationText: ['<i class="fa fa-angle-left fa-5x"></i>','<i class="fa fa-angle-right fa-5x"></i>'],
	pagination: true,
  /*beforeMove:function(){
    $('.slideshow-caption').find($('h3')).hide();
     $('.slideshow-caption').find($('p')).hide();
  },afterMove:function(){
      $('.slideshow-caption').find($('h3')).show(700);
      $('.slideshow-caption').find($('p')).show(1000);
  }*/
});
--></script>