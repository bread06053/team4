<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
</head>
<body>
<c:if test = "${pw != null}">
${user.name} 님의 비밀번호는 ${pw} 입니다.
</c:if>
<c:if test = "${pw == null}">
	입력한 정보가 정확하지 않습니다.
	
</c:if>

</body>
</html>