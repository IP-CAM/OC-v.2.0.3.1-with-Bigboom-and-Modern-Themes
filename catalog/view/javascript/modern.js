$(document).ready(function () { 

    var input_search=$('#search').find('input');

	var quickview = $('.btn-quickview');



 	var main_image=$('#product-quickview .modal-body .product-images .main-image img'),

 		main_href=$('#product-quickview .modal-body .product-images .main-image a'),

 	  	other_image=$('#product-quickview .modal-body .product-images .other-image  ul'),

 	  	rating=$('#product-quickview .modal-body .product-desc .rating'),

 		modal_title=$('#product-quickview .modal-body .product-desc h3'),

 		price=$('#product-quickview .modal-body .product-desc .price'),

 		modal_desc=$('#product-quickview .modal-body .product-desc .modal-description'),

 		share=$('#product-quickview .modal-body .product-desc .addthis_native_toolbox'),



 		btn_add=$('#product-quickview .modal-body .product-desc .add-to-cart-content .add-to-cart-button');

 		btn_compare=$('#product-quickview .modal-body .product-desc .button-group .btn-compare');

 		btn_wishlist=$('#product-quickview .modal-body .product-desc .button-group .btn-wishlist'); 		



 	$(quickview).click(function(){ 		

 		other_image.empty();

 		rating.empty();

 		price.empty();



 		console.log(btn_add);



 		var product_info=$(this).data('productinfo');		

		

 		main_image.attr('src',product_info['thumb']);

 		main_href.attr('href',product_info['href']);



 		var arr_image=product_info['images'];

 		for(var i=0;i<arr_image.length&&i<3;i++){ 			

 			other_image.append('<li><img style="width:78px;cursor:pointer" class="img-thumbnail other-image" src="'+arr_image[i]+'"></li>')

 		}



 		$('.other-image').click(function(){

 			main_image.attr('src',$(this).attr('src'));

 		});

 		modal_title.html(product_info['name']);

 		modal_desc.html($("<div />").html(product_info['description_modal']).text());

 		if(product_info['rating']){

 			for(var j=1;j<=5;j++){

 				if(product_info['rating']<j){

 					rating.append('<span class="fa fa-stack"><i class="fa fa-star fa-stack-2x" style="color:#999;"></i></span>');

 				}

 				else{

 					rating.append('<span class="fa fa-stack"><i class="fa fa-star fa-stack-2x"></i><i class="fa fa-star fa-stack-2x" tyle="color:#999;"></i></span>');

 				}



 			}

 		}

 		else{

 			for(var j=0;j<5;j++){

 				rating.append(' <span class="fa fa-stack"><i class="fa fa-star fa-stack-2x" style="color:#999;"></i></span>');

 			}

 		}



 		if(product_info['price']){ 			

 			if(product_info['special']){ 			

 				price.text(product_info['price']);

 			}

 			else{ 				

 				price.append('<span class="price-old">'+product_info["price"]+'</span>');

 			}



 		}



 		btn_add.attr('onclick','cart.add('+product_info["product_id"]+')'); 		

 		btn_compare.attr('onclick','compare.add('+product_info["product_id"]+')');

 		btn_wishlist.attr('onclick','wishlish.add('+product_info["product_id"]+')');

 	});



    /*dropdown*/

    $('header .dropdown-hover').parent().hover(function () {

       $(this).find('.dropdown-menu').show();

    },function(){        
        $(this).find('.dropdown-menu').hide();

    });



    /*search*/    

   /* $('#search').hover(function(){

        input_search.css('transition','all 0.5s ease');

        input_search.stop().fadeIn();

        input_search.css('transform','translate(20px,0)');

    },function(){

        input_search.hide();

        input_search.css('transform','translate(0,0)');

    });

*/

    /*product tab */

    $('.product-tab-title').click(function(){                 

        var k=$(this).data('index');

        var products=$(this).data('products'); 

        $('#product-tab-'+k).find('.product-thumb').hide();

        for(i=0;i<products.length;i++){

            $('#product-tab-'+k).find('#product-content'+k+products[i].product_id).delay(i*300).fadeIn(800);

        }

    });



    //Megamenu..

    max =0;

    if($(window).width()>768){         

        $('.menu-dropdown').each(function(){

            $(this).hover(function(){            

                max=0;

                li=$(this).find('.sub-menu-wrapper ul.sub-menu-1 > li');

                li.each(function(){

                    h=($(this).height());

                    max = h>max ? h:max;

                });

                li.css('min-height',max+'px');

            });

        });

    }



    //Replace arrow icon in select form

    $('select').wrap('<div class="select-element-wrapper"></div>');



     $(window).scroll(function () {

        if ($(this).scrollTop() > 100) {

            $('#scroll-top').fadeIn();

        } else {

            $('#scroll-top').fadeOut();

        }

    });



    $('#scroll-top').click(function () {

        $("html, body").animate({

            scrollTop: 0

        }, 600);

        return false;

    });

});



/*$(window).scroll(function(){

	tab_content= isElementVisible('#product-tab-0');	

	if(tab_content){

		//console.log("It visibled");

	}

});

*/

/*function isElementVisible(elementToBeChecked){

    var TopView = $(window).scrollTop();

    var BotView = TopView + $(window).height();

    var TopElement = $(elementToBeChecked).offset().top;

    var BotElement = TopElement + $(elementToBeChecked).height();   

    return ((BotElement <= BotView) && (TopElement >= TopView));

}*/