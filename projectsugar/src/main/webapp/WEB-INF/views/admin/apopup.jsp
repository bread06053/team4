<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
</head>
<body>
<c:if test = "${id != null}">
<div id = good1>회원가입시 사용한 아이디는: ${id} 입니다.</div>
</c:if>
<c:if test = "${id == null}">
<div id = good1>입력한 이메일이 틀리셨습니다.</div>
</c:if>
</body>
</html>