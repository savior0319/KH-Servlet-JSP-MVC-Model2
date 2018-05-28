<%@page import="java.util.ArrayList"%>
<%@page import="jsp.notice.model.vo.*"%>
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
	@SuppressWarnings("all")
	PageDataVo pd = (PageDataVo) request.getAttribute("pageData");
	ArrayList<NoticeVo> aList = pd.getaList(); // 현재 페이지 리스트
	String pageNavi = pd.getPageNavi(); // navi 리스트
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
<title>공지사항</title>
</head>

<style>
table {
	width: 700px;
}

.wrapper {
	display: table;
	margin: 0 auto;
	text-align: center;
}

#test {
	width: 700px;
}

#searchBtn {
	margin-left: 15px;
}

.searchWrapper {
	margin: 0 auto;
	display: table;
}
</style>

<body>
	<div class="wrapper">
		<br>
		<h1>공지사항</h1>
		<hr id="test">
		<br>
		<center>
			<table class="table">
				<thead class="thead-light">
					<tr>
						<th>글번호</th>
						<th>글제목</th>
						<th>작성자</th>
						<th>작성일</th>
					</tr>
				</thead>
				<%
					for (NoticeVo n : aList) {
				%>

				<tr>
					<td><%=n.getNoticeNo()%></td>
					<td><%=n.getSubject()%></td>
					<td><%=n.getUserId()%></td>
					<td><%=n.getRegDate()%></td>
				</tr>
				<%
					}
				%>
			</table>
			<label><%=pageNavi%></label>
			<div class="searchWrapper">
				<form class="form-inline" action="/noticeSearch">
					<div class="form-group">
						<input type="text" class="form-control" id="pwd" name="title" placeholder="제목입력">
					</div>
					<button type="submit" class="btn btn-default" id="searchBtn">검색</button>
				</form>
			</div>
		</center>
	</div>
</body>

</html>