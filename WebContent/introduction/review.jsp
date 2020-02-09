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
//오늘 날짜 구하는 구분
SimpleDateFormat format1 = new SimpleDateFormat ("yyyy-MM-dd");
Calendar time = Calendar.getInstance();
String format_time1 = format1.format(time.getTime());
//페이지네이션을 처리하는 부분
request.setCharacterEncoding("UTF-8");
//시작데이터 위치와 몇개 출력할건지 정함(페이지네이션)
int from = 0;
int cnt = 10;
//첫 화면을 나타낼때의 if처리(페이지네이션)
if(request.getParameter("from") == null){ 
	from=0;
	cnt=10;
}else{
	from = Integer.parseInt(request.getParameter("from"));
	//cnt = Integer.parseInt(request.getParameter("cnt"));
}
hotelDAO hoteldao = hotelDAO.getInstance();
List<BoardDTO> boardlist = hoteldao.getlist(from,cnt);
//페이지를 처리하는 변수
int maxcount = hoteldao.maxcount();
int pagebar = ((from+(10*cnt))-(from%(10*cnt)))/cnt-10;
//relevel을 조건으로 0일땐 화살표 없게 하나일땐 
String arrow;
int width;
String date;
String imgnew;
%>


<!-- 게시판 보드부분을 나타냄 -->
	<section class="section " id="dgwrap-content" data-aos="fade-up"
		style="padding: 0px;">
		<div class="container content_middle list" id="contents"
			style="padding: 0px; margin: 0px; display: inline;">
			<h2>공지사항</h2>
			<div class="middle_wrap">
			
			
			
<table class="blueTable">
<thead>
<tr>
<th>번호</th>
<th>제목</th>
<th>조회수</th>
<th>등록일</th>
</tr>
</thead>

<tbody>
<% for(int i=0;i<boardlist.size();i++){%>
<%if(boardlist.get(i).getIsdelete() != 1){ %>
<tr>
<td><%=boardlist.get(i).getId()%></td>
<td>
<%if(boardlist.get(i).getRelevel() == 0){ %>
<%arrow = "";
width = 0;
%>
<%}else{ %>
<%arrow = "arrow.png";
width = 10;
%>
<%} %>
<img src="<%=arrow %>" style="width:<%=width%>px; height:10px; margin-left:<%=boardlist.get(i).getRelevel()*8%>px;">
<a href="gongji_view.jsp?id=<%=boardlist.get(i).getId()%>&viewcnt=<%=boardlist.get(i).getViewcnt()%>" style="color:black;"><%=boardlist.get(i).getTitle()%></a>
<%if((boardlist.get(i).getDate()).equals(format_time1) && boardlist.get(i).getViewcnt() == 0){ %>
<%imgnew = "new.png";%>
<%}else{
imgnew = "";%>
<%} %>
<img src="<%=imgnew %>" style="width:20px; height:12px;">
</td>
<td><%=boardlist.get(i).getViewcnt()%></td>
<td><%=boardlist.get(i).getDate()%></td>
</tr>

<%}else if(boardlist.get(i).getIsdelete() == 1 && hoteldao.checkdelete(boardlist.get(i).getRootid(),boardlist.get(i).getRelevel(),boardlist.get(i).getRecnt()) == 1){ %>

<tr>
<td><%=boardlist.get(i).getId()%></td>
<td style="text-decoration: line-through;">
<%if(boardlist.get(i).getRelevel() == 0){ %>
<%arrow = "";
width = 0;
%>
<%}else{ %>
<%arrow = "arrow.png";
width = 10;
%>
<%} %>
<img src="<%=arrow %>" style="width:<%=width%>px; height:10px; margin-left:<%=boardlist.get(i).getRelevel()*8%>px;">
<%if(boardlist.get(i).getRelevel() == 0){ %>
삭제된 글입니다.
<%}else{ %>
삭제된 댓글입니다.
<%} %>
</td>
<td></td>
<td></td>
</tr>
<%}else{ %>
<%}} %>
</tbody>
</table>
	

	




				<div class="middle_btn"></div>



				<div class="paging">
					<a class="btn first null">FIRST</a> <a class="btn prev null">PREV</a><span>
						<a class="selected">1</a> <a href="#">2</a> <a href="#">3</a> <a
						href="#">4</a> <a href="#">5</a> <a href="#">6</a> <a href="#">7</a>
						<a href="#">8</a> <a href="#">9</a> <a href="#">10</a>
					</span><a class="btn next" href="#">NEXT</a> <a class="btn last" href="#">LAST</a>
				</div>



				<div class="middle_search">
					<select name="ctl00$Contents$selSearch"
						id="ctl00_Contents_selSearch">
						<option value="1">제목</option>
					</select> <label for="list_select2" class="hidden_acc">검색 필터</label> <input
						name="ctl00$Contents$inputSrch" type="text"
						id="ctl00_Contents_inputSrch" style=""> <label
						for="list_input1" class="hidden_acc">검색어 입력</label> <input
						type="submit" name="ctl00$Contents$SearchClick" value="검색"
						onclick="return search();" id="ctl00_Contents_SearchClick"
						class="btn small_btn Clr5">
				</div>
			</div>
		</div>
	</section>

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