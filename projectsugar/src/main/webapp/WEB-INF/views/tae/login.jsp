<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>

<meta name="google-signin-client_id" content="796949115397-ai1it1djvm2m96661au2tgt3e4ftk6l6.apps.googleusercontent.com">

<style type="text/css">
body{
	background : url("/img/IMG_8048.PNG");
}
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
        
        form{
        	width: 300px;
            margin-left : 800px;
            margin-top : 500px;
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
    <div>
        <form method = "post">
            <input type="text" name="username" placeholder="아이디" class="in">
            <input type="password" name="password" placeholder="비밀번호" class="in">
            <input type="submit" id="btn" value="로그인"><br>
            
            <div class="g-signin2" data-onsuccess="onSignIn"></div>
    	
        
        <a href="/tae/find">아이디/비밀번호를 잊어버리셨나요?</a>
        
		
 
      <!-- 아래와같이 아이디를 꼭 써준다. -->
     <!-- <button id="naverIdLogin_loginButton" href="javascript:void(0)">네이버 로그인</button> -->

	
	<!--   <button onclick="naverLogout(); return false;" href="javascript:void(0)">네이버 로그인</button> -->

    <!--     <a href="#" onclick="signOut();">Sign out</a> -->
        
        </form>
    </div>
    
<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
<script src="https://apis.google.com/js/platform.js" async defer></script>
<script type="text/javascript">
     $(function() {
         
           fnInit();
         
     });
     
     function frm_check(){
         saveid();
     }
 
    function fnInit(){
        var cookieid = getCookie("saveid");
        console.log(cookieid);
        if(cookieid !=""){
            $("input:checkbox[id='saveId']").prop("checked", true);
            $('#logId').val(cookieid);
        }
        
    }    
 
    function setCookie(name, value, expiredays) {
        var todayDate = new Date();
        todayDate.setTime(todayDate.getTime() + 0);
        if(todayDate > expiredays){
            document.cookie = name + "=" + escape(value) + "; path=/; expires=" + expiredays + ";";
        }else if(todayDate < expiredays){
            todayDate.setDate(todayDate.getDate() + expiredays);
            document.cookie = name + "=" + escape(value) + "; path=/; expires=" + todayDate.toGMTString() + ";";
        }
        
        
        console.log(document.cookie);
    }
 
    function getCookie(Name) {
        var search = Name + "=";
        console.log("search : " + search);
        
        if (document.cookie.length > 0) { // 쿠키가 설정되어 있다면 
            offset = document.cookie.indexOf(search);
            console.log("offset : " + offset);
            if (offset != -1) { // 쿠키가 존재하면 
                offset += search.length;
                // set index of beginning of value
                end = document.cookie.indexOf(";", offset);
                console.log("end : " + end);
                // 쿠키 값의 마지막 위치 인덱스 번호 설정 
                if (end == -1)
                    end = document.cookie.length;
                console.log("end위치  : " + end);
                
                return unescape(document.cookie.substring(offset, end));
            }
        }
        return "";
    }
 
    function saveid() {
        var expdate = new Date();
        if ($("#saveId").is(":checked")){
            expdate.setTime(expdate.getTime() + 1000 * 3600 * 24 * 30);
            setCookie("saveid", $("#logId").val(), expdate);
            }else{
           expdate.setTime(expdate.getTime() - 1000 * 3600 * 24 * 30);
            setCookie("saveid", $("#logId").val(), expdate);
             
        }
    }
    
    function onSignIn(googleUser) {
    	  var profile = googleUser.getBasicProfile();
    	  console.log('ID: ' + profile.getId()); // Do not send to your backend! Use an ID token instead.
    	  console.log('Name: ' + profile.getName());
    	  console.log('Image URL: ' + profile.getImageUrl());
    	  console.log('Email: ' + profile.getEmail()); // This is null if the 'email' scope is not present.
    	}
    
 
    
   

    
</script>

</body>
</html>