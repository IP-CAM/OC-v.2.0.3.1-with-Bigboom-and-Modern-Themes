<?php echo $header; ?><?php echo $column_left; ?>
<div id="content">
  <div class="page-header">
    <div class="container-fluid">
      <div class="pull-right">
        <button type="submit" form="form-featured" data-toggle="tooltip" title="<?php echo $button_save; ?>" class="btn btn-primary"><i class="fa fa-save"></i></button>
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
        <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form-featured" class="form-horizontal">
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
            <label class="col-sm-2 control-label" for="input-title"><?php echo $entry_title; ?></label>
            <div class="col-sm-10">
              <input type="text" name="title" value="<?php echo $title; ?>" placeholder="<?php echo $entry_title; ?>" id="input-name" class="form-control" />
              <?php if ($error_title) { ?>
              <div class="text-danger"><?php echo $error_title; ?></div>
              <?php } ?>
            </div>
          </div>          
           <div class="form-group">
            <label class="col-sm-2 control-label" for="input-categories"><?php echo "Product display"; ?></label>                 
            <div class="col-sm-2 group-choose">
            <?php  if(($cate_products=="featured")||($cate_products=="ypn")) {?>
                <input type="radio" name="products" value="featured" checked="checked">All Products
                <?php } else { ?><input type="radio" name="products" value="featured">All Products<?php } ?>
                <div class="choose-element product-featured" >
                    <div class="panel-body" style="overflow:auto;height:100%;width:100%;">    
                        <div class="table-responsive">
                          <table class="table table-bordered table-hover" id="display-by-featured">
                            <thead>
                              <tr>
                                <td style="width: 1px;" class="text-center"><input type="checkbox" onclick="$('#display-by-featured').find('input[name*=\'selected\']').prop('checked', this.checked);" /></td>
                                <td class="text-center"><?php echo $column_image; ?></td>
                                <td class="text-left"><?php if ($sort == 'pd.name') { ?>
                                  <h5 class="<?php echo strtolower($order); ?>"><?php echo $column_name; ?></h5>
                                  <?php } else { ?>
                                  <h5><?php echo $column_name; ?><h5>
                                  <?php } ?></td>                                      
                              </tr>
                            </thead>
                            <tbody>
                              <?php if ($products) { ?>
                              <?php foreach ($products as $product) { ?>
                              <tr>
                                <td class="text-center">
                                  <?php if(!empty($product_selected)&&in_array($product['product_id'],$product_selected)) { ?>
                                  <input type="checkbox" name="selected[]" value="<?php echo $product['product_id']; ?>" checked="checked"/>             
                                  <?php } else { ?>
                                      <input type="checkbox" name="selected[]" value="<?php echo $product['product_id']; ?>"/>             
                                  <?php } ?>
                                </td>
                                <td class="text-center"><?php if ($product['image']) { ?>
                                  <img src="<?php echo $product['image']; ?>" alt="<?php echo $product['name']; ?>" class="img-thumbnail" />
                                  <?php } else { ?>
                                  <span class="img-thumbnail list"><i class="fa fa-camera fa-2x"></i></span>
                                  <?php } ?></td>
                                <td class="text-left"><?php echo $product['name']; ?></td>             
                              </tr>
                              <?php } ?>
                              <?php } else { ?>
                              <tr>
                                <td class="text-center" colspan="8"><?php echo $text_no_results; ?></td>
                              </tr>
                              <?php } ?>
                            </tbody>
                          </table>
                        </div>                      
                      <div class="row">                      
                      </div>
                    </div>
                </div>       
            </div>
            <div class="col-sm-3 group-choose">
              <?php if($cate_products=="category") { ?>
                <input type="radio" name="products" value="category" checked="checked">Categories
                <?php } else {?><input type="radio" name="products" value="category">Categories<?php } ?>
                <div class="choose-element">
                  <select name="categories" class="form-control list-choose" id="product_by_cate">
                      <?php  foreach ($category_id as $ctid) { ?>
                        <option value="<?php echo $ctid['category_id']; ?>"
                        <?php if($category_sl==$ctid['category_id']){echo "selected";} ?>> 
                        <?php echo $ctid['name']; ?>
                        </option>
                      <?php }?>
                  </select>
                  <div>                      
                    <table class="display-tb" id="display-by-cate">
                      <thead>
                        <tr>
                          <td style="width: 1px;" class="text-center"><input type="checkbox" onclick="$('#display-by-cate').find('input[name*=\'selected\']').prop('checked', this.checked);" /></td>
                          <td class="text-center" style="font-weight:700;"><?php echo $column_image; ?></td>
                          <td class="text-left"><?php if ($sort == 'pd.name') { ?>
                            <h5 class="<?php echo strtolower($order); ?>"><?php echo $column_name; ?></h5>
                            <?php } else { ?>
                            <h5><?php echo $column_name; ?><h5>
                            <?php } ?></td>  
                        </tr>      
                      </thead>                     
                        <tbody> 
                         <?php if(!empty($product_by_cate)) {foreach ($product_by_cate as $pbc) { ?> 
                          <tr>                                                  
                            <td class="left-col">
                              <?php if(!empty($product_selected)&&in_array($pbc['product_id'],$product_selected)) {?>  
                            <input type="checkbox" name="selected[]" value="<?php echo $pbc['product_id']; ?>" checked="checked"/>
                              <?php } else { ?>
                              <input type="checkbox" name="selected[]" value="<?php echo $pbc['product_id']; ?>"/>
                              <?php } ?>
                            </td>                            
                            <td class="center-col"><img src="<?php echo $pbc['image']; ?>" class="img-thumbnail"></td>
                            <td class="right-col"><?php echo $pbc['name']; ?></td>
                          </tr>
                           <?php }} ?> 
                      </tbody> 
                    </table>
                  </div>
                </div>
            </div>
            <div class="col-sm-3 group-choose">
            <?php if($cate_products=="products-tab") {?>            
                <input type="radio" name="products" value="products-tab" checked="checked">Product tabs
                <?php } else { ?><input type="radio" name="products" value="products-tab">Product tabs <?php } ?>
                 <div class="choose-element">
                  <select name="select-product" class="form-control list-choose" id="select-protab">
                      <?php  foreach ($selected_products as $key=>$sl_pr) { if($tab_select==$key) { ?>
                        <option value="<?php echo $key;  ?>"  selected="selected"><?php echo $sl_pr; ?></option>
                      <?php }else{ ?>
                        <option value="<?php echo $key;  ?>"><?php echo $sl_pr; ?></option>
                       <?php }}?>
                  </select>
                  <table class="display-tb" id="display-by-productab">
                    <thead>
                          <tr>
                            <td style="width: 1px;" class="text-center"><input type="checkbox" onclick="$('#display-by-productab').find('input[name*=\'selected\']').prop('checked', this.checked);" /></td>
                            <td class="text-center" style="font-weight:700;"><?php echo $column_image; ?></td>
                            <td class="text-left"><?php if ($sort == 'pd.name') { ?>
                              <h5 class="<?php echo strtolower($order); ?>"><?php echo $column_name; ?></h5>
                              <?php } else { ?>
                              <h5><?php echo $column_name; ?><h5>
                              <?php } ?></td>  
                          </tr>      
                      </thead>
                      <tbody>   
                      <?php if(!empty($product_by_tab)){ foreach ($product_by_tab as $pbt) {                       
                      ?>   
                          <tr>                          
                            <td class="left-col">
                            <?php if(!empty($product_selected)&&in_array($pbt['product_id'],$product_selected)) { ?>
                            <input type="checkbox" value="<?php echo $pbt['product_id']; ?>" name="selected[]" checked="checked"/>
                            <?php } else{ ?>
                            <input type="checkbox" value="<?php echo $pbt['product_id']; ?>" name="selected[]"/>
                            <?php } ?>
                            </td>
                            <td class="center-col"><img src="<?php echo $pbt['image']; ?>" class="img-thumbnail"></td>
                            <td class="right-col"><?php echo $pbt['name']; ?></td>
                          </tr>
                      <?php }} ?>
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
            <label class="col-sm-2 control-label" for="input-style"><?php echo $text_style; ?></label>
            <div class="col-sm-10">
              <select name="style" id="input-style" class="form-control">
                <?php if ($style==1) { ?>
                <option value="1" selected="selected"><?php echo $text_grid; ?></option>
                <option value="0"><?php echo $text_slider; ?></option>
                <option value="2"><?php echo $text_other; ?></option>
                <?php } elseif($style==0) { ?>
                <option value="1"><?php echo $text_grid; ?></option>
                <option value="0" selected="selected"><?php echo $text_slider; ?></option>
                <option value="2"><?php echo $text_other; ?></option>
                <?php } else{?>
                 <option value="1"><?php echo $text_grid; ?></option>
                <option value="0"><?php echo $text_slider; ?></option>
                <option value="2" selected="selected"><?php echo $text_other; ?></option>
                <?php } ?>
              </select>
            </div>             
          </div>          
          <div class="form-group row-slider">
            <label class="col-sm-2 control-label" for="input-row"><?php echo $entry_row; ?></label>
            <div class="col-sm-2">
              <input type="text" name="row" value="<?php echo $row; ?>" placeholder="<?php echo $entry_row; ?>" id="input-row" class="form-control" />
              <?php if ($error_row) { ?>
              <div class="text-danger"><?php echo $error_row; ?></div>
              <?php } ?>
            </div> 
             <label class="col-sm-2 control-label" for="input-row"><?php echo "Items"; ?></label>
              <div class="col-sm-1">
              <input type="text" name="item" value="<?php echo $item; ?>" placeholder="<?php echo $item; ?>" id="input-item" class="form-control" />
              <?php if ($error_item) { ?>
              <div class="text-danger"><?php echo $error_item; ?></div>
              <?php } ?>
            </div>
            <label class="col-sm-2 control-label" for="input-margin"><?php echo "Items margin" ?></label>
            <div class="col-sm-1">
                <input type="text" name="margin" value="<?php echo $margin; ?>" placeholder="<?php echo $margin; ?>" class="form-control"/>
            </div>            

             <label class="col-sm-1 control-label" for="carousel-content" style="text-align:right"><?php echo "Uncarousel" ?></label>
            <div class="col-sm-1">            
              <input type="hidden"  name="uncarousel" value="no"> 
              <input type="checkbox" name="uncarousel" value="yes" id="id-carousel" data-stcheck="<?php echo $stcarousel; ?>" style="margin-top:9px;">
            </div>         
          </div>    
          <div class="form-group row-slider">           
            <label class="col-sm-2 control-label"  for="input-480px"><?php echo "480px"; ?></label>
            <div class="col-sm-2">
                <input type="text" name="resp480" value="<?php echo $resp480; ?>" placeholder="<?php echo $resp480; ?>" class="form-control"/>
            </div>
            <label class="col-sm-2 control-label" for="input-640"><?php echo "640px"; ?></label>
            <div class="col-sm-2">
                <input type="text" name="resp640" value="<?php echo $resp640; ?>" placeholder="<?php echo $resp640; ?>" class="form-control"/>
            </div>
             <label class="col-sm-2 control-label" for="input-0px"><?php echo "768px"; ?></label>
            <div class="col-sm-2">
                <input type="text" name="resp0" value="<?php echo $resp0 ;?>" placeholder="<?php echo $resp0; ?>" class="form-control"/>
            </div>
          </div>             
          <div class="form-group">
            <label class="col-sm-2 control-label" for="input-limit"><?php echo $entry_limit; ?></label>
            <div class="col-sm-10">
              <input type="text" name="limit" value="<?php echo $limit; ?>" placeholder="<?php echo $entry_limit; ?>" id="input-limit" class="form-control" />
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
  <script type="text/javascript"><!--
  $(document).ready(function(){  
  var product_selected = <?php echo json_encode($product_selected); ?>;  
    $('#product_by_cate').change(function(){
    $('#display-by-cate').find($('tbody')).empty();
    var url="<?php  echo html_entity_decode($action_demo); ?>";
    $.ajax({
      method:"POST",
      url:url,
      data:{category_id:$(this).val()} 

    }).done(function(msg){
      var rs=jQuery.parseJSON(msg);  
      var i;
      for(i=0;i<rs.length;i++){
      if($.inArray(rs[i].product_id,product_selected)==-1) 
      {
         $('#display-by-cate').find($('tbody')).append('<tr><td class="left-col">'+'<input type="checkbox" name="selected[]" value="'+rs[i].product_id+'" />'+'</td><td class="center-col"><img class="img-thumbnail" src="'+rs[i].image+'"></td><td class="right-col">'+rs[i].name+'</td></tr>');
       }
       else{
         $('#display-by-cate').find($('tbody')).append('<tr><td class="left-col">'+'<input type="checkbox" name="selected[]" value="'+rs[i].product_id+'" checked="checked"/>'+'</td><td class="center-col"><img class="img-thumbnail" src="'+rs[i].image+'"></td><td class="right-col">'+rs[i].name+'</td></tr>');
       }
      }      
    });
 });
  });
    if(($('#id-carousel').data("stcheck"))=="yes")
    {
    $('#id-carousel').prop("checked",true);
    }
    else{$('#id-carousel').prop("checked",false);}
    //-->
     var product_selected = <?php echo json_encode($product_selected); ?>;  
    $('#select-protab').change(function(){
      $('#display-by-productab').find($('tbody')).empty();
        $.ajax({  
          method:"POST",
          url:'index.php?route=bigbom/ajax_category/getProductab&token=<?php echo $token; ?>',
          data:{productab_id:$(this).val()}
        }).done(function(msg){
          var rs_tab=jQuery.parseJSON(msg);  
          var j;
          for(j=0;j<rs_tab.length;j++){
          if($.inArray(rs_tab[j].product_id,product_selected)==-1) 
          {
             $('#display-by-productab').find($('tbody')).append('<tr><td class="left-col">'+'<input type="checkbox" name="selected[]" value="'+rs_tab[j].product_id+'" />'+'</td><td class="center-col"><img class="img-thumbnail" src="'+rs_tab[j].image+'"></td><td class="right-col">'+rs_tab[j].name+'</td></tr>');
           }
           else{
             $('#display-by-productab').find($('tbody')).append('<tr><td class="left-col">'+'<input type="checkbox" name="selected[]" value="'+rs_tab[j].product_id+'" checked="checked"/>'+'</td><td class="center-col"><img class="img-thumbnail" src="'+rs_tab[j].image+'"></td><td class="right-col">'+rs_tab[j].name+'</td></tr>');
           }
          }     
        });
  });
  </script>
</div>
<?php echo $footer; ?>
</script>
<style type="text/css">
  .display-tb{border:1px solid #ddd;width:900px;margin-left:-196px;}
  .display-tb td{border:1px solid #ddd;}
  .center-col{width:50%;text-align:center;}
  .product-featured{height:500px;width:946px;border: 1px solid #efefef;}
  .choose-element{display: none;}
  #product_by_cate{border-radius: 0;margin-left: 441px;border-bottom: 0;}
  #select-protab{border-radius: 0;margin-left: 149px;border-bottom: 0;}
  .display-tb td{padding: 8px;}
  #display-by-productab{margin-left:-489px;}
</style> 
</div>
