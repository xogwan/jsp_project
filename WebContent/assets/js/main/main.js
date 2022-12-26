/**
 * 
 */



	$(document).ready(function(){
		$("#lgr_select1").val("00").prop("selected", true);
	});
    
	$("#lgr_topbtn").click(function(){
		$('html, body').animate({scrollTop: '0'}, 800);
		return false;
	});
	
	/* 슬라이드 메뉴 타이틀 클릭시 슬라이드 */
	$(document).ready(function(){
		  $('#b').hide();
		  $('#d').hide();
		  $('#f').hide();
		  $('#h').hide();
		  $('#bb').hide();
		  
		  $('#aa').click(function(){
			  	$('#bb').slideToggle();
			  	$('#b').hide();
			    $('#d').hide();
				$('#f').hide();
				$('#h').hide();
			  })
		  
		  $('#a').click(function(){
		  	$('#b').slideToggle();
		  	$('#bb').hide();
		    $('#d').hide();
			$('#f').hide();
			$('#h').hide();
		  })
		  
		  $('#c').click(function(){
		  	$('#d').slideToggle();
		  	$('#bb').hide();
		  	$('#b').hide();
			$('#f').hide();
			$('#h').hide();
		  })
		  
		  $('#e').click(function(){
		  	$('#f').slideToggle();
		  	$('#bb').hide();
		  	$('#b').hide();
			$('#d').hide();
			$('#h').hide();
		  	
		  })
		  
		  $('#g').click(function(){
		  	$('#h').slideToggle();
		  	$('#bb').hide();
		  	$('#b').hide();
			$('#d').hide();
			$('#f').hide();
	  });
	  
	  
	});
	



	//슬라이드
	var swiper = new Swiper(".mySwiper", {
	  slidesPerView: 4,
	  spaceBetween: 40,
	  pagination: {
	    el: ".swiper-pagination",
	    clickable: true,
	  },
	});
	
