<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="hotel.*, java.text.SimpleDateFormat, java.util.*"%>
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
<%
request.setCharacterEncoding("UTF-8");
//Reservation_status에서 넘겨준 값들을 받는다.
int year = Integer.parseInt(request.getParameter("year"));
int month = Integer.parseInt(request.getParameter("month"));
int day = Integer.parseInt(request.getParameter("day"));
String room = request.getParameter("room");
//그 값들을 조합해서 DB에 넣을수 있는 데이터로 만든다.
String datestr = Integer.toString(year) + "-" + Integer.toString(month) + "-" + Integer.toString(day);

SimpleDateFormat formatter = new SimpleDateFormat("yyyy-M-dd");
Date Date = formatter.parse(datestr);
long caldate = (Date.getTime() / (24 * 60 * 60 * 1000));


hotelDAO hoteldao = hotelDAO.getInstance();

UserDTO userdto = hoteldao.get_user_info((String)session.getAttribute("login_id"));

%>

<section class="section " id="dgwrap-content" style="margin: 3% 10% 3% 10%;">


<form id="resv" action="Reservation_logic.jsp" method="post">
			<h2>예약 하기</h2>
			<div class="container" style="margin: 0px;">
				<div class="row" style="">
					<div class="col-4">
						<h3>체크인</h3>
						<div class="input_date" style="display: flex; min-width: 300px;">
							<input id="checkin" class="select" type="text" name="checkin"
								value="<%=datestr %>" readonly />
							<ion-icon name="calendar"
								style="width:50px; height:50px; left: 10%;"></ion-icon>
						</div>
					</div>
					<div class="col-4" style="margin-left: 5%;">
						<h3>체크아웃</h3>
						<div class="input_date" style="display: flex; min-width: 300px;">
							<input type="text" id="checkout_date" class="select"
								name="checkout" value="" readonly />
							<ion-icon name="calendar"
								style="width:50px; height:50px; left: 10%;"></ion-icon>
						</div>
					</div>
				</div>
				<div class="row"></div>
			</div>



			<div class="container" id="select_room" style="margin-top: 100px">
				<h2>방 선택</h2>
				<div class="row">
					<div class="col-md-6 col-lg-4">
						<a class="room"> <img src="../rooms/standard1.jpg"
							alt="Free website template" class="img-fluid mb-3">

							<div class="p-3 text-center room-info">
								<input type="checkbox" name="room" value="Standard Room"
									onclick="oneCheckbox(this)">
								<h2>Standard Room</h2>
								<span class="text-uppercase letter-spacing-1">90$ / per
									night</span>
							</div>
						</a>
					</div>
					<div class="col-md-6 col-lg-4">

						<a class="room"> <img src="../rooms/suite1.jpg"
							alt="Free website template" class="img-fluid mb-3">

							<div class="p-3 text-center room-info">
								<input type="checkbox" name="room" value="Suite Room"
									onclick="oneCheckbox(this)">
								<h2>Suite Room</h2>
								<span class="text-uppercase letter-spacing-1">120$ / per
									night</span>
							</div>
						</a>
					</div>

					<div class="col-md-6 col-lg-4">
						<a class="room"> <img src="../rooms/royal1.jpg"
							alt="Free website template" class="img-fluid mb-3">

							<div class="p-3 text-center room-info">
								<input type="checkbox" name="room" value="Royal Room"
									onclick="oneCheckbox(this)">
								<h2>Royal Room</h2>
								<span class="text-uppercase letter-spacing-1">250$ / per
									night</span>
							</div>
						</a>
					</div>


				</div>
			</div>


			<div class="container" style="margin-top: 100px;">
				<div class="row" style="">
					<div class="col-4">
						<h3>이름</h3>
						<div class="input_date" style="display: flex; min-width: 300px;">
							<input id="name" class="select" type="text" name="name" value="<%=userdto.getId() %>"
								maxlength="8" />
							<ion-icon name="contact"
								style="width:50px; height:50px; left: 10%;"></ion-icon>
						</div>
					</div>
					<div class="col-4" style="margin-left: 5%;">
						<h3>전화번호</h3>
						<div class="input_date" style="display: flex; min-width: 300px;">
							<input type="text" oninput="inputPhoneNumber(this);" id="call"
								class="select" name="call" value="<%=userdto.getTell() %>" maxlength="13">
							<ion-icon name="call" style="width:50px; height:50px; left: 10%;"></ion-icon>
						</div>
					</div>
					<div class="col-4"
						style="width: 100px; flex: 0 0 10%; padding-top: 5%;">
						<input type="button" id="bnt" value="예약"
							style="width: 100px; height: 40px;">
					</div>
				</div>
				</div>
	</form>




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
//전 페이지에서 내가 선택 했던 방이 선택된 채로 로드되는 function
window.onload=function(){
	var obj = document.getElementsByName("room");
	for(var i=0; i<obj.length; i++){
		if(obj[i].value == '<%=room%>'){
			obj[i].checked = true;
		}else{
			obj[i].checked = false;
		}		
	}
}



