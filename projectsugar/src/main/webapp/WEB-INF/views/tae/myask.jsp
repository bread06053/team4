<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
</head>
<body>

 <sec:authentication property = "principal.user.userid"></sec:authentication>님의 문의내역 입니다.<br>
 <table>
 <tr>
<th>글 번호</th><th>글 제목</th><th>아이디</th></tr>
<c:forEach items="${ask}" var="as">
<tr><td>${as.ano}</td><td>${as.atitle}</td><td>${as.userid}</td></tr>
</c:forEach>
</table>
</body>
</html>