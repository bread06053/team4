<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html>
<style>
@import url('https://fonts.googleapis.com/css2?family=Dongle&display=swap');
</style>
<head>
<link rel="stylesheet" href="/css/mainHeader.css"/>
<title>Insert title here</title>
<link rel="preconnect" href="https://fonts.googleapis.com"><link rel="preconnect" href="https://fonts.gstatic.com" crossorigin><link href="https://fonts.googleapis.com/css2?family=Dongle&display=swap" rel="stylesheet">
<style>
@import url('https://fonts.googleapis.com/css2?family=Dongle&display=swap');

</style>
</head>
<body>
<script>
$(document).ready(function() {
    doRTKeyword();

    $("#yoyoText").keypress(function(event) {
        if (event.which == 13) {
            event.preventDefault();
            $("#yoyoSearch").submit();
        }
    }).autocomplete({
        delay: 200,
        source: "https://www.10000recipe.com/recipe/ajax.html?q_mode=autoComplete",
        focus: function(event, ui) {
            return false;
        },
        select: function(event, ui) {
            this.value = ui.item.label;
            return false;
        }
    }).focus();

    $('.ui-autocomplete').css('z-index','10000');
});



var curRtword = 2;
function doRTKeyword()
{
    var backRtword = (curRtword == 1) ? 2 : 1;
    $("#RtwordDiv_"+curRtword).hide();
    $("#RtwordDiv_"+backRtword).show();
    curRtword = backRtword;
}
</script>
<div class="yoyo_top_wrap">
	<div class="yoyo_top">
	<h1>
	<a href="http://localhost:8084/chan/main">
	<img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTYeFHo_i34CbGLC4ZmZyjA3V8XSK_sUHWE7A&usqp=CAU" alt="로고">
	</a>
	</h1>
	<div class="yoyo_search">
	<form id="yoyoSearch" method="get" action="">
		<div class="input-group">
		<input id="yoyoText" name="q" type="text" class="form-control ui-autocmplete-input" placeholder values="" style="ime-mode:active;" autocomplete="off">	
		<span class="input-group-btn">
		<button class="btn btn-default" type="button" onclick="$('#yoyoSearch').submit();">
			<span class="glyphicon glyphicon-search">
			::검색
			</span>
		</button>	
		</span>
		</div>
	</form>	
</div> 
<dl class="yoyoRight" style="position:relative">
	<div style="position: absolute; width:100px; top: 47px; left: 0; margin-left: -25px;display:none; margin:10;">
         <span style="margin: 10; padding: 10; font-size: 0; display: block; text-align: center;"><img src="" width="8"></span>
         <span style="border-radius: 2px; background: #ffd200; color: #000; display: block; font-size: 11px; padding:2px 5px; text-align: center;">회원가입</span>
    </div>
    <a href="">
    <img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSKqph2wqtX84lDFu9tH5kMGjUQwoL14qT45w&usqp=CAU" alt="로그인">
    </a>
</dl>
</div>
</div>
<div class="yoyo_navi">
            <ul class="yoyoNavi">
                <li><a href="https://www.10000recipe.com/index.html">Best 레시피</a>
                </li>
                <li><a href="https://www.10000recipe.com/recipe/list.html" class="active">나만의 레시피</a>
                </li>
                <li><a href="https://www.10000recipe.com/ranking/home_new.html">커뮤니티</a>
                </li>
            </ul>
        </div>
</body>
</html>