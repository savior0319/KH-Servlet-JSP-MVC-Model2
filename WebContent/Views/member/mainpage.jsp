<%@page import="jsp.member.model.vo.MemberVo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
	<div class="wrapper">
		<h1><%=mv.getUserName() + "님 환영합니다"%></h1>
		<h3>
			<br> <a href="myPage.jsp">마이페이지</a><br> <a href="/logout">로그아웃</a><br>
			<a href="#">회원탈퇴</a><br>
		</h3>
	</div>
</body>

</html>