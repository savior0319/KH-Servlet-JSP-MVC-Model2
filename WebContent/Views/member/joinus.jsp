<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page errorPage="errorpage.jsp"%>

<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js"></script>
<title>회원가입</title>
</head>

<style>
.wrapper {
	margin: 0 auto;
	text-align: center;
}

.jumbotron {
	text-align: center;
	background: skyblue;
}

fieldset {
	width: 500px;
	margin: 0 auto;
}
</style>

<body>
	<div class="wrapper">
		<div class="jumbotron">
			<h1>회원가입</h1>
		</div>
		<fieldset>
			<h5>
				가입할 회원 정보를 입력하세요
				<br>
				(*은 필수 입력 항목입니다)
			</h5>
			<form action="/joinus" method="get">

				<br>
				<div class="input-group mb-3">
					<div class="input-group-prepend">
						<span class="input-group-text" id="inputGroup-sizing-default">아이디</span>
					</div>
					<input type="text" class="form-control" aria-label="Default" aria-describedby="inputGroup-sizing-default" name="id" id="id" placeholder="아이디" pattern="^[a-z0-9_]{4,16}$">
				</div>

				<span id="idCheckMessage"></span>

				<div class="input-group mb-3">
					<div class="input-group-prepend">
						<span class="input-group-text" id="inputGroup-sizing-default">비밀번호</span>
					</div>
					<input type="password" class="form-control" aria-label="Default" aria-describedby="inputGroup-sizing-default" name="pwd" id="pwd" placeholder="비밀번호" pattern="^[a-zA-Z0-9!@#$%^&*()_+|-=\]{4,16}$">
				</div>

				<div class="input-group mb-3">
					<div class="input-group-prepend">
						<span class="input-group-text" id="inputGroup-sizing-default">비밀번호 확인</span>
					</div>
					<input type="password" class="form-control" aria-label="Default" aria-describedby="inputGroup-sizing-default" name="pwdRe" id="pwdRe" placeholder="비밀번호 확인"
						pattern="^[a-zA-Z0-9!@#$%^&*()_+|-=\]{4,16}$"
					>
				</div>

				<div class="input-group mb-3">
					<div class="input-group-prepend">
						<span class="input-group-text" id="inputGroup-sizing-default">이름</span>
					</div>
					<input type="text" class="form-control" aria-label="Default" aria-describedby="inputGroup-sizing-default" name="name" id="name" placeholder="이름">
				</div>

				<div class="input-group mb-3">
					<div class="input-group-prepend">
						<span class="input-group-text" id="inputGroup-sizing-default">나이</span>
					</div>
					<input type="text" class="form-control" aria-label="Default" aria-describedby="inputGroup-sizing-default" name="age" id="age" placeholder="나이">
				</div>

				<div class="input-group mb-3">
					<div class="input-group-prepend">
						<span class="input-group-text" id="inputGroup-sizing-default">이메일</span>
					</div>
					<input type="text" class="form-control" aria-label="Default" aria-describedby="inputGroup-sizing-default" name="mail" id="mail" placeholder="이메일">
				</div>

				<button type="button" class="btn btn-primary" onclick="sendEmail();">이메일 인증</button>

				<br>
				<br>

				<div class="input-group mb-3">
					<div class="input-group-prepend">
						<span class="input-group-text" id="inputGroup-sizing-default">전화번호</span>
					</div>
					<input type="text" class="form-control" aria-label="Default" aria-describedby="inputGroup-sizing-default" name="phone" id="phone" placeholder="전화번호">
				</div>

				<div class="input-group mb-3">
					<div class="input-group-prepend">
						<span class="input-group-text" id="inputGroup-sizing-default">주소</span>
					</div>
					<input type="text" class="form-control" aria-label="Default" aria-describedby="inputGroup-sizing-default" name="addr" id="addr" placeholder="주소">
				</div>
				성별&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<input type="radio" name="gender" id="genderM" value="M">
				남 &nbsp;&nbsp;&nbsp;
				<input type="radio" name="gender" id="genderF" value="F">
				여
				<br>
				<br>

				<div class="input-group mb-3">
					<div class="input-group-prepend">
						<span class="input-group-text" id="inputGroup-sizing-default">취미</span>
					</div>
					<input type="text" class="form-control" aria-label="Default" aria-describedby="inputGroup-sizing-default" name="hobby" id="hobby" placeholder="취미">
				</div>
				<div class="alert alert-danger" style="display: none" id="danger">
					<strong>오류 : </strong> 입력하지 않은 항목이 있습니다!
				</div>
				<div class="alert alert-danger" style="display: none" id="idDanger">
					<strong>오류 : </strong> 아이디를 확인해주세요
				</div>
				<div class="alert alert-danger" style="display: none" id="pwDanger">
					<strong>오류 : </strong> 비밀번호 확인이 일치하지 않습니다
				</div>
				<input type="submit" class="btn btn-primary" value="회원가입" onclick="return submitBtn();">
				<button type="button" class="btn btn-danger" onclick="back();">취소</button>
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
		var id = $('#id').val();
		if (id == "") {
			// 빈 칸일때 backspace 방지
			$('#idCheckMessage').html("");
		} else {
			$.ajax({
				type : 'POST',
				url : '/idcheck',
				data : {
					id : id
				},
				success : function(result) {
					if (result == 1) {
						$('#idCheckMessage').html('이미 사용중인 아이디 입니다<br><br>').css('color', 'red').css('font-size', '14px');
					} else {
						$('#idCheckMessage').html('사용 가능한 아이디 입니다<br><br>').css('color', 'blue').css('font-size', '14px');
						idCheck1 = id;
					}
				}
			});
		}
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
			$('#idDanger').hide();
			$('#pwDanger').hide();
			$('#danger').show();
			return false;
		} else if (idCheck1 != idCheck2) {
			$('#danger').hide();
			$('#pwDanger').hide();
			$('#idDanger').show();
			return false;
		} else if ($('#pwd').val() != $('#pwdRe').val()) {
			$('#danger').hide();
			$('#idDanger').hide();
			$('#pwDanger').show();
			return false;
		}
		else return true;
	}

	function sendEmail() {
		var windowW = 500; // 창의 가로 길이
		var windowH = 180; // 창의 세로 길이
		var left = Math.ceil((window.screen.width - windowW) / 2);
		var top = Math.ceil((window.screen.height - windowH) / 2) - 75;


		var mail = document.getElementById("mail").value;
		window.open("/Views/member/mailAuth.jsp?userEmail=" + mail, "_blank", "top=" + top + ", left=" + left + ", height=" +
			windowH + ", width=" +
			windowW);


	}
</script>

</html>