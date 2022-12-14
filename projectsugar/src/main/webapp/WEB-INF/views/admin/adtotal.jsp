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
						<button onclick = "location.href ='/admin/admain' ">회원 관리</button>
						<button onclick = "location.href ='/admin/asklist' ">문의 리스트</button>
						<button onclick = "location.href ='/admin/reportlist' ">신고 리스트</button>
						<button onclick = "location.href ='/admin/adstyle' ">배너 스타일</button>
					</div>
				</div>
			</div>
			<div class="wrapper_right">
				<div class="wrapper_right_header">
					<div class="wrapper_right_title">
						관리자 통계 페이지
					</div>
					<div class="wrapper_right_setting">
						<a href="/tae/userinfo">개인정보 변경</a>
					</div>
				</div>
				  <div class="wrapper_right_body">
                    <div class="wrapper2">
        				<div class="wrapper_body">
            				<div class="header2">
            	    			<div class="header__title">
                    				<span class="title">인기 레시피 Best 3</span>
                				</div>
                				<div class="line2"></div>
									<table style="">
										<tr>
											<th>글 번호</th><th> 글 제목 </th><th> 추천수</th>
										</tr>
										<c:forEach items="${cntL}" var="dto">
										<tr>
										<td><a href="/chan/bestRcpInfo/${dto.rno}">${dto.rno}</a></td><td>${dto.rtitle}</td><td>${dto.rlikes}</td> 
										</tr>
										</c:forEach>
										</table>
										<!-- <div class="total">
                    						<span class="title">통계</span>
											<ul class="btm_stats">
            									<li><img src="https://recipe1.ezmember.co.kr/img/btm_icon2.png" >총 요리사 수: <b>${cntU}</b></li>
         										<li><img src = "https://recipe1.ezmember.co.kr/img/btm_icon3.png">총 레시피 수: <b>${cntR}</b></li>
            									<li><img src = "http://image.auction.co.kr/itemimage/9c/5b/51/9c5b51bf6.jpg">등록된 커뮤니티 글 수: <b>${cntP}</b></li>
        									</ul>        									
										</div> -->					
												<div class="chart-area">
											<div id="container" style="width:100%; height:100%;">
											<c:forEach var="i" items="${wordcloud}">
											<input type ="hidden" value = "${i.catename }" id = "catename" >
											<input type ="hidden" value = "${i.cnt }" id = "cnt">
											</c:forEach>
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
<script src="https://cdn.anychart.com/releases/v8/js/anychart-base.min.js"></script>
<script src="https://cdn.anychart.com/releases/v8/js/anychart-tag-cloud.min.js"></script>
<script src="https://code.jquery.com/jquery-3.6.1.min.js"></script>
<script>

anychart.onDocumentReady(function () {
	

	var data=[
	<c:forEach var="i" items="${wordcloud}">
		{x : '${i.x}',
		 value : '${i.value}'},
	</c:forEach>
	]
    var chart = anychart.tagCloud(data);
    chart.angles([0]);
    chart.container("container");
    // chart.getCredits().setEnabled(false);
    chart.draw();
});
</script>
</body>
</html>