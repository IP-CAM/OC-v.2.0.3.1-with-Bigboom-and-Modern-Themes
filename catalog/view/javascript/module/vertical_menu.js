$(document).ready(function(){
	var li =$('.vertical-menu .category-list > ul > li');
	fly_sub_menu = li.find('.fly-sub-menu');
	li.hover(function(){		
		var max= 0;
		var element_cate_wrapper = $(this).find('.element-cate-wrapper');	
		var link_cate = $(this).find('.link-cate');	

		fly_sub_menu.stop().animate({left:"100%"});

		element_cate_wrapper.each(function(){
			w = $(this).width();
			max = w>max ? w :max;
		});				
		element_cate_wrapper.css('min-width',(max+1)+'px');

		var max_width = link_cate.find('.row-cate-wrapper').width();	

		link_cate.css('max-width',max_width+'px');

		width_image = $(this).find('.fly-sub-menu img').width();

		width = width_image+max_width+27;
		($(this).find('.fly-sub-menu')).css('width',width+'px');	

	},function(){
		fly_sub_menu.css('left','110%');
	});
});