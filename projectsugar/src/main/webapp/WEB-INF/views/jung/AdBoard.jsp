<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<%@ page session="true"%>
<c:set var="loginId" value="${sessionScope.id}"/>
<c:set var="loginOutLink" value="${loginId=='' ? '/login/login' : '/login/logout'}"/>
<c:set var="loginOut" value="${loginId=='' ? 'Login' : 'ID='+=loginId}"/>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <link rel="stylesheet" href="<c:url value='/css/menu.css'/>">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <script src="https://code.jquery.com/jquery-1.11.3.js"></script>
    <style>
        * {
            box-sizing: border-box;
            margin: 0;
            padding: 0;
            font-family: "Noto Sans KR", sans-serif;
        }
        .container {
            width : 50%;
            margin : auto;
        }
        .writing-header {
            position: relative;
            margin: 20px 0 0 0;
            padding-bottom: 10px;
            border-bottom: 1px solid #323232;
        }
        input {
            width: 100%;
            height: 35px;
            margin: 5px 0px 10px 0px;
            border: 1px solid #e9e8e8;
            padding: 8px;
            background: #f8f8f8;
            outline-color: #e6e6e6;
        }
        textarea {
            width: 100%;
            background: #f8f8f8;
            margin: 5px 0px 10px 0px;
            border: 1px solid #e9e8e8;
            resize: none;
            padding: 8px;
            outline-color: #e6e6e6;
        }
        .frm {
            width:100%;
        }
        .btn {
            background-color: rgb(236, 236, 236); /* Blue background */
            border: none; /* Remove borders */
            color: black; /* White text */
            padding: 6px 12px; /* Some padding */
            font-size: 16px; /* Set a font size */
            cursor: pointer; /* Mouse pointer on hover */
            border-radius: 5px;
        }
        .btn:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>
<script>
    let msg = "${msg}";
    if(msg=="WRT_ERR") alert("신고 등록에 실패하였습니다. 다시 시도해 주세요.");
</script>
<div class="container">
    <h2 class="writing-header">신고 ${mode=="new" ? "글쓰기" : "읽기"}</h2>
    <form id="form" class="frm" action="" method="post">
        <input type="hidden" name="bno" value="${adBoard.bno}">
		<input type="hidden" name="pno" value="${pno}">

        <input name="btitle" type="text" value="${adBoard.btitle}" placeholder="  제목을 입력해 주세요." ${mode=="new" ? "" : "readonly='readonly'"}>            <br>
        <textarea name="btext" rows="20" placeholder=" 내용을 입력해 주세요." ${mode=="new" ? "" : "readonly='readonly'"}>${adBoard.btext}</textarea>      <br>
		<c:if test="${mode eq 'new'}">
			<button type="button" id="writeBtn" class="btn btn-write"><i class="fa fa-pencil"></i> 등록</button>
			<button type="button" id="listBtn" class="btn btn-list"><i class="fa fa-bars"></i> 목록</button>
		</c:if>
		<c:if test="${mode ne 'new'}">
			<button type="button" id="removeBtn" class="btn btn-remove"><i class="fa fa-trash"></i> 삭제</button>
        	<button type="button" id="banListBtn" class="btn btn-list"><i class="fa fa-bars"></i> 목록</button>
		</c:if>
    </form>
</div>
<script>
    $(document).ready(function(){
		let formCheck = function() {
			let form = document.getElementById("form");
			if(form.btitle.value=="") {
				alert("제목을 입력해 주세요.");
				form.btitle.focus();
				return false;
			}
			if(form.btext.value=="") {
				alert("내용을 입력해 주세요.");
				form.btext.focus();
				return false;
			}
			return true;
		}

		$("#writeBtn").on("click", function(){
			let form = $("#form");
			form.attr("action", "<c:url value='/member/ban'/>");
			form.attr("method", "post");
			if(formCheck())
				form.submit();
		});

        $("#removeBtn").on("click", function(){
            if(!confirm("정말로 삭제하시겠습니까?")) return;
            let form = $("#form");
            form.attr("action", "<c:url value='/admin/remove?page=${page}&pageSize=${pageSize}'/>");
            form.attr("method", "post");
            form.submit();
        });
        $("#banListBtn").on("click", function(){
            location.href="<c:url value='/admin/list?page=${page}&pageSize=${pageSize}'/>";
        });
    });
</script>
</body>
</html>
