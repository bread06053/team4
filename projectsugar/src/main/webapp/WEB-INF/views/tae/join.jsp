<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<title>회원 가입</title>
<link rel="preconnect" href="https://fonts.googleapis.com"><link rel="preconnect" href="https://fonts.gstatic.com" crossorigin><link href="https://fonts.googleapis.com/css2?family=Dongle&display=swap" rel="stylesheet">
<style>
 


#addbtn {
background-color: #1BBC9B;
margin-top : 10px;
color: white;
width: 40%;
padding: 5px;
}
#mail_ck {
background-color: #1BBC9B;
margin-bottom: 30px;
margin-top : 10px;
color: white;
width: 25%;
padding: 5px;
box-sizing: border-box;
 border-radius: 5px;
 border: none;
}
#ck_b {
background-color: #1BBC9B;
margin-bottom: 30px;
margin-top : 10px;
color: white;
width: 25%;
padding: 10px;
}
#id_check {
background-color: #1BBC9B;

margin-top : 10px;
margin-left : 10px;
color: white;
width: 25%;
padding: 5px;
}
#join{
background-color: #1BBC9B;

margin-top : 10px;
margin-left : 10px;
color: white;
width: 25%;
padding: 5px;
}
	#input , #result{ display: none;}
	table{
	 background-color: #EEEFF1;
	padding-top : 20px;
	
	}
	
	    input {
            width: 100%;
            padding: 10px;
            box-sizing: border-box;
            border-radius: 5px;
            border: none;
        }
@import url('https://fonts.googleapis.com/css2?family=Dongle&display=swap');
#good{
background-image : url("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRrZdTGyurUhIzhhDK7J4R6XMGSNLVCpLASLw&usqp=CAU");
background-repeat : no-repeat;
background-size:225% 225%;
}
.pt1 {
	font-size:24pt
}
.a{
	font-size:24pt;
	font-family: 'Dongle', sans-serif;
	color:ivory;
	text-align: center;
}
h3{
	font-family: 'Dongle', sans-serif;
	font-size:24pt
}
td {
 padding: 10px;
}





</style>
</head>
<body>


<div id = good align="center" style="width: 1910px; height: 70px;" onclick = "location.href = '/chan/mainHeader'">
<p class="a"><span style="font-size: 200%;">요</span><span style="font-size:100%;">리초보들을 위한</span>
<span style="font-size: 200%;">요</span><span style="font-size:100%;">리비책</span></p>
</div>


<form action="/tae/join" method="post" id="joinForm">
	<table style="border:1px solid black;margin-left:800px;margin-right:auto; margin-top: 150px;width:25%;"> 
		<tr><td colspan="2"><h3 style = "text-align: center;">요-요</h3></td></tr>
		<tr><td>아이디</td><td><input name="userid" id="id"><input type="button" id="id_check" value="중복 확인">
		<div id="id_msg"></div></td></tr>
		<tr><td>비밀번호</td><td><input name="passwd" type="password" placeholder="4글자 이상 입력해주세요" id="password">
		<div id="pw_msg"></div></td></tr>
		<tr><td>이름</td><td><input name="name" id="name">
		<div id="name_msg"></div></td></tr>
		<tr><td>닉네임</td><td><input name="nickname" type="nickname" id="nickname">
		<div id="nickname_msg"></div></td></tr>
		<tr><td>주소</td><td><input name="address" id="address">
		<input type="button" id="addbtn" value="우편번호 검색" onclick="addPost()">
		<tr><td>상세주소</td><td><input style = "margin-bottom: 10px;" name = "address" ></td>
		<tr><td>이메일</td><td><input name="email" id="email">
		<div id="emailresult"></div>
		<button id="mail_ck" value="메일 인증">메일 인증</button>
		<div id="input"><input id="ck_num"> <input type="button" id="ck_b" value="인증 확인"></div>
		<div id="result"></div>
		</td></tr>
		<tr><td colspan="2"><input type="submit" id= "join" value="가입" onclick = "location.href='chan/main'"></td></tr>
	</table>
	
</form>

<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
	let num ="";
	$(function(){
		
		 $("#mail_ck").click(function(){
			 let email = $("#email").val();
			if(!email){
					$("#result").css("display","block").html("메일 주소를 입력하세요");
					
					return false;
				} 
		 $.ajax({url:"/send",
			 	data:"emailAddress="+email,
				dataType:"json"}
			).done(function(data){
				if(eval(data[1])){
					num = data[0];
					alert("메일이 전송되었습니다. 인증번호를 입력하세요.")
					$("#input,#result").css("display","block");
				}
			}); 
		}) 
		$("#ck_b").click(function(){
			let ck_num = $("#ck_num").val();
			if(ck_num == num){
				$("#result").html("인증이 확인되었습니다.")
				$("#result").append("<input type='hidden' id='ck' value='1'>");
			}else{
				$("#result").html("인증 실패했습니다. 다시 확인하세요.");
			}
		})
		
	})
function addPost(){
    new daum.Postcode({
        oncomplete: function(data) {
            	document.querySelector("#address").value = data.address;
            	alert("나머지 주소도 입력하세요.");
        }
    }).open();
}    

$(function(){
	$("#id_check").click(function(){
		let id = $("#id").val();
		if(!id){
			$("#id_msg").html("아이디를 입력하세요")
			return false;
		}
		$.ajax({url:"/idCheck", data:"id="+id, datatype:"text"}
		).done(function(data){
			
			if(data == ""){
				$("#id_msg").html("사용할 수 있는 아이디 입니다.");
				$("#id_msg").append("<input type='hidden' id='id_ck' value='1'>");
			}else{
				$("#id_msg").html("이미 사용중인 아이디 입니다.");
			}
		})
	});//아이디 중복 확인 click

	
	$("#joinform").submit(function(){
		if($("#id_ck").val() != 1){
			$("#id_msg").html("아이디 중복 체크 하셔야 합니다.")
			return false;
		}
		if(!$("#password").val()){
			alert("비밀번호를 입력해야 합니다.");
			return false;
		}
	});
	
})//ready
	$("#joinform").click(function(){
	 let pd = $("#password").val() 
		if (pd.length < 4){
			$("#pw_msg").text("4글자 이상 입력해주세요.")
			return false;
		}
		
	})


</script>

</body>
</html>