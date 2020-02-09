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
//해당 정보들을 받아서 업데이트 한다. 
request.setCharacterEncoding("UTF-8");

String name = request.getParameter("name");				//이름 
String check_in =  request.getParameter("check_in"); 	//체크인
String check_out = request.getParameter("check_out");	//체크 아웃 
String room = request.getParameter("room");				//방 정보
String tell = request.getParameter("tell");			//전화번호

hotelDAO hoteldao = hotelDAO.getInstance();
%>


<div>
<table>
	<tbody>
		<tr>
			<td>예약자 명</td><td><input type="text" name="name" value="<%=name%>"/></td>
		</tr>
		<tr>
			<td>체크인</td><td><input type="text" name="check_in" value="<%=check_in%>"/></td>
		</tr>
		<tr>
			<td>체크 아웃</td><td><input type="text" name="check_out" value="<%=check_out%>"/></td>
		</tr>
		<tr>
			<td>방 정보</td>
			<td>
			<input type="radio" name="room" value="Standard Room">Standard Room
			<input type="radio" name="room" value="Suite Room">Suite Room
			<input type="radio" name="room" value="Royal Room">Royal Room
			</td>
		</tr>
		<tr>
			<td>전화번호</td><td><input type="text" name="tell" value="<%=tell%>"/></td>
		</tr>
	</tbody>
</table>
</div>

<div>
	<input type="button" id="sendparam" value="수정">
</div>

<script type="text/javascript" src="http://code.jquery.com/jquery-1.11.3.js"></script>
<script type="text/javascript">

//전 페이지에서 내가 선택 했던 방이 선택된 채로 로드되는 function

window.onload=function(){
	var obj = document.getElementsByName("room");
	for(var i=0; i<obj.length; i++){
		if(obj[i].value == '<%=room%>'){
			obj[i].checked = true;
		}else{
			obj[i].checked = false;
		}		
	}
}


        $(document).ready(function(){
            //id가 sendparam 이라는 태그를 클릭하면 
            $("#sendparam").click(function() {
            	// 보내고자 하는 정보들을 json 형태로 담음
            	// 수정전 정보와 수정하고자 하는 정보를 함께 담았음
                var Params = {
                        "pre_name" : "<%=name%>",
                        "pre_room" : "<%=room%>",                      
                        "pre_check_in" : "<%=check_in%>",                      
                        "pre_check_out" : "<%=check_out%>",                      
                        "pre_tell" : "<%=tell%>",                      
                        "name" : $('input[name="name"]').val(), 	//이름
                        "check_in" : $('input[name="check_in"]').val(),     //체크인
                        "check_out" : $('input[name="check_out"]').val(),    //체크아웃
                        "room" : $('input[name="room"]:checked').val(),        //방 정보
                        "tell" : $('input[name="tell"]').val()        //전화번호
                    };
                
                // ajax 호출
                // url : 해당 경로에
                // json 형식으로
                // json으로 데이터를 보낼 때 contentType을 설정해 준다.
                // type은 전송 방식을 get으로 보낼지, post로 보낼지 성정한다.
                // data는 실제로 보내는 데이터 이다. 위에서 json 형식으로 보냈다.
                // success는 통신이 성공 했을 때의 처리
                // error 는  통신이 실패 했을 때의 처리를 한다.
                // 성공시 
                $.ajax({
                    url         :   "./adm_oneview_update_logic.jsp",
                    dataType    :   "json",
                    contentType :   "application/x-www-form-urlencoded; charset=UTF-8",
                    type        :   "post",
                    data        :   Params,
                    success     :   function(json){
                        alert(json.message);
                    },
                    error       :   function(request, status, error){
                        console.log("AJAX_ERROR");
                    }
                });
            })
        });
</script>


</body>
</html>