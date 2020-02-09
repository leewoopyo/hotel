<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, javax.sql.*, java.net.*, java.io.*" %>    
<%@ page import="hotel.*" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
request.setCharacterEncoding("utf-8");
//login.jsp에서 값을 주었다. 
String jump = request.getParameter("jump");		//login.jsp에서 준 jump값 받기
String id = request.getParameter("id");			//id값 받기
//String passwd = request.getParameter("passwd");	//passwd값 받기

//hotelDAO hoteldao = hotelDAO.getInstance();
//UserDTO userdto = hoteldao.get_user_info(id,passwd);	//id와 passwd를 매개변수로 해당 유저 정보를 가져옴


//if(userdto.getId() != null || userdto.getPasswd() != null){
//	if(id.equals(userdto.getId()) && passwd.equals(userdto.getPasswd())){	
//	}else{
//		out.print("아이디 혹은 비밀번호 다름");	//만약 nullpointException 이 생기면 아무것도 가져오지 못한다. 해당문구 출력
%>
<!-- 만약 로그인을 잘못했으면 다시 로그인 화면으로 갈 수 있도록 버튼을 하나 생성한다. -->
<%-- <input type="button" value="로그인" onclick="location.href='login.jsp?jump=<%=jump %>'"> --%>
<%
//	return;
//	}
//}else{
//	out.print("아이디 혹은 비밀번호 다름");
%>
<!-- 만약 로그인을 잘못했으면 다시 로그인 화면으로 갈 수 있도록 버튼을 하나 생성한다. -->
<%-- <input type="button" value="로그인" onclick="location.href='login.jsp?jump=<%=jump %>'"> --%>
<%
//return;
//}

session.setAttribute("login_ok", "yes"); //login_ok세션에 yes값을 세팅한다.
session.setAttribute("login_id", id);	//login_id세션에 id를 세팅한다.id엔 로그인시 쳤던 아이디가 들어있다.
response.sendRedirect(jump);	//그리고 jump로 설정했던 URL로 이동한다.돌아갈 URL은 reservation.jsp이다. 다시 돌아가서 id체크를 할 것이다.
%>


</body>
</html>