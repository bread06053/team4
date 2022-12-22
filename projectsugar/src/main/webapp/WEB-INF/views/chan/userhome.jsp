<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
</head>
<body>


<sec:authorize access="hasAnyRole('ROLE_ADMIN','ROLE_MANAGER')">
<button onclick = "location.href ='/admin/admain' "> 질문 잘 받으면 강사시켜줄게</button>
</sec:authorize>



</body>
</html>