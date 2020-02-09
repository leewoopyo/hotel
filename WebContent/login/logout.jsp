<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, javax.sql.*, java.net.*, java.io.*" %>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
//세션 삭제
session.invalidate();
//out.print("로그아웃");


response.sendRedirect("../index.jsp");
%>
<!-- 돌아가기 버튼 생성 -->
<input type="button" value="이전페이지" onclick="location.href='../index.jsp'">

</body>
</html>