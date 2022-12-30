<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>
<style>
@import url('https://fonts.googleapis.com/css2?family=Dongle&display=swap');
</style>
<head>

<title>Insert title here</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="preconnect" href="https://fonts.googleapis.com"><link rel="preconnect" href="https://fonts.gstatic.com" crossorigin><link href="https://fonts.googleapis.com/css2?family=Dongle&display=swap" rel="stylesheet">
<style>
@import url('https://fonts.googleapis.com/css2?family=Dongle&display=swap');
.mySlides {display:none}
.prev, .next, .dot {cursor:pointer}
.dot {height:13px;width:13px;padding:0}
th{border-bottom:2px solid peru;}
</style>
<link rel="stylesheet" href="/css/community_list.css"/>
<link rel="stylesheet" href="/css/mainHeader.css"/>
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
<div id="center">
<!-- 게시글 리스트 테이블 -->
<div id = "title">   
</div>
   <!-- 조회수/최신순 정렬 -->
   <div class = "sort" align="right">

      <form action="postsearch"class="btn1">
      <input type="hidden" name="search" value="${search}"/>
      <input type="hidden" name="sort" value="0">
      <input type="submit" value="최신순" />
      </form>
      <form action="postsearch"class="btn1">
      <input type="hidden" name="search" value="${search}" />
      <input type="hidden" name="sort" value="1">
      <input type="submit" value="조회수 순" style="margin-right: 2px;"/>
      </form>  <br>
   </div>
   <div class = "board">
      <table id="board">
         <colgroup>
                  <col style="width:5%;" />
                  <col style="width:70%"/>
                  <col style="width:10%;" />
                  <col style="width:10%;" />
                  <col style="width:5%;" />
               </colgroup>
               <thead>
                  <tr>
                     <th scope="col">번호</th>
                     <th scope="col">제목</th>
                     <th scope="col">작성자</th>
                     <th scope="col">작성일</th>
                     <th scope="col">조회수</th>
                  </tr>
               </thead>
               <tbody class="list1">
                  <c:if test="${count == 0}">
                     <tr>
                        <td colspan="5" id="none_post">게시판에 저장된 글이 없습니다.</td>
                     </tr>
                  </c:if>
                  <c:if test="${count != 0}">
                     <c:forEach items="${cList}" var="comm">
                     <tr>
                        <td><a href="postview/${comm.pno}">${comm.pno}</a></td>
                        <td><a href="postview/${comm.pno}">${comm.ptitle}</a></td>
                        <td>${comm.userid}</td>
                        <td><fmt:formatDate value="${comm.ptime}" dateStyle="long" /></td>
                        <td>${comm.pview}</td>
                     </tr>
                     </c:forEach>
                  </c:if>
                  
               </tbody>
      </table>
<div class="write" align="right">
         <button type = "button" class="community_write">
            <a href="postwrite" class="community_write">글 쓰기</a>
         </button>
      </div>
      <div id="paging" align="center">
         <c:if test="${begin > pageNum}">
            <a href="postsearch?p=${begin-1}&search=${search}&sort=${sort}">[이전]</a>
         </c:if>
         <c:forEach begin="${begin}" end = "${end}" var='i'>
            <a href="postsearch?p=${i}&search=${search}&sort=${sort}" class="page">${i}</a>
         </c:forEach>
         <c:if test="${end < totalPages}">
            <a href="postsearch?p=${end+1}&search=${search}&sort=${sort}">[다음]</a>
         </c:if>
      </div>
         <!-- 검색창 -->
   <div id = "search1" align="left">
      <form action="postsearch" class="search1">
      <!-- <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" /> -->
         <input class="search2" type="text" name="search" size="24" maxlength="225" placeholder = "검색어를 입력하세요">
         <button type='submit' value="검색" class="search3"style="height: 30px; font-size: large;">::검색</button>
      </form>
   </div>

   </div>
</div>

<div>
<!-- 오른쪽 네비게이션 바 검색, 찜, 채팅 링크  -->
</div>

<footer>
</footer>


</body>
</html>