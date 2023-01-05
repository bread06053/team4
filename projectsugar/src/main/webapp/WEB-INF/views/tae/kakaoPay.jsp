<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
</head>
<body>
<form method="post" action="/tae/kakaoPay" name="frmData">
<button type="button" id = "kakao">KaKaoPay!</button>
</form>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
$(function(){
	$("#kakao").click(function(){
		//window.open("/tae/kakaoPay", '_blank', 'width=800, height=600'); 
		
		
	var pop_title = "popupOpener" ;
		
		window.open("", pop_title,'width=800, height=600') ;
		
		var frmData = document.frmData ;
		frmData.target = pop_title ;
		frmData.action = "/tae/kakaoPay" ;
		
		frmData.submit() ;
		
	})
})
</script>
</body>
</html>