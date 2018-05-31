<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
<title>파일 업로드</title>
</head>

<style>
.wrapper {
	border: 1px solid lightgray;
	padding: 20px;
	width: 600px;
}

.jumbotron {
	text-align: center;
	background: skyblue;
}
</style>

<body>
	<center>
		<div class="jumbotron">
			<h1>파일업로드</h1>
			<br>
			<button type="button" class="btn btn-primary" onclick="back()">뒤로가기</button>
		</div>
		<br>
		<br>
		<div class="wrapper">
			<form action="/upload" method="post" enctype="multipart/form-data">
				<input class="btn btn-primary" type="file" name="upfile">
				<input class="btn btn-success" type="submit" value="업로드">
				<input class="btn btn-danger" type="reset" value="취소">
		</div>
		</form>
	</center>
	<br>
</body>

<script type="text/javascript">
	function back() {
		window.location.href = "/Views/member/mainpage.jsp";
	}
</script>

</html>