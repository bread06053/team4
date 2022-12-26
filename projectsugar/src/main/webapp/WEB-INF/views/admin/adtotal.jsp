<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<title>관리자 통계 페이지</title>
</head>
<body>
<h1>관리자 통계 페이지 입니다.</h1>
<c:forEach items="${cntL}" var="dto">
<table>
<th>글 번호</th><th> 글 제목 </th><th> 추천수</th>
<tr><td><a href="/chan/bestRcpInfo/${dto.rno}">${dto.rno}</a></td><td>${dto.rtitle}</td><td>${dto.rlikes}</td> 
</table>
</c:forEach>

<h3>가입한 요리사 수 : <img src="https://recipe1.ezmember.co.kr/img/btm_icon2.png" >${cntU} </h3>
<h3>등록된 레시피 개수  :<img src = "https://recipe1.ezmember.co.kr/img/btm_icon3.png"> ${cntR}</h3>
<h3>등록된 커뮤니티 게시글 수  :<img src = "http://image.auction.co.kr/itemimage/9c/5b/51/9c5b51bf6.jpg"> ${cntP}</h3>
</body>
</html>