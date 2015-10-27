<?php echo $header; ?><?php echo $column_left; ?>
<div id="content">
	<div class="page-header">
    <div class="container-fluid">
      <div class="pull-right">
        <button type="submit" form="form-contact" data-toggle="tooltip" title="<?php echo $button_save; ?>" class="btn btn-primary"><i class="fa fa-save"></i></button>
        <a href="<?php echo $cancel; ?>" data-toggle="tooltip" title="<?php echo $button_cancel; ?>" class="btn btn-default"><i class="fa fa-reply"></i></a></div>
      <h1><?php echo $heading_title; ?></h1>     
    </div>
    <div class="container-fluid">
    	<div class="panel-body">
    		<form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form-contact" class="form-horizontal">      			
				<div class="tab-pane">
					<ul class="nav nav-tabs" id="language_slg">
		              <?php foreach ($languages as $language) { ?>
		              <li><a href="#language_slg<?php echo $language['language_id']; ?>" data-toggle="tab"><img src="view/image/flags/<?php echo $language['image']; ?>" title="<?php echo $language['name']; ?>" /> <?php echo $language['name']; ?></a></li>
		              <?php } ?>
		            </ul>
				</div>
				<div class="tab-content">
					<?php foreach ($languages as $language) { ?>
						<div class="tab-pane" id="language_slg<?php echo $language['language_id']; ?>">
							<div class="form-group">
			    				<label class="col-sm-2 control-label"><?php echo $footer_logo; ?></label>
				    			<div class="col-sm-10"><a href="" id="thumb-icon-image<?php echo $language['language_id']; ?>" data-toggle="image" class="img-thumbnail"><img src="<?php echo $info[$language['language_id']]['footer_logo']; ?>" alt="" title="" data-placeholder="<?php echo $placeholder; ?>" /></a>
									<input type="hidden" name="info[<?php echo $language['language_id']; ?>][footer_logo]" value="<?php echo $info[$language['language_id']]['icon_image']; ?>"  id="input-icon-image<?php echo $language['language_id']; ?>" />
								</div>
			    			</div>
							<div class="form-group">
								<label class="col-sm-2 control-label"><?php echo $text_slogan ?></label>
								<div class="col-sm-10">
									<textarea name="info[<?php echo $language['language_id']; ?>][footer_slogan]"  id="slogan<?php echo $language['language_id']; ?>" class="form-control"><?php echo $info[$language['language_id']]['footer_slogan'] ?></textarea>
								</div>
							</div>	   						
							<div class="form-group">
								<label class="col-sm-2 control-label"><?php echo $entry_contact; ?></label>
								<div class="col-sm-10">
									<textarea name="info[<?php echo $language['language_id']; ?>][contact_info]"  id="contact_info<?php echo $language['language_id']; ?>" class="form-control"><?php echo $info[$language['language_id']]['contact_info'] ?></textarea>	
								</div>	
							</div>	 
							<div class="form-group">
								<label class="col-sm-2 control-label"><?php echo $entry_footer_text; ?></label>
								<div class="col-sm-10">
									<textarea name="info[<?php echo $language['language_id']; ?>][footer_text]" id="footer_text<?php echo $language['language_id']; ?>" class="form-control"><?php echo $info[$language['language_id']]['footer_text']; ?></textarea>
								</div>
							</div>   								
						</div>	    						
					<?php } ?>
				</div>    			 		
    		</form>
    	</div>
    </div>
  </div>
</div>
  <script type="text/javascript"><!--
<?php foreach ($languages as $language) { ?>
$('#contact_info<?php echo $language['language_id']; ?>').summernote({height: 300});
$('#slogan<?php echo $language['language_id']; ?>').summernote({height: 300});
$('#footer_text<?php echo $language['language_id']; ?>').summernote({height: 300});

<?php } ?>
//--></script> 
  <script type="text/javascript"><!--
$('#language a:first').tab('show');
$('#language_slg a:first').tab('show');
//--></script>
<?php echo $footer; ?>