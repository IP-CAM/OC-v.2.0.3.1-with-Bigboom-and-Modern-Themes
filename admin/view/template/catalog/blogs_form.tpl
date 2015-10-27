<?php echo $header; ?><?php echo $column_left; ?>
<div id="content">
	<div class="page-header">
		<div class="container-fluid">
			<div class="pull-right">
				<button type="submit" form="form-blog" data-toggle="tooltip" title="<?php echo $button_save; ?>" class="btn btn-primary"><i class="fa fa-save"></i></button>
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
				<form  action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form-blog" class="form-horizontal">
					<ul class="nav nav-tabs">
						<li class="active"><a href="#tab-general" data-toggle="tab"><?php echo $tab_general; ?></a></li>
						<li><a href="#tab-data" data-toggle="tab"><?php echo $tab_data; ?></a></li>				      
					</ul>
					<div class="tab-content">
						<div class="tab-pane active in" id="tab-general">
							<ul class="nav nav-tabs" id="language">
								<?php  foreach($languages as $language) { ?>
								<li><a href="#language<?php echo $language['language_id']; ?>" data-toggle="tab"><img src="view/image/flags/<?php echo $language['image']; ?>" title="<?php echo $language['name']; ?>" /> <?php echo $language['name']; ?></a></li>
								<?php } ?>
							</ul>
							<div class="tab-content">
								<?php foreach ($languages as $language) { ?>
								<div class="tab-pane" id="language<?php echo $language['language_id']; ?>">
									<div class="form-group required">
										<label class="col-sm-2 control-label" for="input-name<?php echo $language['language_id']; ?>"><?php echo $entry_name; ?></label>
										<div class="col-sm-10">
											<input type="text" name="blog_description[<?php echo $language['language_id']; ?>][name]" value="<?php echo isset($blog_description[$language['language_id']]) ? $blog_description[$language['language_id']]['name'] : ''; ?>" placeholder="<?php echo $entry_name; ?>" id="input-name<?php echo $language['language_id']; ?>" class="form-control" />
											<?php if (isset($error_name[$language['language_id']])) { ?>
											<div class="text-danger"><?php echo $error_name[$language['language_id']]; ?></div>
											<?php } ?>
										</div>
									</div>

									 <div class="form-group">
										<label class="col-sm-2 control-label" for="input-short-desc<?php echo $language['language_id']; ?>"><?php echo $entry_short_desc; ?></label>
										<div class="col-sm-10">
											<textarea name="blog_description[<?php echo $language['language_id']; ?>][short_content]" rows="5" placeholder="<?php echo $entry_short_desc; ?>" id="input-short-desc<?php echo $language['language_id']; ?>" class="form-control"><?php echo isset($blog_description[$language['language_id']]) ? $blog_description[$language['language_id']]['short_content'] : ''; ?></textarea>
										</div>
									</div>

									<div class="form-group">
										<label class="col-sm-2 control-label" for="input-content<?php echo $language['language_id']; ?>"><?php echo $entry_content; ?></label>
										<div class="col-sm-10">
											<textarea name="blog_description[<?php echo $language['language_id']; ?>][content]" placeholder="<?php echo $entry_content; ?>" id="input-content<?php echo $language['language_id']; ?>" class="form-control"><?php echo isset($blog_description[$language['language_id']]) ? $blog_description[$language['language_id']]['content'] : ''; ?></textarea>
										</div>
									</div>
									<div class="form-group required">
										<label class="col-sm-2 control-label" for="input-meta-title<?php echo $language['language_id']; ?>"><?php echo $entry_meta_title; ?></label>
										<div class="col-sm-10">
											<input type="text" name="blog_description[<?php echo $language['language_id']; ?>][meta_title]" value="<?php echo isset($blog_description[$language['language_id']]) ? $blog_description[$language['language_id']]['meta_title'] : ''; ?>" placeholder="<?php echo $entry_meta_title; ?>" id="input-meta-title<?php echo $language['language_id']; ?>" class="form-control" />
											<?php if (isset($error_meta_title[$language['language_id']])) { ?>
											<div class="text-danger"><?php echo $error_meta_title[$language['language_id']]; ?></div>
											<?php } ?>
										</div>
									</div>
									<div class="form-group">
										<label class="col-sm-2 control-label" for="input-meta-content<?php echo $language['language_id']; ?>"><?php echo $entry_meta_description; ?></label>
										<div class="col-sm-10">
											<textarea name="blog_description[<?php echo $language['language_id']; ?>][meta_description]" rows="5" placeholder="<?php echo $entry_meta_description; ?>" id="input-meta-content<?php echo $language['language_id']; ?>" class="form-control"><?php echo isset($blog_description[$language['language_id']]) ? $blog_description[$language['language_id']]['meta_description'] : ''; ?></textarea>
										</div>
									</div>
									<div class="form-group">
										<label class="col-sm-2 control-label" for="input-meta-keyword<?php echo $language['language_id']; ?>"><?php echo $entry_meta_keyword; ?></label>
										<div class="col-sm-10">
											<textarea name="blog_description[<?php echo $language['language_id']; ?>][meta_keyword]" rows="5" placeholder="<?php echo $entry_meta_keyword; ?>" id="input-meta-keyword<?php echo $language['language_id']; ?>" class="form-control"><?php echo isset($blog_description[$language['language_id']]) ? $blog_description[$language['language_id']]['meta_keyword'] : ''; ?></textarea>
										</div>
									</div>
								</div>
								<?php } ?>
							</div>
						</div><!-- end tab general -->
						<div class="tab-pane fade" id="tab-data">  
							<div class="form-group">
								<label class="col-sm-2 control-label"><?php echo $entry_store; ?></label>
								<div class="col-sm-10">
									<div class="well well-sm" style="height: 150px; overflow: auto;">
										<div class="checkbox">
											<label>
												<?php if (in_array(0, $blog_store)) { ?>
												<input type="checkbox" name="blog_store[]" value="0" checked="checked" />
												<?php echo $text_default; ?>
												<?php } else { ?>
												<input type="checkbox" name="blog_store[]" value="0" />
												<?php echo $text_default; ?>
												<?php } ?>
											</label>
										</div>
										<?php foreach ($stores as $store) { ?>
										<div class="checkbox">
											<label>
												<?php if (in_array($store['store_id'], $blog_store)) { ?>
												<input type="checkbox" name="blog_store[]" value="<?php echo $store['store_id']; ?>" checked="checked" />
												<?php echo $store['name']; ?>
												<?php } else { ?>
												<input type="checkbox" name="blog_store[]" value="<?php echo $store['store_id']; ?>" />
												<?php echo $store['name']; ?>
												<?php } ?>
											</label>
										</div>
										<?php } ?>
									</div>
								</div>
							</div>

							<div class="form-group">
								<label class="col-sm-2 control-label" for="input-keyword"><span data-toggle="tooltip" title="<?php echo $help_keyword; ?>"><?php echo $entry_keyword; ?></span></label>
								<div class="col-sm-10">
									<input type="text" name="keyword" value="<?php echo $keyword; ?>" placeholder="<?php echo $entry_keyword; ?>" id="input-keyword" class="form-control" />
									<?php if ($error_keyword) { ?>
									<div class="text-danger"><?php echo $error_keyword; ?></div>
									<?php } ?>                
								</div>
							</div>

							<div class="form-group" id="blog-category">
								<label class="col-sm-2 control-label" for="blog_category"><?php echo $entry_blog_cate; ?></label>
								<div class="col-sm-5" style="display:inline-flex;">
										<input style="margin-right:10px;" type="radio" data-toggle="tooltip" title="Available category" name="rd_blog_cate" checked="checked">                    
										<select class="form-control" name="blog_cate">
											<?php foreach ($blogs_cate as $blog_cate) { 
													if($blog_cate['cat_id']==$blog_cat)
														{
											 ?>
												<option value="<?php echo $blog_cate['cat_id']; ?>" selected="selected"><?php echo $blog_cate['title'];?></option>
												<?php } else { ?>
												<option value="<?php echo $blog_cate['cat_id']; ?>"><?php echo $blog_cate['title'];?></option>
											<?php } } ?>                    
										</select>
								</div>  
								 <div class="col-sm-5">
									<div  style="display:inline-flex; width:100%">
										<input style="margin-right:10px;" type="radio" data-toggle="tooltip" title="New category" name="rd_blog_cate">
										<input type="text" class="form-control" name="blog_new_cate" disabled> 
									</div>                                                      
									 <?php if (!empty($error_blog_new_cate)) { ?>
									<div class="text-danger"><?php echo $error_blog_new_cate; ?></div>
									<?php } ?>                    

								</div>  
							</div>

							 <div class="form-group">
									<label class="col-sm-2 control-label"><?php echo $entry_icon; ?></label>
									<div class="col-sm-10"><a href="" id="thumb-icon-image" data-toggle="image" class="img-thumbnail"><img src="<?php echo $icon_thumb; ?>" alt="" title="" data-placeholder="<?php echo $placeholder; ?>" /></a>
										<input type="hidden" name="icon_image" value="<?php echo $icon_image; ?>" id="input-icon_image" />
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
						</div><!--end tag data--> 
					</div>
				</form>
			</div>
		</div>
	</div>
	<script type="text/javascript"><!--
