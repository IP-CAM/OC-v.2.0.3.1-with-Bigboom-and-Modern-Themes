<div id="lastest-blog">

    <h3 class="heading-title heading-slide-title lastest-blog-title">Lastest from our blog</h3>

    <div class="owl-carousel-ypn"> 

    <?php foreach ($blogs as $blog) {  ?>

        <div class="item clearfix">

            <div class="blog-img">

                <a href="<?php echo $blog['href']; ?>"><img src="<?php echo $blog['image']; ?>" alt="<?php echo $blog['title']; ?>"></a>

            </div>

            <div class="blog-content">

                <h3 class="blog-title"><a href="<?php echo $blog['href']; ?>"><?php echo $blog['title']; ?></a></h3>

                <div class="blog-des">

                    <p><?php echo $blog['short_desc']; ?></p>

                </div>

                <div class="blog-info">

                    <h5 class="blog-date"><span><?php echo $blog['month']; ?></span> <?php echo $blog['date']; ?>, <?php echo $blog['year']; ?></h5>

                    <h5 class="blog-comment">8 comments</h5>

                </div>

            </div>

        </div> 

     <?php } ?>     

    </div>   

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

            600:{

                items:2

            },

            1000:{

                items:<?php echo $item_display; ?>

            }

        }

    });

 </script>