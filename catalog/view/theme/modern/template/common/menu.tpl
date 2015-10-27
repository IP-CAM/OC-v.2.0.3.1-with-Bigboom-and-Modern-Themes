<?php if ($categories) { ?>
	<nav id="menu" class="navbar">
		<div class="navbar-header"><span id="category" class="visible-xs"><?php echo "Categories"; ?></span>
			<button type="button" class="btn btn-navbar navbar-toggle" data-toggle="collapse" data-target=".navbar-ex1-collapse"><i class="fa fa-bars"></i></button>
		</div>
		<div class="collapse navbar-collapse navbar-ex1-collapse">
			<ul class="nav navbar-nav">	
				<li class="dropdown"><a href="<?php echo $home1; ?>" class="dropdown-toggle" data-toggle="dropdown">Home</a>
					<div class="dropdown-menu">
						<div class="dropdown-inner">
							<div class="sub-menu-wrapper">
								<ul class="list-unstyled sub-menu-1 sub-home">
									<li><a href="<?php echo $home1; ?>">Home1</a></li>
									<li><a href="<?php echo $home2; ?>">Home2</a></li>					
								</ul>
							</div>
						</div>
					</div>
				</li>
				<?php foreach ($categories as $category) { ?>	
					<?php if ($category['children']) { ?>
						<li class="dropdown menu-dropdown sub-collapse">
							<a href="<?php echo $category['href']; ?>"><?php echo $category['name']; ?><i class="fa fa-angle-down"></i></a>
							<span class="dropdown-toggle sub-toggle visible-xs" data-toggle="dropdown"><i class="fa fa-plus"></i></span>
							<div class="dropdown-menu">
								<div class="dropdown-inner">
									<?php if($category['children']) { ?>
									<div class="sub-menu-wrapper">
										<?php foreach (array_chunk($category['children'], ceil(count($category['children']) / $category['column'])) as $children) { ?>
											<ul class="list-unstyled sub-menu-1">											
												<?php foreach ($children as $child) { ?>
													<li>
														<a href="<?php echo $child['href']; ?>">
															<?php echo $child['name']; ?>
														</a>										
														<ul class="sub-menu-2 hidden-xs"> 
															<?php foreach ($child['sub_child'] as $sub) { ?>
																<li><a href="<?php echo $sub['href']; ?>"><?php echo $sub['name']; ?></a></li>
															<?php } ?>
														</ul>													
													</li>
													<?php } ?>													
											</ul>
											<?php } ?>
									</div>	
									<?php } ?>									
								</div>
								<!-- <a href="<?php echo $category['href']; ?>" class="see-all">
									<?php echo $text_all; ?>
										<?php echo $category['name']; ?>
								</a>	 -->								
							</div>							
						</li>
						<?php } else { ?>
							<li>
								<a href="<?php echo $category['href']; ?>">
									<?php echo $category['name']; ?>
								</a>
							</li>
							<?php } ?>
							<?php } ?>
							<li><a href="<?php echo $blog_href; ?>">Blog</a></li>
							<li><a href="<?php echo $contact_href; ?>">Contact</a></li>
			</ul>
		</div>
	</nav>
<?php } ?>