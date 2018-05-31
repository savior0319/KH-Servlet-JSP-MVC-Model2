<%@page import="jsp.file.model.vo.FileVo"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	@SuppressWarnings("all")
	ArrayList<FileVo> aList = (ArrayList<FileVo>) request.getAttribute("fileList");
%>


<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" integrity="sha384-WskhaSGFgHYWDcbwN70/dfYBj47jz9qbsMId/iRN3ewGhXQFZCSftd1LZCfmhktB"
	crossorigin="anonymous"
>
</script>
<title>파일 전체 목록</title>
</head>

<style>
.table {
	width: 800px;
}

.jumbotron {
	width: 800px;
	text-align: center;
	background: skyblue;
	text-align: center;
}
</style>

<body>
	<center>
		<div class="jumbotron">
			<h1>파일 전체 목록</h1>
			<br>
			<button type="button" class="btn btn-primary" onclick="back();">뒤로가기</button>
		</div>
		<table class="table">
			<thead class="thead-light">
				<tr>
					<th>파일 이름</th>
					<th>파일 사이즈</th>
					<th>업로더</th>
					<th>업로드 시간</th>
					<th>다운로드</th>
					<th>삭제</th>
				</tr>
			</thead>
			<%
				for (FileVo fv : aList) {
			%>
			<tr>
				<td><%=fv.getFileName()%></td>
				<td><%=fv.getFileSize() / 1024 + "KB"%>
				</td>
				<td><%=fv.getFileUser()%></td>
				<td><%=fv.getUpload()%></td>
				<td>
					<button class="btn btn-primary">다운로드</button>
				</td>
				<td>
					<button class="btn btn-danger">삭제</button>
				</td>
			</tr>
			<%
				}
			%>
		</table>
	</center>
</body>

<script type="text/javascript">
	function back() {
		window.location.href = "/Views/member/mainpage.jsp";
	}
</script>

</html>