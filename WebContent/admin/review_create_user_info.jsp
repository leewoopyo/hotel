<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        <%@ page import="hotel.*, java.text.SimpleDateFormat, java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%

//회원 가입시의 정보들을 받아서 메서드를 통해 유저 정보를 넣는다.
request.setCharacterEncoding("UTF-8");
//생성할 id와 passwd를 받아서 변수에 넣는다. 
String id = request.getParameter("id");			//아이디
String passwd = request.getParameter("passwd");		//비밀번호

String name = request.getParameter("name");		//이름

String first = request.getParameter("first");		//전화번호1
String second = request.getParameter("second");		//전화번호2
String third = request.getParameter("third");		//전화번호3

String total_phone = first + "-" + second + "-" + third;		//전화번호 문자열 결합

String postcode = request.getParameter("postcode");			//주소1
String roadaddress = request.getParameter("roadaddress");	//주소2
String jibunaddress = request.getParameter("jibunaddress");		//주소3	
String extraaddress = request.getParameter("extraaddress");		//주소4
String detailaddress = request.getParameter("detailaddress");	//주소 5

//주소 문자열 결합
String total_addr = postcode + " " + roadaddress + " " + jibunaddress + " " + extraaddress + " " + detailaddress; 

String str_email01 = request.getParameter("str_email01");		//이메일
String str_email02 = "";

if(request.getParameter("str_email02") != null){
	//이메일 직접 입력시 
	str_email02 = request.getParameter("str_email02");		
}
//이메일 을 select박스로 선택 시
String selectEmail = request.getParameter("selectEmail");
// 이메일 문자열 결합 
String mail = str_email01 + "" + str_email02 + "@" + selectEmail;

/* out.print(id + "<br>");
out.print(passwd  + "<br>");
out.print(name  + "<br>");
out.print(total_phone  + "<br>");
out.print(total_addr  + "<br>");
out.print(mail  + "<br>");
out.print("생성완료");
 */
//DAO 클래스 객체 불러오기
hotelDAO hoteldao = hotelDAO.getInstance();
//해당 정보들을 매개변수로 insert하는 메소드
hoteldao.create_user_info(id,passwd,name,total_phone,total_addr,mail);
%>

<h2>회원가입 완료</h2>


</body>
</html>