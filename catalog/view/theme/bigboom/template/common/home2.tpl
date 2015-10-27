<?php echo $header; ?>
<div class="main-body">
    <div class="container">
        <div class="row">
            <?php echo $column_left; ?>
            <?php 
                if ($column_left && $column_right) { ?>
                    <?php $class = 'col-sm-6'; ?>
                <?php } 
                elseif ($column_left || $column_right) { ?>
                    <?php $class = 'col-sm-9'; ?>
                <?php } 
                else { ?>
                    <?php $class = 'col-sm-12'; 
                ?>
            <?php } ?>
            <div id="content" class="<?php echo $class; ?>">
                <?php echo $themevast_4; ?>
                <?php echo $content_top; ?>
                <?php echo $themevast_5; ?>
                <?php echo $content_bottom; ?>                            
            </div>        
            <?php echo $column_right; ?>
        </div>  
    </div> 
</div>  
<?php echo $themevast_3; ?> 
<?php echo $footer; ?>