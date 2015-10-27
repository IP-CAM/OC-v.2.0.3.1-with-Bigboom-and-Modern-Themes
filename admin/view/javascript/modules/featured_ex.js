$(document).ready(function(){
		
	//radio.prop("checked",true);
	 /*$('#loader').hide();
		jQuery.ajaxSetup({
	  beforeSend: function() {
	     $('#loader').show();
	  },
	  complete: function(){
	     $('#loader').hide();
	  },
	  success: function() {
	  	  $('#loader').hide();
	  }
	});*/

	$('.group-choose').each(function(){
		var radio = $(this).find($("input[name='products']"));
		var group=$(this).find($('.choose-element'));
		var rest_group=$('.group-choose .choose-element');		
		var list_group=$(this).find($('.group-choose .list-choose'));
		if(radio.is(":checked")){
			group.fadeIn(100);
		}	

		radio.each(function(){
			if($(this).prop('checked')){
				rest_group.find('input,select').prop('disabled',true);
				group.find('input ,select').prop('disabled',false);	
			}
		});
		radio.click(function(){				
			rest_group.find('input,select').prop('disabled',true)	;				
			rest_group.stop().fadeOut();
			group.stop().fadeIn(300);				
			group.find('input ,select').prop('disabled',false);			
		
		});
	});
});



