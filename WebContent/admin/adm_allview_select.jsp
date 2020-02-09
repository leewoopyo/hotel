<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.css" />
</head>
<body>

<div style="height:10px;"></div>


<h2>기간을 선택하세요.</h2><br>




<form action="adm_allview.jsp" method="post">
	<input type="radio" name="chk_info" id="all" value="all">전체 기간<br><br>
	<input type="radio" name="chk_info" id="Specific" value="Specific">특정 기간
	<input type="text" name="datefilter" id="period" value="" /><br><br>
	<input type="submit" value="검색">
</form>





<script type="text/javascript" src="https://cdn.jsdelivr.net/jquery/latest/jquery.min.js"></script>
<script type="text/javascript" src="https://cdn.jsdelivr.net/momentjs/latest/moment.min.js"></script>
<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.min.js"></script>

<script type="text/javascript">
$(function() {
	$('input[name="datefilter"]').daterangepicker({
		autoUpdateInput : false,
		locale : {
			cancelLabel : 'Clear'
		}
	});
	$('input[name="datefilter"]').on(
			'apply.daterangepicker',
			function(ev, picker) {
				$(this).val(
						picker.startDate.format('YYYY-MM-DD') + ' ~ '+ picker.endDate.format('YYYY-MM-DD'));
			});
	$('input[name="datefilter"]').on('cancel.daterangepicker',
			function(ev, picker) {
				$(this).val('');
			});
});

</script>
<script>
$(document).ready(function(){
    // 라디오버튼 클릭시 이벤트 발생
    $("input:radio[name=chk_info]").click(function(){ 
            // radio 버튼의 value 값이 Specific 이라면  daterangepicker 활성화
        if($("input[name=chk_info]:checked").val() == "Specific"){
            $("input:text[id=period]").attr("disabled",false);
 
            // radio 버튼의 value 값이 all이라면 daterangepicker 비활성화
        }else if($("input[name=chk_info]:checked").val() == "all"){
              $("input:text[id=period]").attr("disabled",true);
        }
    });
});
</script>

</body>
</html>