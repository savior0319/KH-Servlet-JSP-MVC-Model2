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
<%
	NoticeVo nvo = (NoticeVo) request.getAttribute("noticeUpdate");
	MemberVo mv = (MemberVo) session.getAttribute("user");
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
<title>[공지] <%=nvo.getSubject()%></title>
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
		<div class="card">
			<div class="card-body">
				<h5 class="card-title">
					<div class="input-group input-group-sm mb-3">
						<div class="input-group-prepend">
							<span class="input-group-text" id="inputGroup-sizing-sm">글제목</span>
						</div>
						<input type="text" class="form-control" aria-label="Small" aria-describedby="inputGroup-sizing-sm" value="<%=nvo.getSubject()%>" id="subject">
					</div>
					<hr>
					<h6 class="card-subtitle mb-2 text-muted">
						글쓴이 :
						<%=nvo.getUserId()%><br>
						작성일 :
						<%=nvo.getRegDate()%>
					</h6>
					<p class="card-text">
						<br>
						<textarea class="form-control" rows="10" id="content"><%=nvo.getContents()%></textarea>
					</p>
			</div>
		</div>
		<br>
		<button type="button" class="btn btn-primary" onclick="back();">목록</button>
		<button type="button" class="btn btn-warning" onclick="modify();">수정</button>
		<button type="button" class="btn btn-danger" onclick="delte();">삭제</button>
		<button type="button" class="btn btn-success" id="writeBtn" onclick="noticeWrite();">글쓰기</button>
	</center>
</body>

<script type="text/javascript">


	function back() {
		window.location.href = "/notice";
	}

	function modify() {
		var subject = $('#subject').val();
		var content = $('#content').val();

		window.location.href = "/noticeModifyAfter?noticeNo=" + "<%=nvo.getNoticeNo()%>" + "&content=" + content + "&subject=" + subject;
	}
</script>

<%
	if (mv.getUserId().equals("admin")) {
%>
<script>
	document.getElementById("writeBtn").style.display = "inline-block";

	function noticeWrite() {
		window.location.href = "/Views/notice/noticeWrite.jsp";
	}
</script>
<%
	}
%>

</html>