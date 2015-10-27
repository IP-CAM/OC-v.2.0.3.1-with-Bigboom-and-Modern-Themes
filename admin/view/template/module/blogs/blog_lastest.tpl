<?php echo $header; ?><?php echo $column_left;  ?>
	<div id="content">
		<div class="page-header">
			<div class="container-fluid">
				<div class="pull-right">
					<button type="submit" form="form-blogs" data-toggle="tool-tip" title="<?php echo $button_save ?>" class="btn btn-primary"><i class="fa fa-save"></i></button>
					<a href="<?php echo $cancel ?>" data-toggle="tooltip" title="<?php echo $button_cancel ?>" class="btn btn-default"><i class="fa fa-reply"></i></a>
				</div>
				<h1><?php echo $heading_title; ?></h1>
				<ul class="breadcrumb">
					<?php foreach ($breadcrumbs as $breadcrumb) { ?>
						<li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
					<?php } ?>
				</ul>
			</div>
			<div class="container-fluid">
				<?php if($error_warning) { ?>
					<div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i><?php echo $error_warning; ?></div>
					<button type="button" class="close" data-dismiss="alert">&times;</button>
				<?php } ?>
			</div>
			<div class="panel panel-default">
				<div class="panel-heading">
					<h3 class="panel-title"><i class="fa fa-pencil"></i> <?php echo $text_edit; ?></h3>
				</div>
				<div class="panel-body">					
					<form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form-blogs" class="form-horizontal">
						
						<div class="form-group">
							<label class="col-sm-2 control-label" for="input-name"><?php echo $entry_name; ?></label>
							<div class="col-sm-10">
								<input type="text" name="name" placeholder="<?php echo $entry_name; ?>" id="input-name" class="form-control" value="<?php echo $name; ?>">
								  <?php if ($error_name) { ?>
					              <div class="text-danger"><?php echo $error_name; ?></div>
					              <?php } ?>
							</div>							
						</div>

						<div class="form-group">
							<label class="col-sm-2 control-label" for="input-items"><?php echo $entry_amount; ?></label>
							<div class="col-sm-10">
								<input type="text" name="amount" placeholder="<?php echo $entry_amount; ?>" class="form-control" id="input-items" value="<?php echo $amount; ?>">
								  <?php if ($error_amount) { ?>
					              <div class="text-danger"><?php echo $error_amount; ?></div>
					              <?php } ?>
							</div>
						</div>

						<div class="form-group">
							<label class="col-sm-2 control-label" for="input-limit"><?php echo $entry_limit; ?></label>
							<div class="col-sm-10">
								<input type="text" name="limit" placeholder="<?php echo $entry_limit ?>" class="form-control" id="input-limit" value="<?php echo $limit; ?>">
									 <?php if ($error_limit) { ?>
						              <div class="text-danger"><?php echo $error_limit; ?></div>
						              <?php } ?>
							</div>
						</div>

						<div class="form-group">
							<label class="col-sm-2 control-label" form="input-width"><?php echo $entry_width; ?></label>
							<div class="col-sm-10">
								<input type="text" name="width" placeholder="<?php echo $entry_width; ?>" class="form-control" id="input-width" value="<?php echo $width; ?>">
								<?php if ($error_width) { ?>
						              <div class="text-danger"><?php echo $error_width; ?></div>
						              <?php } ?>
							</div>
						</div>

						<div class="form-group">
							<label class="col-sm-2 control-label" form="input-height"><?php echo $entry_height; ?></label>
							<div class="col-sm-10">
								<input type="text" name="height" placeholder="<?php echo $entry_height; ?>" class="form-control" id="input-height" value="<?php echo $height; ?>">
								<?php if ($error_height) { ?>
						              <div class="text-danger"><?php echo $error_height; ?></div>
						              <?php } ?>
							</div>
						</div>

						<div class="form-group">
							<label class="col-sm-2 control-label" form="input-length"><?php echo $entry_length; ?></label>
							<div class="col-sm-10">
								<input type="text" name="length" placeholder="<?php echo $entry_length; ?>" class="form-control" id="input-length" value="<?php echo $length; ?>">
								<?php if ($error_length) { ?>
						              <div class="text-danger"><?php echo $error_length; ?></div>
						              <?php } ?>
							</div>
						</div>

						<div class="form-group">
							<label class="col-sm-2 control-label" for="display-type"><?php echo $text_type_display; ?></label>
							<div class="col-sm-10">
								<select class="form-control" name="display_type">
									<?php if($display_type) { ?> 
									<option value="1" selected="selected">Slider</option>
									<option value="0">List</option>
									<?php } else { ?>
									<option value="1">Slider</option>
									<option value="0" selected="selected">List</option>
									<?php } ?>
								</select>
							</div>
						</div>

						<div class="form-group">
				            <label class="col-sm-2 control-label" for="input-status"><?php echo $entry_status; ?></label>
				            <div class="col-sm-10">
				              <select name="status" id="input-status" class="form-control">
				                <?php if ($status) { ?>
				                <option value="1" selected="selected"><?php echo $text_enabled; ?></option>
				                <option value="0"><?php echo $text_disabled; ?></option>
				                <?php } else { ?>
				                <option value="1"><?php echo $text_enabled; ?></option>
				                <option value="0" selected="selected"><?php echo $text_disabled; ?></option>
				                <?php } ?>
				              </select>
				            </div>
				        </div>

					</form>
				</div>
			</div>
		</div>
	</div>

<?php echo $footer; ?>
