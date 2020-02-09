<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="hotel.*, java.text.SimpleDateFormat, java.util.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link rel="stylesheet" href="../css/bootstrap.min.css">
<!--부트스트랩 CSS 가져오기 -->
<link rel="stylesheet" href="../css/animate.css">
<!-- animate -->
<link rel="stylesheet" href="../css/owl.carousel.min.css">
<link rel="stylesheet" href="../css/aos.css">
<link rel="stylesheet" href="../css/bootstrap-datepicker.css">
<link rel="stylesheet" href="../css/jquery.timepicker.css">
<link rel="stylesheet" href="../css/fancybox.min.css">
<link rel="stylesheet" href="../fonts/ionicons/css/ionicons.min.css">
<link rel="stylesheet"
	href="../fonts/fontawesome/css/font-awesome.min.css">

<link rel="stylesheet" href="Reservation.css">
<link rel="stylesheet" href="../css/style.css">
</head>
<body>



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



	<form id="resv" action="test.jsp" method="post">
		<section class="section" style="display: inline-grid;">
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
		</section>
	</form>







	<!-- 스크립트 소스 모음  -->
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
	<!-- 이쁜 아이콘 사용하게 하는 script -->
	<script src="https://unpkg.com/ionicons@4.5.10-0/dist/ionicons.js"></script>
	<!-- 예약 페이지 개별 설정 스크립트 -->

	<script src="Reservation.js"></script>
	<script src="../js/main.js"></script>
	
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









