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
%>
<!-- 세션 종료 후 뒤페이지로 돌아감 -->
<script>
	history.back();
</script>

</body>
</html>