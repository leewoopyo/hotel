<%@page import="hotel.*"%>
<%@ page language="java" contentType="application/json; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
request.setCharacterEncoding("UTF-8");

String userid = request.getParameter("userid");
String passwd = request.getParameter("passwd");
String type = request.getParameter("type");

System.out.print(type);


System.out.print(userid);
System.out.print(passwd);

hotelDAO hoteldao = hotelDAO.getInstance();

//로그인 시 아이이랑 비밀번호 둘다 일치하는 지 확인
UserDTO userdto = hoteldao.get_user_info(userid,passwd);

//아이디가 중복 되는지 확인
int usercnt = hoteldao.get_usercnt(userid);
%>

<%if(type.equals("1")){ %>
	<%if(usercnt == 1){%>
		{"type" : "1", "message2" : "이미 사용 중인 아이디 입니다."}
	<%}else{%>
		{"type" : "2", "message2" : "사용 가능한 아이디 입니다."}
	<%}%>
<%}else{%>
	<%if(userdto == null){%>
		{"message" : "아이디 혹은 비밀번호가 일치하지 않습니다."}
	<%}else{%>
		{"message" : ""}
	<%}%>
<%}%>

