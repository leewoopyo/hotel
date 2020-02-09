<%@page import="hotel.*"%>
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
				<a href="../map/map.html" target="frame">찾아오시는길</a>
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


<!-------------------------------------------------------------------- 본문 내용 출력 부분 ----------------------------------------------------------------->

<%
//오늘 날짜 구하는 구분
SimpleDateFormat format1 = new SimpleDateFormat ("yyyy-MM-dd");
Calendar time = Calendar.getInstance();
String format_time1 = format1.format(time.getTime());

//페이지네이션을 처리하는 부분
request.setCharacterEncoding("UTF-8");
//시작데이터 위치와 몇개 출력할건지 정함(페이지네이션)
int from = 0;
int cnt = 10;
//첫 화면을 나타낼때의 if처리(페이지네이션)
if(request.getParameter("from") == null){ 
	from=0;
	cnt=10;
}else{
	from = Integer.parseInt(request.getParameter("from"));
	//cnt = Integer.parseInt(request.getParameter("cnt"));
}

hotelDAO hoteldao = hotelDAO.getInstance();
List<BoardDTO> boardlist = hoteldao.get_notice_list(from,cnt);

//페이지를 처리하는 변수
int maxcount = hoteldao.maxcount();
int pagebar = ((from+(10*cnt))-(from%(10*cnt)))/cnt-10;
//relevel을 조건으로 0일땐 화살표 없게 하나일땐 
int width;
String date;
String imgnew;
%>


<!-- 게시판 보드부분을 나타냄 -->
	<section class="section " id="dgwrap-content" data-aos="fade-up"
		style="padding: 0px;  margin: 3% 10% 3% 10%;">
		<div class="container content_middle list" id="contents"
			style="padding: 0px; margin: 0px; display: inline;">
			<h2>공지 사항</h2>
			<div class="middle_wrap">
			
			
			
<table class="blueTable">
<thead>
<tr>
<th>번호</th>
<th>제목</th>
<th>작성자</th>
<th>조회수</th>
<th>등록일</th>
</tr>
</thead>

<tbody>
<% for(int i=0;i<boardlist.size();i++){%>
<tr>

<td style="padding-left:15px;"><%=boardlist.get(i).getId()%></td>

<td style="width: 40%;">
<a href="notice_oneview.jsp?id=<%=boardlist.get(i).getId()%>&viewcnt=<%=boardlist.get(i).getViewcnt()%>" style="color:black;"><%=boardlist.get(i).getTitle()%></a>
<%if((boardlist.get(i).getDate()).equals(format_time1) && boardlist.get(i).getViewcnt() == 0){ %>
<%imgnew = "new.png";%>
<%}else{
imgnew = "";%>
<%} %>
<img src="<%=imgnew %>" style="width:25px; height:12px;">
</td>

<td><%out.print("운영자");%></td>
<td><%=boardlist.get(i).getViewcnt()%></td>
<td><%=boardlist.get(i).getDate()%></td>

</tr>
<%} %>
</tbody>
</table>


<div class="middle_btn">
</div>



<div class="paging">
	<a href='notice.jsp?from=0' class="btn first null">FIRST</a>
<%if(from >= (10*cnt)){ %>
	<a href='notice.jsp?from<%=(from-(10*cnt))-(from%(10*cnt))%>' class="btn prev null">PREV</a> 
<%}else {%>
	<a class="btn prev null">PREV</a>
<%}%>
	<span>
<%if(from >= maxcount-(maxcount%(10*cnt))){ %>
<%for(int i = 1 + pagebar; i <=10 + pagebar-(10-Math.ceil((double)maxcount%(10*cnt)/cnt)); i++){ %>
	<a href='notice.jsp?from=<%=(i-1)*cnt%>' ><%=i%></a>
<%}%>
<%}else{%>
<%for(int i = 1 + pagebar; i <=10 + pagebar; i++){ %>
	<a href='notice.jsp?from=<%=(i-1)*cnt%>' ><%=i%></a>
<%}%>
<%}%>
	</span>
<%if(from < maxcount-(maxcount%(10*cnt))){ %>
	<a href='notice.jsp?from=<%=(from+(10*cnt))-(from%(10*cnt))%>' class="btn next">NEXT</a> 
<%}else{%>
	<a class="btn next">NEXT</a>
<%}%>
	<a class="btn last" href='notice.jsp?from=<%=(int)(maxcount/cnt)*10 %>'>LAST</a>
</div>



<div class="middle_search">
	<select name="ctl00$Contents$selSearch"
		id="ctl00_Contents_selSearch">
		<option value="1">제목</option>
	</select> <label for="list_select2" class="hidden_acc">검색 필터</label> <input
		name="ctl00$Contents$inputSrch" type="text"
		id="ctl00_Contents_inputSrch" style=""> <label
for="list_input1" class="hidden_acc">검색어 입력</label> <input
type="submit" name="ctl00$Contents$SearchClick" value="검색"
onclick="return search();" id="ctl00_Contents_SearchClick"
					class="btn small_btn Clr5">
			</div>
		</div>
	</div>
</section>

<!-------------------------------------------------------------------  본문 종료  -------------------------------------------------------------------->  




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
