<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page errorPage="errorpage.jsp"%>
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
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js"></script>
<title>로그인 실패</title>
</head>

<style>
.jumbotron {
	text-align: center;
	background: hotpink;
}
</style>

<body>
	<div class="jumbotron">
		<h1>로그인 실패</h1>
	</div>

	<center>
		<div class="alert alert-info">
			<strong>경고</strong><br>아이디 또는 비밀번호를 다시 확인하세요
			<br>
			등록되지 않은 아이디이거나, 아이디 또는 비밀번호를 잘못 입력하셨습니다.
		</div>
		<a href="/index.jsp">돌아가기</a>
	</center>
</body>

</html>