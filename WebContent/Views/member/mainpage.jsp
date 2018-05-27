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
<title>메인</title>
</head>

<style>
.wrapper {
	margin: 0 auto;
	display: table;
}

#pwdField {
	font-size: 14px;
	color: red;
}
</style>

<body>
	<div class="wrapper">
		<h1>
			<%=mv.getUserName() + "님 환영합니다"%>
		</h1>
		<h3>
			<br>
			<a href="#" id="myPage">마이페이지</a>
			<form action="/pwdcheck" method="post" id="pwdChk">
				<div id="pwdField">
					<br>
					비밀번호 입력
					<input type="password" name="userPwd" id="userPwd">
				</div>
			</form>
			<br>
			<a href="/logout">로그아웃</a>
			<br>
			<a href="#">회원탈퇴</a>
			<br>
			<a href="/allMember" id="adminOnly">전체 회원 조회</a>
		</h3>
	</div>
</body>

<script>
	window.onload = function() {
		document.getElementById("pwdChk").style.display = 'none';
	}

	$(document).ready(function() {
		$('#myPage').click(function() {
			$('#pwdChk').fadeIn(500);
		});
	});
</script>

<%
	if (!mv.getUserId().equals("admin")) {
%>
<script>
	window.onload = function() {
		document.getElementById("adminOnly").style.display = 'none';
		document.getElementById("pwdChk").style.display = 'none';
	}

	$(document).ready(function() {
		$('#myPage').click(function() {
			$('#pwdChk').fadeIn(500);
		});
	});
</script>
<%
	}
%>

</html>