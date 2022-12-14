<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<title>tab</title>
    <style>
            * {
            font-family: 'Noto Sans KR', sans-serif;
        }
        body{
	margin-top: 100px;
	font-family: 'Noto Sans KR', sans-serif;
	line-height: 1.6
}
.container{
	width: 500px;
	margin: 0 auto;
	position : absolute;
    left : 50%;
    top : 50%;
    transform: translate(-50%, -50%);
    
}

ul.tabs{
	margin: 0px;
	padding: 0px;
	list-style: none;
}
ul.tabs li{
	background: none;
	color: #222;
	display: inline-block;
	padding: 10px 15px;
	cursor: pointer;
}

ul.tabs li.current{
	background: #ededed;
	color: #222;
}

.tab-content{
	display: none;
	background: #ededed;
	padding: 15px;
}

.tab-content.current{
	display: inherit;
}
#btn {
background-color: #1BBC9B;
margin-bottom: 30px;
margin-top : 10px;
color: white;
width: 15%;
padding: 5px;
}
#btn2 {
background-color: #1BBC9B;
margin-bottom: 30px;
margin-top : 10px;
color: white;
width: 20%;
padding: 5px;
}
input {
width: 100%;
padding: 10px;
box-sizing: border-box;
border-radius: 5px;
border: none;
margin-top : 10px;
}
      </style>
</head>

<body>
    <div class="container">
        <ul class="tabs">
            <li class="tab-link current" data-tab="tab-1">아이디 찾기</li>
            <li class="tab-link" data-tab="tab-2">비밀번호 찾기</li>
        </ul>

        <div id="tab-1" class="tab-content current"><input type="text" name="email" placeholder="이메일을 입력해주세요." class="in">
         <br><input type="submit" id="btn" value="아이디 찾기" onclick = "window.open('popup.html', 'pop01', 'top=10, left=10, width=500, height=600, status=no, menubar=no, toolbar=no, resizable=no');" ></div>
        <div id="tab-2" class="tab-content"><input type="text" name="name" placeholder="이름을 입력해주세요." class="in">
        <br>
        <input type="text" name="userid" placeholder="아이디를 입력해주세요." class="in"><br>
        <input type="text" name="email" placeholder="이메일을 입력해주세요." class="in">
        <br><input type="submit" id="btn2" value="비밀번호 찾기"><br></div>
    </div>

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script>
        $(document).ready(function(){
            $('ul.tabs li').click(function(){
                var tab_id = $(this).attr('data-tab');

                $('ul.tabs li').removeClass('current');
                $('.tab-content').removeClass('current');

                $(this).addClass('current');
                $("#"+tab_id).addClass('current');
            });

        });
        
      </script>
     
</body>
</html>