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
<title>경고</title>
</head>

<body>
	<div id="myModal" class="modal fade" role="dialog">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" style="text-align: center;">
						※ 비밀번호를 변경한지 90일이 지났습니다
						<br>
						보안 상 변경 하세요
					</h5>
					<button type="button" class="close" data-dismiss="modal" onclick="back();">x</button>
				</div>
				<div class="modal-body"></div>
			</div>
		</div>
	</div>
</body>

<script>
	$(document).ready(function() {
		$('#myModal').modal({
			show : true
		});
	});

	function back() {
		window.location.href = "/Views/member/loginSuccess.jsp";
	}
</script>
</html>