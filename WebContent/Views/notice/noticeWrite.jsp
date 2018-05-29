<%@page import="jsp.member.model.vo.MemberVo"%>
<%@page import="oracle.net.aso.n"%>
<%@page import="jsp.notice.model.vo.NoticeVo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	String strReferer = request.getHeader("referer");

	if (strReferer == null) {
%>
<script>
	alert("정상적인 경로를 통해 다시 접근하세요.");
	document.location.href = "/index.jsp";
	history.back(-1);
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
<title>공지사항 작성</title>
</head>

<style>
.card {
	width: 800px;
	margin-top: 30px;
	padding: 30px;
}

.jumbotron {
	text-align: center;
	background: skyblue;
}

#subject {
	width: 200px;
	border: none;
}
</style>

<body>
	<center>
		<div class="jumbotron">
			<h1>공지사항</h1>
		</div>

		<form method="get" action="/noticeWrite">
			<div class="card">
				<div class="card-body">
					<h5 class="card-title">
						<div class="input-group input-group-sm mb-3">
							<div class="input-group-prepend">
								<span class="input-group-text" id="inputGroup-sizing-sm">글제목</span>
							</div>
							<input type="text" class="form-control" aria-label="Small" aria-describedby="inputGroup-sizing-sm" value="" placeholder="공지 제목 작성" name="subject">
						</div>
						<hr>
						<h6 class="card-subtitle mb-2 text-muted"></h6>
						<p class="card-text">
							<br>
							<textarea class="form-control" rows="10" id="comment" placeholder="공지내용 작성"></textarea>
						</p>
				</div>
			</div>
			<br>
			<button type="button" class="btn btn-primary" onclick="back();">목록</button>
			<button type="submit" class="btn btn-success" onclick="complete();">완료</button>
		</form>
	</center>
</body>

<script type="text/javascript">

	function back() {
		window.location.href = "/notice";
	}
</script>

</html>