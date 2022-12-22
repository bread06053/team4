<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<style>
button{
width: 50px;
height: 20px;
font-size : 10px;
}
</style>
<title>Insert title here</title>
</head>
<body>
<form action="/tae/Rcpinfowrite1" method="post">
<table border="1" style = "text-align : center;" >
	<tr><td>제목</td><td><input name = "rtitle"></td>
	<tr><td>작성자</td><td><input name = "userid"></td> 
	<tr><td colspan = "2"><img src = "/profile/${Recipeinfo.profile}"/></td>
	<tr><td>내용</td><td><input name = "rinfo"></td>
	<tr><td>요리 난이도</td><td><input name = "rlevel"></td></tr>
	<tr><td>요리 시간</td><td><input name = "rtime"></td></tr>
	<tr><td>요리 팁</td><td><input name = "rtip"></td></tr>
	<tr><td>재료</td><td><input name = "rprep"></td></tr>
	<tr><td>완성 요리사진</td><td><input name = "rthumimg"></td></tr>
	<tr><td>요리 방법</td><td><input name = "rlogic"></td></tr>
	<!--  <tr><td><input type = "hidden" name = "rstate"> -->
 	<tr><td colspan = "2" align = "right"></td>
	</table>
	<a href="/chan/bestRcp">커뮤니티로 이동</a>  <button type ="submit">글 쓰기</button>
</form>
</body>
</html>