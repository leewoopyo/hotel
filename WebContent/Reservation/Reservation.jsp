<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="hotel.*"%>
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
    <link rel="stylesheet" href="Reservation.css">
  </head>
  <body>
  
<!-- 예약 페이지 들어올 땐 로그인을 해야만 들어올 수 있도록 한다. -->

<%
String loginOK = null;		//loginOK변수 생성(로그인 상태를 나타냄)
String jumpURL = "../login/login.jsp?jump=../Reservation/Reservation.jsp";	//jumpURL로 이동할 URL 설정(login.jsp로 가고 jump라는 파라메터 값을 보낸다.)
loginOK = (String)session.getAttribute("login_ok");	//login_ok라는 세션값을 가져옴(로그인이 되었다면 yes값이 들어온다)
if(loginOK == null){
	response.sendRedirect(jumpURL); //loginOK가 null값이면 위에 설정한 URL로 이동
	return;
}
if(!loginOK.equals("yes")){
	response.sendRedirect(jumpURL); //loginOK가 yes가 아니라도  위에 설정한 URL로 이동
	return;
}
%>  

<!-- ****************************헤더 시작*****************************  -->
<!-- 상당의 흰색 바를 나타내는 부분 -->
	<header class="site-header js-site-header">
	<!-- 반응형 설정을 위해  container 쿨래스를 가져옴 -->
      <div class="container-fluid">
        <div class="row align-items-center">
        <!-- 제목 나타내는 영역 -->
          <div class="col-12 col-lg-12 site-logo" data-aos="fade"><a href="../index.jsp">JOA HOTEL</a>
          <!-- 만약 sessio영역에서 login_id객체의 값이 admin이면 (admin을 관리자 계정으로 설정 했다면)관리자 페이지가 뜨는 링크가 생긴다.  -->
          
          <%if(session.getAttribute("login_id").equals("admin")){ %>
          	<a href="../admin/adm_main.html" style="left: 60%; position: sticky;">관리자 페이지</a>       
          <%} %>
          
          <!-- 만약 session에서 login_ok객체의 값이 yes이면(즉, 로그인 상태 이면 ), 로그아웃 창이 뜨게 한다.  -->
          <%if(session.getAttribute("login_ok").equals("yes")){ %>
          	<a href="../login/logout.jsp" style="left: 90%; position: sticky;">LOG OUT</a></div>         
          <%} %>
        </div>
      </div>
    </header>
<!-- ****************************헤더 끝*****************************  -->
<!-- ****************************헤더 밑 배너 부분 *****************************  -->
    <section class="inner-page bg-image overlay" style="height:300px; min-height: 300px; background-image: url(../banner/banner1.jpg); background-size: cover;" data-stellar-background-ratio="0.5">
      <div class="container" style="height:300px;">
        <div class="row site-hero-inner justify-content-center align-items-center" style="height:300px;">
          <div class="col-md-10 text-center" style="top:50px;" data-aos="fade">
            <h1 class="heading mb-3">Reservation</h1>
            <ul class="custom-breadcrumbs mb-4">
              <li><a href="../index.jsp" style="font-size:20px;">Main</a></li>
              <li>&bullet;</li>
              <li>Reservation</li>
            </ul>
          </div>
        </div>
      </div>  
    </section>
<!-- ****************************배너 끝*****************************  -->


<!-------------------------------------------------------------------본문 ---------------------------------------------------------------------------->
<section class="section " id="dgwrap-content" style="margin: 3% 10% 3% 10%;">



<!-- 이번달과 다음달의 상태를 알아야 함 -->
<%
//calendar클래스를 가져와서 시스템 시간을 가져온다.
//SimpleDateFormat format1 = new SimpleDateFormat("yyyy-MM-dd");
Calendar cal = Calendar.getInstance();

//오늘 연도, 달, 날짜, 요일, 달의 마지막날을 나타내는 변수
int year =  cal.get(Calendar.YEAR);	//이번 연도
int month = cal.get(Calendar.MONTH);	//이번 달 
int today = cal.get(Calendar.DATE);	//오늘 날짜
int date = cal.get(Calendar.DAY_OF_WEEK);	//이번주 요일
int lastday = cal.getActualMaximum(Calendar.DAY_OF_MONTH);	//이번달 마지막 날
//7일이 지나면 줄바꿈을 해주는 함수
int linecnt = 0;
//그 주에 앞쪽 공백이 있나 없나 확인하는 변수(0: 공백 있음, 1: 공백 없음)
int linechange = 0;

