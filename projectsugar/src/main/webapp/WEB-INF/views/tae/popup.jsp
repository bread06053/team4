<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<style>
@import url('https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap');
    * {
            font-family: 'Noto Sans KR', sans-serif;
        }
#good1{
   width: 300px;
            position : absolute;
            left : 50%;
            top : 50%;
            transform: translate(-50%, -50%);
            background-color: #EEEFF;
            border-radius: 5px;
            text-align: center;
            padding: 20px;
           }
       
</style>
<title>Insert title here</title>
</head>
<body>
<div id = good align="center" style="height: 10%;">
<p class="a"><span style="font-size: 200%;">요</span><span style="font-size:100%;">리초보들을 위한</span>
<span style="font-size: 200%;">요</span><span style="font-size:100%;">리비책</span></p>
</div>

<c:if test = "${id != null}">
<div id = good1>회원가입시 사용한 아이디는: ${id} 입니다.</div>
</c:if>
<c:if test = "${id == null}">
<div id = good1>입력한 이메일이 틀리셨습니다.</div>
</c:if>
</body>
</html>