<%@page import="java.util.ArrayList"%>
<%@page import="jsp.notice.model.vo.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	@SuppressWarnings("all")
	ArrayList<NoticeVo> aList = (ArrayList<NoticeVo>) request.getAttribute("noticeList");
%>

<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>공지사항</title>
</head>

<style>
.wrapper {
	display: table;
	margin: 0 auto;
	text-align: center;
}

#test {
	width: 700px;
}
</style>

<body>
	<div class="wrapper">
		<h1>공지사항</h1>
		<hr id="test">

		<center>
			<table border="1">
				<tr>
					<th>글번호</th>
					<th>글제목</th>
					<th>작성자</th>
					<th>작성일</th>
				</tr>
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
		</center>
	</div>
</body>

</html>