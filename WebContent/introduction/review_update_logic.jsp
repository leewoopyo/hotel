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
//글의 아이디와 제목, 내용을 받아와서
//아이디로 바꿀 
request.setCharacterEncoding("UTF-8");

int id = Integer.parseInt(request.getParameter("id"));
String title = request.getParameter("title");
String content = request.getParameter("editor");

out.print(id);
out.print(title);
out.print(content);

hotelDAO hoteldao = hotelDAO.getInstance();

hoteldao.update_review(id, title,content); 

response.sendRedirect("./review.jsp");
%>

</body>
</html>