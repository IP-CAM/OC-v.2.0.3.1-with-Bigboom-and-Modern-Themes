<?php echo $header; ?>
<div class="container">
  <ul class="breadcrumb">
    <?php foreach ($breadcrumbs as $breadcrumb) { ?>
    <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
    <?php } ?>
  </ul>
  <div class="row"><?php echo $column_left; ?>
    <?php if ($column_left && $column_right) { ?>
    <?php $class = 'col-sm-6'; $grid_layout='col-lg-6 col-md-6 col-sm-12 col-xs-12'; ?>
    <?php } elseif ($column_left || $column_right) { ?>
    <?php $class = 'col-sm-9'; $grid_layout='col-lg-4 col-md-4 col-sm-6 col-xs-12'; ?>
    <?php } else { ?>
    <?php $class = 'col-sm-12'; $grid_layout='col-lg-3 col-md-3 col-sm-6 col-xs-12'; ?>
    <?php } ?>
    <div id="content" class="<?php echo $class; ?>"><?php echo $content_top; ?>
      <div class="search-header">
        <h1><?php echo $heading_title; ?></h1>
        <label class="control-label" for="input-search"><?php echo $entry_search; ?></label>
        <div class="row">
          <div class="col-sm-4">
            <input type="text" name="search" value="<?php echo $search; ?>" placeholder="<?php echo $text_keyword; ?>" id="input-search" class="form-control" />
          </div>
          <div class="col-sm-3">
            <select name="category_id"  class="form-control">
              <option value="0"><?php echo $text_category; ?></option>
              <?php foreach ($categories as $category_1) { ?>
              <?php if ($category_1['category_id'] == $category_id) { ?>
              <option value="<?php echo $category_1['category_id']; ?>" selected="selected"><?php echo $category_1['name']; ?></option>
              <?php } else { ?>
              <option value="<?php echo $category_1['category_id']; ?>"><?php echo $category_1['name']; ?></option>
              <?php } ?>
              <?php foreach ($category_1['children'] as $category_2) { ?>
              <?php if ($category_2['category_id'] == $category_id) { ?>
              <option value="<?php echo $category_2['category_id']; ?>" selected="selected">&nbsp;&nbsp;&nbsp;&nbsp;<?php echo $category_2['name']; ?></option>
              <?php } else { ?>
              <option value="<?php echo $category_2['category_id']; ?>">&nbsp;&nbsp;&nbsp;&nbsp;<?php echo $category_2['name']; ?></option>
              <?php } ?>
              <?php foreach ($category_2['children'] as $category_3) { ?>
              <?php if ($category_3['category_id'] == $category_id) { ?>
              <option value="<?php echo $category_3['category_id']; ?>" selected="selected">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<?php echo $category_3['name']; ?></option>
              <?php } else { ?>
              <option value="<?php echo $category_3['category_id']; ?>">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<?php echo $category_3['name']; ?></option>
              <?php } ?>
              <?php } ?>
              <?php } ?>
              <?php } ?>
            </select>
          </div>
          <div class="col-sm-3">
            <label class="checkbox-inline">
              <?php if ($sub_category) { ?>
              <input type="checkbox" name="sub_category" value="1" checked="checked" />
              <?php } else { ?>
              <input type="checkbox" name="sub_category" value="1" />
              <?php } ?>
              <?php echo $text_sub_category; ?></label>
          </div>
        </div>
        <p>
          <label class="checkbox-inline">
            <?php if ($description) { ?>
            <input type="checkbox" name="description" value="1" id="description" checked="checked" />
            <?php } else { ?>
            <input type="checkbox" name="description" value="1" id="description" />
            <?php } ?>
            <?php echo $entry_description; ?></label>
        </p>
        <input type="button" value="<?php echo $button_search; ?>" id="button-search" class="btn btn-primary" />
        <h2><?php echo $text_search; ?></h2>
        <?php if ($products) { ?>
        <p><a href="<?php echo $compare; ?>" id="compare-total"><?php echo $text_compare; ?></a></p>
        <div class="view-bar">
          <div class="row">
            <div class="col-md-5 clearfix">
              <label class="control-label pull-left">View as: &nbsp;&nbsp;</label>
              <div class="btn-group pull-left">
                <button type="button" id="list-view" onclick="location ='<?php echo $default; ?>&layout=list'" class="btn btn-default <?php if($layout=='list') {echo 'button-layout';} ?> " data-toggle="tooltip" title="<?php echo $button_list; ?>"><i class="fa fa-th-list"></i></button>
                <button type="button" id="grid-view" onclick="location ='<?php echo $default; ?>&layout=grid'" class="btn btn-default <?php if($layout=='grid') {echo 'button-layout';} ?>" data-toggle="tooltip" title="<?php echo $button_grid; ?>"><i class="fa fa-th"></i></button>
              </div>
            </div>
            <div class="col-md-4 col-xs-6 clearfix">
              <label class="control-label" for="input-sort"><?php echo $text_sort; ?></label>
              <select id="input-sort" class="form-control" onchange="location = this.value;">
                <?php foreach ($sorts as $sorts) { ?>
                <?php if ($sorts['value'] == $sort . '-' . $order) { ?>
                <option value="<?php echo $sorts['href']; ?>&layout=<?php echo $layout; ?>" selected="selected"><?php echo $sorts['text']; ?></option>
                <?php } else { ?>
                <option value="<?php echo $sorts['href']; ?>&layout=<?php echo $layout; ?>"><?php echo $sorts['text']; ?></option>
                <?php } ?>
                <?php } ?>
              </select>
            </div>
            <div class="col-md-3 col-xs-6 clearfix text-right">
              <div>
                <label class="control-label" for="input-limit"><?php echo $text_limit; ?></label>
                <select id="input-limit" class="form-control" onchange="location = this.value;">
                  <?php foreach ($limits as $limits) { ?>
                  <?php if ($limits['value'] == $limit) { ?>
                  <option value="<?php echo $limits['href']; ?>&layout=<?php echo $layout; ?>" selected="selected"><?php echo $limits['text']; ?></option>
                  <?php } else { ?>
                  <option value="<?php echo $limits['href']; ?>&layout=<?php echo $layout; ?>"><?php echo $limits['text']; ?></option>
                  <?php } ?>
                  <?php } ?>
                </select>
              </div>
            </div>
          </div>
        <hr />
        </div>
      </div>
      <div class="search-product">
        <div class="row">
          <?php echo $base; ?>
        </div>
      </div>
      <div class="pagination-wrapper">
        <div class="row">
          <div class="col-xs-6 text-left"><?php echo $pagination; ?></div>
          <div class="col-xs-6 text-right"><?php echo $results; ?></div>
        </div>
      </div>
      <?php } else { ?>
      <p><?php echo $text_empty; ?></p>
      <?php } ?>
    </div>  
    <?php echo $content_bottom; ?></div>
    <?php echo $column_right; ?></div>
</div>
<script type="text/javascript"><!--
$('#button-search').bind('click', function() {
	url = 'index.php?route=product/search';

	var search = $('#content input[name=\'search\']').prop('value');

	if (search) {
		url += '&search=' + encodeURIComponent(search);
	}

	var category_id = $('#content select[name=\'category_id\']').prop('value');

	if (category_id > 0) {
		url += '&category_id=' + encodeURIComponent(category_id);
	}

	var sub_category = $('#content input[name=\'sub_category\']:checked').prop('value');

	if (sub_category) {
		url += '&sub_category=true';
	}

	var filter_description = $('#content input[name=\'description\']:checked').prop('value');

	if (filter_description) {
		url += '&description=true';
	}

	location = url;
});

$('#content input[name=\'search\']').bind('keydown', function(e) {
	if (e.keyCode == 13) {
		$('#button-search').trigger('click');
	}
});

$('select[name=\'category_id\']').on('change', function() {
	if (this.value == '0') {
		$('input[name=\'sub_category\']').prop('disabled', true);
	} else {
		$('input[name=\'sub_category\']').prop('disabled', false);
	}
});

$('select[name=\'category_id\']').trigger('change');
--></script>
<?php echo $footer; ?>