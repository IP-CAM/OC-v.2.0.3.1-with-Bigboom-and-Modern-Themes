<?php echo $header; ?>
<div class="container">  
  <ul class="breadcrumb">
    <?php foreach ($breadcrumbs as $breadcrumb) { ?>
    <li>
      <a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a>
    </li>
    <?php } ?>
  </ul>
  <div id="content">
    <?php echo $content_top; ?>
    <div class="product-detail">
      <div class="row">
        <div class="col-sm-4 col-xs-6">
            <?php 
            if ($thumb || $images) { ?>
            <ul class="thumbnails">
              <?php 
                if ($thumb) { ?>
                  <li class="main-thumbnail">
                    <a class="thumbnail" href="<?php echo $popup; ?>" title="<?php echo $heading_title; ?>">
                      <img src="<?php echo $thumb; ?>" title="<?php echo $heading_title; ?>" alt="<?php echo $heading_title; ?>" />
                    </a>
                  </li>
                  <?php } ?>             
                  <li class="secondary-thumbnail">
                    <div class="image-add-ypn">
                     <?php 
                      if ($images) { ?>
                        <?php foreach ($images as $image) { ?>
                          <a class="item thumbnail" href="<?php echo $image['popup']; ?>" title="<?php echo $heading_title; ?>">
                            <img src="<?php echo $image['thumb']; ?>" title="<?php echo $heading_title; ?>" alt="<?php echo $heading_title; ?>" />
                          </a>
                            <?php } ?>
                    <?php } ?>
                    </div>
                  </li>              
            </ul>
          <?php } ?>
        </div>
        <div class="col-sm-4 col-xs-6">
          <div class="product-detail-information">
            <h2 class="product-name"><?php echo $heading_title; ?></h2>
            <div class="rating-review">
              <div class="rating">
                <?php for ($i = 1; $i <= 5; $i++) { ?>
                <?php if ($rating < $i) { ?>
                <span class="fa fa-stack"><i class="fa fa-star-o fa-stack-1x"></i></span>
                <?php } else { ?>
                <span class="fa fa-stack"><i class="fa fa-star fa-stack-1x"></i><i class="fa fa-star-o fa-stack-1x"></i></span>
                <?php } ?>
                <?php } ?>
              </div>
               <div class="review">
                 <span>(</span><a href="<?php echo $product_href ?>#apn" onclick="$('a[href=\'#tab-review\']').trigger('click'); return true;"><?php echo $reviews; ?></a> / <a href="<?php echo $product_href ?>#apn" onclick="$('a[href=\'#tab-review\']').trigger('click'); return true;"><?php echo $text_write; ?></a><span>)</span>
               </div>
            </div>
            <div class="product-info">
              <?php if ($price) { ?>
              <div class="product-price-wrapper">
                <ul>
                  <li class="product-price-content">
                    <?php if($special) { ?>
                    <h5 class="product-price new-price"><?php echo $special; ?></h5>
                    <h5 class="product-price old-price"><?php echo $price; ?></h5>
                    <?php } else { ?>
                    <h5 class="product-price new-price"><?php echo $price; ?></h5>
                    <?php } ?>
                  </li>
                  <?php if ($tax) { ?>
                  <li><?php echo $text_tax; ?> <?php echo $tax; ?></li>
                  <?php } ?>
                  <?php if ($points) { ?>
                  <li><?php echo $text_points; ?> <?php echo $points; ?></li>
                  <?php } ?>
                </ul>
              </div>
              <?php if ($discounts) { ?>
              <div class="special-offer">
                <h4>Special offer :</h4>
                <ul>
                  <?php foreach ($discounts as $discount) { ?>
                  <li><?php echo $discount['quantity']; ?><?php echo $text_discount; ?> : <?php echo $discount['price']; ?></li>
                  <?php } ?>
                </ul>
              </div>
              <?php } ?>
              <div class="other-information">
                <h4>Other information :</h4>
                <ul>
                  <?php if ($manufacturer) { ?>
                  <li>
                    <?php echo $text_manufacturer; ?> 
                    <a href="<?php echo $manufacturers; ?>" class="manufacturer"><?php echo $manufacturer; ?></a>
                  </li>
                  <?php } ?>
                  <?php if ($tags) { ?>
                  <li><?php echo $text_tags; ?>
                    <?php for ($i = 0; $i < count($tags); $i++) { ?>
                    <?php if ($i < (count($tags) - 1)) { ?>
                    <a href="<?php echo $tags[$i]['href']; ?>"><?php echo $tags[$i]['tag']; ?></a>,
                    <?php } else { ?>
                    <a href="<?php echo $tags[$i]['href']; ?>"><?php echo $tags[$i]['tag']; ?></a>
                    <?php } ?>
                    <?php } ?>
                  </li>
                  <?php } ?>
                  <li><?php echo $text_model; ?> <span><?php echo $model; ?></span></li>
                  <?php if ($reward) { ?>
                  <li><?php echo $text_reward; ?> <span><?php echo $reward; ?></span></li>
                  <?php } ?>
                  <li><?php echo $text_stock; ?> <span><?php echo $stock; ?></span></li>
                </ul>
              </div>
            </div>
            <hr />
            <div class="btn-group button-action">
              <!--<button type="button" data-toggle="tooltip" class="btn-wishlist btn-link wishlist" title="<?php echo $button_wishlist; ?>" onclick="wishlist.add('<?php echo $product_id; ?>');">
                <i class="fa fa-heart"></i>
              </button>
              <button type="button" data-toggle="tooltip" class="btn-compare btn-link compare " title="<?php echo $button_compare; ?>" onclick="compare.add('<?php echo $product_id; ?>');">
                <i class="fa fa-exchange"></i>
              </button>-->
              <a data-toggle="tooltip" title="<?php echo $button_wishlist; ?>" onclick="wishlist.add('<?php echo $product_id; ?>');">
                <i class="fa fa-heart"></i><span>Add to wishlist</span>
              </a>
              <a data-toggle="tooltip" title="<?php echo $button_compare; ?>" onclick="compare.add('<?php echo $product_id; ?>');">
                <i class="fa fa-exchange"></i><span>Add to compare</span>
              </a>
            </div>
            <?php } ?>
            
            <?php if ($review_status) { ?>
           
              <hr>
              <!-- AddThis Button BEGIN -->
              <div class="addthis_toolbox addthis_default_style"><a class="addthis_button_facebook_like" fb:like:layout="button_count"></a> <a class="addthis_button_tweet"></a> <a class="addthis_button_pinterest_pinit"></a> <a class="addthis_counter addthis_pill_style"></a></div>
              <script type="text/javascript" src="//s7.addthis.com/js/300/addthis_widget.js#pubid=ra-515eeaf54693130e"></script>
              <!-- AddThis Button END -->
            <?php } ?>
          </div>
        </div>
        <div class="col-sm-4 pull-left">
          <div id="product">
            <div class="box-add-to-cart">
              <div class="quantity-text">
                <p>To buy, select <span>Quantity</span></p>
                <p>Choose from options to the Down here.</p>
              </div>
              <div class="quantity-wrapper">
                <label class="control-label" for="input-quantity"><strong><?php echo $entry_qty; ?> : </strong></label>
                <div class="quantity">
                  <input type="text" name="quantity" value="<?php echo $minimum; ?>" size="2" id="input-quantity" class="form-control" />
                  <div class="arrow">
                    <button id="btn-up" class="btn-control" type="button"><i class="fa fa-angle-up"></i></button>
                    <button id="btn-down" class="btn-control" type="button"><i class="fa fa-angle-down"></i></button>
                  </div>
                </div>
                <input type="hidden" name="product_id" value="<?php echo $product_id; ?>" />
              </div>
              <?php if ($minimum > 1) { ?>
              <div class="alert"><i class="fa fa-info-circle"></i> <?php echo $text_minimum; ?></div>
              <?php } ?>
              <button type="button" id="button-cart" data-loading-text="<?php echo $text_loading; ?>" class="btn btn-primary btn-lg btn-block"><?php echo $button_cart; ?></button>
            </div>
            <?php if ($options) { ?>
            <!--<h3 class="title"><?php echo $text_option; ?></h3>-->
            <div class="form-group-wrapper">
              <?php foreach ($options as $option) { ?>
              <?php if ($option['type'] == 'select') { ?>
              <div class="form-group<?php echo ($option['required'] ? ' required' : ''); ?>">
                <label class="control-label" for="input-option<?php echo $option['product_option_id']; ?>"><?php echo $option['name']; ?></label>
                <select name="option[<?php echo $option['product_option_id']; ?>]" id="input-option<?php echo $option['product_option_id']; ?>" class="form-control">
                  <option value=""><?php echo $text_select; ?></option>
                  <?php foreach ($option['product_option_value'] as $option_value) { ?>
                  <option value="<?php echo $option_value['product_option_value_id']; ?>"><?php echo $option_value['name']; ?>
                  <?php if ($option_value['price']) { ?>
                  (<?php echo $option_value['price_prefix']; ?><?php echo $option_value['price']; ?>)
                  <?php } ?>
                  </option>
                  <?php } ?>
                </select>
              </div>
              <?php } ?>
              <?php if ($option['type'] == 'radio') { ?>
              <div class="form-group<?php echo ($option['required'] ? ' required' : ''); ?>">
                <label class="control-label"><?php echo $option['name']; ?></label>
                <div id="input-option<?php echo $option['product_option_id']; ?>">
                  <?php foreach ($option['product_option_value'] as $option_value) { ?>
                  <div class="radio">
                    <label>
                      <input type="radio" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option_value['product_option_value_id']; ?>" />
                      <?php echo $option_value['name']; ?>
                      <?php if ($option_value['price']) { ?>
                      (<?php echo $option_value['price_prefix']; ?><?php echo $option_value['price']; ?>)
                      <?php } ?>
                    </label>
                  </div>
                  <?php } ?>
                </div>
              </div>
              <?php } ?>
              <?php if ($option['type'] == 'checkbox') { ?>
              <div class="form-group<?php echo ($option['required'] ? ' required' : ''); ?>">
                <label class="control-label"><?php echo $option['name']; ?></label>
                <div id="input-option<?php echo $option['product_option_id']; ?>">
                  <?php foreach ($option['product_option_value'] as $option_value) { ?>
                  <div class="checkbox">
                    <label>
                      <input type="checkbox" name="option[<?php echo $option['product_option_id']; ?>][]" value="<?php echo $option_value['product_option_value_id']; ?>" />
                      <?php echo $option_value['name']; ?>
                      <?php if ($option_value['price']) { ?>
                      (<?php echo $option_value['price_prefix']; ?><?php echo $option_value['price']; ?>)
                      <?php } ?>
                    </label>
                  </div>
                  <?php } ?>
                </div>
              </div>
              <?php } ?>
              <?php if ($option['type'] == 'image') { ?>
              <div class="form-group<?php echo ($option['required'] ? ' required' : ''); ?>">
                <label class="control-label"><?php echo $option['name']; ?></label>
                <div id="input-option<?php echo $option['product_option_id']; ?>">
                  <?php foreach ($option['product_option_value'] as $option_value) { ?>
                  <div class="radio">
                    <label>
                      <input type="radio" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option_value['product_option_value_id']; ?>" />
                      <img src="<?php echo $option_value['image']; ?>" alt="<?php echo $option_value['name'] . ($option_value['price'] ? ' ' . $option_value['price_prefix'] . $option_value['price'] : ''); ?>" class="img-thumbnail" /> <?php echo $option_value['name']; ?>
                      <?php if ($option_value['price']) { ?>
                      (<?php echo $option_value['price_prefix']; ?><?php echo $option_value['price']; ?>)
                      <?php } ?>
                    </label>
                  </div>
                  <?php } ?>
                </div>
              </div>
              <?php } ?>
              <?php if ($option['type'] == 'text') { ?>
              <div class="form-group<?php echo ($option['required'] ? ' required' : ''); ?>">
                <label class="control-label" for="input-option<?php echo $option['product_option_id']; ?>"><?php echo $option['name']; ?></label>
                <input type="text" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option['value']; ?>" placeholder="<?php echo $option['name']; ?>" id="input-option<?php echo $option['product_option_id']; ?>" class="form-control" />
              </div>
              <?php } ?>
              <?php if ($option['type'] == 'textarea') { ?>
              <div class="form-group<?php echo ($option['required'] ? ' required' : ''); ?>">
                <label class="control-label" for="input-option<?php echo $option['product_option_id']; ?>"><?php echo $option['name']; ?></label>
                <textarea name="option[<?php echo $option['product_option_id']; ?>]" rows="5" placeholder="<?php echo $option['name']; ?>" id="input-option<?php echo $option['product_option_id']; ?>" class="form-control"><?php echo $option['value']; ?></textarea>
              </div>
              <?php } ?>
              <?php if ($option['type'] == 'file') { ?>
              <div class="form-group<?php echo ($option['required'] ? ' required' : ''); ?>">
                <label class="control-label"><?php echo $option['name']; ?></label>
                <button type="button" id="button-upload<?php echo $option['product_option_id']; ?>" data-loading-text="<?php echo $text_loading; ?>" class="btn btn-default btn-block"><i class="fa fa-upload"></i> <?php echo $button_upload; ?></button>
                <input type="hidden" name="option[<?php echo $option['product_option_id']; ?>]" value="" id="input-option<?php echo $option['product_option_id']; ?>" />
              </div>
              <?php } ?>
              <?php if ($option['type'] == 'date') { ?>
              <div class="form-group<?php echo ($option['required'] ? ' required' : ''); ?>">
                <label class="control-label" for="input-option<?php echo $option['product_option_id']; ?>"><?php echo $option['name']; ?></label>
                <div class="input-group date">
                  <input type="text" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option['value']; ?>" data-date-format="YYYY-MM-DD" id="input-option<?php echo $option['product_option_id']; ?>" class="form-control" />
                  <span class="input-group-btn">
                  <button class="btn btn-default" type="button"><i class="fa fa-calendar"></i></button>
                  </span></div>
              </div>
              <?php } ?>
              <?php if ($option['type'] == 'datetime') { ?>
              <div class="form-group<?php echo ($option['required'] ? ' required' : ''); ?>">
                <label class="control-label" for="input-option<?php echo $option['product_option_id']; ?>"><?php echo $option['name']; ?></label>
                <div class="input-group datetime">
                  <input type="text" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option['value']; ?>" data-date-format="YYYY-MM-DD HH:mm" id="input-option<?php echo $option['product_option_id']; ?>" class="form-control" />
                  <span class="input-group-btn">
                  <button type="button" class="btn btn-default"><i class="fa fa-calendar"></i></button>
                  </span></div>
              </div>
              <?php } ?>
              <?php if ($option['type'] == 'time') { ?>
              <div class="form-group<?php echo ($option['required'] ? ' required' : ''); ?>">
                <label class="control-label" for="input-option<?php echo $option['product_option_id']; ?>"><?php echo $option['name']; ?></label>
                <div class="input-group time">
                  <input type="text" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option['value']; ?>" data-date-format="HH:mm" id="input-option<?php echo $option['product_option_id']; ?>" class="form-control" />
                  <span class="input-group-btn">
                  <button type="button" class="btn btn-default"><i class="fa fa-calendar"></i></button>
                  </span></div>
              </div>
              <?php } ?>
              <?php } ?>
              <?php if ($recurrings) { ?>
              <hr>
              <h3><?php echo $text_payment_recurring ?></h3>
              <div class="form-group required">
                <select name="recurring_id" class="form-control">
                  <option value=""><?php echo $text_select; ?></option>
                  <?php foreach ($recurrings as $recurring) { ?>
                  <option value="<?php echo $recurring['recurring_id'] ?>"><?php echo $recurring['name'] ?></option>
                  <?php } ?>
                </select>
                <div class="help-block" id="recurring-description"></div>
              </div>
              <?php } ?>
              </div>
              <?php } ?>
            
          </div>
        </div>
      </div>
      <!--description-->
      <div class="product-detail-description" id="apn">
        <ul class="nav nav-tabs">
          <li class="active">
            <a href="#tab-description" data-toggle="tab"><?php echo $tab_description; ?></a>
          </li>
          <?php if ($attribute_groups) { ?>
            <li>
              <a href="#tab-specification" data-toggle="tab"><?php echo $tab_attribute; ?></a>
            </li>
          <?php } ?>
          <?php if ($review_status) { ?>
            <li>
              <a href="#tab-review" data-toggle="tab"><?php echo $tab_review; ?></a>
            </li>
          <?php } ?>
        </ul>
        <div class="tab-content">
          <div class="tab-pane active" id="tab-description">
            <?php echo $description; ?>
          </div>
          <?php if ($attribute_groups) { ?>
          <div class="tab-pane" id="tab-specification">
            <table class="table table-bordered">
              <?php foreach ($attribute_groups as $attribute_group) { ?>
              <thead>
                <tr>
                  <td colspan="2"><strong><?php echo $attribute_group['name']; ?></strong></td>
                </tr>
              </thead>
              <tbody>
                <?php foreach ($attribute_group['attribute'] as $attribute) { ?>
                <tr>
                  <td><?php echo $attribute['name']; ?></td>
                  <td><?php echo $attribute['text']; ?></td>
                </tr>
                <?php } ?>
              </tbody>
              <?php } ?>
            </table>
          </div>
          <?php } ?>
          <?php if ($review_status) { ?>
          <div class="tab-pane" id="tab-review">
            <form class="form-horizontal" id="form-review">
              <div id="review"></div>
              <h2><?php echo $text_write; ?></h2>
              <?php if ($review_guest) { ?>
              <div class="form-group required">
                <div class="col-sm-12">
                  <label class="control-label" for="input-name"><?php echo $entry_name; ?></label>
                  <input type="text" name="name" value="" id="input-name" class="form-control" />
                </div>
              </div>
              <div class="form-group required">
                <div class="col-sm-12">
                  <label class="control-label" for="input-review"><?php echo $entry_review; ?></label>
                  <textarea name="text" rows="5" id="input-review" class="form-control"></textarea>
                  <div class="help-block"><?php echo $text_note; ?></div>
                </div>
              </div>
              <div class="form-group required">
                <div class="col-sm-12">
                  <label class="control-label"><?php echo $entry_rating; ?></label>
                  &nbsp;&nbsp;&nbsp; <?php echo $entry_bad; ?>&nbsp;
                  <input type="radio" name="rating" value="1" />
                  &nbsp;
                  <input type="radio" name="rating" value="2" />
                  &nbsp;
                  <input type="radio" name="rating" value="3" />
                  &nbsp;
                  <input type="radio" name="rating" value="4" />
                  &nbsp;
                  <input type="radio" name="rating" value="5" />
                  &nbsp;<?php echo $entry_good; ?></div>
              </div>
              <?php if ($site_key) { ?>
                <div class="form-group">
                  <div class="col-sm-12">
                    <div class="g-recaptcha" data-sitekey="<?php echo $site_key; ?>"></div>
                  </div>
                </div>
              <?php } ?>
              <div class="buttons clearfix">
                  <button type="button" id="button-review" data-loading-text="<?php echo $text_loading; ?>" class="btn btn-primary"><?php echo $button_continue; ?></button>
              </div>
              <?php } else { ?>
              <?php echo $text_login; ?>
              <?php } ?>
            </form>
          </div>
          <?php } ?>
        </div>
      </div><!--end description-->
    </div>
    <?php if ($products) { ?>
    <div class="relate-product">
      <h3 class="heading-title heading-slide-title"><?php echo $text_related; ?></h3>
      <div class="relate-carousel">   
        <?php foreach ($products as $product) { ?>
         <div class="product-grid">
           <div class="product-thumb">
             <div class="product-image-box">
               <a href="<?php echo $product['href']; ?>" class="product-image-link" ></a>
               <img class="product-image product-image-1 img-responsive" src="<?php echo $product['thumb']; ?>">
               <img class="product-image product-image-2 img-responsive" src="<?php echo $product['thumb1']; ?>">
               <div class="button-action">             
                   <span style="display:inline-block;" data-toggle="tooltip" title="<?php echo $button_quickview; ?>">
                     <a class="btn-quickview btn-link quickview" data-toggle="modal" data-target="#product-quickview" data-productinfo='<?php echo $prod_quick_view; ?>'>
                     <i class="fa fa-search"><?php echo $button_quickview; ?></i>
                     </a>
                   </span>               
                   <a class="btn-wishlist btn-link wishlist" data-toggle="tooltip" title="<?php echo $button_wishlist; ?>" onclick="wishlist.add('<?php echo $product['product_id']; ?>');">
                     <i class="fa fa-heart"><?php echo $button_wishlist ?></i>
                   </a>
                   <a data-toggle="tooltip" title="<?php echo $button_compare; ?>" class="btn-compare btn-link compare" onclick="compare.add('<?php echo $product['product_id']; ?>');"> 
                   <i class="fa fa-exchange"><?php echo $button_compare; ?></i>      
                   </a>      
               </div>
             </div>
             <div class="product-info">
               <h3 class="product-name"><a href="#"><?php echo $product['name']; ?></a></h3>
                <?php if ($product['rating']) { ?>
                     <div class="rating">
                     <?php for ($i = 1; $i <= 5; $i++) { ?>
                     <?php if ($product['rating'] < $i) { ?>
                     <span class="fa fa-stack"><i class="fa fa-star fa-stack-2x" style="color:#999;"></i></span>
                     <?php } else { ?>
                     <span class="fa fa-stack"><i class="fa fa-star fa-stack-2x"></i><i class="fa fa-star fa-stack-2x" tyle="color:#999;"></i></span>
                     <?php } ?>
                     <?php } ?>
                   </div>
                   <?php } else {?> <div class="rating">
                     <?php for ($i=0; $i <5 ; $i++) { ?>
                         <span class="fa fa-stack"><i class="fa fa-star fa-stack-2x" style="color:#999;"></i></span>
                     <?php } ?></div><?php } ?>
               <div class="product-price-content">
                 <?php if($product['special']) { ?>
                 <h5 class="product-price old-price"><?php echo $product['price']; ?></h5>
                 <h5 class="product-price new-price"><?php echo $product['special']; ?></h5>
                 <?php } else { ?>
                 <h5 class="product-price new-price"><?php echo $product['price']; ?></h5>
                 <?php } ?>
               </div>
               <div class="add-to-cart-content">
               <button type="button" class="add-to-cart-button" onclick="cart.add('<?php echo $product['product_id']; ?>');"><?php echo $button_cart; ?></button>
               </div>
             </div>
           </div>
         </div>
        <?php } ?>
        </div>  
      <?php } ?>
    </div>
    <?php echo $content_bottom; ?>
  </div>
