<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*, java.text.*" %>
<%@ page import="java.sql.*, javax.sql.*, java.net.*, java.io.*" %>

<!DOCTYPE HTML>
<html>
  <head>
    <meta charset="utf-8">
    <title>JOA HOTEL</title>

<!-- CSS 파일 링크 모음 -->
<link rel="stylesheet" href="../css/bootstrap.min.css">
<link rel="stylesheet" href="../css/animate.css">
<!-- 여러 이미지를 이쁘게 가져오기 위한  CSS -->
<link rel="stylesheet" href="../css/owl.carousel.min.css">
<!-- aos : animate on scroll : 스크롤 이펙트  -->
<link rel="stylesheet" href="../css/aos.css">
<!-- text바 클릭 시 달력모양의 선택창이 나오는 CSS -->
<link rel="stylesheet" href="../css/bootstrap-datepicker.css">
<link rel="stylesheet" href="../css/jquery.timepicker.css">
<!-- 이미지 및 동영상 등을 게시할 때 더 이쁘게 보여줌 -->
<link rel="stylesheet" href="../css/fancybox.min.css">
<!-- 아이콘 사용과 관련된 CSS -->
<link rel="stylesheet" href="../fonts/ionicons/css/ionicons.min.css">
<link rel="stylesheet"
	href="../fonts/fontawesome/css/font-awesome.min.css">
<!-- 폰트 설정 -->
<link
	href="https://fonts.googleapis.com/css?family=Noto+Sans+KR:500&display=swap&subset=korean"
	rel="stylesheet">
<!-- Theme Style -->
<link rel="stylesheet" href="../css/style.css">
<!-- 개별 설정한 CSS -->
<link rel="stylesheet" href="../css/mycss.css">

  <link rel="stylesheet" type="text/css" href="slick/slick.css"/>
  <link rel="stylesheet" type="text/css" href="slick/slick-theme.css"/>
  
  <link href="https://unpkg.com/aos@2.3.1/dist/aos.css" rel="stylesheet">
  <link href="https://use.fontawesome.com/releases/v5.0.6/css/all.css" rel="stylesheet">
    
<style>
  .txt-area{
	background: rgba(0,0,0,0.5);
    position: absolute;
    width: 95%;
    height: 40%;
    margin: 5%;
    padding: 5%;
    color: white;
    display: inline-grid;
    bottom: 0%;
    word-spacing: 2px;
    font-size: larger;
  }
  .lazy img{
    margin: 5%;
    width: 95%;
    height: 600px;
  }
  strong{
  	    height: 90px;
    font-size: xx-large;
    font-weight: 600;
  }
  .desc{
  	font-style: inherit;
  }
  
  </style>
  </head>
  <body>
<!-- ****************************헤더 시작*****************************  -->
<!-- 상당의 흰색 바를 나타내는 부분 -->
	<header class="site-header js-site-header">
	<!-- 반응형 설정을 위해  container 쿨래스를 가져옴 -->
      <div class="container-fluid">
        <div class="row align-items-center">
        <!-- 제목 나타내는 영역 -->
          <div class="col-8 col-lg-8 site-logo" data-aos="fade" style="display: inline-block;"><a href="../index.jsp">JOA HOTEL</a>
          <%
          if(session.getAttribute("login_id") == null){ %>
          	<a href="../admin/adm_main.html" style="display:none; left: 60%; position: sticky;">관리자 페이지</a>       
          <%}else if(session.getAttribute("login_id").equals("admin")){ %>
          	<a href="../admin/adm_main.html" style="display:inline-block; left: 60%; position: sticky;">관리자 페이지</a>       
          <%}else{ %>
          <a href="../admin/adm_main.html" style="display:none; left: 60%; position: sticky;">관리자 페이지</a>   
          <%} %>
          <% 
          if(session.getAttribute("login_ok") == null){ 
          %>
          	  <a href="../login/logout.jsp"  id="logout" style="display:none; position: fixed; left: 100%; width: fit-content;">LOG OUT</a>
          	  <a href="../login/login.jsp?jump=../Welcome.jsp"  id="login" style="display:inline-block; position: fixed; left: 100%; width: fit-content;">LOG IN</a>      
          <%
          }else if(session.getAttribute("login_ok").equals("yes")){
          %>  
        	  <a href="../login/logout.jsp"  id="logout" style="display:inline-block; position: fixed; left: 100%; width: fit-content;">LOG OUT</a>
        	  <a href="../login/login.jsp?jump=../Welcome.jsp"  id="login" style="display:none; position: fixed; left: 100%; width: fit-content;">LOG IN</a>
          <%
          }
          %>
		</div>

          <!-- 헤더 쪽 좌 상단 예약 체이지 이동하게 하는 버튼 설정 fixed설정으로 인해 화면 스크롤을 이동시켜도 계속 화면에 붙어있는 효과를 준다. -->
		<div class="col-4 col-lg-4" style="display: inline-block;">
          <a href="../Reservation/Reservation.jsp" class="btn btn-outline-white-primary py-3 text-white px-5" data-aos="fade" 
          style="color:black !important; border: 2px solid black; position: fixed; right:3%; top: 5px;">Reserve Now</a>
          </div>
        </div>
      </div>
    </header>
