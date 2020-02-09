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
String passwd = request.getParameter("passwd");	//passwd값 받기

hotelDAO hoteldao = hotelDAO.getInstance();
UserDTO userdto = hoteldao.get_user_info(id,passwd);

try{
	id = userdto.getId();
}catch(Exception e){
	out.print("아이디 혹은 비밀번호 다름");
%>
<input type="button" value="로그인" onclick="location.href='login.jsp?jump=<%=jump %>'">
<%
	return;
}

/* //불린형 변수 선언
boolean bPassChk = false;
//id를 공백 제거 한 아이디가 admin이고 pass도 admin이면
if(id.replaceAll(" ","").equals(id) && passwd.replaceAll(" ","").equals(passwd)){
	bPassChk = true;	//불린형 변수 bpasschk는 true가 되고
}else{
	bPassChk = false;	//아니면 false가 된다.
}
//bPassChk가 true이면 login_ok세션에 yes값을 세팅한다.
if(bPassChk){ */
session.setAttribute("login_ok", "yes"); //login_ok세션에 yes값을 세팅한다.
session.setAttribute("login_id", id);	//login_id세션에 id를 세팅한다.
response.sendRedirect(jump);	//그리고 jump로 설정했던 URL로 이동한다.
/* }else{
	//그렇지 않으면 해당 문구 출력
	out.print("해당 아이디가 다릅니다.");
} 
*/
%>


</body>
</html>