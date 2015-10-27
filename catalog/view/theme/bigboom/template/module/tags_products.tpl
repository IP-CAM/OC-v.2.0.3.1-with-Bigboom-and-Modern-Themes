<h2 class="heading-title product-tag-title">Product tags</h2>
<div class="tagcloud">
	<?php $k=0; foreach ($product_tags as $pt) { if($k<15) { ?>
		<a href="<?php echo $pt['href']; ?>"><?php echo $pt['name']; ?></a>
	<?php $k++;}} ?>
</div>