<?php echo $header; ?><?php echo $column_left;  ?>
	<div id="content">
		<div class="page-header">
			<div class="container-fluid">
				<div class="pull-right">
					<button type="submit" form="form-image-blocks" data-toggle="tool-tip" title="<?php echo $button_save ?>" class="btn btn-primary"><i class="fa fa-save"></i></button>
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
					<h3 class="panel-title"><i class="fa fa-pencil"><?php echo $text_edit; ?></i></h3>
				</div>
				<div class="panel-body">
					<form action="<?php echo $action ?>" method="post" enctype="multipart/form-data" id="form-image-blocks" class="form-horizontal">
						<div class="form-group">
							<label class="col-sm-2 control-label" for="input-product"><?php echo $entry_name; ?></label>
				            <div class="col-sm-10">
				            	<input type="text" name="name" class="form-control" value="<?php echo $name; ?>" placeholder="<?php echo $entry_name; ?>" id="input-name">
				            	 <?php if ($error_name) { ?>
					             <div class="text-danger"><?php echo $error_name; ?></div>
					             <?php } ?>
				            </div>
						</div>
						<div class="form-group">
							<label class="col-sm-2 control-label"><?php echo "Image" ?></label>		
						  	<div class="col-sm-10">
						  		<a href="" id="thumb-image" data-toggle="image" class="img-thumbnail"><img src="<?php echo $thumb; ?>" alt="" title="" data-placeholder="<?php echo $placeholder; ?>" />
						  		</a>
						  		 <input type="hidden" name="image" value="<?php echo $image; ?>" id="input-image" />
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-2 control-label"><?php echo $entry_width; ?></label>
							<div class="col-sm-10">
								<input type="text" name="width" value="<?php echo $width; ?>" placeholder="<?php echo $entry_width; ?>" class="form-control">
								 <?php if ($error_width) { ?>
					             <div class="text-danger"><?php echo $error_width; ?></div>
					             <?php } ?>
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-2 control-label"><?php echo $entry_height ?></label>
							<div class="col-sm-10">
								<input type="text" name="height" class="form-control" value="<?php echo $height ?>" placeholder="<?php echo $entry_height; ?>">
								<?php if ($error_height) { ?>
					            <div class="text-danger"><?php echo $error_height; ?></div>
					            <?php } ?>
							</div>
						</div>

						<div class="form-group">
							<label class="col-sm-2 control-label"><?php echo $text_status ?></label>
							<div class="col-sm-10">
								<select name="status" class="form-control">
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
