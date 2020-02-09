<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*, java.text.*" %>
<%@ page import="java.sql.*, javax.sql.*, java.net.*, java.io.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%
String loginOK = null;		//loginOK변수 생성
String jumpURL = "login.jsp?jump=login_test.jsp";	//jumpURL로 이동할 URL 설정
loginOK = (String)session.getAttribute("login_ok");	//login_ok라는 세션값을 가져옴
if(loginOK == null){
	response.sendRedirect(jumpURL); //loginOK가 null값이면 위에 설정한 URL로 이동
	return;
}
if(!loginOK.equals("yes")){
	response.sendRedirect(jumpURL); //loginOK가 yes가 아니라도  위에 설정한 URL로 이동
	return;
}
%>
</head>
<body>
<a href="logout.jsp">로그아웃</a>
</body>
</html>