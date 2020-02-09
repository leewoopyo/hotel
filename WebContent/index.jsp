<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*, java.text.*, java.net.*" %>
<!DOCTYPE HTML>
<html>
  <head>
    <meta charset="utf-8">
    <title>JOA HOTEL</title>
	<!-- CSS모음 -->
	<!-- 부트스트랩  -->
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <!-- 다양한 효과를 주는 animate -->
    <link rel="stylesheet" href="css/animate.css">
    <!-- 이미지 파일등을 파일처럼 옆으로 스크롤 하게 해주는 카로셀 -->
    <link rel="stylesheet" href="css/owl.carousel.min.css">
    <!-- aos : animate on scroll : 스크롤 이펙트  -->
    <link rel="stylesheet" href="css/aos.css">
    <!-- 달력표시 datepicker -->
    <link rel="stylesheet" href="css/bootstrap-datepicker.css">
    <link rel="stylesheet" href="css/jquery.timepicker.css">
    <!-- 이미지 및 동영상 등을 게시할 때 더 이쁘게 보여줌 -->
    <link rel="stylesheet" href="css/fancybox.min.css">
    <!-- 폰트 설정 -->
    <link rel="stylesheet" href="fonts/ionicons/css/ionicons.min.css">
    <link rel="stylesheet" href="fonts/fontawesome/css/font-awesome.min.css">
	<link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR:500&display=swap&subset=korean" rel="stylesheet">
	
    <!-- 개인 설정 -->
    <link rel="stylesheet" href="css/style.css">
    <link rel="stylesheet" href="css/mycss.css">
    
    <!-- 미디어 쿼리 사용하여 모바일 환경 구성  -->
    <style>
    @media ( max-width : 991.98px){
    	body{
    		font-size:30px;
    	}
    	.heading{
    		font-size:50px;
    	}
    	.btn{
    		font-size:50px;
    	}
    	.site-hero-inner .heading {
    		font-size: 80px;
    	}
    	.custom-caption{
    		font-size:30px;
    	}
    	#introduction{
    		text-align: center;
    	}
    }
    </style>
    
    
  </head>
  <body>
  
<%
String message = null;		//출력할 메시지를 담는 변수
Cookie[] cookies = request.getCookies();	//먼저 response객체에 저장되있는 쿠키를 먼저 가져와서 배열에 담는다.
try{
	for(int i = 0;i < cookies.length;i++){	//반복을 돌려서 저장된 쿠키를 가져온다
		Cookie thisCookie = cookies[i];		//thiscookie에 데이터를 담고
	 	//out.print("길이 : "+cookies.length);		
		//out.print("이름 : "+thisCookie.getName());
		//out.print("값 : " + thisCookie.getValue());
		if("time".equals(thisCookie.getName())){	//저장했던 쿠키데이터의 이름이 time인것을 찾아서 
			//저장된 값을 메시지 변수에 담아서 출력하게 한다. 출력 인코딩 된 데이터를 디코딩 해서 저장한다.
			message = URLDecoder.decode(thisCookie.getValue(), "UTF-8");		
			thisCookie.setMaxAge(0);				//그리고 쿠키를 지우고 
			response.addCookie(thisCookie);			//상태를 저장한다.
		}
	}	
}catch(Exception e){
	
}
%>
<%
SimpleDateFormat format = new SimpleDateFormat("yyyy년 MM월 dd일 HH시 mm분 ss초");	//현제 시간 포맷 설정(띄어쓰기가 안됨)
Date time = new Date();	//현제 시간 가져오기
String daystr = format.format(time);	//날짜 포맷에 맞게 날짜 데이터 저장 
//쿠키를 저장한다.(해당 데이터 이름은 time, 값은 daystr이다.) 그리고 값을 저장할 때 UTF-8로 인코딩하여 값을 저장한다.(한글문제 일어날 시에는)
Cookie cookieName = new Cookie("time",URLEncoder.encode(daystr, "UTF-8"));	
cookieName.setMaxAge(60*60*24);	//해당 데이터는 브라우저가 켜져있는 동안 적용되게 한다.괄호 안에 쿠키의 만료일 을 설정할 수 있다.
response.addCookie(cookieName);	//해당 쿠키는  response객체에 저장한다.
%>
<script>
<%if(message == null){%>
	alert("오늘 첫방문 입니다.");
<%}else{%>
	alert('마지막 방문 시간은  : ' + '<%=message%>' + ' 입니다.');
<%}%>
</script>

  
  
    <!-------------------------------------------- 헤더 부분 시작 ---------------------------------------------->
    <header class="site-header js-site-header">
      <div class="container-fluid">
        <div class="row align-items-center">
        <!-- 로고 표시하는 부분 -->
          <div class="col-6 col-lg-4 site-logo" data-aos="fade"><a href="index.jsp" id="logo">JOA HOTEL</a></div>
          <div class="col-6 col-lg-8">
		<!--------메뉴바 부분  화면이 작아지면 보인다.----------->
