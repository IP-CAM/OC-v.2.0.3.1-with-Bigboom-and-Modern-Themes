<div id="search-custom" class="input-group">
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
  	<input class="search-input" type="text" name="search" value="<?php echo $search; ?>" placeholder="<?php echo $text_search; ?>">
   <button type="button" class="btn-group" id="btn-search">
   	<a href="#" class="search-icon top-icon"><i class="fa fa-search"></i></a>
   </button>
</div>
<script type="text/javascript"><!--
$('#search-custom #btn-search').bind('click', function() {
	url = 'index.php?route=product/search';

	var search = $('#search-custom input[name=\'search\']').prop('value');

	if (search) {
		url += '&search=' + encodeURIComponent(search);
	}

	var category_id = $('#search-custom select[name=\'category_id\']').prop('value');

	if (category_id > 0) {
		url += '&category_id=' + encodeURIComponent(category_id);
	}		

	location = url;
});

$('#search-custom input[name=\'search\']').bind('keydown', function(e) {
	if (e.keyCode == 13) {
		$('#btn-search').trigger('click');
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