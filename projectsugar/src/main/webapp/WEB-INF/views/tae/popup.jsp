<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
</head>
<body>
<c:if test = "${id != null}">
회원가입시 사용한 아이디는: ${id} 입니다.
</c:if>
<c:if test = "${id == null}">
입력한 이메일이 틀리셨습니다.
</c:if>
</body>
</html>