<!--        <div id="asdf" class="site-menu-toggle js-site-menu-toggle" data-aos="fade">
              <span></span>
              <span></span>
              <span></span>
            </div> -->
            
            <!-- 화면이 클 때 보이는 메뉴 바  -->
             <div class="nav navbar-nav nav-links">
                     <li><a class="movepage" href="#next1">Main</a></li>
                     <li><a class="movepage" href="#next2">호텔소개</a></li>
                     <li><a class="movepage" href="#next3">예약하기</a></li>
                     <li><a class="movepage" href="#next4">객실사진</a></li>
                     <li><a class="movepage" href="#next5">식사메뉴</a></li>
                     <li><a class="movepage" href="#next6">프로모션</a></li>
                     <li><a class="movepage" href="#next7">About Us</a></li>
            </div>
           <!-- 메뉴바 끝 -->

			<!-- 네이게이션 바  -->
          <!--   <div class="site-navbar js-site-navbar" style="display:none">
              <nav role="navigation">
                <div class="container">
                  <div class="row full-height align-items-center">
                    <div class="col-md-6 mx-auto">
                      <ul class="list-unstyled menu">
                        <li class="active"><a class="movepage" href="#next1">Main</a></li>
                        <li><a class="movepage" href="#next2">호텔소개</a></li>
                        <li><a class="movepage" href="#next3">예약하기</a></li>
                        <li><a class="movepage" href="#next4">객실사진</a></li>
                        <li><a class="movepage" href="#next5">식사메뉴</a></li>
                        <li><a class="movepage" href="#next6">프로모션</a></li>
                        <li><a class="movepage" href="#next7">About Us</a></li>
                      </ul>
                    </div>
                  </div>
                </div>
              </nav>
            </div> -->
          </div>
        </div>
      </div>
    </header>
    <!------------------------------------------ 헤더부분 끝 ------------------------------------------------->
	<!--------------------------------------- 메뉴 바 밑 배너 부분 ---------------------------------------------->
    <section class="site-hero overlay"  id="next1">
    
    <!-- 비디오를 가져오는 부분 배너쪽의 배경으로 사용 했다.  -->
 	    <video autoplay muted loop id="myVideo">
	  		<source src="banner/banner.webm" type="video/webm">
		</video>
	<!-- 배너 중간에 글씨 표시  -->
      <div class="container">
        <div class="row site-hero-inner justify-content-center align-items-center">
          <div class="col-md-10 text-center" data-aos="fade-up">
            <span class="custom-caption text-uppercase text-white d-block  mb-3">Welcome To 5 <span class="fa fa-star text-primary"></span>   Hotel</span>
            <h1 class="heading">A Best Place To Stay</h1>
          </div>
        </div>
      </div>
<!-- 빠른 예약 창이다. 구현 안되있다.  -->
    <section class="section bg-light pb-0" id="next2">
      <div class="container">
        <div class="row check-availabilty" >
        </div>
      </div>
    </section>
<!-- 빠른 예약 바 종료  -->
<!-- 호텔 소개 섹션  시작 -->
    <section class="py-5 bg-light">
      <div class="container">
        <div class="row align-items-center">
          <div class="col-md-12 col-lg-7 ml-auto order-lg-2 position-relative mb-5" data-aos="fade-up">
            <figure class="img-absolute">
              <img src="images/food-1.jpg" alt="Image" class="img-fluid">
            </figure>
            <img src="images/img_1.jpg" alt="Image" class="img-fluid rounded">
          </div>
          <div class="col-md-12 col-lg-4 order-lg-1" data-aos="fade-up">
            <h2 class="heading">호텔 소개</h2>
            <p class="mb-4" style="font-family: 'Noto Sans KR', sans-serif;">고객님들이 꿈꾸던 바다로의 여행, 푸른 바다를 배경으로 유혹하는 그 곳!
