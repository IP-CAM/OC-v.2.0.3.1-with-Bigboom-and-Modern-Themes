$(document).ready(function(){
	var li =$('.vertical-menu .category-list > ul > li');
	fly_sub_menu = li.find('.fly-sub-menu');
	li.hover(function(){		
		var max= 0;
		var element_cate_wrapper = $(this).find('.element-cate-wrapper');	
		
		fly_sub_menu.stop().animate({left:"100%"});

		element_cate_wrapper.each(function(){
			w = $(this).width();
			max = w>max ? w :max;
		});
		element_cate_wrapper.css('min-width',max+'px');
	},function(){
		fly_sub_menu.css('left','110%');
	});
});