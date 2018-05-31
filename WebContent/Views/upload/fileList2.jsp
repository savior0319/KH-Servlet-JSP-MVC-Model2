<%@page import="jsp.file.model.vo.FileVo2"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import="java.util.ArrayList"%>

<%
	@SuppressWarnings("all")
	ArrayList<FileVo2> aList = (ArrayList<FileVo2>) request.getAttribute("fileList");
%>

<!DOCTYPE html>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>파일 목록</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" integrity="sha384-WskhaSGFgHYWDcbwN70/dfYBj47jz9qbsMId/iRN3ewGhXQFZCSftd1LZCfmhktB"
	crossorigin="anonymous"
>
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js" integrity="sha384-smHYKdLADwkXOn1EmN1qk/HfnUcbVRZyYmZ4qpPea6sjB/pTJ0euyQp0Mk8ck+5T" crossorigin="anonymous"></script>

</head>
<body>
	<div class="container">
		<div class="jumbotron text-center">
			<h1>파일 업로드</h1>
		</div>
		<div class="row">
			<div class="col-md-12">
				<div class="table-responsive">
					<table class="table table-striped table-bordered table-hover text-center" border="1">
						<tr>
							<th>파일 이름</th>
							<th>파일 크기</th>
							<th>업로더</th>
							<th>업로드 시간</th>
							<th>다운로드</th>
							<th>삭제</th>
						</tr>
						<%
							for (FileVo2 fv : aList) {
						%>
						<tr>
							<td><%=fv.getBeforeFileName()%></td>
							<td><%=fv.getFileSize()%></td>
							<td><%=fv.getFileUser()%></td>
							<td><%=fv.getUploadTime()%></td>
							<td>
								<form action="/fileDown2" method="post">
									<input type="hidden" name="uploadTime" value="<%=fv.getUploadTime()%>">
									<input type="hidden" name="fileName" value="<%=fv.getAfterFileName()%>">
									<input type="submit" value="다운로드">
								</form>
							</td>

							<td>
								<form action="/fileRemove" method="post">
									<input type="submit" value="파일삭제">
								</form>
							</td>
						</tr>
						<%
							}
						%>
					</table>
				</div>
			</div>
		</div>
		<div class="row">
			<div class="col-md-12 text-center">
				<a href="/Views/member/mainpage.jsp">뒤로가기</a>
			</div>
		</div>
	</div>

</body>
</html>