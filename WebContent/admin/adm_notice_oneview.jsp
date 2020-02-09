<%@page import="hotel.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*, java.text.*" %>
<%@ page import="java.sql.*, javax.sql.*, java.net.*, java.io.*" %>

<!DOCTYPE HTML>
<html>
  <head>
    <meta charset="utf-8">
    <title>JOA HOTEL</title>

<!-- CSS 파일 링크 모음 -->
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

<!-------------------------------------------------------------------- 본문 내용 출력 부분 ----------------------------------------------------------------->
<section class="section " id="dgwrap-content" style="margin: 3% 10% 3% 10%;">
	     
<%
request.setCharacterEncoding("UTF-8");
//파라메터 값으로 id와 조회수를 가져온다
int id = Integer.parseInt(request.getParameter("id"));
int viewcnt = Integer.parseInt(request.getParameter("viewcnt"));
//조회수를 +1 한다.
viewcnt = viewcnt + 1;	

//객체를 불러와서
hotelDAO hoteldao = hotelDAO.getInstance();
//조회수 업데이트하는 메소드를 실행하고(해당 아이디에 조회수를 업데이트)
hoteldao.updateviewcnt_notice(viewcnt,id);
//다시 해당 객체를 불러온다 
List<BoardDTO> onelist = hoteldao.getonelist_notice(id);
%>

<form method="post">
<div class="divTable viewTable">
<div class="divTableHeading">
<div class="divTableRow">
<span class="divTableHead" style="width:85%;">
<h3><input type="hidden" name="title" value="<%=onelist.get(0).getTitle()%>"><%=onelist.get(0).getTitle()%></h3>
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
<div class="divTableCell" style="display: block; width: 100%; height: 400px;"><input type="hidden" name="content" value="<%=onelist.get(0).getContent()%>"><%=onelist.get(0).getContent()%></div>
</div>
			<div class="divTableRow" style="border-top: 2px solid #a98274;">
				<div class="divTableCell" style="display: flex;">
					<input type="hidden" name="id" value="<%=id%>">
					<%
					try{
						if(session.getAttribute("login_id").equals("admin")){						
					%>	
						<input type="submit" value="수정" style="width:5%; position:relative; left: 89%; border: 1px solid;" formaction="./adm_notice_update.jsp">
						<input type="submit" value="삭제" style="width:5%; position:relative; left: 90%; border: 1px solid;" formaction="./adm_notice_delete.jsp">					
					<%
					}
					}catch(Exception e){
						
					}
					%>  
				</div>
			</div>
<div class="divTableRow">
<div id="daetguel" class="divTableCell" style="display:block; width:100%;">

<p>총 0개의 댓글</p>
<div style="display: flex;">
<textarea style="width:90%;  resize: none;"></textarea>
<button style="width: 8%; border:1px solid #a98274; background:#a98274; color: white;">남기기</button>
</div>
</div>
</div>
</div>
</div>
</form>
</section>
    
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
    
<!--      <script>
	    $( document ).ready(function() {
	        console.log( "111111" );
	        window['hotel'] = {
	    	        onClickLogin: function() {
 		    	        console.log('onClickLogin 1111');
 		    	       	  $("#logout").css("display","inline-block");
 		    	       	  $("#login").css("display","none");
		    	    }
	    	};
	    });
    </script> -->
  </body>
</html>