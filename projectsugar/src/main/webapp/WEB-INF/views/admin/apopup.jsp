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
	<span>문의 내용</span>
	</div>
	</div>
	<div class="wrapper_body">
	<div class="no">
	<input type="hidden" name = "bno" value="${asktext.ano}">
		<div class="header2">
		<div class="title1">
			<span>제목:</span> ${asktext.atitle}
		</div>
		<div class="who">
			<span>문의하신 분:</span> ${asktext.userid}
		</div>
		<div class="line"></div>
				</div>
		<div class="text">
			${asktext.atext}
		</div>
	</div>
	</div>
	</div>
	</div>
</div>
</body>
</html>