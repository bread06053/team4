<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>
<style>
@import url('https://fonts.googleapis.com/css2?family=Dongle&display=swap');
button{
width: 50px;
height: 20px;
font-size : 10px;
}
</style>
<head>
<link rel="stylesheet" href="/css/mainHeader.css"/>
<link rel="stylesheet" href="/css/Rcpinfowrite.css"/>
<title>Insert title here</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="preconnect" href="https://fonts.googleapis.com"><link rel="preconnect" href="https://fonts.gstatic.com" crossorigin><link href="https://fonts.googleapis.com/css2?family=Dongle&display=swap" rel="stylesheet">
<style>
@import url('https://fonts.googleapis.com/css2?family=Dongle&display=swap');
</style>
<body>
<div class="yoyo_top_wrap">
	<div class="yoyo_top">
	<h1>
	<a href="http://localhost:8084/chan/main">
	<img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTYeFHo_i34CbGLC4ZmZyjA3V8XSK_sUHWE7A&usqp=CAU" alt="로고">
	</a>
	</h1>
	<div class="yoyo_search">
	<form id="yoyoSearch" method="post" action="/tae/searchpage">
		<div class="input-group">

		<input id="yoyoText" name="q" type="text" class="form-control ui-autocmplete-input" placeholder values="" style="ime-mode:active;" autocomplete="off">	
		<span class="input-group-btn">
		<button class="btn btn-default" type="submit" style="padding-bottom: 8px;">
			<span class="glyphicon glyphicon-search">
			::검색
			</span>
		</button>	
		</span>
		</div>
	</form>	
</div> 
<div id = goodtaehun></div>
<div class="yoyoRight" style="position:relative">
	<div style="position: absolute; width:100px; top: 47px; left: 0; margin-left: -25px;display:none; margin:10;">
         <span style="margin: 10; padding: 10; font-size: 0; display: block; text-align: center;"><img src="" width="8"></span>
         <span style="border-radius: 2px; background: #ffd200; color: #000; display: block; font-size: 11px; padding:2px 5px; text-align: center;">회원가입</span>
    </div>
    <a href="http://localhost:8084/chan/mypage">
    <sec:authentication property = "principal.user.userid"></sec:authentication>님 안녕하세요!<br>
    <sec:authorize access = "!isAuthenticated()"/>
    <img src="/profile/<sec:authentication property = "principal.user.profile"/>">
    </a>
</div>
</div>
</div>
<div class="yoyo_navi">
            <ul class="yoyoNavi">
                <li><a href="/chan/bestRcp">Best 레시피</a>
                </li>
                <li><a href="/chan/myRcp">나만의 레시피</a>
                </li>
                <li><a href="/post/postlist">커뮤니티</a>
                </li>
            </ul>
        </div>
        
        
<form action="/tae/Rcpinfowrite1" method="post" enctype="multipart/form-data">
<div class="container recipe_regi">
	<div class="regi_center">
		<div class="regi_title">
			<h2><span style="color:peru;">레시피</span> 등록</h2>
		</div>
		<div class="cont_box pad_1_60">
			<div class="cont_pic">
				<input type = "file" name = "img" id="main_photo">
			</div>
			<div class="cont_line">
			 <div class="user">
         		<input type="hidden" name = "userid" value="<sec:authentication property = "principal.user.userid"></sec:authentication>">
				<p class="cont_tit4">레시피 제목</p>
				<input type="text" name = "rtitle" id="cok_title" class="form-control" placeholder="예) 오레오롤 케이크 만들기" style="width:610px;">
			</div>
		</div>
			<div class="cont_line pad_b_25">
				<p class="con_tit4">요리소개</p>
				<input name = "rinfo" placeholder = "간단한 요리소개를 적어주세요. 예) 오레오로 간단하게 홈베이킹해봐요" style="height:100px; width:610px; resize:none;">
			</div>
			<div class="cont_line">
				<p class="cont_tit4">카테고리</p>
				<select name = "cateno">
    				<option value="23">육류</option>
    				<option value="24">해물류</option>
    				<option value="25">건어물류</option>
    				<option value="26">곡류</option>
  					<option value="27">콩/견과류</option>
    				<option value="28">채소류</option>
    				<option value="31">버섯류</option>
    				<option value="32">밀가루</option>
    				<option value="33">가공식품류</option>
    				<option value="34">기타</option>
    				<option value="47">쌀</option>
    				<option value="48">과일류</option>
    				<option value="50">달걀/유제품</option>
    				<option value="70">소고기</option>
   					<option value="71">돼지고기</option>
    				<option value="72">닭고기</option>
				</select>
				<span class="guide">분류를 설정해주시면 이용자들이 쉽게 레시피를 찾을수 있어요.</span>
			</div>
			<div class="con_line">
				<p class="cont_tit4">요리정보</p>
				시간
				<select name = "rtime">
    				<option value="5분 이내"> 5분 이내</option>
    				<option value="10분 이내">10분 이내</option>
    				<option value="15분 이내">15분 이내</option>
    				<option value="20분 이내">20분 이내</option>
    				<option value="25분 이내">25분 이내</option>
    				<option value="30분 이내">30분 이내</option>
    				<option value="60분 이내">60분 이내</option>
				</select>
				난이도
				<select name = "rlevel">
    				<option value="아무나">아무나</option>
    				<option value=" 초급"> 초급</option>
    				<option value=" 중급"> 중급</option>
    				<option value=" 고급"> 고급</option>
				</select>			
			</div>
		</div>
		<!-- /cont_box -->
		<div class="cont_box pad_1_60">
			<p class="con_tit4">재료</p>
			<input name = "rprep" placeholder = "재료를 적어주세요. 예)오레오 1봉지, 크림치즈50g, 우유 3T" style="height:100px; width:610px; resize:none;">
		</div>
		<!-- /cont_box -->
		<div class="cont_box pad_1_60">
			<p class="con_tit4">요리순서</p>
			<textarea name="rlogic" id="editorTxt" rows="20" cols="10" style="width: 700px"></textarea>
		</div>
		<div class="cont_box pad_1_60">
			<p class="con_tit4">요리팁</p>
			<input name="rtip" placeholder = "요리 팁을 적어주세요. 예)레드벨벳 오레오로 만들어도 이뻐요." style="height:100px; width:610px; resize:none;">
		</div>
		<div class="cont_box pad_1_60">
			<a href="/chan/myRcp" type="button">커뮤니티로 이동</a><button type ="submit" id = "save">글 쓰기</button>
		</div>

	</div>
