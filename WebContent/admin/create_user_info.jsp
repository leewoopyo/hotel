<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        <%@ page import="hotel.*, java.text.SimpleDateFormat, java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
request.setCharacterEncoding("UTF-8");

String id = request.getParameter("id");
String passwd = request.getParameter("passwd");

out.print(id);
out.print(passwd);

hotelDAO hoteldao = hotelDAO.getInstance();

hoteldao.create_user_info(id,passwd);
%>
</body>
</html>