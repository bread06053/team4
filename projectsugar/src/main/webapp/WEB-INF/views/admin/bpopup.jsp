<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="/css/pop.css"/>
<title>Insert title here</title>
</head>
<body>
<div class="popup">
	<div class="outerbox">
	<div class="wrapper">
	<div class="header">
	<div class="title">
	<span>신고 내용</span>
	</div>
	</div>
	<div class="wrapper_body">
	<div class="no">
	<input type="hidden" name = "bno" value="${reporttext.bno}">
		<div class="header2">
		<div class="title2">
			<span>글 번호:</span> ${reporttext.pno}
		</div>
		<div class="title1">
			<span>신고 제목:</span> ${reporttext.btitle}
		</div>
		<div class="who">
			<span>신고자:</span> ${reporttext.userid}
		</div>
		<div class="line"></div>
		</div>
		<div class="text">
			${reporttext.btext}
		</div>
	</div>
	</div>
			<div class="btn">
				<button id = "deletepost">신고 글 삭제</button>
		</div>
	</div>
	</div>
</div>
<script src="https://code.jquery.com/jquery-3.6.1.min.js"></script>
<script>
$(function(){
	$("#deletepost").click(function(){
		if (!confirm("정말로 삭제 하시겠습니까?.")) {
    			return false;
			} else {
				$.ajax({url:"/tae/deletePost",
				 	data:"pno=${reporttext.pno}",
				 	method:'post'
				})
			}//if
	})//click
})//ready
</script>
</body>
</html>