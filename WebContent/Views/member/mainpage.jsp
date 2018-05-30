<%@page import="jsp.member.model.vo.MemberVo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page errorPage="errorpage.jsp"%>
<%
	MemberVo mv = (MemberVo) session.getAttribute("user");
%>

<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" integrity="sha384-WskhaSGFgHYWDcbwN70/dfYBj47jz9qbsMId/iRN3ewGhXQFZCSftd1LZCfmhktB"
	crossorigin="anonymous"
>
</script>

<title>메인페이지</title>
</head>

<style>
.wrapper {
	margin: 0 auto;
	display: table;
}

.pwdField {
	font-size: 14px;
	color: red;
}

.jumbotron {
	text-align: center;
	background: skyblue;
}
</style>

<body>
	<div class="jumbotron">
		<h1>
			<%=mv.getUserName() + "님 환영합니다"%></h1>
	</div>
	<div class="wrapper">
		<h3>
			<br>
			<a href="#" id="myPage">마이페이지</a>
			<form action="/pwdcheck" method="post" id="pwdChk" style="display: none">
				<div class="pwdField">
					<br>
					비밀번호를 입력하세요
					<input type="password" name="userPwd" id="userPwd">
				</div>
			</form>
			<br>
			<a href="/logout">로그아웃</a>
			<br>
			<a href="#" id="userDelete">회원탈퇴</a>
			<form action="/pwdcheck1" method="post" id="pwdChk1" style="display: none">
				<div class="pwdField">
					<br>
					비밀번호를 입력하세요
					<input type="password" name="userPwd1" id="userPwd1">
				</div>
			</form>
			<br>
			<a href="/notice">공지사항</a>
			<br>
			<a href="/allMember" id="adminOnly" style="display: none">전체 회원 조회</a>
			<a href="/Views/upload/upload.jsp">파일업로드</a>
		</h3>
	</div>
</body>

<script>
	window.onload = function() {
		document.getElementById("adminOnly").style.display = "block";
	}
	$(document).ready(function() {
		$('#myPage').click(function() {
			$('#pwdChk').fadeIn(300);
		});

		$('#userDelete').click(function() {
			$('#pwdChk1').fadeIn(300);
		});
	});
</script>

<%
	if (!mv.getUserId().equals("admin")) {
%>
<script>
	$(document).ready(function() {
		$('#myPage').click(function() {
			$('#pwdChk').fadeIn(300);
		});

		$('#userDelete').click(function() {
			$('#pwdChk1').fadeIn(300);
		});
	});
</script>
<%
	}
%>

</html>