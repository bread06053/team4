<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<style>
    #wrap {width: 1000px; height: 900px; margin:0; auto; color: #6a65bb; text-align: center;}
    #side {float: left; width: 300px; height: 600px; line-height: 100px;background: #f6f1ed}
    #contents {float: right; width: 700px; height: 600px; line-height: 600px;background: #f5e9df }
</style>

<head>
    <title>list</title>
    <jsp:include page="/WEB-INF/views/ju/bootstrap.jsp"/>
    <link rel="stylesheet" href="/css/post.css"/>
    <jsp:include page="/WEB-INF/views/ju/bootstrap.jsp"/>

</head>

<body>
<%-- 상단 Header --%>
<jsp:include page="/WEB-INF/views/chan/mainHeader.jsp"/>

<div id="wrap">
<div id="side">Profile</div>

<div class="container2"; id="contents">
    <a href="" title="Button fade blue/green" class="button btnFade btnBlueGreen">글 작성</a>



    <select name="정렬">
        <option value="1">최신순</option>
        <option value="2">인기순</option>
    </select>


<table class="table table-hover">
    <thead>
    <tr>
        <td>번호</td>
        <td>제목</td>
        <td>작성자</td>
        <td>작성일</td>
        <td>조회수</td>
    </tr>
    </thead>

    <tbody>
    <td>00001</td>
    <td>&#91;공지&#93;커뮤니티 게시판입니다&#33;</td>
    <td>관리자</td>
    <td>2022&#45;12&#45;13</td>
    <td>246</td>
    </tbody>

    <tbody>
    <td>00002</td>
    <td>&#91;공지&#93;커뮤니티 사용법에 대하여</td>
    <td>관리자</td>
    <td>2022&#45;12&#45;15</td>
    <td>229</td>
    </tbody>

    <tbody>
    <td>00003</td>
    <td>후라이팬을 새로 샀어요&#33;</td>
    <td>백설탕</td>
    <td>2022&#45;12&#45;15</td>
    <td>56</td>
    </tbody>

    <tbody>
    <td>00004</td>
    <td>주방 도구 관련 질문</td>
    <td>밤톨이</td>
    <td>2022&#45;12&#45;15</td>
    <td>13</td>
    </tbody>

    <tbody>
    <td>00005</td>
    <td>ㅋㅋㅋㅋㅋㅋㅋ</td>
    <td>요리왕</td>
    <td>2022&#45;12&#45;16</td>
    <td>34</td>
    </tbody>

    <tbody>
    <td>00006</td>
    <td>나눔합니다</td>
    <td>레몬샤벳</td>
    <td>2022&#45;12&#45;17</td>
    <td>17</td>
    </tbody>
</table>
</div>
</div>
<!-- <button type="button" class="btn btn-outline-primary">글 작성</button> -->
</body>

</html>
