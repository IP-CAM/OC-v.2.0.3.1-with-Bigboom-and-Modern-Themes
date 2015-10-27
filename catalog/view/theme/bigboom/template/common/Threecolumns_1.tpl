<div class="static-block-1">
	<div class="row">
	<?php foreach ($modules as $k=>$module) { ?>
		<?php if($k<3) { ?>
			<?php if($k==0) { ?>
			<div class="col-md-3 col-sm-4"><?php echo $module; ?></div>
			<?php } else if($k==1) { ?>
			<div class="col-md-6 col-sm-8"><?php echo $module; ?></div>
			<?php } else { ?>
			<div class="col-md-3 hidden-xs hidden-sm"><?php echo $module; ?></div>
		<?php } } ?>
	<?php } ?>
	</div>
</div>