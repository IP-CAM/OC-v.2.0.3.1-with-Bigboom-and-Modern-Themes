<div class="banner1">
	<div class="row">
	<?php foreach ($modules as $k=>$module) { ?>
		<?php if($k<3) { ?>
			<?php if($k==0) { ?>
			<div class="col-sm-4 col-xs-6"><?php echo $module; ?></div>
			<?php } else if($k==1) { ?>
			<div class="col-sm-4 hidden-xs"><?php echo $module; ?></div>
			<?php } else { ?>
			<div class="col-sm-4 col-xs-6"><?php echo $module; ?></div>
		<?php } } ?>
	<?php } ?>
	</div>
</div>