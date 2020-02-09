<%@page import="hotel.*"%>
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
    
    input{
    	border:1px solid;
    }
    table tr{
		height:70px;	
	}
	table td{
		padding-left	: 20px;
		padding-right : 20px; 
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
				<div class="col-12 col-lg-12 site-logo" data-aos="fade">
					<a href="../index.jsp">JOA HOTEL</a>
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
            <h1 class="heading mb-3">Login</h1>
            <ul class="custom-breadcrumbs mb-4">
              <li><a href="../index.jsp" style="font-size:20px;">Main</a></li>
              <li>&bullet;</li>
              <li>Login</li>
            </ul>
          </div>
        </div>
      </div>  
    </section>
<!-- ****************************배너 끝*****************************  -->

<section style="height:700px;">

<%
hotelDAO hoteldao = hotelDAO.getInstance();
List<UserDTO> user_list = new ArrayList<UserDTO>();
user_list = hoteldao.get_user_list();
%>

<div style="height:10px;"></div>
<!-- 로그인을 위한 회원을 만드는 부분이다. 아이디와 비밀번호를 입력 하도록 만들었다. -->
<!-- 그리고, create_user_info.jsp로 적은 값들을 보낸다.  -->
<div style="margin-top:5%; margin-left:20%">
<form action="../admin/create_user_info.jsp" method="post" name="sampleform" onsubmit="return validation_chk();">
<table>
	<tbody>
		<tr>
			<td>*아이디</td><td>
				<input type="text" name="id" id="userid">
				<input type="button" name="id_confirm" id="sendparam" value="중복 확인">
				<div id="id_chk" style="display: inline-block; margin-left: 10px;"></div>
			</td>
		</tr>
		<tr>
			<td>*비밀번호</td><td><input type="password" name="passwd" id="passwd"></td>
		</tr>
		<tr>
			<td>*비밀번호 확인</td>
			<td>
			<input type="password" name="passwd_confirm" id="passwd_confirm"><div id="passchk" style="display: inline-block; margin-left: 10px;"></div>
			</td>
		</tr>
		<tr>
			<td>*이름</td><td><input type="text" name="name" id="name"></td>
		</tr>
		<tr>
			<td>전화번호</td>
			<td>
					
			<input type="text" name="first" size=4 onKeyup="autotab(this, document.sampleform.second)" maxlength=3> -
			<input type="text" name="second" size=4 onKeyup="autotab(this, document.sampleform.third)" maxlength=4> -
			<input type="text" name="third" size=5 maxlength=4>
			</td>
		</tr>
		<tr>
			<td>주소</td><td>
				<input type="text" id="sample4_postcode" name="postcode" placeholder="우편번호">
				<input type="button" onclick="sample4_execDaumPostcode()" value="우편번호 찾기"><br>
				<input type="text" id="sample4_roadAddress" name="roadaddress" placeholder="도로명주소">
				<input type="text" id="sample4_jibunAddress" name="jibunaddress" placeholder="지번주소">
				<span id="guide" style="color:#999;display:none"></span>
				<input type="text" id="sample4_extraAddress" name="extraaddress" placeholder="참고항목">
				<input type="text" id="sample4_detailAddress" name="detailaddress" placeholder="상세주소">
			</td>
		</tr>
		<tr>
			<td>이메일</td><td>
			
			
			<input type="text" name="str_email01" id="str_email01" style="width:100px">
			 @ 
			 <input type="text" name="str_email02" id="str_email02" style="width:100px;" disabled value="naver.com">
			  <select style="width:100px;margin-right:10px" name="selectEmail" id="selectEmail"> 
			  <option value="1">직접입력</option> 
			  <option value="naver.com" selected>naver.com</option> 
			  <option value="hanmail.net">hanmail.net</option> 
			  <option value="hotmail.com">hotmail.com</option> 
			  <option value="nate.com">nate.com</option> 
			  <option value="yahoo.co.kr">yahoo.co.kr</option> 
			  <option value="empas.com">empas.com</option> 
			  <option value="dreamwiz.com">dreamwiz.com</option> 
			  <option value="freechal.com">freechal.com</option> 
			  <option value="lycos.co.kr">lycos.co.kr</option> 
			  <option value="korea.com">korea.com</option> 
			  <option value="gmail.com">gmail.com</option> 
			  <option value="hanmir.com">hanmir.com</option> 
			  <option value="paran.com">paran.com</option> 
			  </select>
			
			
			</td>
		</tr>
		<tr>
			<td rowspan="2"><input type="submit" value="회원 가입"></td>
		</tr>
	</tbody>
</table>
</form>
</div>
</section>

<!-- 하단 배너 부분 -->
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
    
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.min.js"></script> 
<script src="../admin/login.js"></script>

<script>

var is_button_press = false;		//중복 버튼을 눌렀는지 안눌렀는지
var id_chk = true;		//아이디가 중복인지 아닌지

<%-- //아이디 중복 체크
function confirmid(){
	//적은 아이디 값을 가져와서 
	var id = document.getElementById("id").value;
	
	//리스트에 담긴 아이디 데이터를 확인한다.
	<%for(int i = 0;i<user_list.size();i++){ %>
	//만약 적은 아이디가 리스트의 아이디와 일치하는 것이 있다면
		if(id == '<%=user_list.get(i).getId()%>'){
			//false를 반환하고 (중복이 있어서 사용 불가)
			id_chk = false;
		}else{
			//그렇지 않으면 true를 반환한다.(중복이 없어서 사용 가능)
			id_chk = true;
		}
	<%}%>
	//id_chk가 ture면, 아이디 사용 가능
	if (id_chk == true) {
		$("#id_chk").css("color", "black");
		$("#id_chk").text("사용 가능한 아이디 입니다.");
		//그리고 무조건 중복 체크할 수 있도록한다.
		is_button_press = true;
	} else {
		$("#id_chk").css("color", "red");
		$("#id_chk").text("아이디가 중복 됩니다.");
		//그리고 무조건 중복 체크할 수 있도록한다.
		is_button_press = true;
	}
} --%>


//아이디 중복 체크
        $(document).ready(function(){
            //id가 sendparam 이라는 태그를 클릭하면 
            $("#sendparam").click(function() {
            	// 보내고자 하는 정보들을 json 형태로 담음
            	// 수정전 정보와 수정하고자 하는 정보를 함께 담았음
                var Params = {                    
                        "userid" : $('input[id="userid"]').val(), 	//아이디
                        "type" : "1"
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
                    url         :   "./userid_check.jsp",
                    dataType    :   "json",
                    contentType :   "application/x-www-form-urlencoded; charset=UTF-8",
                    type        :   "post",
                    data        :   Params,
                    success     :   function(json){
							if(json.type == 1){
                        		$("#id_chk").css("color","red");
                        		$("#id_chk").text(json.message2);
							}else{
                        		$("#id_chk").css("color","black");
                        		$("#id_chk").text(json.message2);
                            }
                    },
                    error       :   function(request, status, error){
                        console.log("AJAX_ERROR");
                    }
                });
            })
        });






//id적는 창이 바뀌면 다시 중복체크 하게 하는 이벤트 
$( "#userid" ).change(function() {
	is_button_press = false;
});

//submit 유효성 검사
function validation_chk(){
	var id = document.getElementById("userid").value;
	var passwd = document.getElementById("passwd").value;
	var passwd_confirm = document.getElementById("passwd_confirm").value;

	if(id.replace(/ /gi,'') == ''){
		alert("아이디 공백 불가");
		return false;
	}else if(is_button_press == false){
		alert("아이디 중복 확인을 해주세요.");
		return false;
	}else if(id_chk == false){
		alert("아이디가 중복 됩니다.");
		return false;
	}else if(passwd.replace(/ /gi,'') == ''){
		alert("비밀번호 공백 불가");
		return false;
	}else if(passwd != passwd_confirm){
		alert("비밀번호가 일치하지 않습니다.");
		return false;
	}
}

</script>
  </body>
</html>