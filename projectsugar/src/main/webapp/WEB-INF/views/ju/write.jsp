<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
    <title>글 쓰기</title>
    <jsp:include page="/WEB-INF/views/ju/bootstrap.jsp"/>
    <%--  스마트에디터 관련 스크립트  --%>
    <script type="text/javascript" src="/smarteditor/js/HuskyEZCreator.js" charset="utf-8"></script>
    <script type="text/javascript" src="/js/Write.js"></script>
</head>

<body>
<%-- 상단 Header --%>
<jsp:include page="/WEB-INF/views/chan/mainHeader.jsp"/>
<div style="margin-top: 40px" class="container">
    <h2 class="text-danger">글 작성</h2>
    <form action="/post/upload" onsubmit="return submitPost()" method="post">
        <sec:csrfInput/>
        <div class="mb-3">
            <label for="inputTitle" class="form-label">제목</label>
            <input type="text" name="ptitle" class="form-control" id="inputTitle" required>
        </div>

        <div class="mb-2" id="smarteditor">
            <label for="editorTxt" class="form-label">내용</label>
            <textarea class="form-control" name="ptext" id="editorTxt" rows="20" cols="10" placeholder="내용을 입력해주세요">
            </textarea>
        </div>
        <div class="text-end">
            <button class="btn btn-primary mb-3" type="submit">업로드</button>
            <a href="/chan/main"><button class="btn btn-secondary mb-3" type="button">취소</button></a>
        </div>

    </form>
</div>
</body>
</html>
