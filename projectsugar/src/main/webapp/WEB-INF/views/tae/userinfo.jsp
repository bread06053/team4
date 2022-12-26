<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html>

<style>
@import url('https://fonts.googleapis.com/css2?family=Dongle&display=swap');
#good{
    background-color: burlywood;
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
<%-- <link rel = "stylesheet" href = "/css/font-awesome.min.css"/>--%>
<head>
<link rel="stylesheet" href="/css/userinfo.css"/>
<title>요리초보들을 위한 요리비책</title>
<link rel="preconnect" href="https://fonts.googleapis.com"><link rel="preconnect" href="https://fonts.gstatic.com" crossorigin><link href="https://fonts.googleapis.com/css2?family=Dongle&display=swap" rel="stylesheet">
</head>
<body>
<div id = good align="center" style="width: 1910px; height: 70px;" onclick = "location.href = '/chan/main'">
<p class="a"><span style="font-size: 200%;">요</span><span style="font-size:100%;">리초보들을 위한</span>
<span style="font-size: 200%;">요</span><span style="font-size:100%;">리비책</span></p>
</div>
        <form method = "get" id="inputform" action = "/tae/userinfo">
        <div class="whoru">
            아이디: <input type="text" name="userid" placeholder="아이디"><br><br>
                 비밀번호: <input type="password" name="passwd" placeholder="비밀번호"><br>
                        <input type="submit" id="submit" value = "확인">
                           </div>
        </form>
                             
</body>
</html>