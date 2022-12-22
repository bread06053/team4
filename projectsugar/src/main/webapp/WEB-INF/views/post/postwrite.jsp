<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글 쓰기</title>

</head>
<body>
<header>
</header>
<!--
<div id="center">
게시글 리스트 테이블
<div id = "title">
   <a href="community_list" class="community_list">커뮤니티</a>    
</div>
<form method="post" id="writeform" action="community_write">
 <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" /> 
   <table border="1">
      <tr>
         <td class="subject">제목 :
         <input name="ptitle" placeholder="제목을 입력해주세요" size="90" maxlength="100" required="required"/></td>
      </tr>
      <tr>
         <td class="user">작성자 : 
         <input name="userid" value="${user.user_img} ${user.id}"  ></td>   
      </tr>
      <tr>
         <td><textarea name="ptext" id="content" 
         rows="20" cols="10" 
         placeholder="내용을 입력해주세요"
         style="width : 700px" required="required"></textarea>
         </td>
      </tr>
   </table>
   <div id="button" align="center">
      <button type="submit" id="save" value="완료">완료</button>
      <button type="button" id="cancel" value="취소" onclick="location.href='community_list'">취소</button>
      <button type="button" id="list" value="목록으로" onclick="location.href='community_list'">목록으로</button>
   </div>
</form>
</div>
 -->
 <div id="center">
게시글 리스트 테이블
<div id = "title">
   <a href="postlist" class="community_list">커뮤니티</a>    
</div>
<form method="post" id="writeform" action="postwrite">
 <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" /> 
   <table border="1">
      <tr>
         <td class="subject">제목 :
         <input name="ptitle" placeholder="제목을 입력해주세요" size="90" maxlength="100" required="required"/></td>
      </tr>
      <tr>
         <td class="user">작성자 : <sec:authentication property = "principal.user.userid"></sec:authentication>
         <input type="hidden" name = "userid" value="${user.userid}"></td>   
      </tr>
      <tr>
			<tr><td><div id="smarteditor"></div></td></tr>
        	<tr><td><textarea name="ptext" id="editorTxt" 
                  rows="20" cols="10" placeholder="내용을 입력해주세요"
                  style="width: 700px">"내용을 입력해주세요"</textarea></td></tr>
                 
    </table>
   <div id="button" align="center">
      <button type="submit" id="save" value="완료">완료</button>
      <button type="button" id="cancel" value="취소" onclick="location.href='postlist'">취소</button>
      <button type="button" id="list" value="목록으로" onclick="location.href='postlist'">목록으로</button>
   </div>
</form>
</div>                 
<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
<script type="text/javascript" src="/smarteditor/js/HuskyEZCreator.js" charset="utf-8"></script>
<script>
     let oEditors = []

    smartEditor = function() {
      console.log("Naver SmartEditor")
      nhn.husky.EZCreator.createInIFrame({
        oAppRef: oEditors,
        elPlaceHolder: "editorTxt",
        sSkinURI: "/smarteditor/SmartEditor2Skin.html",
        fCreator: "createSEditor2"
      })
    } 

    $(document).ready(function() {
  
      smartEditor() 
      
      $("#save").click(function(){
    	  oEditors.getById["editorTxt"].exec("UPDATE_CONTENTS_FIELD", []);
    	  $("#writeform").submit();
      });
      
    })
  </script>
</body>
</html>