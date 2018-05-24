<%@page import="jsp.member.model.vo.MemberVo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
.wrapper {
	margin: 0 auto;
	display: table;
}
</style>

<body>
	<%
		if (mv != null) {
	%>
	<div class="wrapper">
		<h2>로그인 성공</h2>
		<hr>
		<h3>
			<a href="mainpage.jsp">마이페이지 이동</a>
		</h3>
	</div>
	<%
		} else {
	%>
	<div class="wrapper">
		<h2>잘못된 접근 입니다</h2>
		<hr>
		<h3>
			<a href="/index.jsp">로그인 페이지로 이동</a>
		</h3>
	</div>
	<%
		}
	%>
</body>

</html>