</div>
</form>
<!--
<table border="1" style = "text-align : center;" >
	<tr><td>제목</td><td><input name = "rtitle"></td>
	<tr><td>작성자</td><td><sec:authentication property = "principal.user.userid"></sec:authentication></td> 
	<tr><td>내용</td><td><input name = "rinfo" placeholder = "귀찮거나 그럴때 입맛돋우는 간단한 김무침으로 반찬 만들어보세요"></td>
	<tr><td>요리 난이도</td><td>
	<select name = "rlevel">
    <option value="아무나">아무나</option>
    <option value="초급">초급</option>
    <option value="중급">중급</option>
    <option value="고급">고급</option>
	</select>
	</td></tr>
	<tr><td>요리 시간</td><td>
	<select name = "rtime">
    <option value="5분이내">5분이내</option>
    <option value="10분이내">10분이내</option>
    <option value="15분이내">15분이내</option>
    <option value="20분이내">20분이내</option>
    <option value="25분이내">25분이내</option>
    <option value="30분이내">30분이내</option>
    <option value="60분이내">60분이내</option>
	</select>
	</td></tr>
	<tr><td>요리 팁</td><td><input name = "rtip" placeholder = "모든 재료 한꺼번에 넣어도 괜찮아요.겁내지 말고 도전하세요."></td></tr>
	<tr><td>재료</td><td>	
	<select name = "cateno">
    <option value="23">육류</option>
    <option value="24">해물류</option>
    <option value="25">건어물류</option>
    <option value="26">곡류</option>
    <option value="27">콩/견과류</option>
    <option value="28">채소류</option>
    <option value="31">버섯류</option>
    <option value="32">밀가루</option>
    <option value="33">가공식품류</option>
    <option value="34">기타</option>
    <option value="47">쌀</option>
    <option value="48">과일류</option>
    <option value="50">달걀/유제품</option>
    <option value="70">소고기</option>
    <option value="71">돼지고기</option>
    <option value="72">닭고기</option>
	</select>
	</td></tr>
	<tr><td>완성 요리사진</td><td><input type = "file" name = "rthumimg"></td></tr>
	<tr><td>요리 방법</td><td><textarea name="rlogic" id="editorTxt" rows="20" cols="10" style="width: 700px"></textarea></td></tr>
	</table>
	 -->

<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
<script type="text/javascript" src="/smarteditor/js/HuskyEZCreator.js" charset="utf-8"></script>
<script>

     let oEditors = []

    smartEditor = function() {
      console.log("Naver SmartEditor")
      nhn.husky.EZCreator.createInIFrame({
        oAppRef: oEditors,
        elPlaceHolder: "editorTxt",
        sSkinURI: "/smarteditor/SmartEditor2Skin.html",
        fCreator: "createSEditor2"
      })
    } 

    $(document).ready(function() {
  
      smartEditor() 
      
      $("#save").click(function(){
    	  oEditors.getById["editorTxt"].exec("UPDATE_CONTENTS_FIELD", []);
    	  $("#writeform").submit();
      });
      
    })
  </script>
</body>
</html>