<div class="blog-content">
	<?php foreach ($blog_content as $bc) { ?>
		<div class="blog-single-post">
		<div class="row">
			<div class="blog-img col-sm-6 col-md-4">
				<img src="<?php echo $bc['image']; ?>" alt="<?php echo $bc['title']; ?>" />
			</div>	
			<div class="post-content col-sm-6 col-md-8">
				<div class="blog-title-wrapper">
					<h3 class="blog-title"><a href="<?php echo $bc['submit_href']; ?>"><?php echo $bc['title']; ?></a></h3>
					<div class="blog-meta">
						<span class="post-category">
							Category: <a href="<?php echo $bc['category_href']; ?>"><?php echo $bc['category']; ?></a>
						</span>
						<span class="author-link">
							Author: <?php echo $bc['user']; ?>
						</span>
						<span class="published-date"> 
							Date: <?php echo $bc['month']; ?> <?php echo $bc['date']; ?>, <?php echo $bc['year']; ?>
						</span>	
					</div>
				</div>					
				<div class="short-description">
					<p><?php echo $bc['short_content'] ?></p>
					<a class="btn btn-primary btn-blog" href="<?php echo $bc['submit_href']; ?>">Read more ...</a>
				</div>						
			</div>
		</div>
		<hr />
	</div>
	<?php	} ?>		
</div>
<div class="pagination-wrapper">
	<div class="row">
		<div class="col-sm-6 text-left"><?php echo $pagination; ?></div> 	
		<div class="col-sm-6 text-right"><?php echo $results; ?></div>
	</div>
</div>
<script type="text/javascript"><!--
$('#slideshow').owlCarousel({
	items: 6,
	//autoPlay: 3000,
	singleItem: true,
	navigation: true,
	navigationText: ['<i class="fa fa-angle-left fa-5x"></i>', '<i class="fa fa-angle-right fa-5x"></i>'],
	pagination: true
});
--></script>