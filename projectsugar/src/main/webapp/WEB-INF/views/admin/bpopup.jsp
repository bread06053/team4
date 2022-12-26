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
		<div class="title1">
			피 신고 글 번호: ${reporttext.pno}
		</div>
		<div class="title2">
			신고 제목: ${reporttext.btitle}
		</div>
		<div class="who">
			신고자: ${reporttext.userid}
		</div>
		<div class="line"></div>
		<div class="text">
			${reporttext.btext}
		</div>
	</div>
	</div>
	</div>
	</div>
</div>
</body>
</html>