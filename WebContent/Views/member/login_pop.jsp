<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
<title>로그인</title>
</head>

<body>
	<div class="wrapper">
		<form action="/memberLogin" method="POST" class="login-form">
			<div class="form-group">
				<label>아이디</label>
				<input type="text" name="userId" class="form-control" id="userId" placeholder="아이디 입력" pattern="^[a-z0-9_]{4,16}$">
			</div>
			<div class="form-group">
				<label>비밀번호</label>
				<input type="password" name="userPwd" class="form-control" id="userPwd" placeholder="비밀번호 입력" pattern="^[a-zA-Z0-9!@#$%^&*()_+|-=\]{4,16}$">
			</div>
			<div class="alert alert-danger" style="display: none" id="danger">
				<strong>오류 : </strong> 입력하지 않은 항목이 있습니다!
			</div>
			<button type="submit" class="btn btn-primary" onclick="return login();">로그인</button>
		</form>
	</div>
</body>
</html>