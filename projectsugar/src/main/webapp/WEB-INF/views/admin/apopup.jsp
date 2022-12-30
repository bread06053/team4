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
	<c:forEach var="i" items="${info}">
				
				작성자 :${id }<br>
				댓글 : ${i.actext }  	<!-- 날짜값 태그 주고 화면 오른쪽으로 나오면 이쁠듯 -->	  <br>
				<c:if test = "${i.userid  == id}">
				<button onclick = "location.href='/admin/apopup1/${i.ano}/${i.acno}'">댓글 삭제</button><hr>
				</c:if>
				<hr>
				</c:forEach>
	<form method = "post" action = "/admin/apopup">
	댓글 : <input name = actext> 
	<input type = "hidden" name = "ano" value = "${asktext.ano}">
	<input type = "hidden" name = "userid" value = "${id }">
	<button type = "submit">답변 등록</button>
	</form>
</div>
</body>
</html>