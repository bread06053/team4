<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html>
<style>
@import url('https://fonts.googleapis.com/css2?family=Dongle&display=swap');
</style>
<head>
<title>Insert title here</title>
<link rel="preconnect" href="https://fonts.googleapis.com"><link rel="preconnect" href="https://fonts.gstatic.com" crossorigin><link href="https://fonts.googleapis.com/css2?family=Dongle&display=swap" rel="stylesheet">
<style>
@import url('https://fonts.googleapis.com/css2?family=Dongle&display=swap');
.yoyoRight dl a img {
    width: 80px;
    border-radius: 100%;
}
a {
    color: #333;
    text-decoration: none;
}
img {
    vertical-align: middle;
     border: 0;
}
.yoyo_top_wrap {
    background: #fff;
    width: 100%;
    height: 112px;
}
div {
    display: block;
}
.yoyo_top {
    width: 1240px;
    margin: 0 auto;
    padding: 16px 0 0 176px;
    display:flex;
}
.yoyoNavi{
	background-color:peru;
	list-style-type:none;
	text-align:center;
	margin:0;
	padding:0;
	width:100%;
}
.yoyoNavi li{
	width:25%; <%--네비바 간격 조절--%>
	color:ivory;
	display:inline-block;
	font-size:32px;
	font-family: 'Dongle', sans-serif;
	padding:8px;
}
.yoyoNavi a{
	color:ivory;
}
.yoyo_search {
    width: 450px;
    display: inline-block;
    padding-top: 12px;
}
form {
    display: block;
    margin-top: 0em;
}
.input-group {
    position: relative;
    display: table;
    border-collapse: separate;
}
.yoyo_search .form-control {
    border: 1px solid #ccc;
    background: #fbfbfb;
    height: 38px;
}
.input-group .form-control, .input-group-addon, .input-group-btn {
    display: table-cell;
}
.form-control {
    display: block;
    width: 100%;
    height: 34px;
    padding: 6px 12px;
    font-size: 14px;
    line-height: 1.42857143;
    color: #555;
    background-color: #fff;
    background-image: none;
    border: 1px solid #ccc;
    border-radius: 4px;
    }
    .input-group-btn {
    position: relative;
    font-size: 0;
    white-space: nowrap;
    width: 1%;
}

h1 img{
	width:186px;
	height:67px;
	object-fit:contain;

	
}
.glyphicon {
    position: relative;
    top: 1px;
    display: inline-block;
    font-family: 'Glyphicons Halflings';
    font-style: normal;
    font-weight: 400;
    line-height: 1;
    -webkit-font-smoothing: antialiased;
    -moz-osx-font-smoothing: grayscale;
}
</style>
</head>
<body>
<div class="yoyo_top_wrap">
	<div class="yoyo_top">
	<h1>
	<a herf="http://localhost:8084/chan/subHeader">
	<img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTYeFHo_i34CbGLC4ZmZyjA3V8XSK_sUHWE7A&usqp=CAU" alt="로고">
	</a>
	</h1>
	<div class="yoyo_search">
	<form id="yoyoSearch" method="get" action="">
		<div class="input-group">
		<input id="yoyotext" name="q" type="text" class="form-control ui-autocmplete-input" placeholder values style="ime-mode:active;" autocomplete="off">	
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
<ul class="yoyoRight">    
<dl style="position:relative">
	<div style="position: absolute; width:100px; top: 47px; left: 0; margin-left: -25px;display:none;">
         <span style="margin: 0; padding: 0; font-size: 0; display: block; text-align: center;"><img src="" width="8"></span>
         <span style="border-radius: 2px; background: #ffd200; color: #000; display: block; font-size: 11px; padding:2px 5px; text-align: center;">회원가입</span>
    </div>
    <a href="">
    <img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSKqph2wqtX84lDFu9tH5kMGjUQwoL14qT45w&usqp=CAU" alt="로그인">
    </a>
</dl>
</ul>
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
        <style>
        @media (max-width:1400px){.partners_banner {display: none;}}
    </style>
</div>
</body>
</html>