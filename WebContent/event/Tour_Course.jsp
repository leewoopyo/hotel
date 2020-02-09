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
				<h2 class="heading">Tour Course</h2>
				<p>다낭에서의 다양한 구경거리가 있습니다.</p>
			</div>
		</div>
		<div class="row">
			<div class="col-md-12">
				<!-- START slider -->
				<div class="home-slider major-caousel owl-carousel mb-5">
					<div class="slider-item">
						<a><img src="Tour_Course1.jpg" alt="Image placeholder"
							class="img-fluid"></a>
						<div class="room-infomation">
							<h2 class="blind">흥부엉 거리(Hung Vuong Street)</h2>
							<div class="tb-responsive view-type">
								<table class="rwd-table">
									<tbody>
										<tr style="border-top: 1px solid #aaa;">
											<th style="font-size:20px;">다낭에서 가장 활기 넘치는 거리로 흥부엉 거리가 다낭의 중심이라고 할 수 있다. ‘베트남’ 하면 쉽게 떠올릴 수 있는 오토바이 부대 역시 이곳에선 흔한 풍경. 복잡하지만 나름의 규칙과 질서를 유지하며 도로 위를 달리는 오토바이들을 보면 저절로 사진을 찍게 된다. </th>
									</tbody>
								</table>
							</div>
						</div>
					</div>
					<div class="slider-item">
						<a><img src="Tour_Course2.jpg" alt="Image placeholder"
							class="img-fluid"></a>
						<div class="room-infomation">
							<h2 class="blind">다낭 대성당(Chinh Toa Da Nang)</h2>
							<div class="tb-responsive view-type">
								<table class="rwd-table">
									<tbody>
										<tr style="border-top: 1px solid #aaa;">
											<th style="font-size:20px;">다낭 가볼만한 곳을 대표하는, 다낭 대성당. 다낭에서 유일하게 볼 수 있는 프랑스풍 건축물이다. 분홍색 외벽과 풍향계가 달린 뾰족한 첨탑은 멀리서도 한눈에 잘 보인다. 미사가 있는 일요일에만 성당 내부에 입장할 수 있다. 성당 내부의 화려한 스테인드글라스도 눈길을 사로잡는다.</th>
									</tbody>
								</table>
							</div>
						</div>
					</div>
					<div class="slider-item">
						<a><img src="Tour_Course3.jpg" alt="Image placeholder"
							class="img-fluid"></a>
						<div class="room-infomation">
							<h2 class="blind">참 조각 박물관(Cham Sculpture Museum)</h2>
							<div class="tb-responsive view-type">
								<table class="rwd-table">
									<tbody>
										<tr style="border-top: 1px solid #aaa;">
											<th style="font-size:20px;">4~13세기 동안 인도차이나반도에서 번영했던 참파 왕국의 방대한 유물을 만날 수 있는 곳. 무려 300점이 넘는 전시품은 모두 프랑스 고고학 조사단이 발굴했다고 한다. 박물관은 크게 2동의 건물로 이루어져 있고, 시대와 양식별로 유물들이 전시되어 있다. 동남아 고고학에 관심이 있다면, 반드시 들러야 할 다낭 가볼만한 곳. </th>
									</tbody>
								</table>
							</div>
						</div>
					</div>
					<div class="slider-item">
						<a><img src="Tour_Course4.jpg" alt="Image placeholder"
							class="img-fluid"></a>
						<div class="room-infomation">
							<h2 class="blind">응우한선 (오행산)(Ngu Hanh Son)</h2>
							<div class="tb-responsive view-type">
								<table class="rwd-table">
									<tbody>
										<tr style="border-top: 1px solid #aaa;">
											<th style="font-size:20px;">다낭 최남단에 위치한 명소, 오행산. 산 전체가 대리석으로 이루어져 ‘마블 마운틴’으로도 불린다. 현지인들은 성스러운 곳으로 칭하며 이 오행산을 경외 시 하는데, 실제로 햇볕이 스며든 내부 동굴과 마주하면 성스러운 기분이 든다. </th>
									</tbody>
								</table>
							</div>
						</div>
					</div>
					<div class="slider-item">
						<a><img src="Tour_Course5.jpg" alt="Image placeholder"
							class="img-fluid"></a>
						<div class="room-infomation">
							<h2 class="blind">다낭 한시장(Han Market)</h2>
							<div class="tb-responsive view-type">
								<table class="rwd-table">
									<tbody>
										<tr style="border-top: 1px solid #aaa;">
											<th style="font-size:20px;">다낭 최대 규모의 재래시장. 현지인에게는 소중한 생필품과 식료품 시장이 되는 곳이자, 여행자에게는 멋진 기념품 시장이 되는 곳. 롯데마트, 빅씨마트와 더불어 쇼핑하기 좋은 다낭 가볼만한 곳으로 소문나있다. </th>
									</tbody>
								</table>
							</div>
						</div>
					</div>
					<div class="slider-item">
						<a><img src="Tour_Course6.jpg" alt="Image placeholder"
							class="img-fluid"></a>
						<div class="room-infomation">
							<h2 class="blind">바나힐(Banahills)</h2>
							<div class="tb-responsive view-type">
								<table class="rwd-table">
									<tbody>
										<tr style="border-top: 1px solid #aaa;">
											<th style="font-size:20px;">다낭 외곽에 자리한 테마파크, 바나힐. 1,487m 고지에 자리하고 있는 곳으로 프랑스 식민 당시에 지어진 피서지이다. 세계에서 두 번째로 길다는 케이블카를 타고 바나힐로 가게 되는데, 주변 경치는 말로 표현하기 어려울 정도로 장관이다.</th>
									</tbody>
								</table>
							</div>
						</div>
					</div>
					<div class="slider-item">
						<a><img src="Tour_Course7.jpg" alt="Image placeholder"
							class="img-fluid"></a>
						<div class="room-infomation">
							<h2 class="blind">호이안(Hoi An)</h2>
							<div class="tb-responsive view-type">
								<table class="rwd-table">
									<tbody>
										<tr style="border-top: 1px solid #aaa;">
											<th style="font-size:20px;">다낭을 찾은 여행자의 십중팔구가 호이안 방문을 염두에 두고 있을 것이다. 다낭의 주요 리조트에서 2-30분 정도면 아름다운 도시, 가장 ‘베트남스러운’ 도시로 분류되는 곳으로 정적인 풍광이 일품이다. ‘느림의 미학’을 제대로 배울 수 있는 좋은 기회도 될 것이다. 내원교, 풍흥고가, 복건회관 등이 주요 가볼만한 곳이다.</th>
									</tbody>
								</table>
							</div>
						</div>
					</div>
				</div>
				<!-- END slider -->
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