<?php foreach ($languages as $language) { ?>
$('#input-content<?php echo $language['language_id']; ?>').summernote({
	height: 300
});
<?php } ?>
//--></script> 
<!--  <script type="text/javascript"><!--
$('input[name=\'path\']').autocomplete({
	'source': function(request, response) {
		$.ajax({
			url: 'index.php?route=catalog/blog/autocomplete&token=<?php echo $token; ?>&filter_name=' +  encodeURIComponent(request),
			dataType: 'json',
			success: function(json) {
				json.unshift({
					blog_id: 0,
					name: '<?php echo $text_none; ?>'
				});

				response($.map(json, function(item) {
					return {
						label: item['name'],
						value: item['blog_id']
					}
				}));
			}
		});
	},
	'select': function(item) {
		$('input[name=\'path\']').val(item['label']);
		$('input[name=\'parent_id\']').val(item['value']);
	}
});
</script> -->
<!--<script type="text/javascript"><!--
$('input[name=\'filter\']').autocomplete({
	'source': function(request, response) {
		$.ajax({
			url: 'index.php?route=catalog/filter/autocomplete&token=<?php echo $token; ?>&filter_name=' +  encodeURIComponent(request),
			dataType: 'json',
			success: function(json) {
				response($.map(json, function(item) {
					return {
						label: item['name'],
						value: item['filter_id']
					}
				}));
			}
		});
	},
	'select': function(item) {
		$('input[name=\'filter\']').val('');

		$('#blog-filter' + item['value']).remove();

		$('#blog-filter').append('<div id="blog-filter' + item['value'] + '"><i class="fa fa-minus-circle"></i> ' + item['label'] + '<input type="hidden" name="blog_filter[]" value="' + item['value'] + '" /></div>');
	}
});

$('#blog-filter').delegate('.fa-minus-circle', 'click', function() {
	$(this).parent().remove();
});
</script> -->
<script type="text/javascript">
$('#language a:first').tab('show');
//--></script>
<script type="text/javascript">
	$("#blog-category input[type='radio']").click(function() {
	$(this).parents('.form-group').find('.form-control').prop('disabled',true);
	$(this).parent().find('.form-control').prop('disabled',false); 
	});

	$('#btn-view').click(function(){
		var src=$('#input-src').val();
		$('#img-iframe').attr('src',src);
	});

	$("input[name='images']").each(function(){
		$(this).click(function(){
		 $(this).parents('#tab-image').find('input:text,input:hidden,select').prop('disabled',true);
		$(this).parents('.form-group').find('input:text,input:hidden,select').prop('disabled',false);
		});
	});
</script>

<script type="text/javascript">

</script>

</div>
<?php echo $footer; ?>