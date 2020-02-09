<%@page import="hotel.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
request.setCharacterEncoding("UTF-8");

int id = Integer.parseInt(request.getParameter("id"));
String title = request.getParameter("title");
String content = request.getParameter("editor");


hotelDAO hoteldao = hotelDAO.getInstance();
hoteldao.update_notice(id, title,content); 
response.sendRedirect("./adm_notice.jsp");
%>

</body>
</html>