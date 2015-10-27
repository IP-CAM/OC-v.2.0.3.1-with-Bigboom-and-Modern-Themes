<script>(function(d, s, id) {
  var js, fjs = d.getElementsByTagName(s)[0];
  if (d.getElementById(id)) return;
  js = d.createElement(s); js.id = id;
  js.src = "//connect.facebook.net/en_GB/sdk.js#xfbml=1&version=v2.4&appId=1477153512585236";
  fjs.parentNode.insertBefore(js, fjs);
}(document, 'script', 'facebook-jssdk'));</script>

<div class="blog-single-post">
	<div class="blog-title-wrapper">
		<h1 class="blog-title"><?php echo $blog_content['title']; ?></h1>
		<div class="blog-meta">
			<p class="post-category">
				Category: <a href="<?php echo $blog_content['category_href']; ?>"><?php echo $blog_content['category']; ?></a>
			</p>
			<div>
				<span class="author-link">
					Author:	<?php echo $blog_content['user']; ?>
				</span>
				<span class="published-date">
					Date: <?php echo $blog_content['month']; ?> <?php echo $blog_content['date']; ?>, <?php echo $blog_content['year']; ?>
				</span>	
			</div>
		</div>
	</div>							
	<div class="post-content">
		<?php echo $blog_content['post_content']; ?>
	</div>
	<div data-width="610" class="fb-comments" data-numposts="5"></div>
</div>