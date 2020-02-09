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
  	border:1px solid;
}
table th, table td{
	border:1px solid;
}
</style>
</head>
<body>

<%
hotelDAO hoteldao = hotelDAO.getInstance();
List<hotelDTO> getnamelist = new ArrayList<hotelDTO>();
getnamelist = hoteldao.getnamelist();

%>
<table>
	<thead>
		<tr>
			<th>예약일자</th>
			<th>Standard Room</th>
			<th>Suite Room</th>
			<th>Royal Room</th>			
		</tr>
	</thead>
	<tbody>
	
	<%for(int i = 0; i < getnamelist.size();i++){ %>
		<tr>
			<td><%=getnamelist.get(i).getResv_date() %></td>
			<td><%=getnamelist.get(i).getName1() %></td>
			<td><%=getnamelist.get(i).getName2() %></td>
			<td><%=getnamelist.get(i).getName3() %></td>		
		</tr>
	<%} %>	
		
		
	</tbody>
</table>

</body>
</html>