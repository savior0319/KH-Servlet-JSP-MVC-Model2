<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page errorPage="errorpage.jsp"%>

<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
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
				<input type="text" name="id" id="id" placeholder="아이디">
				<!-- 			<button type="button" id="idDuplicateCheckBtn" onclick="idDuplicateCheck();">
				아이디 중복체크</button> -->
				<span id="idCheckMessage"></span>
				<br>
				비밀번호
				<input type="password" name="pwd" id="pwd" placeholder="비밀번호">
				<br>
				비밀번호 확인
				<input type="password" name="pwdRe" id="pwdRe" placeholder="비밀번호 확인">
				<br>
				이름
				<input type="text" name="name" id="name" placeholder="이름">
				<br>
				나이
				<input type="text" name="age" id="age" placeholder="나이">
				<br>
				이메일
				<input type="text" name="mail" id="mail" placeholder="이메일">
				<br>
				전화번호
				<input type="text" name="phone" id="phone" placeholder="전화번호">
				<br>
				주소
				<input type="text" name="addr" id="addr" placeholder="주소">
				<br>
				성별
				<input type="radio" name="gender" id="genderM" value="M">
				남
				<input type="radio" name="gender" id="genderF" value="F">
				여
				<br>
				취미
				<input type="text" name="hobby" id="hobby" placeholder="취미">
				<br>
				<br>
				<input type="submit" value="회원가입" onclick="return submitBtn();">
				<button type="button" onclick="back();">취소</button>
			</form>
		</fieldset>
	</div>
</body>

<script>
	// 전역 변수 선언
	var idCheck1 = "",
		idCheck2 = "";

	window.onload = function() {}

	function back() {
		history.back(-1);
	}

	// 아이디 중복체크 AJAX
	$('#id').keyup(function() {
		// function idDuplicateCheck() {
		var id = $('#id').val();

		if (id == "") {
			alert('아이디를 입력해주세요');
		} else {
			$.ajax({
				type : 'POST',
				url : '/idcheck',
				data : {
					id : id
				},
				success : function(result) {
					if (result == 1) {
						/* 	alert('이미 사용중인 아이디 입니다'); */
						$('#idCheckMessage').html('<br>이미 사용중인 아이디 입니다').css('color', 'red').css('font-size', '14px');
					} else {
						/* 	alert('사용 가능한 아이디 입니다'); */
						$('#idCheckMessage').html('<br>사용 가능한 아이디 입니다').css('color', 'blue').css('font-size', '14px');
						idCheck1 = id;
					}
				}
			});
		}
	// }
	});

	// 가입 버튼
	function submitBtn() {
		var id = $('#id').val();
		idCheck2 = id;

		if (document.getElementById('id').value == '' || document.getElementById('pwd').value == '' || document.getElementById(
				'pwdRe').value == '' || document.getElementById('name').value == '' || document.getElementById('age').value == '' ||
			document.getElementById('mail').value == '' || document.getElementById('phone').value == '' || document.getElementById(
				'addr').value == '' || document.getElementById('hobby').value == '' || ($('#genderM').is(":checked") == false &&
			$('#genderF').is(":checked") == false)) {
			alert('입력하지 않은 항목이 있습니다');
			return false;
		} else if (idCheck1 != idCheck2) {
			alert('아이디 중복체크를 확인해주세요');
			return false;
		} else return true;
	}
</script>

</html>