다낭에 병풍처럼 펼쳐진 미케비치를 상상해 보셨나요?
그곳에 가면 이 세상에서 가장 아름다운 사랑과 가장 가치 있는 선물이 있고, 편안한 휴식이 있으며 가장
눈부신 추억이 있습니다. 조아 호텔에서는 고객님 한 분, 한 분의 고귀한 삶을 아름답게 비춰 드리고자 합니다.</p>
            <p id="introduction">
            <a href="https://youtu.be/FT0odx2LoyQ" class="btn btn-primary text-white py-2 mr-3" data-fancybox>See video</a>
            <a href="Welcome.jsp" class="btn btn-primary text-white py-2 mr-3" >more...</a>
            </p>
          </div>
        </div>
      </div>
    </section>
<!-- 호텔 소개 섹션 종료  -->
<!-- 예약 페이지 이동 섹션  -->
    <section class="section"  id="next3">
      <div class="container">
        <div class="row justify-content-center text-center mb-5">
          <div class="col-md-7">
            <h2 class="heading" data-aos="fade-up">Reservation</h2>
            <p data-aos="fade-up" data-aos-delay="100">고객님의 간편하고 빠른 예약을 도와드립니다.</p>
            <p data-aos="fade-up" data-aos-delay="100">
            <button class="btn btn-primary btn-block text-white" onclick="location.href='Reservation/Reservation.jsp'">예약페이지</button>
            </p>
          </div>
        </div>
        <div class="row">
          <div class="col-md-6 col-lg-4" data-aos="fade-up">
            <a class="room">
              <figure class="img-wrap">
                <img src="images/img_1.jpg" alt="Free website template" class="img-fluid mb-3">
              </figure>
              <div class="p-3 text-center room-info">
                <h2>Standard Room</h2>
                <span class="text-uppercase letter-spacing-1">90$ / per night</span>
              </div>
            </a>
          </div>

          <div class="col-md-6 col-lg-4" data-aos="fade-up">
            <a class="room">
              <figure class="img-wrap">
                <img src="images/img_2.jpg" alt="Free website template" class="img-fluid mb-3">
              </figure>
              <div class="p-3 text-center room-info">
                <h2>Suite Room</h2>
                <span class="text-uppercase letter-spacing-1">120$ / per night</span>
              </div>
            </a>
          </div>

          <div class="col-md-6 col-lg-4" data-aos="fade-up">
            <a class="room">
              <figure class="img-wrap">
                <img src="images/img_3.jpg" alt="Free website template" class="img-fluid mb-3">
              </figure>
              <div class="p-3 text-center room-info">
                <h2>Royal Room</h2>
                <span class="text-uppercase letter-spacing-1">250$ / per night</span>
              </div>
            </a>
          </div>


        </div>
      </div>
    </section>
    <!-- 예약 페이지 이동섹션 종료  -->
    <!-- 사진 슬라이드 표시 색션 -->
    <section class="section slider-section bg-light" id="next4">
      <div class="container">
        <div class="row justify-content-center text-center mb-5">
          <div class="col-md-7">
            <h2 class="heading" data-aos="fade-up">Photos</h2>
            <p data-aos="fade-up" data-aos-delay="100">아늑하고 쾌적한, 고객님께 최고의 경험을 드릴 저희 객실입니다.</p>
          </div>
        </div>
        <div class="row">
          <div class="col-md-12">
            <div class="home-slider major-caousel owl-carousel mb-5" data-aos="fade-up" data-aos-delay="200">
              <div class="slider-item">
                <a href="images/slider-1.jpg" data-fancybox="images" data-caption="Caption for this image"><img src="images/slider-1.jpg" alt="Image placeholder" class="img-fluid"></a>
              </div>
              <div class="slider-item">
                <a href="images/slider-2.jpg" data-fancybox="images" data-caption="Caption for this image"><img src="images/slider-2.jpg" alt="Image placeholder" class="img-fluid"></a>
              </div>
              <div class="slider-item">
                <a href="images/slider-3.jpg" data-fancybox="images" data-caption="Caption for this image"><img src="images/slider-3.jpg" alt="Image placeholder" class="img-fluid"></a>
              </div>
              <div class="slider-item">
                <a href="images/slider-4.jpg" data-fancybox="images" data-caption="Caption for this image"><img src="images/slider-4.jpg" alt="Image placeholder" class="img-fluid"></a>
              </div>
              <div class="slider-item">
                <a href="images/slider-5.jpg" data-fancybox="images" data-caption="Caption for this image"><img src="images/slider-5.jpg" alt="Image placeholder" class="img-fluid"></a>
              </div>
              <div class="slider-item">
                <a href="images/slider-6.jpg" data-fancybox="images" data-caption="Caption for this image"><img src="images/slider-6.jpg" alt="Image placeholder" class="img-fluid"></a>
              </div>
              <div class="slider-item">
                <a href="images/slider-7.jpg" data-fancybox="images" data-caption="Caption for this image"><img src="images/slider-7.jpg" alt="Image placeholder" class="img-fluid"></a>
              </div>
            </div>
          </div>
        </div>
      </div>
    </section>
