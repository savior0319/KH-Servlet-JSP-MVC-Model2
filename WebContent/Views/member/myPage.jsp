<%@page import="jsp.member.model.vo.MemberVo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
<title>마이페이지</title>
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
		<h1>
			<%=mv.getUserName() + " 마이페이지"%>
		</h1>
		<hr>
		<h3>
			<fieldset>
				<form action="/memberupdate" method="post">
					<br>
					아이디
					<input type="text" name="id" value="<%=mv.getUserId()%>" readonly="readonly">
					<br>
					비밀번호
					<input type="password" name="pw" value="" id="pwd">
					<br>
					이름
					<input type="text" name="name" readonly="readonly" value="<%=mv.getUserName()%>">
					<br>
					나이
					<input type="text" name="age" readonly="readonly" value="<%=mv.getAge()%>">
					<br>
					메일
					<input type="text" name="mail" value="<%=mv.getEmail()%>">
					<br>
					전화번호
					<input type="text" name="phone" value="<%=mv.getPhone()%>">
					<br>
					주소
					<input type="text" name="addr" value="<%=mv.getAddress()%>">
					<br>
					성별 남
					<input type="radio" value="genderM" name="gender" disabled <%if (mv.getGender().equals("M")) {%> checked="checked" <%}%>>
					여
					<input type="radio" value="genderF" name="gender" disabled <%if (mv.getGender().equals("F")) {%> checked="checked" <%}%>>
					<br>
					취미
					<input type="text" value="<%=mv.getHobby()%>" name="hobby">
					<br>
					가입일
					<input type="text" value="<%=mv.getEnrollDate()%>" readonly="readonly">
					<br>
					<br>
					<input type="submit" value="수정하기" onclick="return btn();">
					<button type="button" onclick="back();">뒤로가기</button>
				</form>
			</fieldset>
		</h3>
	</div>
</body>

<script>
	function back() {
		history.back(-1);
	}
	
	function btn(){
		if(document.getElementById("pwd").value == ""){
			alert('비밀번호를 입력해주세요');
			return false;
		}
	}
	
</script>

</html>