//날짜 체크 후 서밋하게 하는 function
$('#bnt').click(function(){
	//일자와 달을 substring으로 자르기
	var checkinmonth = $('#checkin').val().substring(5,6);		//체크인 달
	var checkoutmonth = $('#checkout_date').val().substring(5,6);		//체크아웃 달
	var checkinday = $('#checkin').val().substring(7,9);		//체크인 일
	var checkoutday = $('#checkout_date').val().substring(7,9);		//체크인 일
	var resv = document.getElementById("resv");		// 
	
 	var diffDate_1 = $('#checkin').val() instanceof Date ? $('#checkin').val() : new Date($('#checkin').val());		//체크인 문자값을 날짜 데이터로 바꿈
	var diffDate_2 = $('#checkout_date').val() instanceof Date ? $('#checkout_date').val() : new Date($('#checkout_date').val());	//체크아웃 값을 요일 데이터로 바꿈
	diffDate_1 =new Date(diffDate_1.getFullYear(), diffDate_1.getMonth()+1, diffDate_1.getDate());		//데이터 값 입력
	diffDate_2 =new Date(diffDate_2.getFullYear(), diffDate_2.getMonth()+1, diffDate_2.getDate());		//데이터 값 입력
	var diff = (diffDate_2.getTime() - diffDate_1.getTime());	//두 날의 시간 차이의 절대값 구하기
	//구해진 시간을 일자로 환산 
	diff = Math.ceil(diff / (1000 * 3600 * 24));	 


	//if문으로  위에서 자른 것 중 달 부분을 확인한다.
	if(parseInt(checkinmonth) == parseInt(checkoutmonth)){
		//달이 같으면 날짜를 확인해서 체크 인보다 체크 아웃 날이 더 크면 alert이 뜨도록 한다.
		if(parseInt(checkinday) >= parseInt(checkoutday)){
			console.log(checkinday);
			console.log(checkoutday);
			console.log("1111");
			alert("날짜 선택 입력 오류");
			return;
		}
		//달이 아얘 다르면 서밋한다.
	}else if(parseInt(checkinmonth) < parseInt(checkoutmonth)){
		
	}else{
		console.log("2222");
		alert("날짜 선택 입력 오류");
		return;
	}
 	if(diff >=14){
		alert("예약 기간은 2주를 넘길 수 없습니다.");
		return;
	}
	//이름적는 곳 input 공백과 한글 처리
	var inputname =  document.getElementById("name").value;
	var kor = /^[가-힣]+$/;

	if(inputname == ""){
		alert("공백 입력 불가");
		return;
	}
	if(kor.test(inputname) == false){
		alert("이름은 한글입력 필요");
		return;
	}
	
	resv.submit();
});

//체크박스 하나만 선택 할 수 있게 하는 function 
function oneCheckbox(a){
	//해당 페이지에 room의 name을 가진 요소들을 가져온다 
    var obj = document.getElementsByName("room");
    //name의 요소는 여러개 이기 때문에 length를 통해 갯수를 구할 수 있다.
    for(var i=0; i<obj.length; i++){
        //만약 해당 배열의 수가 매개변수로 들어온 값(this)과 다르면 
        if(obj[i] != a){
            //체크 해제한다. 즉, 같으거만 체크하고 나머지 체크해제하는거임
            obj[i].checked = false;
        }
    }
}


//전화번호 입력 창에서 '-'가 자동으로 생기는 function
function inputPhoneNumber(obj) {
	
    var number = obj.value.replace(/[^0-9]/g, "");
    var phone = "";

    if(number.length < 4) {
        return number;
    } else if(number.length < 7) {
        phone += number.substr(0, 3);
        phone += "-";
        phone += number.substr(3);
    } else if(number.length < 11) {
        phone += number.substr(0, 3);
        phone += "-";
        phone += number.substr(3, 3);
        phone += "-";
        phone += number.substr(6);
    } else {
        phone += number.substr(0, 3);
        phone += "-";
        phone += number.substr(3, 4);
        phone += "-";
        phone += number.substr(7);
    }
    obj.value = phone;
}

</script>
</body>
</html>