</div>
<?php echo $footer; ?>
<script type="text/javascript">
      $('#btn-up').click(function(){
        var curent =parseInt($('#input-quantity').val());
        $('#input-quantity').val(curent+1);
      });
      $('#btn-down').click(function(){
         var curent =parseInt($('#input-quantity').val());
         if(curent>0){
            $('#input-quantity').val(curent-1);   
         }
      });
  </script>
<script type="text/javascript"><!--
  $('select[name=\'recurring_id\'], input[name="quantity"]').change(function(){
    $.ajax({
      url: 'index.php?route=product/product/getRecurringDescription',
      type: 'post',
      data: $('input[name=\'product_id\'], input[name=\'quantity\'], select[name=\'recurring_id\']'),
      dataType: 'json',
      beforeSend: function() {
        $('#recurring-description').html('');
      },
      success: function(json) {
        $('.alert, .text-danger').remove();

        if (json['success']) {
          $('#recurring-description').html(json['success']);
        }
      }
    });
  });
//--></script>
<script type="text/javascript"><!--
$('#button-cart').on('click', function() {
  $.ajax({
    url: 'index.php?route=checkout/cart/add',
    type: 'post',
    data: $('#product input[type=\'text\'], #product input[type=\'hidden\'], #product input[type=\'radio\']:checked, #product input[type=\'checkbox\']:checked, #product select, #product textarea'),
    dataType: 'json',
    beforeSend: function() {
      $('#button-cart').button('loading');
    },
    complete: function() {
      $('#button-cart').button('reset');
    },
    success: function(json) {
      $('.alert, .text-danger').remove();
      $('.form-group').removeClass('has-error');

      if (json['error']) {
        if (json['error']['option']) {
          for (i in json['error']['option']) {
            var element = $('#input-option' + i.replace('_', '-'));

            if (element.parent().hasClass('input-group')) {
              element.parent().after('<div class="text-danger">' + json['error']['option'][i] + '</div>');
            } else {
              element.after('<div class="text-danger">' + json['error']['option'][i] + '</div>');
            }
          }
        }

        if (json['error']['recurring']) {
          $('select[name=\'recurring_id\']').after('<div class="text-danger">' + json['error']['recurring'] + '</div>');
        }

        // Highlight any found errors
        $('.text-danger').parent().addClass('has-error');
      }

      if (json['success']) {
        $('.breadcrumb').after('<div class="alert alert-success">' + json['success'] + '<button type="button" class="close" data-dismiss="alert">&times;</button></div>');

        $('#cart > button').html('<i class="fa fa-shopping-cart"></i><span id="cart-total">' + json['total']);

        $('html, body').animate({ scrollTop: 0 }, 'slow');

        $('#cart > ul').load('index.php?route=common/cart/info ul li');
      }
    }
  });
});
//--></script>
<script type="text/javascript"><!--
  $('.date').datetimepicker({
    pickTime: false
  });

  $('.datetime').datetimepicker({
    pickDate: true,
    pickTime: true
  });

  $('.time').datetimepicker({
    pickDate: false
  });

  $('button[id^=\'button-upload\']').on('click', function() {
    var node = this;

    $('#form-upload').remove();

    $('body').prepend('<form enctype="multipart/form-data" id="form-upload" style="display: none;"><input type="file" name="file" /></form>');

    $('#form-upload input[name=\'file\']').trigger('click');

    if (typeof timer != 'undefined') {
        clearInterval(timer);
    }

    timer = setInterval(function() {
      if ($('#form-upload input[name=\'file\']').val() != '') {
        clearInterval(timer);

        $.ajax({
          url: 'index.php?route=tool/upload',
          type: 'post',
          dataType: 'json',
          data: new FormData($('#form-upload')[0]),
          cache: false,
          contentType: false,
          processData: false,
          beforeSend: function() {
            $(node).button('loading');
          },
          complete: function() {
            $(node).button('reset');
          },
          success: function(json) {
            $('.text-danger').remove();

            if (json['error']) {
              $(node).parent().find('input').after('<div class="text-danger">' + json['error'] + '</div>');
            }

            if (json['success']) {
              alert(json['success']);

              $(node).parent().find('input').attr('value', json['code']);
            }
          },
          error: function(xhr, ajaxOptions, thrownError) {
            alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
          }
        });
      }
    }, 500);
  });
