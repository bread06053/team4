<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="/css/rpopup.css"/>
<title>Insert title here</title>
</head>
<body>
<form class="fom1" action="/admin/rpopup1" method="post" id="reportlist">
 <input type = "hidden" name = "pno" value = "${pno}">
 <input type = "hidden" name = "userid" value = "${userid}">
 신고 제목 : <input name = "btitle" placeholder="제목을 입력하시오" class="title">
 신고 내용 : <textarea name = "btext" class="text" placeholder="내용을 입력해주세요"></textarea>

<input class="submit" type="submit" id= "plzban" value="전달">
</form>
</body>
</html>