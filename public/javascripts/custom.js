$(document).ready(function() {
	plus_menu();		plus_gallery();	
 });

function plus_menu(){
	$('#nav').superfish({		 animation:   {height:'show'}	});
}function plus_gallery(){		var galleryItems = $('#content ul.gallery a');		galleryItems.each(function(){		$(this).append('<span class="overlay"></span>');		$(this).find('span.overlay').fadeTo(0,0);	});		galleryItems.hover(		function(){			$(this).find('span.overlay').fadeTo('slow',0.8);		},		function(){			$(this).find('span.overlay').fadeTo('fast',0);		}	);	}