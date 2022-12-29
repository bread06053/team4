<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>
<style>
@import url('https://fonts.googleapis.com/css2?family=Dongle&display=swap');
<link rel="preconnect" href="https://fonts.googleapis.com"><link rel="preconnect" href="https://fonts.gstatic.com" crossorigin><link href="https://fonts.googleapis.com/css2?family=Dongle&display=swap" rel="stylesheet">
</style>
    <link rel="stylesheet" href="/css/mypage.css"/>
    <link rel="stylesheet" href="/css/admin.css"/>
    <link rel="stylesheet" href="/css/paging.css"/>
<head>
<title>Insert title here</title>
</head>
<div class="background">
	<div class="outerbox">
		<div class="wrapper">
			<div class="wrapper_left">
				<div class="wrapper_left_header">
					<div class="hello">
					   <a href="/chan/main"><span>요</span>리초보를 위한 <span>요</span>리비책</a>
					</div>
				</div>
				<div class="wrapper_left_body">
					<div class="header">
						<div class="profile">
						<c:if test = "${id.profile == null }">
						<img src ="/style/goguma1.jpeg">
						</c:if>
						<c:if test= "${id.profile != null }">
							  <img src="/profile/<sec:authentication property = "principal.user.profile"/>">
							  </c:if>
							</div>
						<div class="line"></div>
						<div class="prnbtn">
							<div class="pr">
							<c:if test = "${id.pr == null}">
							자기소개가 없습니다.
							</c:if>
							<c:if test = "${id.pr != null }">
							<sec:authentication property = "principal.user.pr"></sec:authentication>
							</c:if>
							</div>
						</div>
					</div>
					<div class="footer">
					<sec:authorize access="hasAnyRole('ROLE_ADMIN','ROLE_MANAGER')">
						<button onclick = "location.href ='/admin/admain' ">관리자 페이지</button>
					</sec:authorize>							
					</div>
				</div>
			</div>
			<div class="wrapper_right">
				<div class="wrapper_right_header">
					<div class="wrapper_right_title">
						문의 내역
					</div>
					<div class="wrapper_right_setting">
					<button onclick = 'location.href = "/chan/mypage"'>마이페이지</button>
						<a href="/tae/userinfo">개인정보 변경</a>
					</div>
				</div>
				  <div class="wrapper_right_body">
                    <div class="wrapper2">
        				<div class="wrapper__body">
            				<div class="header2">
            	    			<div class="header__title">
                    				<span class="title"><sec:authentication property = "principal.user.userid"></sec:authentication>님의 문의내역 입니다.</span>
                				</div>
                				<div class="line2"></div>
               					<table>
 								<tr>
									<th>글 제목</th><th>글 내용</th></tr>
									<c:forEach items="${ask}" var="as">
								<tr><td>${as.atitle}</td><td>${as.atext}</td></tr>
									</c:forEach>
								</table>
								<div class="page_wrap"style="clear:both;">
  <div class="page_nation">
      <div class="paging" align="center" >
         <c:if test="${begin > pageNum}">
            <a class="point" href="myask1?id=<sec:authentication property = "principal.user.userid"/>&p=${begin-1}">◀</a>
         </c:if>
         <c:forEach begin="${begin}" end = "${end}" var='i'>
            <a class="point" href="myask1?id=<sec:authentication property = "principal.user.userid"/>&p=${i}" class="page">${i}</a>
         </c:forEach>
         <c:if test="${end < totalPages}">
            <a class="point" href="myask1?id=<sec:authentication property = "principal.user.userid"/>&p=${end+1}">▶</a>
         </c:if>
      </div>
      </div>
      </div>
            				</div>
        				</div>
   					 </div>     
                  </div>
			</div>
		</div>
	</div>
</div>
</body>
</html>
<!-- 
<body>

 <sec:authentication property = "principal.user.userid"></sec:authentication>님의 문의내역 입니다.<br>
 <table>
 <tr>
<th>글 번호</th><th>글 제목</th><th>아이디</th></tr>
<c:forEach items="${ask}" var="as">
<tr><td><a href = "/admin/apopup/${as.ano}">${as.ano}</a></td><td>${as.atitle}</td><td>${as.userid}</td></tr>
</c:forEach>
</table>
</body>
</html> -->