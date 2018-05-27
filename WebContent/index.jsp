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
<title>Document</title>
</head>

<style>
* {
	padding: 0;
	margin: 0;
	box-sizing: border-box;
}

fieldset {
	padding: 40px;
}

#userId {
	line-height: 30px;
}

#userPwd {
	line-height: 30px;
}

.wrapper {
	display: table;
	margin: 0 auto;
	text-align: center;
}

#loginBtn {
	height: 70px;
	width: 80px;
}

input:focus {
	border: 2px solid red;
}
</style>

<body>
	<%
		if (mv != null) {
			response.sendRedirect("/Views/member/loginSuccess.jsp");
		} else {
	%>
	<div class="wrapper">
		<br>
		<h1>index</h1>
		<br>
		<fieldset>
			<legend>로그인</legend>
			<form action="/memberLogin" method="post">
				<table>
					<tr>
						<td>아이디</td>
						<td>
							<input type="text" name="userId" id="userId" placeholder="아이디 입력" required pattern="^[a-z0-9_]{4,16}$">
						</td>
						<td rowspan="2">
							<input type="submit" value="로그인" id="loginBtn">
						</td>
					</tr>
					<tr>
						<td>비밀번호</td>
						<td>
							<input type="password" name="userPwd" id="userPwd" placeholder="비밀번호입력" required pattern="^[a-zA-Z0-9!@#$%^&*()_+|-=\]{4,16}$">
						</td>
					</tr>
				</table>
				<br>
				<a href="/Views/member/joinus.jsp">회원가입</a>
				<a href="/Views/member/idfind.jsp">ID 찾기</a>
				<a href="/Views/member/pwchange.jsp">PW 변경</a>
			</form>
		</fieldset>
	</div>
</body>

<!-- <script>
	history.pushState(null, null, location.href);
	window.onpopstate = function() {
		history.go(1);
	};
</script> 뒤로가기 방지-->

<%
	}
%>

</html>