<!-- 사진 슬라이드 섹션 종료 -->
<!-- 요리 섹션 시작  -->    
    <section class="section bg-image overlay" id="next5" style="background-image: url('images/hero_3.jpg');">
      <div class="container">
        <div class="row justify-content-center text-center mb-5">
          <div class="col-md-9">
            <h2 class="heading text-white" data-aos="fade">Restaurant Menu</h2>
            <p class="text-white" data-aos="fade" data-aos-delay="100">
호텔 최고층에 위치한 마레첼로는
다낭의 에메랄드 빛 바다를 전경으로 세계 최고급
호텔에서 맛볼 수 있는 Steak와 신선한
해물류를 으뜸으로 하는 부드러운 파스타를 맛보실 수 있으며, 
저녁이 되면 클래식한 분위기 속에서
프리미엄 위스키와 최고급 와인을 즐길 수 있습니다.
            </p>
          </div>
        </div>
        <div class="food-menu-tabs" data-aos="fade">
          <ul class="nav nav-tabs mb-5" id="myTab" role="tablist">
            <li class="nav-item">
              <a class="nav-link active letter-spacing-2" id="mains-tab" data-toggle="tab" href="#mains" role="tab" aria-controls="mains" aria-selected="true">Mains</a>
            </li>
            <li class="nav-item">
              <a class="nav-link letter-spacing-2" id="desserts-tab" data-toggle="tab" href="#desserts" role="tab" aria-controls="desserts" aria-selected="false">Desserts</a>
            </li>
            <li class="nav-item">
              <a class="nav-link letter-spacing-2" id="drinks-tab" data-toggle="tab" href="#drinks" role="tab" aria-controls="drinks" aria-selected="false">Drinks</a>
            </li>
          </ul>
          <div class="tab-content py-5" id="myTabContent">
            
            
            <div class="tab-pane fade show active text-left" id="mains" role="tabpanel" aria-labelledby="mains-tab">
              <div class="row">
                <div class="col-md-6">
                  <div class="food-menu mb-5">
                    <span class="d-block text-primary h4 mb-3">$15.00</span>
                    <h3 class="text-white"><a class="text-white">까오러우(비빔쌀국수)</a></h3>
                    <p class="text-white text-opacity-7">돼지고기 볶음과 튀긴 쌀국수를 올린 면요리,매콤한 맛이 일품 </p>
                  </div>
                  <div class="food-menu mb-5">
                    <span class="d-block text-primary h4 mb-3">$15.00</span>
                    <h3 class="text-white"><a class="text-white">껌까(닭고기덮밥)</a></h3>
                    <p class="text-white text-opacity-7">숯불 닭고기와 각종 채소를 밥 위에 올려 먹는 베트남 대표요리</p>
                  </div>
                  <div class="food-menu mb-5">
                    <span class="d-block text-primary h4 mb-3">$18.00</span>
                    <h3 class="text-white"><a class="text-white">껌헨(제첩비빔밥)</a></h3>
                    <p class="text-white text-opacity-7">제첩 조갯살과 견과류 등 각종 고명을 밥위에 얹은 요리</p>
                  </div>
                </div>
                <div class="col-md-6">
                  <div class="food-menu mb-5">
                    <span class="d-block text-primary h4 mb-3">$30.00</span>
                    <h3 class="text-white"><a class="text-white">껀가느엉(닭날개구이)</a></h3>
                    <p class="text-white text-opacity-7">매콥짭잘할 양념에 기름기가 쪽 빠진 담백한 숯불 닭구이</p>
                  </div>
                  <div class="food-menu mb-5">
                    <span class="d-block text-primary h4 mb-3">$8.35</span>
                    <h3 class="text-white"><a class="text-white">짜조(튀긴 스프링롤)</a></h3>
                    <p class="text-white text-opacity-7">양념한 고기와 야채를 반짱에 말아 기름에 튀긴 일품요리</p>
                  </div>
                  <div class="food-menu mb-5">
                    <span class="d-block text-primary h4 mb-3">$22.00</span>
                    <h3 class="text-white"><a class="text-white">분팃느엉(고기구이국수)</a></h3>
                    <p class="text-white text-opacity-7">돼지고기볶음, 땅콩, 채소와 각종 향신채가 들어간 전통요리</p>
                  </div>
                </div>
              </div>
              

            </div> 

            <div class="tab-pane fade text-left" id="desserts" role="tabpanel" aria-labelledby="desserts-tab">
              <div class="row">
                <div class="col-md-6">
                  <div class="food-menu mb-5">
                    <span class="d-block text-primary h4 mb-3">$7.00</span>
                    <h3 class="text-white"><a class="text-white">쩨(베트남 팥빙수)</a></h3>
                    <p class="text-white text-opacity-7">코코넛,쌀떡 땅콩 등 원하는 대로 담아 먹는 시원한 디저트</p>
                  </div>
                  <div class="food-menu mb-5">
                    <span class="d-block text-primary h4 mb-3">$10.00</span>
                    <h3 class="text-white"><a class="text-white">반베오(작은 쌀 부침개)</a></h3>
                    <p class="text-white text-opacity-7">작은 종지위에 생선,새우튀김이 올라가는 디저트</p>
                  </div>
                  <div class="food-menu mb-5">
                    <span class="d-block text-primary h4 mb-3">$15.00</span>
                    <h3 class="text-white"><a class="text-white">반꾸온티느응(월남쌈)</a></h3>
                    <p class="text-white text-opacity-7">라이스 페이퍼에 각종 고기와 야채를 넣고 찐 음식</p>
                  </div>
                </div>
                <div class="col-md-6">
                  <div class="food-menu mb-5">
                    <span class="d-block text-primary h4 mb-3">$10.00</span>
                    <h3 class="text-white"><a class="text-white">반쎄오(베트남 부침개)</a></h3>
                    <p class="text-white text-opacity-7">프라이팬에 쌀가루 반죽을 부쳐 먹는 베트남 대표음식</p>
                  </div>
                  <div class="food-menu mb-5">
                    <span class="d-block text-primary h4 mb-3">$2.35</span>
                    <h3 class="text-white"><a class="text-white">소프트 아이스크림</a></h3>
                    <p class="text-white text-opacity-7">부드럽고 시원한 아이스크림</p>
                  </div>
                  <div class="food-menu mb-5">
                    <span class="d-block text-primary h4 mb-3">$5.00</span>
                    <h3 class="text-white"><a class="text-white">푸딩(딸기, 사과, 오렌지)</a></h3>
                    <p class="text-white text-opacity-7">상큼하고 시원하고 부드러운 푸딩</p>
                  </div>
                </div>
              </div>
            </div> <!-- .tab-pane -->
            <div class="tab-pane fade text-left" id="drinks" role="tabpanel" aria-labelledby="drinks-tab">
              <div class="row">
                <div class="col-md-6">
                  <div class="food-menu mb-5">
                    <span class="d-block text-primary h4 mb-3">$5.00</span>
                    <h3 class="text-white"><a class="text-white">신또(과일 스무디)</a></h3>
                    <p class="text-white text-opacity-7"></p>
                  </div>
                  <div class="food-menu mb-5">
                    <span class="d-block text-primary h4 mb-3">$2.00</span>
                    <h3 class="text-white"><a class="text-white">코카 콜라 , 코카 제로 콜라</a></h3>
                    <p class="text-white text-opacity-7"></p>
                  </div>
                  <div class="food-menu mb-5">
                    <span class="d-block text-primary h4 mb-3">$1.50</span>
                    <h3 class="text-white"><a class="text-white">환타(오렌지, 사과, 포도)</a></h3>
                    <p class="text-white text-opacity-7"></p>
                  </div>
                </div>
                <div class="col-md-6">
                  <div class="food-menu mb-5">
                    <span class="d-block text-primary h4 mb-3">$10.00</span>
                    <h3 class="text-white"><a class="text-white">생맥주 1000CC</a></h3>
                    <p class="text-white text-opacity-7"></p>
                  </div>
                  <div class="food-menu mb-5">
                    <span class="d-block text-primary h4 mb-3">$2.00</span>
                    <h3 class="text-white"><a class="text-white">스파클링 미네랄 워터</a></h3>
                    <p class="text-white text-opacity-7"></p>
                  </div>
                  <div class="food-menu mb-5">
                    <span class="d-block text-primary h4 mb-3">$7.00</span>
                    <h3 class="text-white"><a  class="text-white">라임 주스</a></h3>
                    <p class="text-white text-opacity-7"></p>
                  </div>
                </div>
              </div>
            </div> 
          </div>
        </div>
      </div>
    </section>
