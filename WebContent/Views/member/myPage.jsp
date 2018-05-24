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

<body>
	<center>
		<h1><%=mv.getUserName() + " 마이페이지"%></h1>
		<hr>
		<h3>
			<%="아이디 : " + mv.getUserId()%><br>
			<%="비밀번호 : " + mv.getUserPwd()%><br>
			<%="이름 : " + mv.getUserName()%><br>
			<%="나이 : " + mv.getAge()%><br>
			<%="메일 : " + mv.getEmail()%><br>
			<%="전화번호 : " + mv.getPhone()%><br>
			<%="성별 : " + mv.getGender()%><br>
			<%="취미 : " + mv.getHobby()%><br>
			<%="가입일 : " + mv.getEnrollDate()%><br>
		</h3>
	</center>
</body>

</html>