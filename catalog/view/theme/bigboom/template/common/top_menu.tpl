<div class="header-menu">
	<ul>
		<li class="home"><a href="#">Home</a>
			<div class="dropdown">
				<ul>
					<li><a href="<?php echo $home2 ?>">Home2</a></li>
					<li><a href="<?php echo $home3 ?>">Home3</a></li>
				</ul>
			</div>
		</li>
		<li><a href="#">Shop</a>
		<?php if(isset($cms_block[5])) { echo html_entity_decode($cms_block[5]['content']);} ?>			
		</li>
		<li><a href="#">Menu Featured</a>
			<div class="dropdown featured-content">
				<?php if(isset($cms_block[4])) { echo html_entity_decode($cms_block[4]['content']);} ?>	
			</div>
		</li>
		<li><a href="#">Clearance</a></li>
		<li><a href="#">Blogs</a></li>
		<li><a href="#">Contact us</a></li>
	</ul>			
</div>