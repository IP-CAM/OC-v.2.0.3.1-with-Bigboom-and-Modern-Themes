<div class="vertical-megamenu" style="margin-top:-50px;">
    <nav>    
    <div>
      <ul class="navbar navbar-default megamenu" style="padding-left:15px;">
        <li class="dropdown category"><a href="#"><h2>CATEGORIES</h2><i class="fa fa-bars"></i></a>
       		<div class="dropdown-menu drop-right-inner ">
				<ul>
					<?php foreach ($categories as $category) { ?>
						<?php if($category['children']) { ?>
						<li class="drop-right"><a href="<?php echo $category['href']; ?>"><?php if(isset($awesome[$category['category_id']])){ ?><i class="fa <?php echo html_entity_decode($awesome[$category['category_id']]);?>"></i><?php } ?><?php echo $category['name']; ?></a>
							<div class="drop-right-menu">					
								<div style="float:left;">				
									<?php foreach ($category['children'] as $key=>$child) { ?>
										<div class="item-right">
											<div style="display:block;width:100%;" class="inner-item">
												<h4><?php echo $child['name']; ?></h4>			
												<ul>
													<?php foreach ($child['product_id']->rows as $name) {?>
													<li><a href="#"><?php echo $name['name']; ?></a></li>		
													<?php } ?>
												</ul>
											</div>
										</div>
									<?php if(($key+1)%2==0) { echo "<br>";} } ?>
								</div>
								<div style="float:right;">
									<img style="height:300px;width:215px;" src="<?php echo $category['image'] ;?>">
								</div>							
							</div>								
						</li>
						<?php } else { ?>
						<li><a href="<?php echo $category['href']; ?>"><?php if(isset($awesome[$category['category_id']])){ ?><i class="fa <?php echo html_entity_decode($awesome[$category['category_id']]); ?>"></i><?php } ?><?php echo $category['name']; ?></a></li>	
					<?php } }?>
				</ul>	
			</div>
        </li>    
    </div>
  </nav>
</div>

