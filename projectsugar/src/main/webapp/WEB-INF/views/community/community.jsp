<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</style>
</head>
<body>

<div id="center">
<!-- 게시글 리스트 테이블 -->
<div id = "title">
   <a href="/community/community_list" class="community_list">커뮤니티</a>    <br>
   <h2>글 수정</h2>
</div>
<form method="post" id="update" action="/community/community_update">
<%--  <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" /> --%>
 <input type="hidden" name="_method" value="put">
   <table border="1">
      <tr>
         <td class="subject">제목 :
         <input name="ptitle" value="${dto.ptitle}" size="90" maxlength="100" required="required"/>
         <input type="hidden" name="comm_no" value="${dto.pno}" /> </td>
      </tr>
      <tr>
         <td class="user">작성자 : 
         <input name="userid" value="${user.profile} ${user.userid}"> <!-- readonly  --></td>
      </tr>
      <tr>
         <td><textarea name="ptext" id="content" 
         rows="20" cols="10" 
         style="width : 700px" required="required"> ${dto.ptext} </textarea>
         </td>
      </tr>
   </table>
   <div id="button" align="center">
      <button class="save" value="완료">완료</button>
      <button type="button" class="cancel" value="취소" onclick="location.href='/community/community_list'">취소</button>
   </div>
</form>
</div>

</body>
</html>