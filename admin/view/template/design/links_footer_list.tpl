<?php echo $header; ?><?php echo $column_left; ?>
<div id="content">
	<div class="page-header">
		<div class="container-fluid">
			<div class="pull-right"><a href="<?php echo $add; ?>" data-toggle="tooltip" title="<?php echo $button_add; ?>" class="btn btn-primary"><i class="fa fa-plus"></i></a>
        	<button type="button" data-toggle="tooltip" title="<?php echo $button_delete; ?>" class="btn btn-danger" onclick="confirm('<?php echo $text_confirm; ?>') ? $('#form-links').submit() : false;"><i class="fa fa-trash-o"></i></button>
        	</div>      	
        	<h1><?php echo $heading_title; ?></h1>
		    <ul class="breadcrumb">
		        <?php foreach ($breadcrumbs as $breadcrumb) { ?>
		        <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
		        <?php } ?>
		    </ul>
		</div>

		<div class="container-fluid">
			<?php if ($error_warning) { ?>
		    <div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> <?php echo $error_warning; ?>
		      <button type="button" class="close" data-dismiss="alert">&times;</button>
		    </div>
		    <?php } ?>
		    <?php if ($success) { ?>
		    <div class="alert alert-success"><i class="fa fa-check-circle"></i> <?php echo $success; ?>
		      <button type="button" class="close" data-dismiss="alert">&times;</button>
		    </div>
		    <?php } ?>
		    <div class="panel panel-default">
		    	<div class="panel-heading">
		    		 <h3 class="panel-title"><i class="fa fa-list"></i> <?php echo $text_list; ?></h3>
		    	</div>
		    	<div class="panel-body">	
		    		<form action="<?php echo $delete; ?>" method="post" enctype="multipart/form-data" id="form-links">
		    			<div class="table-responsive">
		    				  <table class="table table-bordered table-hover">
		    				  		<thead>
		    				  			<tr>
						                  <td style="width: 1px;" class="text-center"><input type="checkbox" onclick="$('input[name*=\'selected\']').prop('checked', this.checked);" /></td>
						                  <td class="text-left"><?php echo "Links title"; ?></td>        
						                  <td class="text-left"><?php echo "Status"; ?></td>
						                  <td class="text-right"><?php echo "Action"; ?></td>
						                </tr>
		    				  		</thead>
		    				  		<tbody>
		    				  			<?php foreach ($links as $link) { ?> 				
		    				  				<tr>
		    				  					<td class="text-center"><input type="checkbox" name="selected[]" value="<?php echo $link['link_id']; ?>"></td>
		    				  					<td class="text-left"><?php echo $link['title'] ?></td>
		    				  					<td class="text-left"><?php echo $link['status']; ?></td>
		    				  					 <td class="text-right"><a href="<?php echo $link['edit']; ?>" data-toggle="tooltip" title="<?php echo $button_edit; ?>" class="btn btn-primary"><i class="fa fa-pencil"></i></a></td>
		    				  				</tr>
		    				  			<?php } ?>
		    				  		</tbody>		    				  		
		    				  </table>
		    			</div>

		    		</form>	    		
		    	</div>
		    </div>
		</div>
	</div>
</div>
<?php echo $footer; ?>