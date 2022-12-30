<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="/css/login.css"/>
<meta name="google-signin-client_id" content="796949115397-ai1it1djvm2m96661au2tgt3e4ftk6l6.apps.googleusercontent.com">

<style type="text/css">
@import url('https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap');

        * {
            font-family: 'Noto Sans KR', sans-serif;
        }


        div good2{
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
        

        
        #g-signin2{
		    margin-left : 50%;
            margin-top : 50%;
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

        .save_Id {
        	height: 30px;
        	width: 30px;
        }

</style>
<title>Insert title here</title>
</head>
<body >
    <div class="container">
        <form method = "post">
            <input type="text" name="username" placeholder="아이디" class="in">
            <input type="password" name="password" placeholder="비밀번호" class="in">
            <input type="submit" id="btn" value="로그인"><br>
            
            <div class="col-lg-12 text-center mt-3">
    		<button class="btn btn-block waves-effect waves-light btn-rounded btn-outline-info mb-3">로그인하기</button>
			<img alt="카카오로그인" src="/img/kakao.jpeg" onclick="loginWithKakao()">
			</div>
    	
        <a href= "/tae/join">회원가입</a>
        <a href="/tae/find">아이디/비밀번호를 잊어버리셨나요?</a>
        
		
 
      <!-- 아래와같이 아이디를 꼭 써준다. -->
     <!-- <button id="naverIdLogin_loginButton" href="javascript:void(0)">네이버 로그인</button> -->

	
	<!--   <button onclick="naverLogout(); return false;" href="javascript:void(0)">네이버 로그인</button> -->

    <!--     <a href="#" onclick="signOut();">Sign out</a> -->
        
        </form>
    </div>
    
<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
<script type="text/javascript" src="https://developers.kakao.com/sdk/js/kakao.min.js" charset="utf-8"></script>
<script type="text/javascript"> 
    $(document).ready(function(){
    	//Kakao.init('919798b7305f599e46752fca6aba2ab7');
    	Kakao.init('def68b95ea99dad9a4f297b1e517c05a');
        Kakao.isInitialized();
    });

    function loginWithKakao() {
        Kakao.Auth.authorize({ 
        redirectUri: 'http://localhost:8084/kakao_callback' 
        }); // 등록한 리다이렉트uri 입력
    }
   

    
</script>

</body>
</html>