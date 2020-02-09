<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="hotel.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style>
table tr{
	height:50px;	
}
table td{
	padding-left	: 20px;
	padding-right : 20px; 
}
</style>

</head>
<body>

<%
hotelDAO hoteldao = hotelDAO.getInstance();
List<UserDTO> user_list = new ArrayList<UserDTO>();
user_list = hoteldao.get_user_list();
%>

<div style="height:10px;"></div>
<!-- 로그인을 위한 회원을 만드는 부분이다. 아이디와 비밀번호를 입력 하도록 만들었다. -->
<!-- 그리고, create_user_info.jsp로 적은 값들을 보낸다.  -->
<form action="review_create_user_info.jsp" method="post" name="sampleform" onsubmit="return validation_chk();">
<table>
	<tbody>
		<tr>
			<td>*아이디</td><td>
				<input type="text" name="id" id="id">
				<input type="button" name="id_confirm" value="중복 확인" onclick="confirmid()">
				<div id="id_chk" style="display: inline-block; margin-left: 10px;"></div>
			</td>
		</tr>
		<tr>
			<td>*비밀번호</td><td><input type="password" name="passwd" id="passwd"></td>
		</tr>
		<tr>
			<td>*비밀번호 확인</td>
			<td>
			<input type="password" name="passwd_confirm" id="passwd_confirm"><div id="passchk" style="display: inline-block; margin-left: 10px;"></div>
			</td>
		</tr>
		<tr>
			<td>*이름</td><td><input type="text" name="name" id="name"></td>
		</tr>
		<tr>
			<td>전화번호</td>
			<td>
					
			<input type="text" name="first" size=4 onKeyup="autotab(this, document.sampleform.second)" maxlength=3> -
			<input type="text" name="second" size=4 onKeyup="autotab(this, document.sampleform.third)" maxlength=4> -
			<input type="text" name="third" size=5 maxlength=4>
			</td>
		</tr>
		<tr>
			<td>주소</td><td>
				<input type="text" id="sample4_postcode" name="postcode" placeholder="우편번호">
				<input type="button" onclick="sample4_execDaumPostcode()" value="우편번호 찾기"><br>
				<input type="text" id="sample4_roadAddress" name="roadaddress" placeholder="도로명주소">
				<input type="text" id="sample4_jibunAddress" name="jibunaddress" placeholder="지번주소">
				<span id="guide" style="color:#999;display:none"></span>
				<input type="text" id="sample4_extraAddress" name="extraaddress" placeholder="참고항목">
				<input type="text" id="sample4_detailAddress" name="detailaddress" placeholder="상세주소">
			</td>
		</tr>
		<tr>
			<td>이메일</td><td>
			
			
			<input type="text" name="str_email01" id="str_email01" style="width:100px">
			 @ 
			 <input type="text" name="str_email02" id="str_email02" style="width:100px;" disabled value="naver.com">
			  <select style="width:100px;margin-right:10px" name="selectEmail" id="selectEmail"> 
			  <option value="1">직접입력</option> 
			  <option value="naver.com" selected>naver.com</option> 
			  <option value="hanmail.net">hanmail.net</option> 
			  <option value="hotmail.com">hotmail.com</option> 
			  <option value="nate.com">nate.com</option> 
			  <option value="yahoo.co.kr">yahoo.co.kr</option> 
			  <option value="empas.com">empas.com</option> 
			  <option value="dreamwiz.com">dreamwiz.com</option> 
			  <option value="freechal.com">freechal.com</option> 
			  <option value="lycos.co.kr">lycos.co.kr</option> 
			  <option value="korea.com">korea.com</option> 
			  <option value="gmail.com">gmail.com</option> 
			  <option value="hanmir.com">hanmir.com</option> 
			  <option value="paran.com">paran.com</option> 
			  </select>
			
			
			</td>
		</tr>
		<tr>
			<td rowspan="2"><input type="submit" value="회원 가입"></td>
		</tr>
	</tbody>
</table>
</form>


<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.min.js"></script> 
<script src="./login.js"></script>

<script>

var is_button_press = false;		//중복 버튼을 눌렀는지 안눌렀는지
var id_chk = false;		//아이디가 중복인지 아닌지



//아이디 중복 체크
function confirmid(){
	var id = document.getElementById("id").value;
	console.log(id);
	console.log(id);
	console.log('<%=user_list.get(0).getId()%>');
	console.log('<%=user_list.get(0).getPasswd()%>');
	
	<%for(int i = 0;i<user_list.size();i++){ %>
		if(id == '<%=user_list.get(i).getId()%>'){
			id_chk = false;
		}else{
			id_chk = true;
		}
	<%}%>
	if (id_chk == true) {
		$("#id_chk").css("color", "black");
		$("#id_chk").text("사용 가능한 아이디 입니다.");
		is_button_press = true;
	} else {
		$("#id_chk").css("color", "red");
		$("#id_chk").text("아이디가 중복 됩니다.");
		is_button_press = true;
	}
}

//id적는 창이 바뀌면 다시 중복체크 하게 하는 이벤트 
$( "#id" ).change(function() {
	is_button_press = false;
});

//submit 유효성 검사
function validation_chk(){
	var id = document.getElementById("id").value;
	var passwd = document.getElementById("passwd").value;
	var passwd_confirm = document.getElementById("passwd_confirm").value;

	if(id.replace(/ /gi,'') == ''){
		alert("아이디 공백 불가");
		return false;
	}else if(is_button_press == false){
		alert("아이디 중복 확인을 해주세요.");
		return false;
	}else if(id_chk == false){
		alert("아이디가 중복 됩니다.");
		return false;
	}else if(passwd.replace(/ /gi,'') == ''){
		alert("비밀번호 공백 불가");
		return false;
	}else if(passwd != passwd_confirm){
		alert("비밀번호가 일치하지 않습니다.");
		return false;
	}
}

</script>

</body>
</html>