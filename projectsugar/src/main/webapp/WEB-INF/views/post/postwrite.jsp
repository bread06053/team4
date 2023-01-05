<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="/css/mainHeader.css"/>
<link rel="stylesheet" href="/css/postwrite.css"/>
<title>글 쓰기</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="preconnect" href="https://fonts.googleapis.com"><link rel="preconnect" href="https://fonts.gstatic.com" crossorigin><link href="https://fonts.googleapis.com/css2?family=Dongle&display=swap" rel="stylesheet">
<style>
@import url('https://fonts.googleapis.com/css2?family=Dongle&display=swap');
</style>
</head>
<body>
<header>
</header>
<div class="yoyo_top_wrap">
	<div class="yoyo_top">
	<h1>
	<a href="http://localhost:8084/chan/main">
	<img id = "sugarimg" src="/style/${all}" alt="로고">
	</a>
	</h1>
	<div class="yoyo_search">
	<form id="yoyoSearch" method="post" action="/tae/searchpage">
		<div class="input-group">

		<input id="yoyoText" name="q" type="text" class="form-control ui-autocmplete-input" placeholder values="" style="ime-mode:active;" autocomplete="off">	
		<span class="input-group-btn">
		<button class="btn btn-default" type="submit" style="padding-bottom: 8px;">
			<span class="glyphicon glyphicon-search">
			::검색
			</span>
		</button>	
		</span>
		</div>
	</form>	
</div> 
<div id = goodtaehun></div>
<div class="yoyoRight" style="position:relative">
	<div style="position: absolute; width:100px; top: 47px; left: 0; margin-left: -25px;display:none; margin:10;">
         <span style="margin: 10; padding: 10; font-size: 0; display: block; text-align: center;"><img src="" width="8"></span>
         <span style="border-radius: 2px; background: #ffd200; color: #000; display: block; font-size: 11px; padding:2px 5px; text-align: center;">회원가입</span>
    </div>
    <a href="http://localhost:8084/chan/mypage">
    <sec:authentication property = "principal.user.userid"></sec:authentication>님 안녕하세요!<br>
    <sec:authorize access = "!isAuthenticated()"/>
    <img src="/profile/<sec:authentication property = "principal.user.profile"/>">
    </a>
</div>
</div>
</div>
<div class="yoyo_navi">
            <ul class="yoyoNavi">
                <li><a href="/chan/bestRcp">Best 레시피</a>
                </li>
                <li><a href="https://www.10000recipe.com/recipe/list.html">나만의 레시피</a>
                </li>
                <li><a href="/post/postlist">커뮤니티</a>
                </li>
            </ul>
        </div>
 <form method="post" id="writeform" action="postwrite">
  <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" /> 
<div class="WritingWrap">
	<div class="WritingHeader">
		<h2 class="title"><span style="color:peru;">커뮤니티</span> 글쓰기</h2>
		<div class="tool_area">
			<button type="submit" id="save" value="완료">등록</button>
			<button type="button" id="cancel" value="취소" onclick="location.href='/post/postlist'">취소</button>	
		</div>
	</div>
	<div class="WritingContent">
		<div class="WritingEditor">
			<div class="row">
				<div class="FlexableTextArea">
					<input name="ptitle" class="textarea_input" placeholder="제목을 입력해주세요" style="height:40px;" required="required"/>
				</div>
				<div class="row">
			    <div class="user">작성자 : <sec:authentication property = "principal.user.userid"></sec:authentication>
         		<input type="hidden" name = "userid" value="${id}">
         		</div>
			</div>
			</div>
			<div id="smarteditor" class="CafeEditor"></div>
			<textarea name="ptext" id="editorTxt" 
                  rows="20" cols="10" placeholder="내용을 입력해주세요"
                  style="width: 860px"></textarea>
		</div>
	</div>
</div>
</form>
 <!-- 
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
-->                 
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