<!-- 요리 섹션 종료  -->
<!-- 이벤트 섹션  -->
    <section class="section blog-post-entry bg-light" id="next6">
      <div class="container">
        <div class="row justify-content-center text-center mb-5">
          <div class="col-md-7">
            <h2 class="heading" data-aos="fade-up">Events</h2>
            <p data-aos="fade-up">진행중이거나 곧 진행 할 이벤트를 알려드립니다.</p>
          </div>
        </div>
        <div class="row">
          <div class="col-lg-4 col-md-6 col-sm-6 col-12 post" data-aos="fade-up" data-aos-delay="100">

            <div class="media media-custom d-block mb-4 h-100">
              <a class="mb-4 d-block"><img src="images/event1.jpg" alt="Image placeholder" class="img-fluid"></a>
              <div class="media-body">
                <span class="meta-post">2020-01-01 ~ 2020-01-31</span>
                
                <h2 class="mt-0 mb-3"><br><a href="#">가족여행 패키지</a></h2>
               <p>최고의 경험을 가족과 함께</p>
              </div>
            </div>

          </div>
          <div class="col-lg-4 col-md-6 col-sm-6 col-12 post" data-aos="fade-up" data-aos-delay="200">
            <div class="media media-custom d-block mb-4 h-100">
              <a class="mb-4 d-block"><img src="images/event2.jpg" alt="Image placeholder" class="img-fluid"></a>
              <div class="media-body">
                <span class="meta-post">2020-01-23 ~ 2020-01-29</span>
                <h2 class="mt-0 mb-3"><br><a href="#">베트남 설날 패키지</a></h2>
                <p>베트남의 설날을 통해 더욱 의미있는 여행을 만들어 드립니다. </p>
              </div>
            </div>
          </div>
          <div class="col-lg-4 col-md-6 col-sm-6 col-12 post" data-aos="fade-up" data-aos-delay="300">
            <div class="media media-custom d-block mb-4 h-100">
              <a class="mb-4 d-block"><img src="images/event3.jpg" alt="Image placeholder" class="img-fluid"></a>
              <div class="media-body">
                <span class="meta-post">2020-02-01 ~ 2020-02-28</span>
                <h2 class="mt-0 mb-3"><br><a href="#">프로포즈 패키지</a></h2>
                <p>사랑하는 사람과 함께</p>
              </div>
            </div>
          </div>
        </div>
      </div>
    </section>
