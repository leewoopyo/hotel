<%@page import="hotel.hotelDAO"%>
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
//oneview에서 넘긴 글 번호를 가져온다
int id = Integer.parseInt(request.getParameter("id"));

System.out.print(id);

hotelDAO hoteldao = hotelDAO.getInstance();

hoteldao.delete_notice(id); 

response.sendRedirect("./adm_notice.jsp");
%>


</body>
</html>