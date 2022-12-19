<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<style>
@import url('https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap');
    #good2 {
            font-family: 'Noto Sans KR', sans-serif;
        }
#good2{
   width: 300px;
            position : absolute;
            left : 50%;
            top : 50%;
            transform: translate(-50%, -50%);
            background-color: #EEEFF1;
            border-radius: 5px;
            text-align: center;
            padding: 20px;
           }
@import url('https://fonts.googleapis.com/css2?family=Dongle&display=swap');
#good{
background-image : url("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRrZdTGyurUhIzhhDK7J4R6XMGSNLVCpLASLw&usqp=CAU");
background-repeat : no-repeat;
background-size:225% 225%;
}
.a{
	font-size:24pt;
	font-family: 'Dongle', sans-serif;
	color:ivory;
	text-align: center;
}
</style>
<title>Insert title here</title>
</head>
<body>
<div id = good align="center" style="height: 10%;">
<p class="a"><span style="font-size: 200%;">요</span><span style="font-size:100%;">리초보들을 위한</span>
<span style="font-size: 200%;">요</span><span style="font-size:100%;">리비책</span></p>
</div>
<c:if test = "${pw != null}">
<div id = good2 >${user.name} 님의 비밀번호는 ${pw} 입니다.</div>
</c:if>
<c:if test = "${pw == null}">
	<div id = good2>입력한 정보가 정확하지 않습니다.</div>
	
</c:if>

</body>
</html>