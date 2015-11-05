<div class="hidden-xs vertical-menu">
	<div class="category-text">
		<h4>CATEGORY</h4>
		<i class="fa fa-bars"></i>
	</div>
	<div class="category-list">
		<ul>
		<?php foreach ($categories as $category) { $k=$category['category_id']; ?>	
			<?php if(!empty($category['children'])) { ?>	
			<li>
				<a href="<?php echo $category['href']; ?>"><?php if(isset($cate_conf[$k]['icon_url'])){ ?><img src="<?php echo $cate_conf[$k]['icon_url']; ?>"><?php } ?><span><?php echo $category['name']; ?><span><i class="fa fa-angle-right"></i></a>
				<div class="fly-sub-menu">						
					<div class="link-cate">	
						<?php foreach (array_chunk($category['children'],3) as $key=>$children) { ?>						
							<div class="row-cate-wrapper">
								<?php foreach ($children as $child) { ?>
								<div class="element-cate-wrapper">
									<h4><?php echo $child['name']; ?></h4>
									<ul>
										<?php foreach ($child['sub_child'] as $sub_child) { ?>
											<li><a href="<?php echo $sub_child['href']; ?>"><?php echo $sub_child['name']; ?></a></li>
										 <?php } ?>
									</ul>
								</div>
								<?php } ?>	
							</div>														
						<?php } ?>							
					</div>	
					<div>		
						<img src="<?php echo $cate_conf[$k]['image']; ?>">				
					</div>				
				</div>				
			</li>
			<?php }else{ ?>
			<li>
				<a href="<?php echo $category['href']; ?>"><?php if(isset($cate_conf[$k]['icon_url'])){ ?><img src="<?php echo $cate_conf[$k]['icon_url']; ?>"/><?php } ?><span><?php echo $category['name']; ?></span></a>	
			</li>
			<?php } ?>
		<?php } ?>			
		</ul>
	</div>
</div>
<div class="visible-xs">
<?php echo $menu; ?>
</div>