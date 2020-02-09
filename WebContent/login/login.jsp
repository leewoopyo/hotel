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
<!-- login_test.jsp에서 jump값을 받아옴(주소값을 받아옴)-->
<%String jump = request.getParameter("jump"); %>	

<h2>로그인</h2>
<!-- post로 loginokjsp에 값을 보냄 -->
<!-- id,비밀번호, jump값을 보냄 -->
<form method="post" action="loginok.jsp">
<table>
<tr>
	<td>아이디</td>
	<td><input type="text" name="id"></td>
</tr>
<tr>
	<td>비밀번호</td>
	<td><input type="password" name="passwd"></td>
</tr>
<tr>
	<td colspan="2" align="center"><input type="submit" value="전송"></td>
</tr>

</table>
<input type="hidden" name="jump" value="<%=jump%>">
</form>

</body>
</html>