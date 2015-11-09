<?php echo $header; ?>
<div class="main-body">
    <div class="container">
        <div class="main-content">
            <div class="top-banner-wrapper">
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
                        <?php echo $content_top; ?>                   
                    </div>        
                    <?php echo $column_right; ?>
                </div>
            </div>
            <?php echo $content_bottom; ?>  
        </div>    
        <?php if($ex_position) { echo $ex_position;} ?>                  
    </div>  
    <?php echo $top_footer; ?>  
</div>  
<?php echo $footer; ?>