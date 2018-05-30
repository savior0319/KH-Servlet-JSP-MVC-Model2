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
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" integrity="sha384-WskhaSGFgHYWDcbwN70/dfYBj47jz9qbsMId/iRN3ewGhXQFZCSftd1LZCfmhktB"
	crossorigin="anonymous"
>
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<title>로그인 성공 페이지</title>
</head>

<style>
.wrapper {
	margin: 0 auto;
	display: table;
}

.jumbotron {
	text-align: center;
	background: skyblue;
}
</style>

<body>
	<%
		if (mv != null) {
	%>

	<div class="jumbotron">
		<h1>로그인 성공!</h1>
	</div>
	<div class="wrapper">
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

<script type="text/javascript">
	window.onload = function() {
		if (opener != null) {
			opener.location.reload();
			close();
		}
	}
</script>
</html>