<!-- 이벤트 섹션 종료 -->

<!-- 하단  배너 -->
    <section class="section bg-image overlay" id="next7" style="background-image: url('images/hero_4.jpg');">
        <div class="container" >
          <div class="row align-items-center">
            <div class="col-12 col-md-6 text-center mb-4 mb-md-0 text-md-left" data-aos="fade-up">
              <h2 class="text-white font-weight-bold">A Best Place To Stay. Reserve Now!</h2>
            </div>
            <div class="col-12 col-md-6 text-center text-md-right" data-aos="fade-up" data-aos-delay="200">
              <a href="Reservation/Reservation.jsp" class="btn btn-outline-white-primary py-3 text-white px-5">Reserve Now</a>
            </div>
          </div>
        </div>
      </section>
<!-- 하단 배너 종료  -->
<!-- 풋터 부분 시작  -->
    <footer class="section footer-section">
      <div class="container">
        <div class="row mb-4">
          <div class="col-md-3 mb-5 pr-md-5 contact-info">
          <!-- ion-ios : 다양한 아이콘들을 클래스로 정의 가능하다. -->
            <p><span class="d-block"><span class="ion-ios-location h5 mr-3 text-primary"></span>Address</span> <span> 369W+JM Phước Mỹ, Sơn Trà, Đà Nẵng, Việt Nam, Phường Phước Mỹ, Quận Sơn Trà, Đà Nẵng, 베트남 <br></span></p>
            <p><span class="d-block"><span class="ion-ios-telephone h5 mr-3 text-primary"></span>Phone</span> <span> (+1) 435 3533</span></p>
            <p><span class="d-block"><span class="ion-ios-email h5 mr-3 text-primary"></span>Email</span> <span> KOPO15@kopoctc.com</span></p>
            
            
            <form action="#" class="footer-newsletter">
              <div class="form-group">
              <p>Sign up for our newsletter</p>
                <input type="email" class="form-control" placeholder="Email...">
           		<button type="submit" class="btn" style="top:100px; left:450px;"><span class="fa fa-paper-plane"></span></button>
              </div>
            </form>
          </div>
          <div class="col-md-3 mb-5 contact-info">
          <p><span class="d-block"><span class="ion-ios-location h5 mr-3 text-primary"></span>Location</span></p>
    		<div id="map"></div>
          </div>
        </div>
        <div class="row pt-5">
          <p class="col-md-6 text-left">
            Copyright &copy;<script>document.write(new Date().getFullYear());</script> All rights reserved | This template is made with <i class="icon-heart-o" aria-hidden="true"></i> by <a href="https://colorlib.com" target="_blank" >Colorlib</a>
          </p>
            
          <p class="col-md-6 text-right social">
            <a ><span class="fa fa-tripadvisor"></span></a>
            <a ><span class="fa fa-facebook"></span></a>
            <a ><span class="fa fa-twitter"></span></a>
            <a ><span class="fa fa-linkedin"></span></a>
            <a ><span class="fa fa-vimeo"></span></a>
          </p>
        </div>
      </div>
    </footer>
    <!-- 풋터 부분 종료  -->
    
    
    
