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
		<button style="float:right;margin-top: 10px;">피신고자 추방하기</button>
		</div>
	</div>
	</div>
</div>
</body>
</html>