<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
</head>
<body>
<form action="/admin/rpopup1" method="post" id="reportlist">
 <input type = "hidden" name = "pno" value = "${pno}">
 <input type = "hidden" name = "userid" value = "${userid}">
 제목 : <input name = "btitle">
 내용 : <input name = "btext">

<input type="submit" id= "plzban" value="전달">
</form>
</body>
</html>