//--></script>
<script type="text/javascript"><!--
  $('#review').delegate('.pagination a', 'click', function(e) {
    e.preventDefault();

      $('#review').fadeOut('slow');

      $('#review').load(this.href);

      $('#review').fadeIn('slow');
  });

  $('#review').load('index.php?route=product/product/review&product_id=<?php echo $product_id; ?>');

  $('#button-review').on('click', function() {
    $.ajax({
      url: 'index.php?route=product/product/write&product_id=<?php echo $product_id; ?>',
      type: 'post',
      dataType: 'json',
      data: $("#form-review").serialize(),
      beforeSend: function() {
        $('#button-review').button('loading');
      },
      complete: function() {
        $('#button-review').button('reset');
      },
      success: function(json) {
        $('.alert-success, .alert-danger').remove();

        if (json['error']) {
          $('#review').after('<div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> ' + json['error'] + '</div>');
        }

        if (json['success']) {
          $('#review').after('<div class="alert alert-success"><i class="fa fa-check-circle"></i> ' + json['success'] + '</div>');

          $('input[name=\'name\']').val('');
          $('textarea[name=\'text\']').val('');
          $('input[name=\'rating\']:checked').prop('checked', false);
        }
      }
    });
  });

  $(document).ready(function() {
    $('.thumbnails').magnificPopup({
      type:'image',
      delegate: 'a',
      gallery: {
        enabled:true
      }
    });
  });
//--></script>
<script type="text/javascript">
$('.relate-carousel').owlCarousel({
    loop:true,
    margin:30,
    nav:true,  
    mouseDrag:false,     
    responsive:{
        0:{
            items:1
        },
        480:{
            items:2
        },
        640:{
            items:3
        },
        768:{
            items:3
        },
        1000:{
            items:4
        }
    }
});  
</script>
<script type="text/javascript">
$('.image-add-ypn').owlCarousel({
    loop:true,
    margin:15,
    nav:true,  
    mouseDrag:false,     
    responsive:{
        0:{
            items:1
        },
        480:{
            items:2
        },       
        1000:{
            items:4
        }
    }
});  
</script>