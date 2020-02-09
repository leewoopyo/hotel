<%@page import="java.util.*"%>
<%@page import="hotel.*"%>
<%@ page language="java" contentType="application/json; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
request.setCharacterEncoding("UTF-8");

hotelDAO hoteldao = hotelDAO.getInstance();		//객체 불러오기

int maxid = 0;		//가장 큰 아이디
if(hoteldao.getmaxid() == 0){	//0이면 
	maxid = 0;		//0을 넣고
}else{
	maxid = hoteldao.getmaxid();	//아니면 가장 큰 값을 가져옴
}

String masterid = request.getParameter("masterid");		//본문의 번호
String date = request.getParameter("date");				//작성일
String content = request.getParameter("content");		//댓글 내용
int rootid = maxid+1;									//원글 번호

/* System.out.println(masterid);
System.out.println(date);
System.out.println(content); */

//새로 단 댓글을 등록한다 
//hoteldao.insert_recomment(masterid, date, content, rootid);
//전체 댓글리스트를 가져온다.
List<recommentDTO> recmt = hoteldao.getlist_recomment(masterid);

/* System.out.println("123");
System.out.println(recmt.get(0).getContent());

for(int i = 0; i < recmt.size();i++){
	if(i == (recmt.size()-1)){
		System.out.print("\""+recmt.get(i).getContent()+"\"");
	}else{
		System.out.print("\""+recmt.get(i).getContent()+"\",");
	}	
} */


%>

<%-- <%//response할 데이터를 %>
{"message" : [
<%
for(int i = 0; i < recmt.size();i++){
	if(i == (recmt.size()-1)){
		out.println("\""+recmt.get(i).getContent()+"\"");
	}else{
		out.println("\""+recmt.get(i).getContent()+"\",");
	}	
}
%>
]} --%>

{"information" : [{"aa" : "11"},{"bb" : "22"}]}








