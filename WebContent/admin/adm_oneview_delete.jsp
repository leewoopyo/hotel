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

String name = request.getParameter("name"); 
String check_in =  request.getParameter("check_in"); 
String check_out = request.getParameter("check_out");
String room = request.getParameter("room");
String tell = request.getParameter("tell");

/* out.print(name);
out.print(check_in);
out.print(check_out);
out.print(room);
out.print(tell); */

hotelDAO hoteldao = hotelDAO.getInstance();
hoteldao.delete_resv(name,check_in,check_out,room);
%>
삭제 완료

</body>
</html>