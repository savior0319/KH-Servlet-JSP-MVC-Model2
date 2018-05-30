<%@page import="java.util.ArrayList"%>
<%@page import="jsp.notice.model.vo.NoticeCommentVo"%>
<%@page import="jsp.member.model.vo.MemberVo"%>
<%@page import="jsp.notice.model.vo.NoticeVo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%
	@SuppressWarnings("all")
	ArrayList<NoticeCommentVo> aList = (ArrayList<NoticeCommentVo>) request.getAttribute("comment");
	NoticeVo nv = (NoticeVo) request.getAttribute("nv");
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
<title>[공지] <%=nv.getSubject()%>
</title>
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

.table, .comment {
	width: 800px;
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
						<%=nv.getUserId()%>
						<br>
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
					<h5 class="modal-title" id="exampleModalLabel">공지 삭제 확인</h5>
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">공지를 정말 삭제 하시겠습니까?</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
					<button type="button" class="btn btn-primary" onclick="noticeDelete();">삭제</button>
				</div>
			</div>
		</div>
	</div>

	<br>
	<center>
		<div class="comment">
			<h3>댓글작성</h3>
			<form action="noticeComment" method="get">
				<%
					if ((MemberVo) session.getAttribute("user") == null) {
				%>
				<textarea class="form-control" rows="3" id="notice" placeholder="로그인 한 사용자만 댓글 작성이 가능합니다" readonly="readonly" onclick="login();" name="content"></textarea>
				<%
					} else {
				%>
				<textarea class="form-control" rows="3" id="notice" placeholder="댓글을 작성하세요" name="comment"></textarea>
				<%
					}
				%>
				<%
					if (mv != null) {
				%>
				<input type="hidden" name="userId" value="<%=mv.getUserId()%>">
				<%
					}
				%>
				<input type="hidden" name="noticeNo" value="<%=nv.getNoticeNo()%>">
				<br>
				<input type="submit" class="btn btn-primary" value="댓글작성" onclick="return commentSub();">
			</form>
			<br>
			<div class="alert alert-danger" style="display: none" id="danger">
				<strong>오류 : </strong> 댓글 내용을 입력해주세요
			</div>
		</div>
		<br>
		<table class="table">
			<%
				for (NoticeCommentVo ncv : aList) {
			%>
			<thead class="thead-light">
				<tr>
					<th>
						<%=ncv.getUserId()%>
					</th>
					<th>
						<%=ncv.getRegDate()%>
					</th>
					<th>
						<%
							if (mv != null && mv.getUserId().equals(ncv.getUserId())) {
						%>
						<button type="button" class="btn btn-primary" id="<%=ncv.getUserId()%>" style="line-height: 10px;" onclick="modifyBtn(<%=ncv.getCommentNO()%>);">수정</button>
						&nbsp;
						<button type="button" class="<%=ncv.getCommentNO()%> btn btn-primary" style="display: none; line-height: 10px;" onclick="modifyCompleteBtn(<%=ncv.getCommentNO()%>);">완료</button>

						<button type="button" class="<%=ncv.getCommentNO()%> btn btn-danger" data-toggle="modal" data-target="#exampleModal1" id="delete" style="line-height: 10px;">삭제</button>


						<div class="modal fade" id="exampleModal1" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
							<div class="modal-dialog" role="document">
								<div class="modal-content">
									<div class="modal-header">
										<h5 class="modal-title" id="exampleModalLabel">댓글 삭제 확인</h5>
										<button type="button" class="close" data-dismiss="modal" aria-label="Close">
											<span aria-hidden="true">&times;</span>
										</button>
									</div>
									<div class="modal-body">댓글을 정말 삭제 하시겠습니까?</div>
									<div class="modal-footer">
										<button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
										<button type="button" class="btn btn-primary" onclick="commentDelete(<%=ncv.getCommentNO()%>);">삭제</button>
									</div>
								</div>
							</div>
						</div>

						<%
							}
						%>
					</th>
				</tr>
			</thead>
			<tr>
				<td>
					<input type="text" class="<%=ncv.getCommentNO()%> form-control" id="<%=ncv.getCommentNO()%>" style="display: none; height: 25px; width: 500px;" value="<%=ncv.getContent()%>">
					</input>
					<div class="<%=ncv.getCommentNO()%>" style="display: block;"><%=ncv.getContent()%></div>
				</th>
			</tr>
			<%
				}
			%>

		</table>
	</center>
</body>


<script type="text/javascript">
	function back() {
		window.location.href = "/notice";
	}


	function modify() {
		window.location.href = "/noticeModifyBefore?noticeNo=<%=nv.getNoticeNo()%>";
	}


	function login() {
		alert('로그인을 해주세요');
		window.open("/Views/member/login_pop.jsp", "_blank", "width=300px height=220px");
	}
	
	function modifyBtn(id) {

		var mod = document.getElementsByClassName(id);
		mod[0].style.display = "inline";
		mod[1].style.display = "none";
		mod[2].style.display = "inline";
		mod[3].style.display = "none";
	}

	function modifyCompleteBtn(id) {
		var content = document.getElementById(id).value;
		window.location.href = "/noticeCommentModify?comment=" + content + "&commentNo=" + id + "&noticeNo=" + <%=nv.getNoticeNo()%>;
	}
	
	function commentDelete(id){
		window.location.href = "/noticeCommentDelete?commentNo=" + id + "&noticeNo=" + <%=nv.getNoticeNo()%>;
	}
	
	function commentSub(){
	if(document.getElementById("notice").value == ""){
			document.getElementById("danger").style.display = "block";
			return false;
		} 
	}
	
</script>


<%
	if (mv != null && mv.getUserId().equals("admin")) {
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