<!-- script모음  -->
<!-- Jquery 가져오기  -->
    <script src="js/jquery-3.3.1.min.js"></script>
    <!-- migrate : 제이쿼리 1.9이상 버전에서 하위버전과 호환이 잘 안될때 사용   -->
    <script src="js/jquery-migrate-3.0.1.min.js"></script>
    <script src="js/popper.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/owl.carousel.min.js"></script>
    <script src="js/jquery.stellar.min.js"></script>
    <!-- 이미지 및 동영상 등을 게시할 때 더 이쁘게 보여줌 -->
    <script src="js/jquery.fancybox.min.js"></script>
    <!-- aos = animate on scroll  -->
    <script src="js/aos.js"></script>
    <!-- datepicker js 가져오기  -->
    <script src="js/bootstrap-datepicker.js"></script> 
    <script src="js/jquery.timepicker.min.js"></script> 
    <script async defer src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCrhOfCmrnYEoWqYnhiVIyj5gaIO2ZhTb4&callback=initMap"></script>
    <script src="js/main.js"></script>
    
    <!-- 구글 맵 가져오는 부분 기본 위치, 줌인 정도 등을 설정 할 수 있다.-->
    <script>
    function initMap() {
    	  // The location of Uluru
    	  var uluru = {lat: 16.0639, lng: 108.2467};
    	  // The map, centered at Uluru
    	  var map = new google.maps.Map(
    	      document.getElementById('map'), {zoom: 12, center: uluru});
    	  // The marker, positioned at Uluru
    	  var marker = new google.maps.Marker({position: uluru, map: map});
    	}
    </script>
    
  </body>
</html>