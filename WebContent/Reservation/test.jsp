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

String checkin = request.getParameter("checkin"); //체크인
String checkout = request.getParameter("checkout");	//체크아웃
String room = request.getParameter("room");		//방
String name = request.getParameter("name");		//이름
String call = request.getParameter("call");		//전화 

//두 날 사이의 날짜 계산
SimpleDateFormat formatter = new SimpleDateFormat("yyyy-M-dd");
Date beginDate = formatter.parse(checkin);
Date endDate = formatter.parse(checkout);
long diff = endDate.getTime() - beginDate.getTime();
long diffDays = diff / (24 * 60 * 60 * 1000);

//out.println("날짜차이=" + diffDays);
%>
<%
//hoteldao 객체 선언
hotelDAO hoteldao = hotelDAO.getInstance();
//중복되는 날짜가 있나 체크
int check = hoteldao.getrecord(checkin, checkout, room);
if(check == 0){
	//addrecord메소드를 통한  해당 값을 insert
	hoteldao.addrecord(name,checkin,room,call,diffDays);
	//insert 끝난 후, 해당 페이지로 돌아간다.
	response.sendRedirect("Reservation_status.jsp");
}else{ 

}
%>

<script>
alert("날짜 중복이 있습니다.");
window.location.href = 'Reservation_status.jsp';
</script>

</body>
</html>