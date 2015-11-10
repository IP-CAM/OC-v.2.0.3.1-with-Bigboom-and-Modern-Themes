$(document).ready(function(){
	var li =$('.vertical-menu .category-list > ul > li');
	var fly_sub_menu = li.find('.fly-sub-menu');
	var element_cate_wrapper = li.find('.element-cate-wrapper');
	var max= 0;				
	element_cate_wrapper.each(function(){
		w = $(this).width();
		max = w>max ? w :max;
	});			

	element_cate_wrapper.width(max+20);			
	
	li.hover(function(){		
		var link_cate = $(this).find('.link-cate');			

		var max_width = link_cate.find('.row-cate-wrapper').width();	

		link_cate.css('max-width',max_width+'px');

		width_image = $(this).find('.fly-sub-menu img').width();

		width = width_image+max_width+27;

		($(this).find('.fly-sub-menu')).css('width',width+'px');	


		fly_height = $(this).find('.fly-sub-menu').height();
		height_image = $(this).find('.fly-sub-menu img').height();
	
		var top = fly_height - height_image;	

		$(this).find('.fly-sub-menu img').parent().css({'position':'relative','top':top+'px'});

	});
});