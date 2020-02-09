<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

</head>
<body>
<form action="adm_oneview_search.jsp" method="post">
<div>검색
<select name="type">
  <option value="name">이름</option>
  <option value="room">방 정보</option>
</select>
<input type="text" name="text"><input type="submit" value="검색"></div>
</form>
<br>

</body>
</html>