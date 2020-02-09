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

<section class="section " id="dgwrap-content" style="">
	<div class="container content_middle list" id="contents" style="width:50%; height:300px;">
<!-- Reservation.jsp에서 jump값을 받아옴(주소값을 받아옴)-->
<%String jump = null;%>
<%jump = request.getParameter("jump"); %>	

<h2>로그인(테스트 아이디 : test1, 비밀번호 : 1234)</h2>
<!-- 아이디와 패스워드를 적는 부분이다. -->
<!-- 전송을 누르면 해당 정보를 보내서 값을 확인한다. -->
<!-- post로 loginok.jsp에 값을 보냄 -->
<!-- id, 비밀번호, jump값을 보냄 -->



<form method="post" id="form" action="loginok.jsp">
<table style="width: 100%;">
<tr>
	<td style="height: 80px;">아이디</td>
	<td><input type="text" name="id" id="userid"style="width:66%; border:1px solid;"></td>
</tr>
<tr>
	<td>비밀번호</td>
	<td><input type="password" name="passwd" id="passwd" style="width:66%; border:1px solid;"></td>
</tr>

<tr>
<td colspan="2" style="height: 40px; text-align:center;"><div id="text"></div></td>
</tr>
	
<tr>
	<td colspan="2" style="text-align: center;">
	<input type="button" value="로그인" id="sendparam" style="width: 20%;position: relative;border: 1px solid; border-radius: 10px; margin:0 10px 0 10px;">
	<input type="button" value="회원가입 " onclick="location.href='create_user_info.jsp'" style="width: 20%;position: relative;border: 1px solid; border-radius: 10px;  margin:0 10px 0 10px;">
	</td>
</tr>

</table>
<input type="hidden" name="jump" value="<%=jump%>">
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
    
    <script type="text/javascript" src="http://code.jquery.com/jquery-1.11.3.js"></script>
<script type="text/javascript">
        $(document).ready(function(){
            //id가 sendparam 이라는 태그를 클릭하면 
            $("#sendparam").click(function() {
            	// 보내고자 하는 정보들을 json 형태로 담음
            	// 수정전 정보와 수정하고자 하는 정보를 함께 담았음
                var Params = {                    
                        "userid" : $('input[id="userid"]').val(), 	//아이디
                        "passwd" : $('input[id="passwd"]').val(),     //비밀번호
                        "type" : "2"
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
                        //alert(json.message);
                        	if(json.message !== ''){
                        		$("#text").css("color","red");
                        		$("#text").text(json.message);
                            }else{
                            	var form = document.getElementById("form");
                            	console.log(form);
                            	form.submit();
                            }
                    },
                    error       :   function(request, status, error){
                        console.log("AJAX_ERROR");
                    }
                });
            })
        });
</script>
    
  </body>
</html>