<!-- ****************************헤더 끝*****************************  -->
<!-- ****************************헤더 밑 배너 부분 *****************************  -->
    <section class="inner-page bg-image overlay" style="height:300px; min-height: 300px; background-image: url(../banner/banner1.jpg); background-size: cover;" data-stellar-background-ratio="0.5">
      <div class="container" style="height:300px;">
        <div class="row site-hero-inner justify-content-center align-items-center" style="height:300px;">
          <div class="col-md-10 text-center" style="top:50px;" data-aos="fade">
            <h1 class="heading mb-3">Welcome!</h1>
            <ul class="custom-breadcrumbs mb-4">
              <li><a href="index.jsp" style="font-size:20px;">Main</a></li>
              <li>&bullet;</li>
              <li>About</li>
            </ul>
          </div>
        </div>
      </div>  
    </section>
<!-- ****************************배너 끝*****************************  -->


<!-- 영역에 마우스를 hove(Jquery의 .on)r하면 아래 슬라이드(Jquery의 slidedown) 주어서 나오게 한다. -->
<section class="bg-light" style="height:100%; ">
<!-- div와  nav에 fade 애니메이션을 줌 -->
	<div class="menu_container" data-aos="fade-up" data-aos-duration="500" id="dgwrap-header" style="">	
	<nav class="aos-init aos-animate" style="width:100%;">
	<!-- 메뉴 출력 부분 -->
		<ul class="header_menu">
			<li class="menu_1">
				<a>호텔 소개</a>
			</li>
			<li class="menu_2">
				<a>객실 안내</a>
			</li>
			<li class="menu_4">
				<a>부대시설</a>
			</li>
			<li class="menu_5">
				<a>프로모션</a>
			</li>
			<li class="menu_6">
				<a href="../map/map.jsp">찾아오시는길</a>
			</li>
		</ul>

		<div class="header_depth2">
			<div class="depth2_wrap">
				<ul class="depth2_menu1">
					<li><a href="../introduction/photo_tour.jsp">Photo Tour</a></li>
					<li><a href="../introduction/notice.jsp">notice</a></li>
					<li><a href="../introduction/review.jsp">review</a></li>
				</ul>

				<ul class="depth2_menu2">
					<li><a href="../rooms/standard.jsp">standard</a></li>
					<li><a href="../rooms/suite.jsp">suite</a></li>
					<li><a href="../rooms/royal.jsp">royal</a></li>
				</ul>
				<!-- 편의 시설 dropdown 부분 내용, 링크 -->
				<ul class="depth2_menu4">
					<li><a href="../Facilities/Fitness_club.jsp">Fitness Club</a></li>
					<li><a href="../Facilities/Gift_shop.jsp">Gift Shop</a></li>
					<li><a href="../Facilities/Healing_therapy.jsp">Healing therapy</a></li>
				</ul>
				<ul class="depth2_menu6">
					<li><a href="./event.jsp">Event</a></li>
					<li><a href="./Tour_Course.jsp">Tour Course</a></li>
				</ul>
			</div>
		</div>
	</nav>
	</div>
</section>


<!-------------------------------------------------------------------- 본문 내용 출력 부분 ----------------------------------------------------------------->
<section class="section " id="dgwrap-content" style="margin: 3% 10% 3% 10%;">
 	<div class="container" data-aos="fade-up">
		<div class="row justify-content-center text-center mb-5">
			<div class="col-md-7">
			<!-- 해당 컨텐츠의 제목 부분 -->
				<h2 class="heading">Event</h2>
				<p>다양한 이벤트를 준비하고 있습니다.</p>
			</div>
		</div>
	</div>
  
	<!-- script에서 적용한 class를 지정하고 크기를 맟춰 안에 내용물을 넣어준다. -->
<div data-aos="fade-up" style="height:1000p">	
  <div class="lazy" style="width:90%; left:5%;" data-aos="fade-up" data-aos-duration="800">
    <div>
    <span style="display: flex; position: relative;">
    <img src="sweet night.jpg" style="">
    <span class="txt-area type3" style="">
		<strong class="title">Sweet Night</strong>
		<em class="desc tag">#조식 #연인 #호캉스 #와인 </em>
		<em class="desc date">2020.01.01~2020.03.31</em>
	</span>
	</span>
	</div>
	    <div>
    <span style="display: flex; position: relative;">
    <img src="forwomen.jpg" style="">
    <span class="txt-area type3" style="">
		<strong class="title">For Women</strong>
		<em class="desc tag" >#친구 #호캉스 #여성 </em>
		<em class="desc date">2020.01.01~2020.03.31</em>
	</span>
	</span>
	</div>
	    <div>
    <span style="display: flex; position: relative;">
    <img src="welcome2020.jpg" style="">
    <span class="txt-area type3" style="">
		<strong class="title">Welcome 2020</strong>
		<em class="desc tag">#온라인 예약 전용</em>
		<em class="desc date">2020.01.06~2020.02.26</em>
	</span>
	</span>
	</div>
	    <div>
    <span style="display: flex; position: relative;">
    <img src="joyfulBBQ.jpg" style="">
    <span class="txt-area type3" style="">
		<strong class="title">JoyfulBBQ</strong>
		<em class="desc tag">#와인 #바비큐 </em>
		<em class="desc date">2020.01.01~2020.03.31</em>
	</span>
	</span>
	</div>
	 
  </div>
