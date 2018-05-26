<%@page import="jsp.member.model.vo.MemberVo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%
	MemberVo mv = (MemberVo) session.getAttribute("user");
%>

<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>Document</title>
</head>

<style>
* {
	padding: 0;
	margin: 0;
}

fieldset {
	padding: 15px;
}

.wrapper {
	display: table;
	margin: 0 auto;
	text-align: center;
}
</style>

<body>
	<%
		if (mv != null) {
			response.sendRedirect("/Views/member/loginSuccess.jsp");
		} else {
	%>
	<div class="wrapper">
		<h1>메인페이지</h1>
		<fieldset>
			<legend>로그인</legend>
			<form action="/memberLogin" method="post">
				아이디 <input type="text" name="userId" id="userId" placeholder="아이디 입력" required
					pattern="^[a-z0-9_]{4,16}$"
				> <br> 비밀번호 <input type="password" name="userPwd" id="userPwd" placeholder="비밀번호입력"
					required pattern="^[a-zA-Z0-9!@#$%^&*()_+|-=\]{4,16}$"
				> <br> <input type="submit" value="로그인"> <a href="/Views/member/joinus.jsp">회원가입</a>
				<a href="/Views/member/idfind.jsp">ID 찾기</a> <a href="/Views/member/pwchange.jsp">PW
					변경</a>
			</form>
		</fieldset>
	</div>
</body>

<%
	}
%>

</html>