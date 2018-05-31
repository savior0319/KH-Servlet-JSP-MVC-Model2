<%@page import="jsp.member.model.vo.MemberVo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page errorPage="errorpage.jsp"%>

<%
	MemberVo mv = (MemberVo) session.getAttribute("user");
%>

<!DOCTYPE html>
<html lang="en">

<head>
<!-- Global site tag (gtag.js) - Google Analytics -->
<script async src="https://www.googletagmanager.com/gtag/js?id=UA-120156974-1"></script>
<script>
	window.dataLayer = window.dataLayer || [];
	function gtag() {
		dataLayer.push(arguments);
	}
	gtag('js', new Date());

	gtag('config', 'UA-120156974-1');
</script>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" integrity="sha384-WskhaSGFgHYWDcbwN70/dfYBj47jz9qbsMId/iRN3ewGhXQFZCSftd1LZCfmhktB"
	crossorigin="anonymous"
>
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<title>index</title>
</head>

<style>
.wrapper {
	margin: 0 auto;
	display: table;
}

.login-form {
	padding-top: 30px;
	padding-bottom: 30px;
	margin: 0 auto;
}

.jumbotron {
	text-align: center;
	background: skyblue;
}
</style>

<body>
	<%
		if (mv != null) {
			response.sendRedirect("/Views/member/loginSuccess.jsp");
		} else {
	%>

	<div class="jumbotron">
		<h1>로그인</h1>
	</div>
	<br>
	<br>
	<br>
	<br>
	<br>
	<div class="wrapper">
		<form action="/memberLogin" method="POST" class="login-form">
			<div class="form-group">
				<label>아이디</label>
				<input type="text" name="userId" class="form-control" id="userId" placeholder="아이디 입력" pattern="^[a-z0-9_]{4,16}$">
			</div>
			<div class="form-group">
				<label>비밀번호</label>
				<input type="password" name="userPwd" class="form-control" id="userPwd" placeholder="비밀번호 입력" pattern="^[a-zA-Z0-9!@#$%^&*()_+|-=\]{4,16}$">
			</div>
			<div class="alert alert-danger" style="display: none" id="danger">
				<strong>오류 : </strong> 입력하지 않은 항목이 있습니다!
			</div>
			<button type="submit" class="btn btn-primary" onclick="return login();">로그인</button>
			<button type="button" class="btn btn-primary" onclick="joinus();">회원가입</button>
			<button type="button" class="btn btn-primary" onclick="idsearch();">ID찾기</button>
			<button type="button" class="btn btn-primary" onclick="pwchange();">PW변경</button>
		</form>
	</div>
</body>

<!-- <script>
	history.pushState(null, null, location.href);
	window.onpopstate = function() {
		history.go(1);
	};
</script> 뒤로가기 방지-->

<script>
	$(document).ready(function() {
		$('#userId').focus();
	});

	function joinus() {
		window.location.href = "/Views/member/joinus.jsp";
	}

	function idfind() {
		window.location.href = "#";
	}

	function pwchange() {
		window.location.href = "#";
	}

	function login() {
		if ($('#userId').val() == "" && $('#userPwd').val() == "") {
			$('#danger').css('display', 'block');
			return false;
		}
	}
</script>

<%
	}
%>

</html>