<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="hotel.*, java.text.SimpleDateFormat, java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
table{
	border: 1px solid;
}
table td{
	border: 1px solid;
}

</style>
</head>
<body>

<%
request.setCharacterEncoding("UTF-8");
String type = request.getParameter("type");
String text = request.getParameter("text");

/* out.print(type);
out.print(text); */

hotelDAO hoteldao = hotelDAO.getInstance();
hotelDTO hoteldto = null;
if(type.equals("name")){
	hoteldto = hoteldao.getoneview_name(text);
}else if(type.equals("room")){
	hoteldto = hoteldao.getoneview_room(text);
}
/* out.print(hoteldto.getName());
out.print(hoteldto.getCheck_in());
out.print(hoteldto.getCheck_out());
out.print(hoteldto.getRoom());
out.print(hoteldto.getTell_num()); */
%>
<div>
	<table>
		<tbody>
			<tr>
				<td>이름</td><td><%=hoteldto.getName() %></td>
			</tr>
			<tr>
				<td>체크인</td><td><%=hoteldto.getCheck_in() %></td>
			</tr>
			<tr>
				<td>체크 아웃</td><td><%=hoteldto.getCheck_out() %></td>
			</tr>
			<tr>
				<td>방</td><td><%=hoteldto.getRoom() %></td>
			</tr>
			<tr>
				<td>전화번호</td><td><%=hoteldto.getTell_num() %></td>
			</tr>
		</tbody>
	</table>
</div>



</body>
</html>