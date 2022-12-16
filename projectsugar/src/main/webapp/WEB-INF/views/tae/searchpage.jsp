<<<<<<< HEAD
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
</head>
<body>


${q }으로/로 검색 결과를 보여줍니다.
<hr>
<ul>
<c:forEach items="${recipe}" var="dto">
	<li><a href="주소?rno=${dto.rno}"> ${dto.rtitle}</a> <br>

</c:forEach>
<hr> 
</ul>
</body>
=======
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
</head>
<body>


${q }으로/로 검색 결과를 보여줍니다.
<hr>
<ul>
<c:forEach items="${recipe}" var="dto">
	<li><a href="주소?rno=${dto.rno}"> ${dto.rtitle}</a> <br>
</c:forEach>
<hr>
</ul>
</body>
>>>>>>> branch 'master' of https://github.com/bread06053/team4
</html>