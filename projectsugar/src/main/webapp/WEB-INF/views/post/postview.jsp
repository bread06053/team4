<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시물 보기</title>
<style>
   #chooseFile {
       visibility: hidden;
   }
   table {
      width: 800px;
      height: 400px;
      margin-left: 50px;
   }
   img-button {
      width:20;
      height:20;
   
   }
   textarea {
      width:100%;
      height:100%;
      border: 0;
      resize: none;
   }
</style>
</head>
<body>

<div id = "title">
   <a href="/community/community_list" class="community_list">커뮤니티</a>    
</div>
<hr>
<form id="viewpost">
<table border="1" class="table">
<tr>
<td>제목 : ${dto.ptitle}</td>
</tr>
<tr>
<td>
<pre><b>작성자 : ${dto.userid}                     작성일 : ${dto.ptime}      조회수 : ${dto.pview}</b>
</pre>
</td>
</tr>
<tr height ="300">
<td>
${dto.ptext}
</td>
</tr>

</table>
</form>
      <a href="/community/community_update/${dto.pno}">글 수정 </a> 
      <a id="${dto.pno}" href="#">글 삭제</a>
      <button type="button" onclick="location.href='/community/community_list'">목록으로</button>
</body>
</html>