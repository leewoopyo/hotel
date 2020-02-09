<%@ page import="java.util.*, java.sql.*, javax.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.text.SimpleDateFormat, java.util.Calendar" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<!-- CSS 파일 링크 모음 -->
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
<!-- Theme Style -->
<link rel="stylesheet" href="../css/style.css">
<link rel="stylesheet" href="../css/mycss.css">
</head>
<body>
<div style="height:10px;"></div>

  <!-- 예약 페이지 들어올 땐 로그인을 해야만 들어올 수 있도록 한다. -->
<%
String loginOK = null;		//loginOK변수 생성(로그인 상태를 나타냄)
String jumpURL = "../login/review_login.jsp?jump=../admin/adm_notice_New_content.jsp";	//jumpURL로 이동할 URL 설정(login.jsp로 가고 jump라는 파라메터 값을 보낸다.)
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
<%
SimpleDateFormat format1 = new SimpleDateFormat ("yyyy-MM-dd");
Calendar time = Calendar.getInstance();
String format_time1 = format1.format(time.getTime());
%>

<div class="container">
<table class="table table-bordered">
    <tbody>
        <form action="adm_notice_create.jsp" method="post">
            <tr>
                <th>제목: </th>
                <td><input type="text" placeholder="제목을 입력하세요." name="title" class="form-control"/></td>
            </tr>
            <tr>
                <th>내용: </th>
                <td style="height:500px;">
                <textarea name="editor" id="content" ></textarea>
                </td>
            </tr>
			<tr>
                <td colspan="2">
                    <input type="submit" value="등록" onclick="" class="pull-right" style="border:1px solid; padding:0 10px;" />
                </td>
            </tr>
            <input type="hidden" name="userid" value="<%=(String)session.getAttribute("login_id")%>">
        </form>
    </tbody>
</table>
</div>

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
	<script src="https://cdn.ckeditor.com/4.13.1/standard/ckeditor.js"></script>
	<script src="../js/main.js"></script>

<script>
	//CKEditor 설정
	var editor = CKEDITOR.replace('editor');
	var content = editor.getData().length;
	CKEDITOR.config.width = '100%';
	CKEDITOR.config.height = 360;
</script>

</body>
</html>