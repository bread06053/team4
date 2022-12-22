<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
</head>
<body>
<table border="1">
<tr><td>아이디, 프로필, 닉네임 , 이메일, 주소, 레벨</td></tr>
<c:forEach items="${infotable}" var="dto">	
	<tr><td>${dto.userid},${dto.profile},${dto.nickname},${dto.email},${dto.address},${dto.level}</td></tr>
	
</c:forEach>
</table>

<button onclick = "/mem/info">다운로드</button>
</body>
</html>