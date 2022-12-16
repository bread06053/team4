<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>Document</title>
</head>
<body>
	<script>
		let msg = "${msg}";
		if(msg=="DEL_ERR")   alert("삭제되었거나 없는 게시물입니다.");
		if(msg=="DEL_OK")    alert("성공적으로 삭제되었습니다.");
	  </script>
	<table border="1">
		<tr>
			<th>번호</th>
			<th>제목</th>
			<th>신고자</th>
			<th>등록일</th>
		</tr>
		<c:forEach var="board" items="${list}">
		<tr>
			<td>${board.bno}</td>
			<td class="title"><a href="<c:url value="/admin/read?bno=${board.bno}"/>">${board.btitle}</a></td>
			<td>${board.userid}</td>
			<td>${board.btime}</td>
		</tr></c:forEach>
	</table>
</body>
</html>