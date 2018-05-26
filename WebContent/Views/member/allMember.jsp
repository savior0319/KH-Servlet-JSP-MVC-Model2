<%@page import="java.io.UncheckedIOException"%>
<%@page import="java.util.ArrayList"%>
<%@page import="jsp.member.model.vo.MemberVo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page errorPage="errorpage.jsp"%>

<%
	@SuppressWarnings("unchecked")
	ArrayList<MemberVo> aList = (ArrayList<MemberVo>) request.getAttribute("userList");
	MemberVo mv = (MemberVo) session.getAttribute("user");
%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>회원 전체 조회</title>
</head>

<style>
.wrapper {
	display: table;
	margin: 0 auto;
	text-align: center;
}
</style>

<%
	if (!mv.getUserId().equals("admin")) {
		response.sendRedirect("/Views/member/errorpage.jsp");
	} else {
%>

<body>
	<div class="wrapper">
		<h1>관리자 : 회원 관리 페이지</h1>
		<hr>
		<table border="1">
			<tr>
				<th>아이디</th>
				<th>이름</th>
				<th>나이</th>
				<th>이메일</th>
				<th>휴대폰</th>
				<th>주소</th>
				<th>성별</th>
				<th>취미</th>
				<th>가입날짜</th>
				<th>활성여부</th>
			</tr>
			<%
				for (MemberVo m : aList) {
						String gender = "";
						if (m.getGender().equals("M")) {
							gender = "남자";
						} else
							gender = "여자";
			%>
			<tr>
				<td><%=m.getUserId()%></td>
				<td><%=m.getUserName()%></td>
				<td><%=m.getAge()%></td>
				<td><%=m.getEmail()%></td>
				<td><%=m.getPhone()%></td>
				<td><%=m.getAddress()%></td>
				<td><%=gender%></td>
				<td><%=m.getHobby()%></td>
				<td><%=m.getEnrollDate()%></td>
				<td>
					<form action="/memberActivation" method="post">
						<input type="hidden" name="activation"
							value="<%=m.getActivation()%>"> <input type="hidden"
							name="userId" value="<%=m.getUserId()%>"> <input
							type="submit" value="<%=m.getActivation()%>" style="width: 100%"
							id="btn">
					</form>
				</td>
			</tr>
			<%
				}
			%>
		</table>
		<br>
		<button onclick="back();">이전 페이지</button>
	</div>
</body>

<%
	}
%>

<script>
	function back() {
		window.location.href = "/index.jsp";
	}
</script>

</html>