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
<title>Document</title>
</head>

<body>
	<center>
		<h2>로그인 실패</h2>
		<hr>
		<h3>
			<%="아이디 또는 비밀번호를 다시 확인하세요"%><br>
			<%="등록되지 않은 아이디이거나, 아이디 또는 비밀번호를 잘못 입력하셨습니다."%>
		</h3>
		<a href="/index.jsp">돌아가기</a>
	</center>
</body>

</html>