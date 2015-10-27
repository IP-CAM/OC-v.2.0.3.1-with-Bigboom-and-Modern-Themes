<?php echo $header; ?><?php echo $column_left;  ?>
	<div id="content">
		<div class="page-header">
			<div class="container-fluid">
				<div class="pull-right">
					<button type="submit" form="form-blogs-lastest" data-toggle="tool-tip" title="<?php echo $button_save ?>" class="btn btn-primary"><i class="fa fa-save"></i></button>
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
					<h3 class="panel-title"><i class="fa fa-pencil"> <?php echo $text_edit; ?></i></h3>
				</div>
				<div class="panel-body">
					<form action="<?php echo $action ?>" method="post" enctype="multipart/form-data" id="form-product-tab" class="form-horizontal">
						<div class="form-group">
							<label class="col-sm-2"><?php echo $text_name; ?></label>
							<div class="col-sm-10">
								<input type="text" name="name" class="form-control" value="<?php echo $name; ?>">
								 <?php if ($error_name) { ?>
					             <div class="text-danger"><?php echo $error_name; ?></div>
					             <?php } ?>
							</div>
						</div>

						 <div class="form-group">
				            <label class="col-sm-2" for="input-status"><?php echo $entry_status; ?></label>
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

						<table id="table-add-tabs" class="table table-striped table-bordered table-hover">
							<thead>
								 <tr>
					                <td class="text-left"><?php echo $text_tab_name; ?></td>
					                <td class="text-left"><?php echo $text_action; ?></td>	               
					              </tr>
							</thead>							
							<tbody>	
								<?php $tab_id=0; ?>
								<?php if(!empty($tabs)) { foreach ($tabs as $tab) { ?>
									<input type="hidden" name="tab_info[<?php echo $tab_id; ?>][tab_id]" value="<?php echo $tab_id; ?>" id="hidden<?php echo $tab_id; ?>">
									<tr id="tab<?php echo $tab_id; ?>">
										<td class="text-left"><input type="text" class="form-control" name="tab_info[<?php echo $tab_id; ?>][name]" value="<?php echo $tab['name']; ?>"></td>
					                	<td class="text-left">
					                		<span class="btn" onclick="removeTab(<?php echo $tab_id; ?>)"><i class="fa fa-trash"></i></span>
					                		<span class="btn" onclick="addConfig(<?php echo $tab_id; ?>)"><i class="fa fa-cogs"></i></span>
					                	</td>	      
									</tr>
									<tr id="tab-config<?php echo $tab_id; ?>">
										<td>
											<div class="row tab-config">
												<?php if($tab['rd']==1) { ?>
												<div class="col-sm-4 choose-group"><input type="radio" checked name="tab_info[<?php echo $tab_id ?>][rd]" id="all-product<?php echo $tab_id; ?>" onchange="rd_change(this,<?php echo $tab_id; ?>)" value="1">All product
													<div class="choose-element choose-default" id="choose-default<?php $tab_id; ?>">
														<table class="table table-striped table-bordered table-hover">
															<thead>
																<tr>
																	<td><input type="checkbox" id="selectall-product<?php echo $tab_id; ?>" onchange="selectAll(this,<?php echo $tab_id; ?>)"></td>
																	<td>Images</td>
																	<td>Name</td>
																</tr>
															</thead>
															<tbody>
																<?php foreach ($products as $p) { ?>							
																	<tr>
																		<?php if(isset($tab['selected'])) { if(in_array($p['product_id'],$tab['selected'])) { ?>
																		<td><input type="checkbox" name="tab_info[<?php echo $tab_id; ?>][selected][]" value="<?php echo $p['product_id'] ?>" checked></td><?php } else { ?>
																		<td><input type="checkbox" name="tab_info[<?php echo $tab_id; ?>][selected][]" value="<?php echo $p['product_id'] ?>"></td>
																		<?php } ?>
																		<td><img src="<?php echo $p['image']; ?>"></td>
																		<td><?php echo $p['name']; ?></td>
																		<?php } else { ?>										
																		<td><input type="checkbox" name="tab_info[<?php echo $tab_id; ?>][selected][]" value="<?php echo $p['product_id'] ?>"></td>			
																		<td><img src="<?php echo $p['image']; ?>"></td>
																		<td><?php echo $p['name']; ?></td>
																		<?php } ?>
																	</tr>
																<?php } ?>
															</tbody>
														</table>
													</div>
												</div>

												<div class="col-sm-4 choose-group"><input type="radio" name="tab_info[<?php echo $tab_id; ?>][rd]" id="cate-product<?php echo $tab_id; ?>" onchange="rd_change(this,<?php echo $tab_id; ?>)" value="2">Categories
													<div class="choose-element">
														<select class="form-control" onchange="selectCate(this,<?php echo $tab_id; ?>)" id="select-protab<?php echo $tab_id; ?>" name="tab_info[<?php echo $tab_id; ?>][cate_selected]">
															<?php foreach ($categories as $cate) { ?>
																<option value="<?php echo $cate['category_id']; ?>"><?php echo $cate['name']; ?></option>
															<?php } ?>
														</select>
														<table id="mytable" class="table table-striped table-bordered table-hover">
															<thead>
																<tr>
																	<td><input type="checkbox" id="selectall-cate<?php echo $tab_id; ?>" onchange="selectAll(this,<?php echo $tab_id; ?>)"></td>
																	<td>Images</td>
																	<td>Name</td>
																</tr>
															</thead>
															<tbody>
															</tbody>
														</table>
													</div>
												</div>

												<div class="col-sm-4 choose-group"><input type="radio" name="tab_info[<?php echo $tab_id; ?>][rd]" id="tab-product<?php echo $tab_id; ?>" onchange="rd_change(this,<?php echo $tab_id; ?>)" value="3">Products tab
													<div class="choose-element">
														<select class="form-control" id="select-type<?php echo $tab_id; ?>" onchange="selectType(this,<?php echo $tab_id; ?>)" name="tab_info[<?php echo $tab_id ?>][type_selected];">
															<?php foreach ($type_product as $k=>$tp) { ?>
																<option value="<?php echo $k; ?>" ><?php echo $tp; ?></option>
															<?php } ?>
														</select>
														<table class="table table-striped table-bordered table-hover">
															<thead>
																<tr>
																	<td><input type="checkbox" id="selectall-type<?php echo $tab_id; ?>" onchange="selectAll(this,<?php echo $tab_id; ?>)"></td>
																	<td>Images</td>
																	<td>Name</td>
																</tr>
															</thead>
															<tbody>

															</tbody>
														</table>
													</div>
												</div>

												<?php } else if($tab['rd']==2) { ?>

												<div class="col-sm-4 choose-group"><input type="radio" name="tab_info[<?php echo $tab_id ?>][rd]" id="all-product<?php echo $tab_id; ?>" onchange="rd_change(this,<?php echo $tab_id; ?>)" value="1">All product
													<div class="choose-element" id="choose-default<?php $tab_id; ?>">
														<table class="table table-striped table-bordered table-hover">
															<thead>
																<tr>
																	<td><input type="checkbox" id="selectall-product<?php echo $tab_id; ?>" onchange="selectAll(this,<?php echo $tab_id; ?>)"></td>
																	<td>Images</td>
																	<td>Name</td>
																</tr>
															</thead>
															<tbody>
																<?php foreach ($products as $p) { ?>
																	<tr>
																		<td><input type="checkbox" name="tab_info[<?php echo $tab_id ?>][selected][]" value="<?php echo $p['product_id']; ?>"></td>
																		<td><img src="<?php echo $p['image']; ?>"></td>
																		<td><?php echo $p['name']; ?></td>
																	</tr>
																<?php  } ?>
															</tbody>
														</table>
													</div>
												</div>

												<div class="col-sm-4 choose-group"><input type="radio" checked name="tab_info[<?php echo $tab_id; ?>][rd]" id="cate-product<?php echo $tab_id; ?>" onchange="rd_change(this,<?php echo $tab_id; ?>)" value="2">Categories
													<div class="choose-element choose-default">
														<select class="form-control" onchange="selectCate(this,<?php echo $tab_id; ?>)" id="select-protab<?php echo $tab_id; ?>" name="tab_info[<?php echo $tab_id; ?>][cate_selected]">
															<?php foreach ($categories as $cate) { ?>
																<?php if($tab['cate_selected']==$cate['category_id']) { ?> 			
																<option value="<?php echo $cate['category_id']; ?>" selected><?php echo $cate['name']; ?></option>
																<?php } else { ?>
																<option value="<?php echo $cate['category_id']; ?>"><?php echo $cate['name']; ?></option>
																<?php } ?>
															<?php } ?>
														</select>
														<table id="mytable" class="table table-striped table-bordered table-hover">
															<thead>
																<tr>
																	<td><input type="checkbox" id="selectall-cate<?php echo $tab_id; ?>" onchange="selectAll(this,<?php echo $tab_id; ?>)"></td>
																	<td>Images</td>
																	<td>Name</td>
																</tr>
															</thead>
															<tbody>
																<?php foreach ($cate_selected as $csl) {
																	if($csl['tab_id']==$tab['tab_id']){
																		foreach ($csl['products'] as $p) { ?>
																			<tr>
																			<?php if(isset($tab['selected'])) { if(in_array($p['product_id'], $tab['selected'])) { ?>
																				<td><input type="checkbox" name="tab_info[<?php echo $tab_id; ?>][selected][]" checked value="<?php echo $p['product_id']; ?>"></td>
																				<?php } else { ?>
																				<td><input type="checkbox" name="tab_info[<?php echo $tab_id; ?>][selected][]" value="<?php echo $p['product_id']; ?>"></td>
																				<?php } ?>
																				<td><img src="<?php echo $p['image']; ?>"></td>
																				<td><?php echo $p['name']; ?></td>
																				<?php } else { ?>
																				<td><input type="checkbox" name="tab_info[<?php echo $tab_id; ?>][selected][]" value="<?php echo $p['product_id']; ?>"></td>				
																				<td><img src="<?php echo $p['image']; ?>"></td>
																				<td><?php echo $p['name']; ?></td>			
																				<?php } ?>
																			</tr>
																		<?php } ?>													
																<?php }} ?>
															</tbody>
														</table>
													</div>
												</div>

												<div class="col-sm-4 choose-group"><input type="radio" name="tab_info[<?php echo $tab_id; ?>][rd]" id="tab-product<?php echo $tab_id; ?>" onchange="rd_change(this,<?php echo $tab_id; ?>)" value="3">Products tab
													<div class="choose-element">
														<select class="form-control" id="select-type<?php echo $tab_id; ?>" onchange="selectType(this,<?php echo $tab_id; ?>)" name="tab_info[<?php echo $tab_id; ?>][type_selected]">
															<?php foreach ($type_product as $k=>$tp) { ?>
																<option value="<?php echo $k; ?>" ><?php echo $tp; ?></option>
															<?php } ?>
														</select>
														<table class="table table-striped table-bordered table-hover">
															<thead>
																<tr>
																	<td><input type="checkbox" id="selectall-type<?php echo $tab_id; ?>" onchange="selectAll(this,<?php echo $tab_id; ?>)"></td>
																	<td>Images</td>
																	<td>Name</td>
																</tr>
															</thead>
															<tbody>																
															</tbody>
														</table>
													</div>
												</div>
												<?php } else { ?>

												<div class="col-sm-4 choose-group"><input type="radio" name="tab_info[<?php echo $tab_id ?>][rd]" id="all-product<?php echo $tab_id; ?>" onchange="rd_change(this,<?php echo $tab_id; ?>)" value="1">All product
													<div class="choose-element" id="choose-default<?php $tab_id; ?>">
														<table class="table table-striped table-bordered table-hover">
															<thead>
																<tr>
																	<td><input type="checkbox" id="selectall-product<?php echo $tab_id; ?>" onchange="selectAll(this,<?php echo $tab_id; ?>)"></td>
																	<td>Images</td>
																	<td>Name</td>
																</tr>
															</thead>
															<tbody>
																<?php foreach ($products as $p) { ?>
																	<tr>
																		<td><input type="checkbox" name="tab_info[<?php echo $tab_id ?>][selected][]"></td>
																		<td><img src="<?php echo $p['image']; ?>"></td>
																		<td><?php echo $p['name']; ?></td>
																	</tr>
																<?php  } ?>
															</tbody>
														</table>
													</div>
												</div>

												<div class="col-sm-4 choose-group"><input type="radio" name="tab_info[<?php echo $tab_id; ?>][rd]" id="cate-product<?php echo $tab_id; ?>" onchange="rd_change(this,<?php echo $tab_id; ?>)" value="2">Categories
													<div class="choose-element">
														<select class="form-control" onchange="selectCate(this,<?php echo $tab_id; ?>)" id="select-protab<?php echo $tab_id; ?>" name="tab_info[<?php echo $tab_id; ?>][cate_selected]">
															<?php foreach ($categories as $cate) { ?>
																<option value="<?php echo $cate['category_id'] ?>"><?php echo $cate['name']; ?></option>
															<?php } ?>
														</select>
														<table id="mytable" class="table table-striped table-bordered table-hover">
															<thead>
																<tr>
																	<td><input type="checkbox" id="selectall-cate<?php echo $tab_id; ?>" onchange="selectAll(this,<?php echo $tab_id; ?>)"></td>
																	<td>Images</td>
																	<td>Name</td>
																</tr>
															</thead>
															<tbody>																
															</tbody>
														</table>
													</div>
												</div>

												<div class="col-sm-4 choose-group"><input type="radio" checked name="tab_info[<?php echo $tab_id; ?>][rd]" id="tab-product<?php echo $tab_id; ?>" onchange="rd_change(this,<?php echo $tab_id; ?>)" value="3">Products tab
													<div class="choose-element choose-default">
														<select class="form-control" id="select-type<?php echo $tab_id; ?>" onchange="selectType(this,<?php echo $tab_id; ?>)" name="tab_info[<?php echo $tab_id; ?>][type_selected]">
															<?php foreach ($type_product as $k=>$tp) { ?>
															<?php if($tab['type_selected']==$k ){ ?>
																<option value="<?php echo $k; ?>" selected><?php echo $tp; ?></option>
																<?php } else { ?>
																<option value="<?php echo $k; ?>" ><?php echo $tp; ?></option>
																<?php } ?>
															<?php } ?>
														</select>
														<table class="table table-striped table-bordered table-hover">
															<thead>
																<tr>
																	<td><input type="checkbox" id="selectall-type<?php echo $tab_id; ?>" onchange="selectAll(this,<?php echo $tab_id; ?>)"></td>
																	<td>Images</td>
																	<td>Name</td>
																</tr>
															</thead>
															<tbody>
																<?php foreach ($type_selected as $csl) {
																if($csl['tab_id']==$tab['tab_id']){
																	foreach ($csl['products'] as $p) { ?>
																		<tr>
																		<?php if(isset($tab['selected'])) { if(in_array($p['product_id'], $tab['selected'])) { ?>
																			<td><input type="checkbox" name="tab_info[<?php echo $tab_id; ?>][selected][]" checked value="<?php echo $p['product_id']; ?>"></td>
																			<?php } else { ?>
																			<td><input type="checkbox" name="tab_info[<?php echo $tab_id; ?>][selected][]" value="<?php echo $p['product_id']; ?>"></td>
																			<?php } ?>
																			<td><img src="<?php echo $p['image']; ?>"></td>
																			<td><?php echo $p['name']; ?></td>
																			<?php } else { ?>
																			<td><input type="checkbox" name="tab_info[<?php echo $tab_id; ?>][selected][]" value="<?php echo $p['product_id']; ?>"></td>				
																			<td><img src="<?php echo $p['image']; ?>"></td>
																			<td><?php echo $p['name']; ?></td>			
																			<?php } ?>
																		</tr>
																	<?php } ?>													
																<?php }} ?>
															</tbody>
														</table>
													</div>
												</div>
												<?php } ?>
											</div>
										</td>
									</tr>
									<?php $tab_id+=1; ?>									
								<?php }} ?>														
							</tbody>
							 <tfoot>
				              <tr>
				                <td colspan="3"></td>
				                <td class="text-left"><button type="button" onclick="addTab();" data-toggle="tooltip" title="<?php echo $button_tab_add; ?>" class="btn btn-primary"><i class="fa fa-plus-circle"></i></button></td>
				              </tr>
				            </tfoot>
						</table>
					</form>
				</div>
			</div>
		</div>
	</div>

	<!--Since some reasons because we must use variables from server side so not other way we must write js code in this file.-->

	<script type="text/javascript">	

		var tab_id	=<?php echo $tab_id; ?>;

		function addTab(){	
			/*load product by ajax*/
			h_product=' ';
			$.ajax({
				method:"POST",
				url:'index.php?route=ajaxload/product/getAllProduct&token=<?php echo $token; ?>',	
				data:{filter:1,page:1}
			}).done(function(msg){							
				var products 	=jQuery.parseJSON(msg).products;	
					categories 	=jQuery.parseJSON(msg).categories;
				
				h_product='';
				for(i=0;i<products.length;i++){	
					h_product+='<tr>'				
					h_product+='<td><input type="checkbox" name="tab_info['+tab_id+'][selected][]" value="'+products[i].product_id+'"></td>';
					h_product+='<td><img src="'+products[i].image+'"></td>';
					h_product+='<td>'+products[i].name+'</td></tr>';
				}
				h_categories='';
				for(j=0;j<categories.length;j++){
					h_categories+='<option value='+categories[j].category_id+'>'+categories[j].name+'</option>'
				}		

			h_tab_config	='<input type="hidden" name="tab_info['+tab_id+'][tab_id]" value="'+tab_id+'">';
			h_tab_config	+='<div class="row tab-config" id="tab-config'+tab_id+'">\
									<div class="col-sm-4 choose-group"><input type="radio" name="tab_info['+tab_id+'][rd]" checked id="all-product'+tab_id+'" onchange="rd_change(this,'+tab_id+')" value="1" >All product\
										<div class="choose-element choose-default" id="choose-default'+tab_id+'">\
											<table class="table table-striped table-bordered table-hover">\
												<thread>\
													<tr>\
														<td><input type="checkbox" id="selectall-product'+tab_id+'" onchange="selectAll(this,'+tab_id+')" ></td>\
														<td>Images</td>\
														<td>Name</td>\
													</tr>\
												</thread>\
												<tbody>'+h_product+'<tbody>\
										</table>\
										</div>\
									</div>\
									<div class="col-sm-4 choose-group"><input type="radio" name="tab_info['+tab_id+'][rd]" id="cate-product'+tab_id+'" onchange="rd_change(this,'+tab_id+')" value="2">Categories\
										<div class="choose-element">\
											<select onchange="selectCate(this,'+tab_id+')" class="form-control" id="select-protab'+tab_id+'" name="tab_info['+tab_id+'][cate_selected]" >'+h_categories+'</select>\
											<table id="table_cate'+tab_id+'" class="table table-striped table-bordered table-hover">\
												<thead>\
												<tr>\
													<td><input type="checkbox" id="selectall-cate'+tab_id+'" onchange="selectAll(this,'+tab_id+')"></td>\
													<td>Images</td>\
													<td>Name</td>\
												</tr>\
												</thead>\
												<tbody>\
												</tbody>\
											</table>\
										</div>\
									</div>\
									<div class="col-sm-4 choose-group"><input type="radio" name="tab_info['+tab_id+'][rd]" id="tab-product'+tab_id+'" onchange="rd_change(this,'+tab_id+')" value="3" >Products tab\
										<div class="choose-element">\
											<select class="form-control" id="select-type'+tab_id+'" onchange="selectType(this,'+tab_id+')" name="tab_info['+tab_id+'][type_selected]">\
												<option value="0">Best seller</option>\
												<option value="1">Special</option>\
												<option value="2">Lastest</option>\
												<option value="3">Popular</option>\
											</select>\
											<table class="table table-striped table-bordered table-hover">\
												<thead>\
												<tr>\
													<td><input type="checkbox" id="selectall-type'+tab_id+'" onchange="selectAll(this,'+tab_id+')"></td>\
													<td>Images</td>\
													<td>Name</td>\
												</tr>\
												</thead>\
												<tbody>\
												</tbody>\
											</table>\
										</div>\
									</div>\
								</div>';

			h_tab	='<tr id="tab'+tab_id+'">\
						<td class="text-left"><input class="form-control" type="text" name="tab_info['+tab_id+'][name]"></td>\
						<td class="text-left">\
							<span class="btn" onclick="removeTab('+tab_id+')"><i class="fa fa-trash"></i></span>\
							<span class="btn" onclick="addConfig('+tab_id+')"><i class="fa fa-cogs"></i></span>\
						</td>\
					</tr>\
					<tr id="tab-config'+tab_id+'" style="display:none;">\
						<td>'+h_tab_config+'</td>\
					</tr>';
			$('#table-add-tabs > tbody').append(h_tab);		

			});	

			tab_id+=1;				
		}	

		/*function handle event for elements were created when new tab initial we call it hook*/ 

		function addConfig(tab_id){	
			$('#table-add-tabs tbody').find('#tab-config'+tab_id).toggle();
		}

		function rd_change(obj,tab_id){
			var r_this=$('#'+obj.id);			
			r_this.parents('#tab-config'+tab_id).find('.choose-element :input').attr('disabled',true);
			r_this.parents('#tab-config'+tab_id).find('.choose-element').hide();			
			r_this.parent().find('.choose-element :input').attr('disabled',false);			
			r_this.parent().find('.choose-element').show();
		}

		function selectCate(obj,tab_id){
			var sl_this=$('#'+obj.id);			
			$.ajax({
					method:"POST",
					url:'index.php?route=ajaxload/product/productByCate&token=<?php echo $token; ?>',
					data:{cate_id:$(sl_this).val()}
				}).done(function(msg){
					products = jQuery.parseJSON(msg);		
					console.log(products)			;
					h_cate_product='';
					for(i=0;i<products.length;i++){
						h_cate_product+='<tr><td><input type="checkbox" name="tab_info['+tab_id+'][selected][]" value="'+products[i].product_id+'"></td>';
						h_cate_product+='<td><img src="'+products[i].image+'"></td>';
						h_cate_product+='<td>'+products[i].name+'</td></tr>';					
					}	
								
					sl_this.parent().find('table tbody').html(h_cate_product);
				});
		}

		function selectType(obj,tab_id){
			var sl_this=$('#'+obj.id);

			$.ajax({
				method:"POST",
				url:'index.php?route=ajaxload/product/productbyType&token=<?php echo $token; ?>',
				data:{type_id:sl_this.val()}
			}).done(function(msg){
				products = jQuery.parseJSON(msg);					
				h_cate_product='';
				for(i=0;i<products.length;i++){
					h_cate_product+='<tr><td><input type="checkbox" name="tab_info['+tab_id+'][selected][]" value="'+products[i].product_id+'"></td>';
					h_cate_product+='<td><img src="'+products[i].image+'"></td>';
					h_cate_product+='<td>'+products[i].name+'</td></tr>';					
				}	
							
				sl_this.parent().find('table tbody').html(h_cate_product);
			});
			
		}

		function selectAll(obj,tab_id){
			var cb_this=$('#'+obj.id);			
			cb_this.parents('.choose-element').find('table tbody').find('input[name*=\'tab_info['+tab_id+'][selected]\']').prop('checked',cb_this.prop('checked'));
		}

		/*========================================================================================*/


	</script>

	<style>
		.tab-config{width: 100%;}		
		.choose-element{display: none;max-height: 300px;overflow: auto;}
		.choose-default{display: block;}
	</style>
<?php echo $footer; ?>
