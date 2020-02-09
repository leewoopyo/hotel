<%@page import="hotel.*"%>
<%@ page language="java" contentType="application/json; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="hotel.*, java.text.SimpleDateFormat, java.util.*" %>

<%
request.setCharacterEncoding("UTF-8");


String pre_name = request.getParameter("pre_name");				//지우기 위한 이전 정보 - 이름
String pre_room = request.getParameter("pre_room");				//지우기 위한 이전 정보 - 방 정보
String pre_check_in = request.getParameter("pre_check_in");		//지우기 위한 이전 정보 - 체크인
String pre_check_out = request.getParameter("pre_check_out");	//지우기 위한 이전 정보 - 체크아웃
String pre_tell = request.getParameter("pre_tell");				//지우기 위한 이전 정보 - 전화번호

String name = request.getParameter("name");						//새로 insert하기 위한 정보 - 이름
String check_in = request.getParameter("check_in");				//새로 insert하기 위한 정보 - 체크 인 
String check_out = request.getParameter("check_out");			//새로 insert하기 위한 정보 - 체크 아웃
String room = request.getParameter("room");						//새로 insert하기 위한 정보 - 방 정보
String tell = request.getParameter("tell");						//새로 insert하기 위한 정보 - 전화번호

//체크인 과 체크아웃 사이의날짜 차이를 계산 한다 
SimpleDateFormat formatter = new SimpleDateFormat("yyyy-M-dd");
//이전 정보에 대한 일수를 구한다. 데이터를 먼저 지우기 때문에 다시 계산이 필요함
Date pre_beginDate = formatter.parse(pre_check_in);
Date pre_endDate = formatter.parse(pre_check_out);
long pre_diff = pre_endDate.getTime() - pre_beginDate.getTime();
long pre_diffDays = pre_diff / (24 * 60 * 60 * 1000);
//새로 수정할 날짜의 날 차이를 계산
Date beginDate = formatter.parse(check_in);
Date endDate = formatter.parse(check_out);
long diff = endDate.getTime() - beginDate.getTime();
long diffDays = diff / (24 * 60 * 60 * 1000);

System.out.println(pre_name);
System.out.println(pre_room);
System.out.println(pre_check_in);
System.out.println(pre_check_out);
System.out.println(name);


System.out.println(check_in);
System.out.println(check_out);
System.out.println(room);
System.out.println(tell);
System.out.println(diffDays);

hotelDAO hoteldao = hotelDAO.getInstance();
//일단 이전 예약 정보를  지우고
hoteldao.delete_resv(pre_name,pre_check_in,pre_check_out,pre_room);
//중복이 있나 먼저 체크해야함
int cnt = hoteldao.overlap_check(check_in,check_out,room);

System.out.println(cnt);

//만약 중복이 있으면
if(cnt >= 1){
	//중복이라서 수정 안함
	//미리 이전 정보를 지웠으니까 다시 이전 정보를 넣어줌
	hoteldao.addrecord(pre_name,pre_check_in,pre_room,pre_tell,pre_diffDays);
%>
{"message" : "예약일을 수정 할 수 없습니다. 다시 선택하세요"}
<%
return;
}else if(cnt == 0){
	//중복이 없으면 수정 함
	//이전 정보를 지우고
	//새로 예약 할 생각
	//방이 하나이기 때문에 해당 정보만 지우는 것이 가능하다
hoteldao.addrecord(name,check_in,room,tell,diffDays);
%>
{"message" : "수정 완료"}
<%	
}
%>




<%-- 
{
"name" : "<%=name %>",
"check_in" : "<%=check_in %>",
"check_out" : "<%=check_out %>",
"room" : "<%=room %>",
"tell" : "<%=tell %>"
} --%>