//현황을 알기 위해서 if조건을 줘야하기 때문에 
hotelDAO hoteldao = hotelDAO.getInstance();
List<hotelDTO> totallist = new ArrayList<hotelDTO>();
List<hotelDTO> getresvlist = new ArrayList<hotelDTO>();
getresvlist = hoteldao.getresvlist();


totallist = hoteldao.getlist();

//예약 여부에 따라 링크여부,스타일 등 지정
String booked1 = "예약 가능";
String booked2 = "예약 가능";
String booked3 = "예약 가능";
String link1 = "href=\"#\" onclick"; 
String link2 = "href=\"#\" onclick"; 
String link3 = "href=\"#\" onclick"; 
String style1 = "";
String style2 = "";
String style3 = "";
%>

<!-- 이번 달의 예약 현황 -->
<!-- 테이블로 달력 모양을 표현한다. -->
<%for(int i=0;i<2;i++){ %>
<!-- 해당 요일 표시 해주고 -->
<h2><%out.print(cal.get(Calendar.YEAR) + "년" + (month+1) + "월"); %></h2>
<table style="">
	<!-- thead에는 분류 이름과 요일을 나타낸다.  -->
	<thead>
		<tr>
			<th>객실 정보</th>
			<th>일</th>
			<th>월</th>
			<th>화</th>
			<th>수</th>
			<th>목</th>
			<th>금</th>
			<th>토</th>
		</tr>
	</thead>
	<!-- tbody : 오늘부터의 날짜부터 이번달의 달력을  표시한다. -->
	<tbody>
	<!--달력 표시 부분   -->
	<!-- 전체를 while반복을 통해서  반복문의 전체반복을 해준다.-->
	<%while(true){ %>
		<tr>
		<td>
		<div class="type" style="">			
		<div style="height:15px;"></div>		<!-- 크기를 맞춰주기 위해서 설정한 div -->
		<div style="">스탠다드</div>				<!-- 왼쪽 끝 분류 표시 -->
		<div style="">스위트</div>
		<div style="">로열</div>
		</div>
		</td>
		<!-- 반복문을 통해 일주일의 예약 상황을 표시해야 한다. -->
		<!-- linechange 조건에 따라서 date 실제데이터로 쓸지, 0으로 쓸지 정한다. 처음엔 1으로 설정해서 공백 표시 등을 해준다. -->
		<!-- linechange 가 1이면 위해서 설정한 date(요일)을 0으로 표시한다. 공백을 적지 않을 것이기 때문이다. -->
		<%
		if(linechange == 1){
			date = 0;
		}
		%>
		<!-- 빈공간을 표시하는 반복문  linechange가 0일때만 동작하게 한다.-->
		<%if(linechange == 0){ %>
			<%for(int j=1;j<date;j++){ %>
				<td><% %></td>
				<!-- 일주일 째가 되면 줄을 내리기 위해서 만든 변수를 +1 해준다 . -->
				<%linecnt++; %>
			<%} %>
		<%} %>
		<!-- 실재 내용물을 (날짜)를 표시하는 부분 이번달을 표시하기 때문에 today부터 표시하게 한다. 그리고 일단 토요일까지만 표시하게 한다. : (+7-(date-1).)-->
		<%for(int j=today;j<today+7-(date-1);j++){ %>
			<!-- j는 lastday(마지막날) 보다 작거나 같은 것을 조건으로 하여서, 달의 마지막 날을 넘기면 더이상 표시 안하게 한다 .-->
			<%if(j <= lastday){ %>
			<td>
			<!-- 날짜 표시  -->
			<div><%=j %></div>
 			<%
 			for(int k=0;k<getresvlist.size();k++){
				if(Integer.parseInt(getresvlist.get(k).getYear()) == year && Integer.parseInt(getresvlist.get(k).getMonth()) == (month+1) && Integer.parseInt(getresvlist.get(k).getDay()) == j){
					if(getresvlist.get(k).getSt() == 1){
						booked1 = "예약 불가";
						link1 = "";
						style1 = "color: crimson;";
						break;
					}else{
						booked1 = "예약 가능"; 
						link1 = "href=\"#\" onclick"; 
						style1 = ""; 
					}
				}else{
					booked1 = "예약 가능"; 
					link1 = "href=\"#\" onclick"; 
					style1 = ""; 
				}
			}
			for(int k=0;k<getresvlist.size();k++){
				if(Integer.parseInt(getresvlist.get(k).getYear()) == year && Integer.parseInt(getresvlist.get(k).getMonth()) == (month+1) && Integer.parseInt(getresvlist.get(k).getDay()) == j){
					if(getresvlist.get(k).getSu() == 1){
						booked2 = "예약 불가";
						link2 = "";
						style2 = "color: crimson;";
						break;
					}else{
						booked2 = "예약 가능"; 
						link2 = "href=\"#\" onclick"; 
						style2 = ""; 
					}
				}else{
					booked2 = "예약 가능"; 
					link2 = "href=\"#\" onclick"; 
					style2 = ""; 
				}
			}
			for(int k=0;k<getresvlist.size();k++){
				if(Integer.parseInt(getresvlist.get(k).getYear()) == year && Integer.parseInt(getresvlist.get(k).getMonth()) == (month+1) && Integer.parseInt(getresvlist.get(k).getDay()) == j){
					if(getresvlist.get(k).getRo() == 1){
						booked3 = "예약 불가";
						link3 = "";
						style3 = "color: crimson;";
						break;
					}else{
						booked3 = "예약 가능"; 
						link3 = "href=\"#\" onclick"; 
						style3 = ""; 
					}
				}else{
					booked3 = "예약 가능"; 
					link3 = "href=\"#\" onclick"; 
					style3 = ""; 
				}
			}
			%>
			
			<!-- 날짜와 방 타입을 get방식으로 넘겨준다 postparam이라는 function을 통해서 넘겨준다.  -->
				<div><a <%=link1 %>="sendparam(<%=year %>,<%=month %>,<%=j %>,'Standard Room');" style="<%=style1%>"><%=booked1 %></a></div>
				<div><a <%=link2 %>="sendparam(<%=year %>,<%=month %>,<%=j %>,'Suite Room');" style="<%=style2%>"><%=booked2 %></a></div>
				<div><a <%=link3 %>="sendparam(<%=year %>,<%=month %>,<%=j %>,'Royal Room');" style="<%=style3%>"><%=booked3 %></a></div>
			</td>
			<%} %>
			<%linecnt++; //7줄이 한줄 내리는  부분%>
			<!-- 만약 linecnt가 7로 나누어서 0이 되면 (알주일째가 되면) -->
			<!-- linechange타입을 확인하고, 그에 따라 다음줄의 시작일을 계산한다.-->
			<!-- linechange가 0이면  공백이 있는 줄이기때문에 시작 일을 계산을 해줘야 한다. 그외엔 today에 7을 더해주면 된다.-->
			<!-- 그 뒤엔 다시 tr td가 생성되야 하기 때문에 break로 반복문은 벗어난다. -->
			<%
			if(linecnt % 7 == 0){
				if(linechange == 0){
					today = today +7 -(date-1);
					linechange = 1;
				}else{
					today = today +7;
				}
				break; 
			} 
			%>
		<%} %>
		</tr>
	<%
	//만약 today보다 lastday가 더 크면 
	if(today >= lastday){ 
		//전체 반복문은 벗어난다.
		break; 
	} 
	%>		
	<%} %>	
	</tbody>
</table>
<!-- 다시 초기화 -->
<%
cal.set(Calendar.MONTH,month+1);
cal.set(Calendar.DAY_OF_MONTH,1);

//오늘 날짜, 요일, 달의 마지막날을 나타내는 변수
today = cal.get(Calendar.DATE);	//오늘 날짜
date = cal.get(Calendar.DAY_OF_WEEK);	//이번주 요일
lastday = cal.getActualMaximum(Calendar.DAY_OF_MONTH);	//이번달 마지막 날
month = cal.get(Calendar.MONTH);

//7일이 지나면 줄바꿈을 해주는 함수
linecnt = 0;
//그 주에 앞쪽 공백이 있나 없나 확인하는 변수(0:공백 있음, 1;공백 없음)
linechange = 0;
%>
<%} %>



</section>
<!-------------------------------------------------------------------본문 ---------------------------------------------------------------------------->




<!---------------------------------------------- 하단 배너 부분 ----------------------------------------------------------->
	<section class="section bg-image overlay" style="background-image: url('../images/hero_4.jpg');">
        <div class="container" >
          <div class="row align-items-center">
            <div class="col-12 col-md-6 text-center mb-4 mb-md-0 text-md-left" data-aos="fade-up">
              <h2 class="text-white font-weight-bold">A Best Place To Stay. Reserve Now!</h2>
            </div>
            <div class="col-12 col-md-6 text-center text-md-right" data-aos="fade-up" data-aos-delay="200">
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
<!---------------------------------------------- 하단 배너 부분 종료 ----------------------------------------------------------->    


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
<!-- 스크립트 작성  -->
<script>
//a태그 클릭 시 서밋하는 function
function sendparam(year,month,day,room){
	location.href="Reservation_form.jsp?year="+year+"&month="+(month+1)+"&day="+day+"&room="+room;
}
</script>  </body>
</html>