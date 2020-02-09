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
	width:100%;
	border: 1px solid;
}
table td{
	border: 1px solid;
}

</style>
</head>
<body>
<div style="height:10px;"></div>

<%
request.setCharacterEncoding("UTF-8");
//전 페이지에서 보낸 찾는 타입(이름 혹은 방 정보)와
//적은 데이터를 받도록 하였다. 
String type = request.getParameter("type");
String text = request.getParameter("text");

/* out.print(type);
out.print(text); */

hotelDAO hoteldao = hotelDAO.getInstance();
List<hotelDTO> hoteldto = null;
//만약 type가 name(이름) 이면 , db에서 where조건이 name인 select문을 실행한 데이터가 hoteldto에 들어가게 된다.
if(type.equals("name")){
	hoteldto = hoteldao.getoneview_name(text);
}
//그렇지 않고, type변수가 room이면 , db에서 where조건이 room인 select문을 실행한 데이터가 hoteldto에 들어가게 된다.
/* }else if(type.equals("room")){
	hoteldto = hoteldao.getoneview_room(text);
} */
//조회 시 아무런 값도 없을 시 다음과 같은 문구가 출력 
try{
	hoteldto.get(0).getName();
}catch(NullPointerException e){
		out.print("해당하는 정보가 없습니다.");
		return;	
}catch(IndexOutOfBoundsException e){
	out.print("해당하는 정보가 없습니다.");
	return;
}


%>
<!-- 위에서 type에 따라 변수에 담은 결과값을 출력한 것이밑의 결과이다. -->
<%for(int i = 0; i < hoteldto.size();i ++){ %>
<!-- 반복문 안에 form태그에 class이름을 정해줌으로서 반복문에 따라 각기 다른 경로로 갈 수 있게 한다. -->
<form class="form" method="post">
<div style="margin-top:20px;" >
	<table>
		<tbody>
			<tr>
				<td>이름</td><td><input type="hidden" name="name" value="<%=hoteldto.get(i).getName() %>"><%=hoteldto.get(i).getName() %></td>
			</tr>
			<tr>
				<td>체크인</td><td><input type="hidden" name="check_in" value="<%=hoteldto.get(i).getCheck_in() %>"><%=hoteldto.get(i).getCheck_in() %></td>
			</tr>
			<tr>
				<td>체크 아웃</td><td><input type="hidden" name="check_out" value="<%=hoteldto.get(i).getCheck_out() %>"><%=hoteldto.get(i).getCheck_out() %></td>
			</tr>
			<tr>
				<td>방</td><td><input type="hidden" name="room" value="<%=hoteldto.get(i).getRoom() %>"><%=hoteldto.get(i).getRoom() %></td>
			</tr>
			<tr>
				<td>전화번호</td><td><input type="hidden" name="tell" value="<%=hoteldto.get(i).getTell_num() %>"><%=hoteldto.get(i).getTell_num() %></td>
			</tr>
		</tbody>
	</table>
</div>
</form>

<div>
	<table>
		<tbody>
			<tr>
			<!-- 수정과 삭제 2개를 다른 경로로 보내기 때문에 function을 이용해서 각가 다른 경로로 보내기로 하고-->
			<!-- 여러 출력 결과가 나오는 것을 대비해서 위 function에 index값도 매개변수로 넣어준다.  -->
				<td><input type="button" value="수정" onclick="sendparam('u',<%=i %>)"></td>
				<td><input type="button" value="삭제" onclick="sendparam('d',<%=i %>)"></td>
			</tr>
		</tbody>
	</table>
</div>
<%} %>

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

<script>
//action을 정하고 submit을 하는 function 
	function sendparam(str,index){
		//form 이름을 받는다. form에는 클래스 이름을 주어서 중복된 결과가 나올 시 index값을 매개변수로 넣어서 각기
		//다른 경로를 가지게끔 한다. 
		let form = document.getElementsByClassName("form")[index];
		
		//str매개변수가 u라면 update할 수 있도록 경로를 설정해준다. 
		if(str === 'u'){
		 	form.action = "./adm_oneview_update.jsp";
		 //str매개변수가 d이라면 delete할 수 있도록 경로를 설정한다.	
		}else if(str === 'd'){
			form.action = "./adm_oneview_delete.jsp";	
		}
		//위 설정이 끝나면 submit한다 ("()"치는것에는 주의 한다.)
		form.submit();
	}

</script>

</body>
</html>