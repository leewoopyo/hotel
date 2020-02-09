(function($) {
	'use strict';
	//클릭 시 css가 적용된 클래스가 생기고 사라지는 function 
	//해당 클래스에 클릭 이벤트 생기면
	$('.site-menu-toggle').click(function(){
	//해당 클래스를 this로 선언하고 
	var $this = $(this);
	//만약 body태그가  menu-open클래스를 가지고 있으면 
	if ( $('body').hasClass('menu-open') ) {
	//this(site-menu-toggle)에 있는 open클래스를 삭제한다.
	  $this.removeClass('open');
	//js-site-navbar클래스를 사라지게 한다.(fadeOut)(0.4초)
	  $('.js-site-navbar').fadeOut(400);
	//그리고 body에 있는 menu-open 클래스를 삭제한다.
	  $('body').removeClass('menu-open');
	  //그렇지 않으면 
	} else {
	//this로 선언된 클래스에 (open) 클래스를 추가한다 .
	  $this.addClass('open');
	  //해당 클래스에 fadein하면 생긴다.(0.4)초
	  $('.js-site-navbar').fadeIn(400);
	  //body태그에 menu-open클래스를 추가한다.
	  $('body').addClass('menu-open');
	}
	});

	//.ready를 안하면 resize 기능이 작동을 안함
	$( document ).ready( function() {  
	//nav-bar를 킨 상태로 window크기를 늘리면 toggle만 사라지고 nav-bar가 남아있는데 그 nav-bar를 사라지게 하는 function

	//해당 클래스를 추가한다. ;
		//아래 클래스에 scrolled 클래스를 추가한다.
	  $('.js-site-header').addClass('scrolled')
	  //브라우저 창의 크기가 조절되면 가눙허눈 리스너
	  $( window ).resize( function() {
		
		  
		  //브라우저 크기가 991.98보다 크면 
		if(window.innerWidth >= 991.98){
			//open클래스 삭제한다.
	      $('.site-menu-toggle').removeClass('open');
	      //사라지는 효과는 주지 않는다.
	      $('.js-site-navbar').fadeOut(0);
	      //해당 태그에 menu-open클래스를 삭제한다.
	      $('body').removeClass('menu-open');
		}
	  } );
	  
	  
	  function pageMove(src){
		    var url = src + ".html";
		    console.log(url);
		       $('#contentssss').load(url);
		 }
	  
	  
	  
	} );


	//추가 검토 필요
	$('nav .dropdown').hover(function(){
		var $this = $(this);
		$this.addClass('show');
		$this.find('> a').attr('aria-expanded', true);
		$this.find('.dropdown-menu').addClass('show');
	}, function(){
		var $this = $(this);
			$this.removeClass('show');
			$this.find('> a').attr('aria-expanded', false);
			$this.find('.dropdown-menu').removeClass('show');
	});



	$('#dropdown04').on('show.bs.dropdown', function () {
	  console.log('show');
	});

	// aos
	AOS.init({
	duration: 1000
	});

	// home slider
	$('.home-slider').owlCarousel({
	loop:true,
	autoplay: true,
	margin:10,
	animateOut: 'fadeOut',
	animateIn: 'fadeIn',
	nav:true,
	autoplayHoverPause: true,
	items: 1,
	autoheight: true,
	navText : ["<span class='ion-chevron-left'></span>","<span class='ion-chevron-right'></span>"],
	responsive:{
	  0:{
	    items:1,
	    nav:false
	  },
	  600:{
	    items:1,
	    nav:false
	  },
	  1000:{
	    items:1,
	    nav:true
	  }
	}
	});

	// owl carousel
	var majorCarousel = $('.js-carousel-1');
	majorCarousel.owlCarousel({
	loop:true,
	autoplay: true,
	stagePadding: 7,
	margin: 20,
	animateOut: 'fadeOut',
	animateIn: 'fadeIn',
	nav: true,
	autoplayHoverPause: true,
	items: 3,
	navText : ["<span class='ion-chevron-left'></span>","<span class='ion-chevron-right'></span>"],
	responsive:{
	  0:{
	    items:1,
	    nav:false
	  },
	  600:{
	    items:2,
	    nav:false
	  },
	  1000:{
	    items:3,
	    nav:true,
	    loop:false
	  }
		}
	});

	// owl carousel
	var major2Carousel = $('.js-carousel-2');
	major2Carousel.owlCarousel({
	loop:true,
	autoplay: true,
	stagePadding: 7,
	margin: 20,
	// animateOut: 'fadeOut',
	// animateIn: 'fadeIn',
	nav: true,
	autoplayHoverPause: true,
	autoHeight: true,
	items: 3,
	navText : ["<span class='ion-chevron-left'></span>","<span class='ion-chevron-right'></span>"],
	responsive:{
	  0:{
	    items:1,
	    nav:false
	  },
	  600:{
	    items:2,
	    nav:false
	  },
	  1000:{
	    items:3,
	    dots: true,
	    nav:true,
	    loop:false
	  }
		}
	});
	
	var siteStellar = function() {
	$(window).stellar({
	  responsive: false,
	  parallaxBackgrounds: true,
	  parallaxElements: true,
	  horizontalScrolling: false,
	  hideDistantElements: false,
	  scrollProperty: 'scroll'
	});
	}
	siteStellar();

	//페이지를 스무스하게 이동
	var smoothScroll = function() {
	var $root = $('html, body');

	$('a.smoothscroll[href^="#"]').click(function () {
	  $root.animate({
	    scrollTop: $( $.attr(this, 'href') ).offset().top}, 700);
	  return false;
	});
	}
	smoothScroll();

	var movepage = function() {
	    var $root = $('html, body');

	    $('a.movepage[href^="#"]').click(function () {
	      $root.animate({
	        scrollTop: $( $.attr(this, 'href') ).offset().top}, 700);
	      return false;
	    });
	  }
	movepage();

//클릭시 달력모양 날짜 선택창 나오게하는 부분
	var dateAndTime = function() {
	$('#m_date').datepicker({
	  'format': 'm/d/yyyy',
	  'autoclose': true
	});
	$('#checkin_date').datepicker({
	  'format': 'yyyy-m-dd',
	  'autoclose': true,
	  'startDate' : '-0d'
	  
	});
	$('#checkout_date').datepicker({
		  'format': 'yyyy-m-dd',
		  'autoclose': true,
		  'startDate' : '+1d'
		  
		});
	$('#m_time').timepicker();
	};
	
	dateAndTime();


	//스크롤 200 만큼 내리면 .js-site-header 클래스에 scrolled 클래스를 더한다.
	var windowScroll = function() {

	$(window).scroll(function(){
	  var $win = $(window);
	 // if ($win.scrollTop() > 200) {
	    $('.js-site-header').addClass('scrolled');
	//  } else {
//	    $('.js-site-header').removeClass('scrolled');
	//  }

	});

	};
	windowScroll();


	var goToTop = function() {

	$('.js-gotop').on('click', function(event){
	  
	  event.preventDefault();

	  $('html, body').animate({
	    scrollTop: $('html').offset().top
	  }, 500, 'easeInOutExpo');
	  
	  return false;
	});

	$(window).scroll(function(){

	  var $win = $(window);
	  if ($win.scrollTop() > 200) {
	    $('.js-top').addClass('active');
	  } else {
	    $('.js-top').removeClass('active');
	  }

	});

	};

	//navbar에 마우스가 올라가면 슬라이드처럼 왔다갔다 하는 function
	$(window).on('load', function() {
		//mouseenter : 경계 밖에서 안으로 들어올때 해당 function이 동작한다.
		$(document).on('mouseenter', '#dgwrap-header', function() {
			//만약 나타날 메뉴바가 애니메이션이 아니면 해당 메뉴가 slidedown 된다.
			if(!$('#dgwrap-header nav > .header_depth2').is(':animated')) $('#dgwrap-header nav > .header_depth2').slideDown(150);
		});
		//mouseleave : 경계 밖에서 안으로 들어올때 해당 function이 동작한다.
		$(document).on('mouseleave', '#dgwrap-header', function() {
			//만약 나타날 메뉴바가 애니메이션이 아니면 해당 메뉴가 slidedown 된다.
			if(!$('#dgwrap-header nav > .header_depth2').is(':animated')) $('#dgwrap-header nav > .header_depth2').slideUp(150);
		});
	});
	
	
	
	
	
	
})(jQuery);



