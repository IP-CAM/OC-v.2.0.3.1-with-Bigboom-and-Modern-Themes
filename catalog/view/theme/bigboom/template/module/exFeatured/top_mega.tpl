<div id ="menu" class="top-mega">
	<nav class="navbar navbar-default megamenu">
		<ul>
			<li class="dropdown"  style="background:#3c3c3c;"><a href="#">HOME <i class="fa fa-angle-down"></i></a>
				<?php echo $mega_home; ?>			
			</li>
			<li class="dropdown" id="new-shop"><span class="new-bagde">new</span><a href="#">SHOP <i class="fa fa-angle-down"></i></a>
				<?php echo $mega_shop; ?>	
			</li>
			<li class="dropdown" id="hot-shop"><a href="#"><span class="hot-bagde">hot</span>FEATURED <i class="fa fa-angle-down"></i></a>
				<?php echo $mega_featured; ?>
			</li>
			<li class="dropdown"><a href="<?php echo $blog_href; ?>">BLOG</a>	
				<?php echo $blogs; ?>
			</li>
			<li><a href="#">CONTACT US</a>				
			</li>
		</ul>
	</nav>
</div>