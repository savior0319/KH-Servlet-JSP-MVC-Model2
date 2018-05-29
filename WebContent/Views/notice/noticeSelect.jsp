<%@page import="jsp.member.model.vo.MemberVo"%>
<%@page import="oracle.net.aso.n"%>
<%@page import="jsp.notice.model.vo.NoticeVo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	NoticeVo nv = (NoticeVo) request.getAttribute("nv");
	MemberVo mv = (MemberVo) session.getAttribute("user");
%>
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
<title>[공지] <%=nv.getSubject()%></title>
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
						<input type="text" class="form-control" readonly="readonly" aria-label="Small" aria-describedby="inputGroup-sizing-sm" value="<%=nv.getSubject()%>">
					</div>
					<hr>
					<h6 class="card-subtitle mb-2 text-muted">
						글쓴이 :
						<%=nv.getUserId()%><br>
						작성일 :
						<%=nv.getRegDate()%>
					</h6>
					<p class="card-text">
						<br>
						<textarea class="form-control" rows="10" id="content" readonly="readonly"><%=nv.getContents()%></textarea>
					</p>
			</div>
		</div>
		<br>
		<button type="button" class="btn btn-primary" onclick="back();">목록</button>
		<button type="button" class="btn btn-warning" onclick="modify();" style="display: none" id="modify">수정</button>
		<button type="button" class="btn btn-danger" data-toggle="modal" data-target="#exampleModal" style="display: none" id="delete">삭제</button>
		<button type="button" class="btn btn-success" onclick="noticeWrite();" style="display: none" id="noticeWrite">글쓰기</button>
	</center>

	<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">삭제 확인</h5>
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">정말 삭제 하시겠습니까?</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
					<button type="button" class="btn btn-primary" onclick="noticeDelete();">삭제</button>
				</div>
			</div>
		</div>
	</div>
</body>

<script type="text/javascript">

	function back() {
		window.location.href = "/notice";
	}

	function modify() {
		window.location.href = "/noticeModifyBefore?noticeNo=<%=nv.getNoticeNo()%>";
	}
</script>


<%
	if (mv.getUserId().equals("admin")) {
%>
<script type="text/javascript">
	document.getElementById("modify").style.display = "inline";
	document.getElementById("delete").style.display = "inline";
	document.getElementById("noticeWrite").style.display = "inline";

	function noticeWrite() {
		window.location.href = "/Views/notice/noticeWrite.jsp";
	}

	function noticeDelete() {
		window.location.href = "/noticeDelete?noticeNo=" + "<%=nv.getNoticeNo()%>";
	}
</script>
<%
	}
%>

</html>