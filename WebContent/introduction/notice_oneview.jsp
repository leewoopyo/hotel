<%@ page import="java.util.*, java.sql.*, javax.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="hotel.*, java.text.SimpleDateFormat, java.util.Calendar" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- CSS모음 -->
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
</head>
<body>

<%
request.setCharacterEncoding("UTF-8");
int id = Integer.parseInt(request.getParameter("id"));
int viewcnt = Integer.parseInt(request.getParameter("viewcnt"));
hotelDAO hoteldao = hotelDAO.getInstance();
hoteldao.updateviewcntrecord(id,viewcnt);
List<BoardDTO> onelist = hoteldao.getonelist(id);
%>

<div class="divTable viewTable">

<div class="divTableHeading">
<div class="divTableRow">
<span class="divTableHead" style="width:85%;">
<h3><%=onelist.get(0).getTitle()%></h3>
<p style="font-size: 13px;">일자 : <%=onelist.get(0).getDate()%></p>
</span>
<span class="divTableHead">
<h5>조회수</h5>
<p style="text-align: center;"><%=onelist.get(0).getViewcnt()%></p>
</span>
</div>
</div>

<div class="divTableBody">
<div class="divTableRow">
<div class="divTableCell" style="display:block; width:100%;"><%=onelist.get(0).getContent()%></div>
</div>
<div class="divTableRow">
<div id="daetguel" class="divTableCell" style="display:block; width:100%;">


<p>총 1개의 댓글</p>
<div style="display: flex;">
<textarea style="width:90%;  resize: none;"></textarea>
<button style="width: 5%; border:1px solid #a98274; background:#a98274; color: white;">남기기</button>
</div>


</div>
</div>

</div>
</div>


	<!-- 스크립트 모음 -->
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