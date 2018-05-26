<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page errorPage="errorpage.jsp"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>회원가입</title>
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
		<fieldset>
			<legend>회원가입</legend>
			<h4>
				가입할 회원 정보를 입력하세요
				<br>
				(*은 필수 입력 항목입니다)
			</h4>
			<form action="/joinus" method="get">
				아이디
				<input type="text" name="id" id="id" placeholder="아이디" required>
				<button type="button">아이디 중복체크</button>
				<br>
				비밀번호
				<input type="password" name="pwd" id="pwd" placeholder="비밀번호" required>
				<br>
				비밀번호 확인
				<input type="password" name="pwdRe" id="pwdRe" placeholder="비밀번호 확인" required>
				<br>
				이름
				<input type="text" name="name" id="name" placeholder="이름" required>
				<br>
				나이
				<input type="text" name="age" id="age" placeholder="나이" required>
				<br>
				이메일
				<input type="text" name="mail" id="mail" placeholder="이메일" required>
				<br>
				전화번호
				<input type="text" name="phone" id="phone" placeholder="전화번호" required>
				<br>
				주소
				<input type="text" name="addr" id="addr" placeholder="주소" required>
				<br>
				성별
				<input type="radio" name="gender" id="genderM" value="M">
				남
				<input type="radio" name="gender" id="genderF" value="F">
				여
				<br>
				취미
				<input type="text" name="hobby" id="hobby" placeholder="취미" required>
				<br>
				<br>
				<input type="submit" value="회원가입">
				<button type="button" onclick="back();">취소</button>
			</form>
		</fieldset>
	</div>
</body>

<script>
	function back() {
		history.back(-1);
	}
</script>

</html>