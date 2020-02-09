<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="hotel.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*, java.text.*" %>
<%@ page import="java.sql.*, javax.sql.*, java.net.*, java.io.*, java.time.*" %>

<!DOCTYPE HTML>
<html>
  <head>
    <meta charset="utf-8">
    <title>JOA HOTEL</title>

<!-- CSS 파일 링크 모음 -->
	<link rel="stylesheet" href="../css/bootstrap.min.css">
    <link rel="stylesheet" href="../css/animate.css">
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

<!-- ****************************네비게이션 바*****************************  -->
<!-- 영역에 마우스를 hove(Jquery의 .on)r하면 아래 슬라이드(Jquery의 slidedown) 주어서 나오게 한다. -->
<section class="bg-light" style="height:100%;">
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
					<li><a href="./photo_tour.jsp">Photo Tour</a></li>
					<li><a href="./notice.jsp">notice</a></li>
					<li><a href="./review.jsp">review</a></li>
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
					<li><a href="../event/event.jsp">Event</a></li>
					<li><a href="../event/Tour_Course.jsp">Tour Course</a></li>
				</ul>
			</div>
		</div>
	</nav>
	</div>
</section>

<!-- ****************************네비게이션 바 종료 *****************************  -->
<!-------------------------------------------------------------------- 본문 내용 출력 부분 ----------------------------------------------------------------->
<section class="section " id="dgwrap-content" style="margin: 3% 10% 3% 10%;">
	<%
		request.setCharacterEncoding("UTF-8");
		int id = Integer.parseInt(request.getParameter("id"));				//글 번호를  받는다.
		int viewcnt = Integer.parseInt(request.getParameter("viewcnt"));	//조회수를 받는다.
		String userid = request.getParameter("userid");						//유저 아이디를 받는다.
			
		viewcnt = viewcnt + 1;		//해당 페이지가 불러와질 때마다 조회수를 1씩 올린다.
		hotelDAO hoteldao = hotelDAO.getInstance();		//객체 불러옴
		hoteldao.updateviewcnt_review(viewcnt, id); 	//1 올린 조회수를 가지고 업데이트 한다.
		List<BoardDTO> onelist = hoteldao.getonelist_review(id);	//해당 글 번호를 가진 글을 불러온다.
		
		LocalDateTime currentDate = LocalDateTime.now();	//현제시간 가져오기
		String today = currentDate.format(DateTimeFormatter.ofPattern("yyyy-MM-dd"));	//포맷 설정
	%>
<form method="post">
	<div class="divTable viewTable">
		<div class="divTableHeading">
			<div class="divTableRow">
				<span class="divTableHead" style="width: 85%;">
					<h3><%=onelist.get(0).getTitle()%></h3>
					<p style="font-size: 13px;">
						일자 :
						<%=onelist.get(0).getDate()%></p>
				</span> <span class="divTableHead">
					<h5>조회수</h5>
					<p style="text-align: center;"><%=onelist.get(0).getViewcnt()%></p>
				</span>
			</div>
		</div>

		<div class="divTableBody">
			<div class="divTableRow">
				<div class="divTableCell"
					style="display: block; width: 100%; height: 400px;">
					<input type="hidden" name="content" value="<%=onelist.get(0).getContent()%>"><%=onelist.get(0).getContent()%></div>
			</div>
			<div class="divTableRow" style="border-top: 2px solid #a98274;">
				<div class="divTableCell" style="display: flex;">
				
					<input type="hidden" name="id" value="<%=id%>">
					<!-- 해당 글의 수정과 삭제는 접속중인 session과 받아온 작성자 아이디가 일치 했을 경우이거나, admin일 경우에만 나오게 한다. -->
					<%
					try{
						if(session.getAttribute("login_id").equals(userid) || session.getAttribute("login_id").equals("admin")){						
					%>	
						<input type="submit" value="수정" style="width:5%; position:relative; left: 89%; border: 1px solid;" formaction="./review_update.jsp">
						<input type="submit" value="삭제" style="width:5%; position:relative; left: 90%; border: 1px solid;" formaction="./review_delete.jsp">					
					<%
					}
					}catch(Exception e){
						
					}
					%>  
				</div>
			</div>
			<div class="divTableRow">
				<div id="daetguel" class="divTableCell"
					style="display: block; width: 100%;">

					<p style="color: white;">총 0개의 댓글</p>
					<div style="display: flex;">
						<textarea id="textarea" style="width: 90%; resize: none;"></textarea>
						<button id="sendparam" style="width: 8%; border: 1px solid #a98274; background: #a98274; color: white;">남기기</button>
						
					</div>
				</div>
			</div>
		</div>
	</div>
	<div id="recomment"></div>
</form>
</section>
<!--******************************************** 본문 영역  종료************************************************* -->
<!--******************************************  하단 영역  ********************************************** -->
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
<!--******************************************  하단 영역 종료  ********************************************** -->    
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
    
    
<script>




$(document).ready(function(){

	console.log("111111");
	
    //id가 sendparam 이라는 태그를 클릭하면 
    $("#sendparam").on("click",function(event) {
    	//botton태그의 기본 속성이 ajax와 충돌하는 것 같음, 계속 새로고침이 되는 것처럼 화면리 깜박거림
    	//event.preventDefault로 botton의 속성을 지우고, 하면 정상 작동 한다.
        event.preventDefault();	
    	// 보내고자 하는 정보들을 json 형태로 담음
    	// 수정전 정보와 수정하고자 하는 정보를 함께 담았음
        var Params = {  
                "masterid" : "<%=id%>",     
				"date" : "<%=today%>",
				"content" : $("textarea").val()
            };
        // ajax 호출
        // url : 해당 경로에
        // json 형식으로
        // json으로 데이터를 보낼 때 contentType을 설정해 준다.
        // type은 전송 방식을 get으로 보낼지, post로 보낼지 성정한다.
        // data는 실제로 보내는 데이터 이다. 위에서 json 형식으로 보냈다.
        // success는 통신이 성공 했을 때의 처리
        // error 는  통신이 실패 했을 때의 처리를 한다.
        // 성공시 
        
        $.ajax({
            url         :   "./recomment.jsp",
            dataType    :   "json",
            contentType :   "application/x-www-form-urlencoded; charset=UTF-8",
            //processData : false,
            type        :   "post",
            data        :   Params,
            success     :   function(json){
                //alert(json.message);
                //console.log(json.message);
            	$("#recomment").text(json.information[0].aa);
            },
            error       :   function(request, status, error){
            	alert("AJAX_ERROR");
            }
        });
    })
});
</script>
    
    
</body>
</html>