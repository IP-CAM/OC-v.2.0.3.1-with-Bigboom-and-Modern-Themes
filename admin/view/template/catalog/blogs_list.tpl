<?php echo $header; ?><?php echo $column_left; ?>
<div id="content">
	<div class="page-header">
		<div class="container-fluid">
			<div class="pull-right"><a href="<?php echo $add; ?>" data-toggle="tooltip" title="<?php echo $button_add; ?>" class="btn btn-primary"><i class="fa fa-plus"></i></a>
				<button type="button" onclick="confirm('<?php echo $text_confirm; ?>') ? $('#form-blogs').submit() : false;" data-toggle="tooltip" title="<?php echo $button_delete; ?>" class="btn btn-danger"><i class="fa fa-trash-o"></i></button>
			</div>	

			<h1><?php echo $heading_title; ?></h1>			
			<ul class="breadcrumb">
				<?php foreach ($breadcrumbs as $breadcrum) { ?>
				<li><a href="<?php echo $breadcrum['href']; ?>"><?php echo $breadcrum['text']; ?></a></li>
				<?php } ?>
			</ul>
		</div>

		<div class="container-fluid">
			<?php  if($error_warning) { ?>	
				<div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i><?php echo $error_warning; ?>
				<button type="button" class="close" data-dismiss="alert">&times;</button>
				</div>						
			<?php } 

				if($success){ ?>
				<div class="alert alert-success"><i class="fa fa-check-circle"></i> <?php echo $success; ?>
      			<button type="button" class="close" data-dismiss="alert">&times;</button>
   				 </div>
			<?php }?>

			<div class="panel panel-default">

				<div class="panel-heading">
					<h3 class="panel-title"><i class="fa fa-list"></i><?php echo $text_list; ?></h3>
				</div>
				<div class="panel-body">
					<form action="<?php echo $delete; ?>" method="post" enctype="multipart/form-data" id="form-blogs">
						<div class="table-responsive">
							<table class="table table-borderd table-hover">
								<thead>
									<tr>
										<td stype="width:1px;" class="text-center"><input type="checkbox" onclick="$('input[name*=\'selected\']').prop('checked',this.checked);"></td>
										<td class="text-center"><?php echo "Images"; ?>
										</td>
										<td class="text-left"><a class="asc" data-toggle="tooltip" title="<?php echo $tip_blog_title; ?>" href="<?php echo $sort_name; ?>"><?php echo $entry_blog_title; ?></a></td>
										<td class="text-left"><a class="asc" data-toggle="tooltip" title="<?php echo $tip_initial; ?>" href="<?php echo $sort_created_time ?>"><?php echo $entry_initial; ?></a></td>
										<td class="text-left"><a class="asc" data-toggle="tooltip" title="<?php echo $tip_update; ?>" href="<?php echo $sort_update_time ?>"><?php echo $entry_update; ?></a></td>
										<td class="text-left"><a data-toggle="tooltip" title="<?php echo $tip_user; ?>" class="asc" href="<?php echo $sort_user ?>"><?php echo $entry_user; ?></a></td>
										<td class="text-left"><a data-toggle="tooltip" title="<?php echo $tip_user_update; ?>" class="asc" href="#"><?php echo $entry_user_update; ?></a></td>
										<td class="text-right"><?php echo $entry_action; ?></td>			
									</tr>
								</thead>
								<tbody>									
									<?php foreach ($blogs as $blog) { ?>
									<tr>
										<td class="text-center"><input type="checkbox" name="selected[]" value="<?php echo $blog['post_id']; ?>"></td>
										<td class="text-center"><div class="img-thumbnail"><img src="<?php echo $blog['icon_image']; ?>"></div></td>
										<td class="text-left"><?php echo $blog['title']; ?></td>
										<td class="text-left"><?php echo $blog['created_time']; ?></td>
										<td class="text-left"><?php echo $blog['update_time']; ?></td>
										<td class="text-left"><?php echo $blog['create_user']; ?></td>
										<td class="text-left"><?php echo $blog['update_user']; ?></td>

										<td class="text-right"><a href="<?php echo $blog['blog_edit']; ?>" data-toggle="tooltip" title="<?php echo $button_edit; ?>" class="btn btn-primary"><i class="fa fa-pencil"></i></a></td>
									</tr>
									<?php } ?>									
								</tbody>

							</table>

						</div>

					</form>

					<div class="row">
			          <div class="col-sm-6 text-left"><?php echo $pagination; ?></div>
			          <div class="col-sm-6 text-right"><?php echo $results; ?></div>
			        </div>
				</div>
			</div>
		</div>
	</div><!--end header-->
</div>
<?php echo $footer; ?>