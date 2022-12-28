<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>
<head>
<style>
.prdiv{
 border :1px solid; 
 padding:10px;
}
</style>
<link rel="stylesheet" href="/css/paging.css"/>
<link rel="stylesheet" href="/css/admin.css"/>
<title>Insert title here</title>
</head>
<body>
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
							  <img src="/profile/<sec:authentication property = "principal.user.profile"/>">
							</div>
						<div class="line"></div>
						<div class="prnbtn">
							<div class="pr">
							<sec:authentication property = "principal.user.pr"></sec:authentication>
							</div>
						</div>
					</div>
					<div class="footer">
					<sec:authorize access="hasAnyRole('ROLE_ADMIN','ROLE_MANAGER')">
						<button onclick = "location.href ='/admin/admain' ">회원 관리</button>
						<button onclick = "location.href ='/admin/asklist' ">문의 리스트</button>
						<button onclick = "location.href ='/admin/reportlist' ">신고 리스트</button>
						<button onclick = "location.href ='/admin/adtotal'">사이트 통계 보기</button>
					</sec:authorize>		
					</div>
				</div>
			</div>
			<div class="wrapper_right">
				<div class="wrapper_right_header">
					<div class="wrapper_right_title">
						신고 관리 페이지
					</div>
					<div class="wrapper_right_setting">
						<a href="/tae/userinfo">개인정보 변경</a>
					</div>
				</div>
				  <div class="wrapper_right_body">
                    <div class="wrapper2">
        				<div class="wrapper_body">
            				<div class="header2">
            	    			<div class="header_title">
                    				<span class="title">신고 내역</span>
                				</div>
                				<div class="line2"></div>
									<table>
										<tr>
											<th>신고 번호</th><th>글번호</th><th>신고 제목</th><th>신고 유저</th>
										</tr>
										<c:forEach items="${report}" var="i">	
										<tr><td>${i.bno}</td><td>${i.pno}</td><td><a href="bpopup/${i.bno}" onclick="window.open(this.href, '_blank', 'width=800, height=600'); return false;">${i.btitle}</a></td><td>${i.userid}</td>
										</tr>
										</c:forEach>
									</table>
      								<div class="page_wrap"style="clear:both;">
  <div class="page_nation">
      <div class="paging" align="center" >
         <c:if test="${begin > pageNum}">
            <a class="point" href="reportlist?p=${begin-1}">◀</a>
         </c:if>
         <c:forEach begin="${begin}" end = "${end}" var='i'>
            <a class="point" href="reportlist?p=${i}" class="page">${i}</a>
         </c:forEach>
         <c:if test="${end < totalPages}">
            <a class="point" href="reportlist?p=${end+1}">▶</a>
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