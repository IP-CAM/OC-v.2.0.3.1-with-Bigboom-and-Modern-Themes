<?php echo $header; ?>
<div class="container">
  <ul class="breadcrumb">
    <?php foreach ($breadcrumbs as $breadcrumb) { ?>
    <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
    <?php } ?>
  </ul>
  <div class="row"><?php echo $column_left; ?>
    <?php if ($column_left && $column_right) { ?>
    <?php $class = 'col-sm-6'; ?>
    <?php } elseif ($column_left || $column_right) { ?>
    <?php $class = 'col-sm-9'; ?>
    <?php } else { ?>
    <?php $class = 'col-sm-12'; ?>
    <?php } ?>
    <div id="content" class="<?php echo $class; ?>"><?php echo $content_top; ?>
      <h2><?php echo $heading_title; ?></h2>
      <?php if ($products) { ?>
      <div class="compare-text">
        <a href="<?php echo $compare; ?>" id="compare-total"> <?php echo $text_compare; ?></a>
      </div>
      <div class="view-bar">
        <div class="row">
          <div class="col-md-5 clearfix">
            <label class="control-label pull-left">View as: &nbsp;&nbsp;</label>
            <div class="btn-group pull-left">
              <button type="button" id="grid-view" onclick="location ='<?php echo $default; ?>&layout=grid'" class="btn btn-default <?php if($layout=='grid') {echo 'button-layout';} ?>" data-toggle="tooltip" title="<?php echo $button_grid; ?>">Grid</button>
              <span class="view-mode-split"> / </span>
              <button type="button" id="list-view" onclick="location ='<?php echo $default; ?>&layout=list'" class="btn btn-default <?php if($layout=='list') {echo 'button-layout';} ?> " data-toggle="tooltip" title="<?php echo $button_list; ?>">List</button>
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
            <div style="display: inline-block">
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
      <div class="row">
        <?php echo $base; ?>
      </div>
      <div class="row">
        <div class="col-sm-6 text-left"><?php echo $pagination; ?></div>
        <div class="col-sm-6 text-right"><?php echo $results; ?></div>
      </div>
      <?php } else { ?>
      <p><?php echo $text_empty; ?></p>
      <div class="buttons">
        <div class="pull-right"><a href="<?php echo $continue; ?>" class="btn btn-primary"><?php echo $button_continue; ?></a></div>
      </div>
      <?php } ?>
      <?php echo $content_bottom; ?></div>
    <?php echo $column_right; ?></div>
</div>
<?php echo $footer; ?>