</div>
</section>
<!-------------------------------------------------------------------- 본문 내용 출력 부분 ----------------------------------------------------------------->
	<section class="section bg-image overlay" style="background-image: url('../images/hero_4.jpg');">
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

    <footer class="section footer-section">
      <div class="container">
        <div class="row mb-4">
          <div class="col-md-3 mb-5 pr-md-5 contact-info">
            <!-- <li>198 West 21th Street, <br> Suite 721 New York NY 10016</li> -->
                     <p><span class="d-block"><span class="ion-ios-location h5 mr-3 text-primary"></span>Address</span> <span> 369W+JM Phước Mỹ, Sơn Trà, Đà Nẵng, Việt Nam, Phường Phước Mỹ, Quận Sơn Trà, Đà Nẵng, 베트남 <br></span></p>
            <p><span class="d-block"><span class="ion-ios-telephone h5 mr-3 text-primary"></span>Phone</span> <span> (+1) 435 3533</span></p>
            <p><span class="d-block"><span class="ion-ios-email h5 mr-3 text-primary"></span>Email</span> <span> KOPO15@kopoctc.com</span></p>
          </div>
          <div class="col-md-3 mb-5">
            <p>Sign up for our newsletter</p>
            <form action="#" class="footer-newsletter">
              <div class="form-group">
                <input type="email" class="form-control" placeholder="Email...">
                <button type="submit" class="btn"><span class="fa fa-paper-plane"></span></button>
              </div>
            </form>
          </div>
        </div>
        <div class="row pt-5">
          <p class="col-md-6 text-left">
            <!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
            Copyright &copy;<script>document.write(new Date().getFullYear());</script> All rights reserved | This template is made with <i class="icon-heart-o" aria-hidden="true"></i> by <a href="https://colorlib.com" target="_blank" >Colorlib</a>
            <!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
          </p>
            
          <p class="col-md-6 text-right social">
            <a href="#"><span class="fa fa-tripadvisor"></span></a>
            <a href="#"><span class="fa fa-facebook"></span></a>
            <a href="#"><span class="fa fa-twitter"></span></a>
            <a href="#"><span class="fa fa-linkedin"></span></a>
            <a href="#"><span class="fa fa-vimeo"></span></a>
          </p>
        </div>
      </div>
    </footer>
    
	<!-- 스크립트 소스 모음  -->
	<script src="../js/jquery-3.3.1.min.js"></script>
	<!-- migrate : 제이쿼리 1.9이상 버전에서 하위버전과 호환이 잘 안될때 사용   -->
	<script src="../js/jquery-migrate-3.0.1.min.js"></script>
	<script src="../js/popper.min.js"></script>
	<script src="../js/bootstrap.min.js"></script>
	<script src="../js/owl.carousel.min.js"></script>
	<script src="../js/jquery.stellar.min.js"></script>
	<!-- 이미지 및 동영상 등을 게시할 때 더 이쁘게 보여줌 -->
	<script src="../js/jquery.fancybox.min.js"></script>
	<!-- aos = animate on scroll  -->
	<script src="../js/aos.js"></script>
	<!-- 다양한 아이콘 사용 스크립트 : ionicons -->
	<script src="https://unpkg.com/ionicons@4.5.10-0/dist/ionicons.js"></script>
	<script src="../js/bootstrap-datepicker.js"></script>
	<script src="../js/jquery.timepicker.min.js"></script>
	<script src="../js/main.js"></script>
  <script src="https://unpkg.com/aos@2.3.1/dist/aos.js"></script>
  <!-- slcik은 여러 이미지를 리스트처럼 이쁘게 나타낼때 쓴다. -->
  <script type="text/javascript" src="slick/slick.min.js"></script>

  <script type="text/javascript">
    $(document).ready(function(){
    	$('.lazy').slick({
    		  lazyLoad: 'ondemand',
    		  slidesToShow: 3,
    		  slidesToScroll: 1
    		});
    });
  </script>
  <script>
  AOS.init();
</script>
<!--      <script>
	    $( document ).ready(function() {
	        console.log( "111111" );
	        window['hotel'] = {
	    	        onClickLogin: function() {
 		    	        console.log('onClickLogin 1111');
 		    	       	  $("#logout").css("display","inline-block");
 		    	       	  $("#login").css("display","none");
		    	    }
	    	};
	    });
    </script> -->
  </body>
</html>