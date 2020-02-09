<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="hotel.*, java.text.SimpleDateFormat, java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<link rel="stylesheet" href="../css/bootstrap.min.css">
    <link rel="stylesheet" href="../css/animate.css">
    <link rel="stylesheet" href="../css/owl.carousel.min.css">
    <link rel="stylesheet" href="../css/aos.css">
    <link rel="stylesheet" href="../css/bootstrap-datepicker.css">
    <link rel="stylesheet" href="../css/jquery.timepicker.css">
    <link rel="stylesheet" href="../css/fancybox.min.css">
    <link rel="stylesheet" href="../fonts/ionicons/css/ionicons.min.css">
    <link rel="stylesheet" href="../fonts/fontawesome/css/font-awesome.min.css">
    <!-- Theme Style -->
    <link rel="stylesheet" href="../css/style.css">
    <link rel="stylesheet" href="../css/mycss.css">
<style>

table{
	border:1px solid;
}
table td, table th{
	border:1px solid;
}

</style>
</head>
<body>
<%
request.setCharacterEncoding("UTF-8");

String type = request.getParameter("chk_info");
String period = request.getParameter("datefilter");

//out.print(type);
//out.print(period);
//out.print(chk_in);
//out.print(chk_out);
String where_condition = " ";
if(type.equals("all")){
	where_condition = " ";	
}else if(type.equals("Specific")){
	String chk_in = period.substring(0, 10);	//체크인
	String chk_out = period.substring(12, 23);	//체크아웃
	where_condition="WHERE e.resv_date BETWEEN '"+chk_in+"' AND '"+chk_out+"'";	
}
%>
<!-- 예약된 전체 현황을 알 수 있게 해주는 리스트이다. -->
<%
hotelDAO hoteldao = hotelDAO.getInstance();
List<hotelDTO> getnamelist = new ArrayList<hotelDTO>();
getnamelist = hoteldao.getnamelist(where_condition);		//날짜와 각 방에 예약한 예약자 이름을 표시한다.
%>
<!-- 표 형식으로 전체 예약지를 표시함 -->
<div>
<table style="width: 70%;">
	<thead>
		<tr>
			<th>예약일자</th>
			<th>Standard Room</th>
			<th>Suite Room</th>
			<th>Royal Room</th>			
		</tr>
	</thead>
	<tbody>
	<!-- 반복문을 돌려서 리스트를 한줄찍 표시한다. -->
	<%for(int i = 0; i < getnamelist.size();i++){ %>
		<tr>
			<td><%=getnamelist.get(i).getResv_date() %></td> <!-- 해당 날짜 표시  -->
			<td><%=getnamelist.get(i).getName1() %></td>	<!-- Standard Room 예약자 표시  -->
			<td><%=getnamelist.get(i).getName2() %></td>	<!-- Suite Room 예약자 표시  -->
			<td><%=getnamelist.get(i).getName3() %></td>	<!-- Royal Room 예약자 표시  -->	
		</tr>
	<%} %>	
	</tbody>
</table>
</div>

 <script src="../js/jquery-3.3.1.min.js"></script>
    <script src="../js/jquery-migrate-3.0.1.min.js"></script>
    <script src="../js/popper.min.js"></script>
    <script src="../js/bootstrap.min.js"></script>
    <script src="../js/owl.carousel.min.js"></script>
    <script src="../js/jquery.stellar.min.js"></script>
    <script src="../js/jquery.fancybox.min.js"></script>
    <script src="../js/aos.js"></script>
    <script src="../js/bootstrap-datepicker.js"></script> 
    <script src="../js/jquery.timepicker.min.js"></script> 
    <script src="../js/main.js"></script>
    <script  src="http://code.jquery.com/jquery-latest.min.js"></script>
</body>
</html>