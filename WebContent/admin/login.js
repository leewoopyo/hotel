//이메일 입력방식 선택 
$('#selectEmail').change(function() {
	$("#selectEmail option:selected").each(function() {
		if ($(this).val() == '1') {
			//직접입력일 경우 
			$("#str_email02").val('');
			//값 초기화 
			$("#str_email02").attr("disabled", false);
			//활성화 
		} else {
			//직접입력이 아닐경우 
			$("#str_email02").val($(this).text());
			//선택값 입력 
			$("#str_email02").attr("disabled", true);
			//비활성화
		}
	});
});

//본 예제에서는 도로명 주소 표기 방식에 대한 법령에 따라, 내려오는 데이터를 조합하여 올바른 주소를 구성하는 방법을 설명합니다.
function sample4_execDaumPostcode() {
	new daum.Postcode(
			{
				oncomplete : function(data) {
					// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

					// 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
					// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
					var roadAddr = data.roadAddress; // 도로명 주소 변수
					var extraRoadAddr = ''; // 참고 항목 변수

					// 법정동명이 있을 경우 추가한다. (법정리는 제외)
					// 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
					if (data.bname !== '' && /[동|로|가]$/g.test(data.bname)) {
						extraRoadAddr += data.bname;
					}
					// 건물명이 있고, 공동주택일 경우 추가한다.
					if (data.buildingName !== '' && data.apartment === 'Y') {
						extraRoadAddr += (extraRoadAddr !== '' ? ', '
								+ data.buildingName : data.buildingName);
					}
					// 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
					if (extraRoadAddr !== '') {
						extraRoadAddr = ' (' + extraRoadAddr + ')';
					}

					// 우편번호와 주소 정보를 해당 필드에 넣는다.
					document.getElementById('sample4_postcode').value = data.zonecode;
					document.getElementById("sample4_roadAddress").value = roadAddr;
					document.getElementById("sample4_jibunAddress").value = data.jibunAddress;

					// 참고항목 문자열이 있을 경우 해당 필드에 넣는다.
					if (roadAddr !== '') {
						document.getElementById("sample4_extraAddress").value = extraRoadAddr;
					} else {
						document.getElementById("sample4_extraAddress").value = '';
					}

					var guideTextBox = document.getElementById("guide");
					// 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
					if (data.autoRoadAddress) {
						var expRoadAddr = data.autoRoadAddress + extraRoadAddr;
						guideTextBox.innerHTML = '(예상 도로명 주소 : ' + expRoadAddr
								+ ')';
						guideTextBox.style.display = 'block';

					} else if (data.autoJibunAddress) {
						var expJibunAddr = data.autoJibunAddress;
						guideTextBox.innerHTML = '(예상 지번 주소 : ' + expJibunAddr
								+ ')';
						guideTextBox.style.display = 'block';
					} else {
						guideTextBox.innerHTML = '';
						guideTextBox.style.display = 'none';
					}
				}
			}).open();
}

//전화번호 다음 칸 넘어가는 거
function autotab(original, destination) {
	
	if (original.getAttribute && original.value.length == original.getAttribute("maxlength")){
		destination.focus()		
	}
		
}

//비밀번호 확인 시 일치하는지 여부
$("#passwd_confirm").focusout(function() {
	let passwd = $("#passwd").val();
	let passwd_confirm = $("#passwd_confirm").val();
	if (passwd == passwd_confirm) {
		$("#passchk").css("color", "black");
		$("#passchk").text("비밀번호가 일치합니다.");
	} else {
		$("#passchk").css("color", "red");
		$("#passchk").text("비밀번호가 일치하지 않습니다.");
	}
});




