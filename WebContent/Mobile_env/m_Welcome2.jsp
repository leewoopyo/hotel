<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*, java.text.*" %>
<%@ page import="java.sql.*, javax.sql.*, java.net.*, java.io.*" %>
<!DOCTYPE HTML>
<html>
  <head>
    <meta charset="utf-8">
    
    <title>JOA HOTEL</title>

<!-- CSS 파일 링크 모음 -->
    <link rel="stylesheet" href="../css/bootstrap.min.css"> <!--부트스트랩 CSS 가져오기 -->
    <link rel="stylesheet" href="../css/animate.css"> <!-- animate -->
    <link rel="stylesheet" href="../css/owl.carousel.min.css">
    <link rel="stylesheet" href="../css/aos.css">
    <link rel="stylesheet" href="../css/bootstrap-datepicker.css">
    <link rel="stylesheet" href="../css/jquery.timepicker.css">
    <link rel="stylesheet" href="../css/fancybox.min.css">
    <link rel="stylesheet" href="../fonts/ionicons/css/ionicons.min.css">
    <link rel="stylesheet" href="../fonts/fontawesome/css/font-awesome.min.css">
    <!-- Theme Style -->
    <link rel="stylesheet" href="../css/style.css">
    <link rel="stylesheet" href="../css/mycss.css">
    
    <style>
    	.heading{
    		font-size : 100px;
    	}
    </style>
   
  </head>
  <body style="font-size:30px;">
  
  
  
<!-- ****************************헤더 시작*****************************  -->
<!-- 상당의 흰색 바를 나타내는 부분 -->
	<header class="site-header js-site-header">
	<!-- 반응형 설정을 위해  container 쿨래스를 가져옴 -->
      <div class="container-fluid">
        <div class="row align-items-center">
        <!-- 제목 나타내는 영역 -->
          <div class="col-8 col-lg-8 site-logo" data-aos="fade" style="display: inline-block;"><a href="../m_index.jsp">JOA HOTEL</a>
<%--           <%
          if(session.getAttribute("login_id") == null){ %>
          	<a href="./admin/adm_main.html" style="display:none; left: 60%; position: sticky;">관리자 페이지</a>       
          <%}else if(session.getAttribute("login_id").equals("admin")){ %>
          	<a href="./admin/adm_main.html" style="display:inline-block; left: 60%; position: sticky;">관리자 페이지</a>       
          <%}else{ %>
          <a href="./admin/adm_main.html" style="display:none; left: 60%; position: sticky;">관리자 페이지</a>   
          <%} %>
          <% 
          if(session.getAttribute("login_ok") == null){ 
          %>
          	  <a href="./login/logout.jsp"  id="logout" style="display:none; position: fixed; left: 100%; width: fit-content;">LOG OUT</a>
          	  <a href="./login/login.jsp?jump=../Welcome.jsp"  id="login" style="display:inline-block; position: fixed; left: 100%; width: fit-content;">LOG IN</a>      
          <%
          }else if(session.getAttribute("login_ok").equals("yes")){
          %>  
        	  <a href="./login/logout.jsp"  id="logout" style="display:inline-block; position: fixed; left: 100%; width: fit-content;">LOG OUT</a>
        	  <a href="./login/login.jsp?jump=../Welcome.jsp"  id="login" style="display:none; position: fixed; left: 100%; width: fit-content;">LOG IN</a>
          <%
          }
          %> --%>
		</div>
        </div>
      </div>
    </header>
<!-- ****************************헤더 끝*****************************  -->
<!-- ****************************헤더 밑 배너 부분 *****************************  -->
    <section class="inner-page bg-image overlay" style=" height:300px; min-height: 300px; background-image: url(../banner/banner1.jpg); background-size: cover;" data-stellar-background-ratio="0.5">
      <div class="container" style="height:300px;">
        <div class="row site-hero-inner justify-content-center align-items-center" style="height:300px;">
          <div class="col-md-10 text-center" style="top:50px;" data-aos="fade">
            <h1 class="heading mb-3" style="font-size:100px;">Welcome!</h1>
            </ul> -->
          </div>
        </div>
      </div>  
    </section>
<!-- ****************************배너 끝*****************************  -->




