<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>

<meta name="google-signin-client_id" content="796949115397-ai1it1djvm2m96661au2tgt3e4ftk6l6.apps.googleusercontent.com">







<style type="text/css">
@import url('https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap');
html{
     background: url(/img/i15446847973.jpg) no-repeat center center/cover, rgba(0, 0, 0, 0.5);
        background-blend-mode: multiply;

}

        
        form{

        	width: 300px;
            margin-left : 800px;
            margin-top : 500px;
			background-color: #EEEFF1;
            border-radius: 5px;
            text-align: center;
            padding: 20px;            
        }
        
    
     

        input {
            width: 100%;
            padding: 10px;
            box-sizing: border-box;
            border-radius: 5px;
            border: none;
        }

        .in {
            margin-bottom: 10px;
        }

        #btn {
            background-color: #1BBC9B;
            margin-bottom: 30px;
            color: white;
        }

        a {
            text-decoration: none;
            color: #9B9B9B;
            font-size: 12px;
        }
 

@import url('https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap');

        * {
            font-family: 'Noto Sans KR', sans-serif;
   			}
			
</style>
<title>Insert title here</title>
</head>
<body >
    <div>
        <form id = "good23" method = "post">
            <input type="text" name="username" placeholder="아이디" class="in">
            <input type="password" name="password" placeholder="비밀번호" class="in">
            <input type="submit" id="btn" value="로그인"><br>
            
    	
        <a href= "/tae/join">회원가입</a>
        <a href="/tae/find">아이디/비밀번호를 잊어버리셨나요?</a>
        
        </form>
    </div>
    


</body>
</html>