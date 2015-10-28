<link rel="stylesheet" type="text/css" href="view/stylesheet/fontawesome-iconpicker.min.css">
<?php echo $header; ?><?php echo $column_left; ?>
	<div id="content">
  <div class="page-header">
      <div class="container-fluid">
        <div class="pull-right">
          <button type="submit" form="form-megamenu" data-toggle="tooltip" title="<?php echo $button_save; ?>" class="btn btn-primary"><i class="fa fa-save"></i></button>
          <a href="<?php echo $cancel; ?>" data-toggle="tooltip" title="<?php echo $button_cancel; ?>" class="btn btn-default"><i class="fa fa-reply"></i></a>
        </div>
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
          <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form-megamenu" class="form-horizontal">
            
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
              <label class="col-sm-2 control-label"><?php echo "Categories icon" ?></label>
              <div class="col-sm-10">
                  <table class="display-tb" style="width:100%;">
                    <thead>
                      <tr>
                        <td class="text-center">Categories Id</td>
                        <td class="text-center">Name</td>
                        <td class="text-center">FontAwesomeIcon</td>
                      </tr>
                    </thead>
                    <tbody>
                      <?php foreach ($categories as $cate) { ?>
                        <tr>
                          <td><?php echo $cate['category_id']; ?></td>
                          <td><?php echo $cate['name']; ?></td>
                          <td>
                            <div class="input-group">
                              <input class="awesome-icon input-group form-control icp icp-auto" placeholder="input awesome icon" style="width:100%;" name="awesome[];" <?php if(isset($awesome[$cate['category_id']])){ ?>value="<?php echo $awesome[$cate['category_id']]; ?>" <?php } ?> data-placement="bottomRight" readonly />
                              <span class="input-group-addon"></span>
                            </div>
                          </td>
                        </tr>
                      <?php } ?>
                    </tbody>
                  </table>
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
         <button class="btn btn-default action-create" style="display:none;"></button>
          </form>
          </div>
        </div>       
    </div>
  </div>
  <script type="text/javascript" src="view/javascript/fontawesome-iconpicker.js"></script>
             
  <script>
            $(function() {                
                $('.action-create').on('click', function() {
                    $('.icp-auto').iconpicker();
                    $('.icp-dd').each(function() {
                        var $this = $(this);
                        $this.iconpicker({
                            title: 'Dropdown with picker',
                            container: $(' ~ .dropdown-menu:first', $this)
                        });
                    });
                    $('.icp-glyphs').iconpicker({
                        title: 'Using glypghicons',
                        icons: ['home', 'repeat', 'search',
                            'arrow-left', 'arrow-right', 'star'],
                        iconBaseClass: 'glyphicon',
                        iconComponentBaseClass: 'glyphicon',
                        iconClassPrefix: 'glyphicon-'
                    });
                    $('.icp-opts').iconpicker({
                        title: 'With custom options',
                        icons: ['github', 'heart', 'html5', 'css3'],
                        selectedCustomClass: 'label label-success',
                        mustAccept: true,
                        placement: 'bottomRight',
                        showFooter: true,
                        // note that this is ignored cause we have an accept button:
                        hideOnSelect: true,
                        templates: {
                            footer: '<div class="popover-footer">' +
                                    '<div style="text-align:left; font-size:12px;">Placements: \n\
                    <a href="#" class=" action-placement">inline</a>\n\
                    <a href="#" class=" action-placement">topLeftCorner</a>\n\
                    <a href="#" class=" action-placement">topLeft</a>\n\
                    <a href="#" class=" action-placement">top</a>\n\
                    <a href="#" class=" action-placement">topRight</a>\n\
                    <a href="#" class=" action-placement">topRightCorner</a>\n\
                    <a href="#" class=" action-placement">rightTop</a>\n\
                    <a href="#" class=" action-placement">right</a>\n\
                    <a href="#" class=" action-placement">rightBottom</a>\n\
                    <a href="#" class=" action-placement">bottomRightCorner</a>\n\
                    <a href="#" class=" active action-placement">bottomRight</a>\n\
                    <a href="#" class=" action-placement">bottom</a>\n\
                    <a href="#" class=" action-placement">bottomLeft</a>\n\
                    <a href="#" class=" action-placement">bottomLeftCorner</a>\n\
                    <a href="#" class=" action-placement">leftBottom</a>\n\
                    <a href="#" class=" action-placement">left</a>\n\
                    <a href="#" class=" action-placement">leftTop</a>\n\
                    </div><hr></div>'}
                    }).data('iconpicker').show();
                }).trigger('click');
            });
  </script>

  <?php echo $footer; ?>
<style type="text/css">
  table td{text-align:center;}
</style>
