<?php if (count($languages) > 1) { ?>
<form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="language">
  <div class="btn-group">
    <button class="btn btn-link dropdown-toggle" data-toggle="dropdown">
    <?php foreach ($languages as $language) { ?>
    <?php if ($language['code'] == $code) { ?>
    <a href="#" class="top-link language-link ">
      <?php echo $language['name']; ?>
      <i class="fa fa-caret-down"></i>
    </a>
    <?php } ?>
    <?php } ?>
  </button>
    <ul class="dropdown-menu">
      <?php foreach ($languages as $language) { ?>
      <li><a href="<?php echo $language['code']; ?>" class="dropdown-menu-item"><img src="image/flags/<?php echo $language['image']; ?>" alt="<?php echo $language['name']; ?>" title="<?php echo $language['name']; ?>" /> <?php echo $language['name']; ?></a></li>
      <?php } ?>
    </ul>
  </div>
  <input type="hidden" name="code" value="" />
  <input type="hidden" name="redirect" value="<?php echo $redirect; ?>" />
</form>
<?php } ?>
