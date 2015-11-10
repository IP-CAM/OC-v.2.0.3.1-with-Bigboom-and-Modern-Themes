<div class="header-menu">
	<ul>
		<li class="home"><a  href="<?php echo $home; ?>">Home</a>
			<div class="dropdown">
				<ul class="sub-menu-1">
					<li><a href="<?php echo $home2 ?>">Homepage 2</a></li>
					<li><a href="<?php echo $home3 ?>">Homepage 3</a></li>
				</ul>
			</div>
		</li>
		<li class="item-has-dropdown">
			<a href="#">Shop <span class="label label-new">new</span></a>
			<?php if(isset($cms_block[5])) { echo html_entity_decode($cms_block[5]['content']);} ?>			
		</li>
		<li class="item-has-dropdown">
			<a href="#">Featured <span class="label label-hot">hot</span></a>
			<div class="dropdown featured-content">
				<?php if(isset($cms_block[4])) { echo html_entity_decode($cms_block[4]['content']);} ?>	
			</div>
		</li>		
		<li><a href="<?php echo $url_blog; ?>">Blogs</a></li>
		<li><a href="<?php echo $url_contact; ?>">Contact us</a></li>
	</ul>			
</div>