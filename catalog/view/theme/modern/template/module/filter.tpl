<div class="filter">
  <div class="panel panel-default">
    <div class="panel-heading">
      <h2 class="heading-title filter-title"><?php echo $heading_title; ?></h2>
    </div>
    <div class="list-group-wrapper">
      <?php foreach ($filter_groups as $filter_group) { ?>
     <div class="list-group">
       <h4 class="filter-list-title"><?php echo $filter_group['name']; ?> :</h4>
       <div class="list-group-item">
         <div id="filter-group<?php echo $filter_group['filter_group_id']; ?>">
           <?php foreach ($filter_group['filter'] as $filter) { ?>
           <div class="checkbox">
             <label>
               <?php if (in_array($filter['filter_id'], $filter_category)) { ?>
               <input type="checkbox" name="filter[]" value="<?php echo $filter['filter_id']; ?>" checked="checked" />
               <?php echo $filter['name']; ?>
               <?php } else { ?>
               <input type="checkbox" name="filter[]" value="<?php echo $filter['filter_id']; ?>" />
               <?php echo $filter['name']; ?>
               <?php } ?>
             </label>
           </div>
           <?php } ?>
         </div>
       </div>
     </div>
      <?php } ?>
    </div>
    <div class="panel-footer">
      <button type="button" id="button-filter" class="btn btn-primary"><?php echo $button_filter; ?></button>
    </div>
  </div>
  <script type="text/javascript"><!--
  $('#button-filter').on('click', function() {
  	filter = [];

  	$('input[name^=\'filter\']:checked').each(function(element) {
  		filter.push(this.value);
  	});

  	location = '<?php echo $action; ?>&filter=' + filter.join(',');
  });
  //--></script>
</div>
