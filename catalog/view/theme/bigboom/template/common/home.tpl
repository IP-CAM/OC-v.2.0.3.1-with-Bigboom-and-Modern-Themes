<?php echo $header; ?>
<div class="main-body">
    <div class="container">     
        <?php echo $banner1 ?>
    <div class="container">
        <div class="main-content">
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
            <?php if($column_left_ex || $column_right_ex) { ?>
                <div class="row">
                    <?php 
                        if($column_left_ex && $column_right_ex) { 
                            $class_ex   =   'col-sm-6';
                        }elseif($column_left_ex || $column_right_ex){
                            $class_ex   =   'col-sm-9';
                        }
                        else{
                            $class_ex   =   'col-sm-12';
                        }
                    ?>
                    <?php if($column_left_ex) {echo $column_left_ex;} ?>
                    <div class="<?php echo $class_ex; ?>">
                        <?php echo $content_bottom; ?>              
                    </div>
                    <?php if($column_right) {echo $column_right_ex;} ?>
                </div>
            <?php } ?>
        </div>    
        <?php if($ex_position) { echo $ex_position;} ?>                  
    </div>  
    <?php if($top_footer) { echo $top_footer; } ?>
</div>  
<?php echo $footer; ?>