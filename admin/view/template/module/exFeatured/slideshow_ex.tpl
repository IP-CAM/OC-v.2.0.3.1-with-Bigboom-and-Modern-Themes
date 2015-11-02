<?php echo $header; ?><?php echo $column_left; ?>
<div id="content">
  <div class="page-header">
    <div class="container-fluid">
      <div class="pull-right">
        <button type="submit" form="form-slideshow-ex" data-toggle="tooltip" title="<?php echo $button_save; ?>" class="btn btn-primary"><i class="fa fa-save"></i></button>
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
        <h3 class="panel-title"><i class="fa fa-pencil"></i> <?php echo $text_edit; ?></h3>
      </div>
      <div class="panel-body">
        <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form-slideshow-ex" class="form-horizontal">
          <div class="form-group">
            <label class="col-sm-2 control-label" for="input-name"><?php echo $entry_name; ?></label>
            <div class="col-sm-10">
              <input type="text" name="name" value="<?php echo $name; ?>" placeholder="<?php echo $entry_name; ?>" id="input-name" class="form-control" />
              <?php if ($error_name) { ?>
              <div class="text-danger"><?php echo $error_name; ?></div>
              <?php } ?>
            </div>
          </div>
          <div class="form-group">
            <label class="col-sm-2 control-label" for="input-banner"><?php echo $entry_banner; ?></label>
            <div class="col-sm-10">
              <select name="banner_id" id="input-banner" class="form-control">
                <?php foreach ($banners as $banner) { ?>
                <?php if ($banner['banner_id'] == $banner_id) { ?>
                <option value="<?php echo $banner['banner_id']; ?>" selected="selected"><?php echo $banner['name']; ?></option>
                <?php } else { ?>
                <option value="<?php echo $banner['banner_id']; ?>"><?php echo $banner['name']; ?></option>
                <?php } ?>
                <?php } ?>
              </select>
              <div>
                 <table id="images" class="table table-striped table-bordered table-hover">
                  <thead>
                    <tr>
                      <td class="text-center" style="width:20%;"><?php echo "Image"; ?></td>
                      <td class="text-center"><?php echo "Title"; ?></td>
                      <td class="text-center  "><?php echo "Content"; ?></td>
                      <td class="text-center"><?php echo "html code" ?></td>
                    </tr>
                  </thead>
                  <tbody>                           
                  <?php if(!empty($images)) { foreach ($images as $k=>$img) { ?>               
                    <tr>
                        <td><input type="hidden" name="images[<?php echo $k ?>][path]" value="<?php echo $img['image'] ;?>"><img src="<?php echo $img['path']; ?>"></td>
                        <td><textarea name="images[<?php echo $k ?>][title]" ><?php if(!empty($img['title'])) {echo $img['title'];} ?></textarea></td>
                        <td><textarea name="images[<?php echo $k ?>][content]"><?php if(!empty($img['content'])){ echo $img['content']; }?></textarea></td>
                        <td><textarea  name="images[<?php echo $k ?>][html_code]"><?php if(!empty($img['html_code'])){echo $img['html_code'];} ?></textarea></td>
                    </tr>
                   <?php } } ?>
                  </tbody>
                 </table>
              </div>
            </div>
          </div>
          <div class="form-group">
            <label class="col-sm-2 control-label" for="input-width"><?php echo $entry_width; ?></label>
            <div class="col-sm-10">
              <input type="text" name="width" value="<?php echo $width; ?>" placeholder="<?php echo $entry_width; ?>" id="input-width" class="form-control" />
              <?php if ($error_width) { ?>
              <div class="text-danger"><?php echo $error_width; ?></div>
              <?php } ?>
            </div>
          </div>
          <div class="form-group">
            <label class="col-sm-2 control-label" for="input-height"><?php echo $entry_height; ?></label>
            <div class="col-sm-10">
              <input type="text" name="height" value="<?php echo $height; ?>" placeholder="<?php echo $entry_height; ?>" id="input-height" class="form-control" />
              <?php if ($error_height) { ?>
              <div class="text-danger"><?php echo $error_height; ?></div>
              <?php } ?>
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
  var url="<?php  echo html_entity_decode($url_banner) ?>"; 
  $('#input-banner').change(function(){ 
    $('#images').find('tbody').empty();    

      $.ajax({
          method:"POST",
          url:url,
          data:{banner_id:$(this).val()}
      }).done(function(msg){
        rs=jQuery.parseJSON(msg);        
        var i;      
        for(i=0; i<rs.length;i++){     

              $('#images').find('tbody').append('<tr><td><input type="hidden" name="images['+i+'][path]" value="'+rs[i]['path']+'"><img src="'+rs[i]['image']+'"></img></td><td><textarea name="images['+i+'][title]"></textarea></td><td><textarea name="images['+i+'][content]"></textarea></td><td><textarea name="images['+i+'][html_code]"></textarea></td></tr>');
          }        
      });
  });
</script>
<style type="text/css">
textarea{height:200px;display:block;width:100%;resize: none;}

</style>
<?php echo $footer; ?>
