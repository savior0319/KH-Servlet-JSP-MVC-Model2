<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page errorPage="errorpage.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
<title>회원 전체 조회(JSTL)</title>
</head>

<style>
.wrapper {
	display: table;
	margin: 0 auto;
	text-align: center;
}

.jumbotron {
	text-align: center;
	background: skyblue;
}
</style>
<c:set var="checkAdmin" value="${sessionScope.user.userId}" />
<c:choose>
	<c:when test="${checkAdmin!='admin'}">
response.sendRedirect("/Views/member/errorpage.jsp");
</c:when>
	<c:otherwise>
		<body>
			<div class="jumbotron">
				<h1>관리자 : 회원 관리 페이지</h1>
			</div>
			<div class="wrapper">
				<hr>
				<table class="table">
					<thead class="thead-light">
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
					</thead>
					<c:forEach items="${userList}" var="list">
						<tr>
							<td id="value">${list.userId}</td>
							<td id="value">${list.userName}</td>
							<td id="value">${list.age}</td>
							<td id="value">${list.email}</td>
							<td id="value">${list.phone}</td>
							<td id="value">${list.address}</td>
							<td>
								<c:set var="gender" value="${userList[0].gender}"></c:set>
								<c:choose>
									<c:when test="${gender=='M'}">남</c:when>
									<c:otherwise>여</c:otherwise>
								</c:choose>
							</td>
							<td id="value">${list.hobby}</td>
							<td id="value">${list.enrollDate}</td>
							<td>
								<%-- <button onclick="activeBtn();" style="width: 100%">${list.activation}</button> --%>
								<form action="/memberActivation" method="post">
									<input type="hidden" id="activation" name="activation" value="${list.activation}">
									<input type="hidden" id="userId" name="userId" value="${list.userId}">
									<input type="submit" value="${list.activation}" style="width: 100%" class="btn" onclick="test(this);">
								</form>
							</td>
						</tr>
					</c:forEach>
				</table>
				<br>
				<button onclick="back();">이전 페이지</button>
			</div>
		</body>
	</c:otherwise>
</c:choose>

<script>
	function back() {
		window.location.href = "/Views/member/mainpage.jsp";
	}
	/* 	function test(oper) {
			var userId = $(oper).prev().val();
		} */
</script>

</html>