<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

</head>
<body>
<div style="height:10px;"></div>
<!-- 단순히 검색만 있는 부분이다. 데이터를 찾기 위해  -->
<!-- 조회할 데이터를 적어준다. -->
<!-- 이름과 방정보 둘 중 하나를 적어 action에 적은 파일에 보낼 수 있도록 했다. -->
<form action="adm_oneview_search.jsp" method="post">
<div>검색
<select name="type">
  <option value="name">이름</option>
<!--   <option value="room">방 정보</option> -->
</select>
<input type="text" name="text"><input type="submit" value="검색"></div>
</form>
<br>

</body>
</html>