<?php echo $header; ?><?php echo $column_left; ?>
	<div id="content">
		<div class="page-header">
			<div class="container-fluid">
				<div class="pull-right">
					 <button type="submit" form="form-cms-block" data-toggle="tooltip" title="<?php echo $button_save; ?>" class="btn btn-primary"><i class="fa fa-save"></i></button>
    				<a href="<?php echo $cancel; ?>" data-toggle="tooltip" title="<?php echo $button_cancel; ?>" class="btn btn-default"><i class="fa fa-reply"></i></a>
				</div>
			</div>
		</div>
		<div class="container-fluid">
			<?php if ($error_warning) { ?>
			    <div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> <?php echo $error_warning; ?>
			      <button type="button" class="close" data-dismiss="alert">&times;</button>
			    </div>
		    <?php } ?>

		    <div class="panel panel-default">
		    	<div class="panel-heading">
		    		<h3 class="panel-title"><i class="fa fa-pencil"></i><?php echo $text_form; ?></h3>
		    	</div>
		    	<div class="panel-body">
		    		<form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form-banner" class="form-horizontal">
		    			<div class="form-group required">
		    				<label class="col-sm-2 control-label"><?php echo $entry_name; ?></label>
		    				 <div class="col-sm-10">
				              <input type="text" name="name" value="<?php echo $name; ?>" placeholder="<?php echo $entry_name; ?>" id="input-name" class="form-control" />
				              <?php if ($error_name) { ?>
				              <div class="text-danger"><?php echo $error_name; ?></div>
				              <?php } ?>
				            </div>
		    			</div>
		    			<div class="form-group">
		    				<label class="col-sm-2 control-label"><?php echo $text_html_content; ?></label>
		    				<div class="col-sm-10">
		    					<textarea name="html_content" id="html_content" class="form-control"><?php echo $html_content; ?></textarea>
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
	<script type="text/javascript">
	$('#html_content').summernote({height:300});
	</script>
<?php echo $footer; ?>