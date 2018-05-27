<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	String strReferer = request.getHeader("referer");

	if (strReferer == null) {
%>
<script>
	alert("정상적인 경로를 통해 다시 접근하세요.");
	window.location.href = "/index.jsp";
</script>
<%
	}
%>
<!DOCTYPE html>

<html>

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<title>아이디 중복 체크</title>
</head>

<style>
* {
	margin: 0;
	padding: 0;
}

.wrapper {
	margin: 0 auto;
	padding-top: 10px;
	display: table;
	text-align: center;
	margin: 0 auto;
	display: table;
}

#title {
	font-size: 18px;
	font-weight: 600;
}

#idChkBtn {
	margin-left: 5px;
}
</style>

<body>
	<div class="wrapper">
		<p id="title">사용 할 아이디를 입력하세요</p>
		<br>
		<input type="text" id="userId" name="userId" onkeypress="keyEvent();">
		<button onclick="idChk();" id="idChkBtn">아이디 중복 확인</button>
	</div>
</body>

<script>
	window.onload = function() {
		document.getElementById('userId').focus();
	}

	function idChk() {
		if (document.getElementById('userId').value == '') {
			alert('아이디를 입력하세요');
		} else {
			var userId = document.getElementById('userId').value;
			window.location.href = "/idcheck?userId=" + userId;
		}
	}

	function keyEvent() {
		if (window.event.keyCode == 13) {
			idChk();
		}
	}
</script>

</html>