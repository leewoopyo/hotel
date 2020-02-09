<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<!-- 프레임의 왼쪽에 메뉴를  표시하는 부분이다. -->
<div>
	<form method="get">
	<a href="#" id="click1">*예약 상황</a>
	<a href="#" id="click2">*예약 조회</a>
	<a href="#" id="click3">*회원 생성</a>
	<a href="#" id="click4">*회원 조회</a>
	<a href="#" id="click5">*공지사항 작성</a>
	<a href="#" id="click6">*돌아가기</a>
	</form>
</div>

<div style="height:100px;"></div>

<div id="div1">
	<h1>관리자 페이지 입니다.</h1><br>
	***관리자 페이지 이용시 준수사항***<br>
	1.<br>
	2.<br>
	3.<br>
	4.<br>
	5.<br>
</div>
	
	
	
	
	
	
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>

<script>

$(function(){
    $('#click1').click(function(){
    	$("#div1").load("./adm_allview_select.jsp");
    });
    $('#click2').click(function(){
    	$("#div1").load("./adm_oneview.jsp");
    });
    $('#click3').click(function(){
    	$("#div1").load("./adm_make_user.jsp");
    });
    $('#click4').click(function(){
    	$("#div1").load("./adm_view_user.jsp");
    });
    $('#click5').click(function(){
    	$("#div1").load("./adm_notice_New_content.jsp");
    });
    $('#click6').click(function(){
    	$("#div1").load("../index.jsp");
    });
});



</script>

</body>
</html>