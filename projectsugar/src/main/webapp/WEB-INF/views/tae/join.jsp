<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<title>회원 가입</title>
<style>
	#input , #result{ display: none;}
	#joinForm{
		position: absolute;
		left : 50%;
		top: 50%;
		transform: translate(-50%, -50%);
	}
</style>
</head>
<body>
<h1>회원 가입</h1>
<form action="/join" method="post" id="joinForm">
	<table >
		<tr><td>아이디</td><td><input name="userid" id="id"><input type="button" id="id_check" value="중복 확인">
		<div id="id_msg"></div></td></tr>
		<tr><td>비밀번호</td><td><input name="passwd" type="password" id="password">
		<div id="pw_msg"></div></td></tr>
		<tr><td>이름</td><td><input name="name" id="name">
		<div id="name_msg"></div></td></tr>
		<tr><td>주소</td><td><input name="address" id="address">
		<input type="button" id="addbtn" value="우편번호 검색" onclick="addPost()">
		<tr><td>상세주소</td><td><input name = "address"></td>
		<tr><td>이메일</td><td><input name="email" id="email">
		<div id="emailresult"></div>
		<input type="button" id="mail_ck" value="메일 인증">
		<div id="input"><input id="ck_num"> <input type="button" id="ck_b" value="인증 확인"></div>
		<div id="result"></div>
		</td></tr>
		<tr><td colspan="2"><input type="submit" value="가입" onclick = "location.href='/main'"></td></tr>
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


</script>

</body>
</html>