<!-------------------------------------------------------------------- 본문 내용 출력 부분 ----------------------------------------------------------------->
<section class="section " id="dgwrap-content" style="">
	<div class="container" data-aos="fade-up" style="margin: 0; min-width: 980px;">
		<div class="row justify-content-center text-center mb-5">
			<div class="col-md-7">
				<h2 class="heading">Intro</h2>
				<p></p>
			</div>
		</div>
		<div class="row">
			<div class="col-md-12">
				<!-- START slider -->
				<div class="mb-5">
					<div style="text-align: center;">
						<a><img src="../images/intro.jpg" alt="Image placeholder"
							class="" style="width:100%;"></a>
							
							<div style="height:20px;"><hr style="border:2px solid;"></div>
						<div class="room-infomation">
							<h2 class="blind" style="text-align: left; font-size:50px; font-weight:bold;">호텔정보</h2>
							<div class="tb-responsive view-type">
								<table class="rwd-table">
									<tbody>
										<tr style="border-top: 1px solid #aaa;">
											<th style="font-size:30px;">
아름다운 미케 비치(My Khe Beach)를 마주한 4성급 호텔로 도보 약 5분이면 해변가에 닿을 수 있으며 차량 이동 시 다낭 대성당(Nha Tho Con Ga)까지 약 8분, 오행산(Ngu Hanh Son)까지 약 10~15분가량 소요된다.
깔끔하게 꾸며진 모던한 객실에서 바다 또는 도시의 전망을 즐길 수 있으며 객실 내 편의시설로 에어컨, LCD TV, 무선 인터넷, 미니바, 커피/티 메이커 등이 완비되어 있다.
이 외에 바와 레스토랑, 베이커리 숍, 피트니스센터, 야외 수영장, 스파 시설, 회의/연회장, 노래방 등 다채로운 부대시설이 호텔 내에 마련되어 있다.</th>
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

	<section class="section bg-image overlay" style="background-image: url('../images/hero_4.jpg');">
        <div class="container" >
          <div class="row align-items-center">
            <div class="col-12 col-md-12 text-center text-md-right" data-aos="fade-up" data-aos-delay="200">
              <a href="./Reservation/m_Reservation.jsp" class="btn btn-outline-white-primary py-3 text-white px-5" 
              style="width: 100%; height: 100px; font-size: 40px;">Reserve Now</a>
            </div>
          </div>
        </div>
      </section>

    <footer class="section footer-section">
      <div class="container" style="max-width: 900px;">
        <div class="row mb-4">
          <div class="col-md-12 mb-12 pr-md-12 contact-info">
            <!-- <li>198 West 21th Street, <br> Suite 721 New York NY 10016</li> -->
                     <p><span class="d-block"><span class="ion-ios-location h5 mr-3 text-primary"></span>Address</span> <span> 369W+JM Phước Mỹ, Sơn Trà, Đà Nẵng, Việt Nam, Phường Phước Mỹ, Quận Sơn Trà, Đà Nẵng, 베트남 <br></span></p>
            <p><span class="d-block"><span class="ion-ios-telephone h5 mr-3 text-primary"style="margin-top:20px;"></span>Phone</span> <span> (+1) 435 3533</span></p>
            <p><span class="d-block"><span class="ion-ios-email h5 mr-3 text-primary"style="margin-top:20px;"></span>Email</span> <span> KOPO15@kopoctc.com</span></p>
          </div>
         
        </div>
        <div class="row pt-5">
          <p class="col-md-12 text-left">
            <!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
            Copyright &copy;<script>document.write(new Date().getFullYear());</script> All rights reserved | This template is made with <i class="icon-heart-o" aria-hidden="true"></i> by <a href="https://colorlib.com" target="_blank" >Colorlib</a>
            <!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
          </p>
        </div>
      </div>
    </footer>
    
<nav class="navbar navbar-inverse navbar-fixed-bottom">
  <div class="container">
    <div class="navbar-header">
      <a class="navbar-brand" href="#">WebSiteName</a>
    </div>
    <ul class="nav navbar-nav">
      <li class="active"><a href="#">Home</a></li>
      <li><a href="#">Page 1</a></li>
      <li><a href="#">Page 2</a></li> 
      <li><a href="#">Page 3</a></li> 
    </ul>
  </div>
</nav>
    
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
    <script src="http://code.jquery.com/jquery-latest.min.js"></script>
    
  </body>
</html>