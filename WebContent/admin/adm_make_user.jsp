<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<form action="create_user_info.jsp" method="post">
<table>
	<tbody>
		<tr>
			<td>아이디</td><td><input type="text" name="id"></td>
		</tr>
		<tr>
			<td>비밀번호</td><td><input type="text" name="passwd"></td>
		</tr>
		<tr>
			<td rowspan="2"><input type="submit" value="생성"></td>
		</tr>
	</tbody>
</table>
</form>

</body>
</html>