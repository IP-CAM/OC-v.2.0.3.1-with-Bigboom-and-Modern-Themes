<?php echo $header; ?>
<div class="main-body">
    <?php if($top_banner) {
        echo $top_banner;
    } ?>
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
                <?php echo $banner1 ?>
                <?php echo $content_top; ?>
                <?php echo $Threecolumns_1; ?>    
                <?php echo $content_bottom; ?>                            
            </div>        
            <?php echo $column_right; ?>
        </div>  
    </div>      
    <?php if($top_footer) {
        echo $top_footer;
    } ?>

</div>  
<?php echo $footer; ?>