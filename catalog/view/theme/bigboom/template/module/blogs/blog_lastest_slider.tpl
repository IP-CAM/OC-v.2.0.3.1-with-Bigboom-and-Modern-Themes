<div id="lastest-blog">
    <h3 class="heading-title heading-slide-title lastest-blog-title">Lastest from our blog</h3>
    <div class="owl-carousel-ypn"> 
    <?php foreach ($blogs as $blog) {  ?>
        <div class="item clearfix">
            <div class="blog-img">
                <a href="<?php echo $blog['href']; ?>"><img src="<?php echo $blog['image']; ?>"></a>
            </div>
            <div class="blog-content">
                <span class="arrows"></span>
                <h3 class="blog-title"><a href="<?php echo $blog['href']; ?>"><?php echo $blog['title']; ?></a></h3>
                <div class="blog-des">
                    <span><?php echo $blog['short_desc']; ?></span>
                </div>
                <div class="blog-info">
                    <h5 class="blog-date"><span><?php echo $blog['month']; ?></span> <?php echo $blog['date']; ?>, <?php echo $blog['year']; ?></h5>
                    <h5 class="blog-comment"><a href="#">8 comments</a></h5>
                </div>
                <a href="<?php echo $blog['href']; ?>" class="readmore">Read more <i class="fa fa-arrow-circle-right"></i></a>
            </div>
        </div> 
     <?php } ?>     
    </div>   
    <script type="text/javascript">
        $('.owl-carousel-ypn').owlCarousel({
            loop:true,
            margin:20,
            nav:true,       
            responsive:{
                0:{
                    items:1
                },
                640:{
                    items:2
                },
                1000:{
                    items:2
                },
                1200:{
                    items:<?php echo $item_display; ?>
                },
            }
        });
     </script>
</div>