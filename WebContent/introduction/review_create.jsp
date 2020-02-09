<%@ page import="java.util.*, java.sql.*, javax.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="hotel.*, java.text.SimpleDateFormat, java.util.Calendar" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<%
request.setCharacterEncoding("UTF-8");

String title = request.getParameter("title");	//제목
String content = request.getParameter("editor");	//내용
String userid = request.getParameter("userid");		//아이디

SimpleDateFormat format = new SimpleDateFormat ("yyyy-MM-dd");
Calendar time = Calendar.getInstance();
String date = format.format(time.getTime());	//작성일

out.print("제목 : " + title);
out.print("내용 : " + content);
out.print("아이디 : " + userid);
out.print("작성일 : " + date);

hotelDAO hoteldao = hotelDAO.getInstance();
hoteldao.insert_review(title,content,userid,date);
response.sendRedirect("review.jsp");
%>

</body>
</html>