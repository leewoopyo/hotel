<%@page import="hotel.*"%>
<%@ page import="java.util.*, java.sql.*, javax.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.text.SimpleDateFormat, java.util.Calendar" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<!-- CSS 파일 링크 모음 -->
<link rel="stylesheet" href="../css/bootstrap.min.css">
<!--부트스트랩 CSS 가져오기 -->
<link rel="stylesheet" href="../css/animate.css">
<!-- animate -->
<link rel="stylesheet" href="../css/owl.carousel.min.css">
<link rel="stylesheet" href="../css/aos.css">
<link rel="stylesheet" href="../css/bootstrap-datepicker.css">
<link rel="stylesheet" href="../css/jquery.timepicker.css">
<link rel="stylesheet" href="../css/fancybox.min.css">
<link rel="stylesheet" href="../fonts/ionicons/css/ionicons.min.css">
<link rel="stylesheet"
	href="../fonts/fontawesome/css/font-awesome.min.css">
<!-- Theme Style -->
<link rel="stylesheet" href="../css/style.css">
<link rel="stylesheet" href="../css/mycss.css">



</head>
<body> 
<%
request.setCharacterEncoding("UTF-8");

int id = Integer.parseInt(request.getParameter("id"));
String title = request.getParameter("title");
String content = request.getParameter("content");


SimpleDateFormat format1 = new SimpleDateFormat ("yyyy-MM-dd");
Calendar time = Calendar.getInstance();
String format_time1 = format1.format(time.getTime());

%>

<form action="adm_notice_update_logic.jsp" method="post">
<div class="container">
<table class="table table-bordered">
    <tbody>
            <tr>
                <th>제목: </th>
                <td><input type="text" placeholder="제목을 입력하세요." name="title" value="<%=title %>" class="form-control"/></td>
            </tr>
            <tr>
                <th>내용: </th>
                <td style="height:500px;">
                <textarea name="editor" id="content"><%=content %></textarea>
                </td>
            </tr>
			<tr>
                <td colspan="2">
                    <input type="submit" value="수정" onclick="" class="pull-right" style="border:1px solid; padding:0 10px;" />
                    <input type="button" value="글 목록으로... " class="pull-right" style="border:1px solid; margin: 0 10px 0 0; padding:0 10px;" onclick="location.href='./adm_notice.jsp'"/>
                </td>
            </tr>
        </form>
    </tbody>
</table>
</div>
<input type="hidden" name="id" value="<%=id%>">
</form>
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
	<script src="https://cdn.ckeditor.com/4.13.1/standard/ckeditor.js"></script>
	<script src="../js/main.js"></script>

<script>
	//CKEditor 설정
	var editor = CKEDITOR.replace('editor');
	var content = editor.getData().length;
	CKEDITOR.config.width = '100%';
	CKEDITOR.config.height = 360;
</script>
</body>
</html>