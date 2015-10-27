<div class="top-banner-2">
	<?php foreach ($modules as $k=>$module) { ?>
		<?php if ($k==0) { ?>
		<div class="position position1"><?php echo $module ?></div>
		<?php } elseif ($k==1) { ?>
		<div class="position position2">
			<?php  echo $module  ?>
			<?php } elseif ($k==2) { ?>
			<?php echo $module ?>
		</div>
		<?php } else { } ?>
	<?php } ?>
</div>