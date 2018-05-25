<%@page import="jsp.member.model.vo.MemberVo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page errorPage="errorpage.jsp"%>

<%
	MemberVo mv = (MemberVo) request.getAttribute("memberInfo");
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
	text-align: center;
}
</style>

<body>
	<div class="wrapper">
		<h1><%=mv.getUserName() + " 마이페이지"%></h1>
		<hr>
		<h3>
			아이디 <input type="text" value="<%=mv.getUserId()%>"
				readonly="readonly"> <br> 이름 <input type="text"
				value="<%=mv.getUserName()%>" readonly="readonly"> <br>나이
			<input type="text" value="<%=mv.getAge()%>" readonly="readonly">
			<br>메일 <input type="text" value="<%=mv.getEmail()%>"
				readonly="readonly"> <br>전화번호 <input type="text"
				value="<%=mv.getPhone()%>" readonly="readonly"> 
			<br>성별
			남 <input type="radio" value="genderM" readonly="readonly" <% if(mv.getGender().equals("M")){ %> checked="checked" <% } %>> 
			여 <input type="radio" value="genderF" readonly="readonly" <% if(mv.getGender().equals("F")){ %> checked="checked" <% } %>> 
			<br>취미 <input type="text" value="<%=mv.getHobby()%>"
				readonly="readonly"> <br>가입일 <input type="text"
				value="<%=mv.getEnrollDate()%>" readonly="readonly">
		</h3>
		<br>
		<button type="button" onclick="back();">뒤로가기</button>
	</div>
</body>

<script>
	function back() {
		history.back(-1);
	}
</script>

</html>