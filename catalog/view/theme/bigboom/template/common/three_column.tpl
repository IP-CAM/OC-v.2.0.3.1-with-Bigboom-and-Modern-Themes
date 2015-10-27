<div class="static-block-4">
	<div class="row">
	<?php foreach ($modules as $k=>$module) { ?>
		<?php if($k<3) { ?>
			<?php if($k==0) { ?>
			<div class="col-sm-3 col-xs-4"><?php echo $module; ?></div>
			<?php } else if($k==1) { ?>
			<div class="col-sm-6 col-xs-8"><?php echo $module; ?></div>
			<?php } else { ?>
			<div class="col-sm-3 hidden-xs"><?php echo $module; ?></div>
		<?php } } ?>
	<?php } ?>
	</div>
</div>