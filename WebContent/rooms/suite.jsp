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
    <link rel="stylesheet" href="../css/owl.carousel.min.css">
    <!-- aos : animate on scroll : 스크롤 이펙트  -->
    <link rel="stylesheet" href="../css/aos.css">
    <link rel="stylesheet" href="../css/bootstrap-datepicker.css">
    <link rel="stylesheet" href="../css/jquery.timepicker.css">
    <!-- 이미지 및 동영상 등을 게시할 때 더 이쁘게 보여줌 -->
    <link rel="stylesheet" href="../css/fancybox.min.css">
    <link rel="stylesheet" href="../fonts/ionicons/css/ionicons.min.css">
    <link rel="stylesheet" href="../fonts/fontawesome/css/font-awesome.min.css">
	<link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR:500&display=swap&subset=korean" rel="stylesheet">
    <!-- Theme Style -->
    <link rel="stylesheet" href="../css/style.css">
    <link rel="stylesheet" href="../css/mycss.css">
    <!-- 객실과 관련된  CSS -->
    <link rel="stylesheet" href="../css/rooms.css">
    

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
					<li><a href="./standard.jsp">standard</a></li>
					<li><a href="./suite.jsp">suite</a></li>
					<li><a href="./royal.jsp">royal</a></li>
				</ul>
				<!-- 편의 시설 dropdown 부분 내용, 링크 -->
				<ul class="depth2_menu4">
					<li><a href="../Facilities/Fitness_club.jsp">Fitness Club</a></li>
					<li><a href="../Facilities/Gift_shop.jsp">Gift Shop</a></li>
					<li><a href="../Facilities/Healing_therapy.jsp">Healing therapy</a></li>
				</ul>
				<ul class="depth2_menu6">
					<li><a href="../event/event.jsp">Event</a></li>
					<li><a href="../event/Tour_Course.jsp">Tour Course</a></li>
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
            <h2 class="heading" >Suite</h2>
            <p>스위트</p>
          </div>
        </div>
        <div class="row">
          <div class="col-md-12">
          <!-- START slider -->
            <div class="home-slider major-caousel owl-carousel mb-5">
              <div class="slider-item">
                <a><img src="suite1.jpg" alt="Image placeholder" class="img-fluid"></a>
              </div>
              <div class="slider-item">
                <a><img src="suite2.jpg" alt="Image placeholder" class="img-fluid"></a>
              </div>
              <div class="slider-item">
                <a><img src="suite3.jpg" alt="Image placeholder" class="img-fluid"></a>
              </div>
            </div>
            <!-- END slider -->
          </div>
        </div>
      </div>


<div class="room-view-area">

					<div class="room-infomation">
						<h2 class="blind">객실 개요</h2>
						<div class="tb-responsive view-type">
							<table class="rwd-table">
								<caption>객실 개요</caption>
								<colgroup>
									<col style="width:15%">
									<col style="width:25%">
									<col style="width:15%">
									<col style="width:auto;">
								</colgroup>
								<tbody>
								<tr  style="border-top: 1px solid #aaa;">
									<th scope="col">체크인</th>
									<td><div class="td-txt">15:00</div></td>
									<th scope="col">체크아웃</th>
									<td><div class="td-txt">11:00</div></td>
								</tr>
								<tr>
									<th scope="col">기준 인원</th>
									<td><div class="td-txt">4명</div></td>
									<th scope="col">최대 인원</th>
									<td><div class="td-txt">6명</div></td>
								</tr>
								<tr>
									<th scope="col">객실 구성</th>
									<td><div class="td-txt">침실(더블)+온돌+거실+욕실2</div></td>
									<th scope="col">객실 면적</th>
									<td><div class="td-txt">65.5㎡(33평)</div></td>
								</tr>
								<tr>
									<th scope="col">객실 수</th>
									<td><div class="td-txt">123실</div></td>
									<th scope="col"></th>
									<td><div class="td-txt"></div></td>
								</tr>
								</tbody>
							</table>
						</div>
					</div>
					
				</div>


<div class="content w-max">
					
						<div class="title-sub-area">
							<h2 class="sub-title">제공 서비스</h2>
						</div>

						<div class="amenity-list">
							<ul class="grid-area gap-4 col-sm-push">
								<li class="colum col-3">
									<span class="ico-amen list-01"></span>
									<div class="desc">
										<strong class="tit">침실/거실</strong>
										<p>침대, 화장대, 식탁의자, 쇼파, 식탁, 화장대 의자, TV, 전화기, 에어컨, 한실이불, 요, 사각 스툴</p>
									</div>
								</li>
								<li class="colum col-3">
									<span class="ico-amen list-02"></span>
									<div class="desc">
										<strong class="tit">욕실</strong>
										<p>샴푸, 샤워젤, 비누, 욕실컵, 바디스펀지, 비데, 헤어드라이기, 페이스타올, 발매트, 욕조</p>
									</div>
								</li>
								<li class="colum col-3">
									<span class="ico-amen list-03"></span>
									<div class="desc">
										<strong class="tit">주방</strong>
										<p>머그잔, 도마, 과도, 식도, 국자, 믹스볼, 냄비, 프라이팬, 냄비받침, 티스푼, 포크, 숟가락, 젓가락, 수저통, 접시, 밥그릇, 국그릇, 냉장고, 커피포트, 인덕션, 밥솥</p>
									</div>
								</li>
								<li class="colum col-3">
									<span class="ico-amen list-04"></span>
									<div class="desc">
										<strong class="tit">추가 제공 물품</strong>
										<p>연필, 빗자루, 쓰레받기, 주방세제, 빨래건조대, 욕실 쓰레기통, 음식물쓰레기통, 음식물쓰레기봉투(5L) 1EA, 욕실화, 소화기, 구둣주걱</p>
									</div>
								</li>
							</ul>
						</div>
				</div>
</section>

	<section class="section bg-image overlay" style="background-image: url('../images/hero_4.jpg');">
        <div class="container" >
          <div class="row align-items-center">
            <div class="col-12 col-md-6 text-center mb-4 mb-md-0 text-md-left" data-aos="fade-up">
              <h2 class="text-white font-weight-bold">A Best Place To Stay. Reserve Now!</h2>
            </div>
            <div class="col-12 col-md-6 text-center text-md-right" data-aos="fade-up" data-aos-delay="200">
              <a href="../Reservation/Reservation.jsp" class="btn btn-outline-white-primary py-3 text-white px-5">Reserve Now</a>
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
    
 <script src="../js/jquery-3.3.1.min.js"></script>
    <script src="../js/jquery-migrate-3.0.1.min.js"></script>
    <script src="../js/popper.min.js"></script>
    <script src="../js/bootstrap.min.js"></script>
    <script src="../js/owl.carousel.min.js"></script>
    <script src="../js/jquery.stellar.min.js"></script>
    <script src="../js/jquery.fancybox.min.js"></script>
    <script src="../js/aos.js"></script>
    <script src="../js/bootstrap-datepicker.js"></script> 
    <script src="../js/jquery.timepicker.min.js"></script> 
    <script src="../js/main.js"></script>
    <script  src="http://code.jquery.com/jquery-latest.min.js"></script>
    
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