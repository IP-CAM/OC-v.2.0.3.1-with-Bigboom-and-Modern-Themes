<?php echo $header; ?><?php echo $column_left; ?>
<div id="content">
	<div class="page-header">
		<div class="container-fluid">
			<div class="pull-right">
		        <button type="submit" form="form-link-footer" data-toggle="tooltip" title="<?php echo $button_save; ?>" class="btn btn-primary"><i class="fa fa-save"></i></button>
		        <a href="<?php echo $cancel; ?>" data-toggle="tooltip" title="<?php echo $button_cancel; ?>" class="btn btn-default"><i class="fa fa-reply"></i></a></div>
		      <h1><?php echo $heading_title; ?></h1>
		      <ul class="breadcrumb">
		        <?php foreach ($breadcrumbs as $breadcrumb) { ?>
		        <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
		        <?php } ?>
		      </ul>
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
		    		<h3 class="panel-title"><i class="fa fa-pencil"></i> <?php echo $text_form; ?></h3>
		    	</div>
		    	<div class="panel-body">
		    		<form action="<?php echo $action ?>" method="post" enctype="multipart/form-data" id="form-link-footer" class="form-horizontal">
		    			<?php foreach ($languages as $language) { $language_id=$language['language_id']; ?>
	    				<div class="form-group required">
		    				<label class="col-md-2 control-label" for="input-name"><img src="view/image/flags/<?php echo $language['image']; ?>" title="<?php echo $language['name']; ?>" /> <?php echo $entry_name; ?></label>
		    				<div class="col-sm-10">
		    					<input type="text" name="name[<?php echo $language['language_id']; ?>][title]" <?php if(!empty($name)) { ?> value="<?php echo $name[$language_id]['title']; ?>" <?php } ?>placeholder="<?php echo $entry_name; ?>" id="input-name" class="form-control" />
		    					<?php if ($error_name) { ?>
				              	<div class="text-danger"><?php echo $error_name; ?></div>
				              	<?php } ?>
		    				</div>
		    			</div>
		    			<?php } ?>		    			
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
		    			<table id="links-footer" class="table table-striped table-bordered table-hover">
		    				<thead>
		    					<tr>
		    						<td class="text-center"><?php echo $text_title; ?></td>
		    						<td class="text-center"><?php echo $text_href; ?></td>
		    						<td class="text-center"><?php echo $text_sort_order; ?></td>
		    					</tr>
		    				</thead>
		    				<tbody>
		    					<?php $link_row=0;  ?>		
		    					<?php if(!empty($links)) { ?>    					
		    						<?php foreach ($links as $link) { ?>
		    							<tr id="link-row<?php echo $link_row; ?>">
		    								<td class="text-left">
		    									<?php foreach ($languages as $language) { $language_id=$language['language_id']; ?>
		    										<div class="input-group">
		    											<span class="input-group-addon"><img src="view/image/flags/<?php echo $language['image']; ?>" title="<?php echo $language['name']; ?>" /></span><input type="text" name="link[<?php echo $link_row; ?>][link_desc][<?php echo $language['language_id']; ?>][title]" value="<?php echo $link['link_desc'][$language_id]['title']; ?>" placeholder="<?php echo $text_title; ?>" class="form-control">
		    										</div>
		    									<?php } ?>
		    								</td>
		    								<td><input type="text" name="link[<?php echo $link_row; ?>][href]" value="<?php echo $link['href']; ?>"></td>
		    								<td><input type="text" name="link[<?php echo $link_row ?>][sort_order]" value="<?php echo $link['sort_order']; ?>"></td>
		    								<td class="text-left"><button type="button" onclick="$('#link-row<?php echo $link_row; ?>').remove();" data-toggle="tooltip" title="<?php echo $button_remove; ?>" class="btn btn-danger"><i class="fa fa-minus-circle"></i></button></td>
		    							</tr>
		    							<?php $link_row ++; ?>
		    						<?php  } ?>
		    					<?php } ?>
		    				</tbody>
		    				<tfoot>
				              	<tr>
					                <td colspan="4"></td>
					                <td class="text-left"><button type="button" onclick="addLink();" data-toggle="tooltip" title="<?php echo $button_banner_add; ?>" class="btn btn-primary"><i class="fa fa-plus-circle"></i></button></td>
					              </tr>
					        </tfoot>
		    			</table>
		    		</form>
		    	</div>
		    </div>
		</div>
	</div>
	<script type="text/javascript">
	var link_row=<?php echo $link_row; ?>;
	 	function addLink(){
	 		html=	'<tr id="link-row'+link_row+'">';
	 		html+=	'<td class="text-left">';
	 		<?php foreach ($languages as $language) { ?>
	 			html += '    <div class="input-group">';
				html += '     <span class="input-group-addon"><img src="view/image/flags/<?php echo $language['image']; ?>" title="<?php echo $language['name']; ?>" /></span><input type="text" name="link['+link_row+'][link_desc][<?php echo $language['language_id']; ?>][title]" placeholder="<?php echo $text_title; ?>" class="form-control">';
			    html += '    </div>';
	 		<?php } ?>
	 		html+=	'</td>'
	 		html+=	'<td><input type="text" name="link['+link_row+'][href]" class="form-control"></td>';
	 		html+=	'<td><input type="text" name="link['+link_row+'][sort_order]" class="form-control"></td>';	
	 		html += '  <td class="text-left"><button type="button" onclick="$(\'#link-row' + link_row  + '\').remove();" data-toggle="tooltip" title="<?php echo $button_remove; ?>" class="btn btn-danger"><i class="fa fa-minus-circle"></i></button></td>'; 
	 		html+=	'</tr>';
	 		$('#links-footer').append(html);
	 		link_row++;
	 	}
	</script>
</div>
<?php echo $footer; ?>