<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css"
	integrity="sha384-WskhaSGFgHYWDcbwN70/dfYBj47jz9qbsMId/iRN3ewGhXQFZCSftd1LZCfmhktB" crossorigin="anonymous"
>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<title>게시판 - 자유게시판</title>
</head>

<style>
.wrapper {
	width: 800px;
	margin: 0 auto;
}

.jumbotron {
	width: 900px;
	text-align: center;
	margin: 0 auto;
}

#writer {
	width: 800px;
	margin: 0 auto;
	background: skyblue;
	padding: 5px;
}

table tr {
	display: none;
}

table tr.active {
	display: table-row;
}
</style>

<body>
	<div class="jumbotron">
		<h2>자유게시판</h2>
	</div>
	<br>
	<div id="writer">
		<hr>
		<h5>작성자 : ${content.writer}</h5>
		<small>작성일 : ${content.writeTime}</small>
		<hr>
	</div>
	<div class="wrapper">
		<textarea class="form-control" rows="20" cols="30" readonly="readonly">${content.content}</textarea>
		<br>
		<h3>댓글 작성</h3>
		<form action="/commentWrite" method="get">
			<textarea class="form-control" rows="5" cols="30" name="comment" placeholder="댓글 입력"></textarea>
			<input type="hidden" name="boardNum" value="${content.boardNum}" />
			<br>
			<div class="text-center">
				<input type="submit" class="btn btn-primary col-3" value="입력" />
			</div>
		</form>
		<br>
		<table class="table">
			<tr class="table-primary">
				<th>댓글작성자</th>
				<th>내용</th>
				<th>작성시간</th>
			</tr>
			<c:forEach items="${comment}" var="cm" begin="0" varStatus="status">
				<tr name="count">
					<td>${cm.writer}</td>
					<td>${cm.commentContent}</td>
					<td>${cm.commentTime}</td>
				</tr>
			</c:forEach>
		</table>
		<div class="text-center">
			<button class="btn btn-primary" id="more">댓글 더보기</button>
		</div>
		<br>
		<br>
	</div>
</body>
<!-- <script> 댓글 10개씩
	window.onload = function() {
		count = document.getElementsByName('count').length;
		test = parseInt(count / 10);

		if (count < 11) {
			$('#more').hide();
		}

	}


	$('table tr:lt(11)').addClass('active');

	click = 0;
	$('#more').on('click', function(e) {
		e.preventDefault();
		var $rows = $('table tr');
		var lastActiveIndex = $rows.filter('.active:last').index();
		$rows.filter(':lt(' + (lastActiveIndex + 11) + ')').addClass('active');
		click++;

		if (count % 10 == 0) {
			if ((test - 1) == click) {
				$('#more').hide();
			}
		} else {
			if (test == click) {
				$('#more').hide();
			}
		}

	});
</script> -->
<script>
	window.onload = function() {
		count = document.getElementsByName('count').length;
		test = parseInt(count / 5);

		if (count < 6) {
			$('#more').hide();
		}

	}


	$('table tr:lt(6)').addClass('active');

	click = 0;
	$('#more').on('click', function(e) {
		e.preventDefault();
		var $rows = $('table tr');
		var lastActiveIndex = $rows.filter('.active:last').index();
		$rows.filter(':lt(' + (lastActiveIndex + 6) + ')').addClass('active');
		click++;

		if (count % 5 == 0) {
			if ((test - 1) == click) {
				$('#more').hide();
			}
		} else {
			if (test == click) {
				$('#more').hide();
			}
		}
	});
</script>
</html>