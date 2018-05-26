<%@page import="jsp.member.model.vo.MemberVo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	int result = (int) request.getAttribute("userList");
	if (result == 0) {
		response.sendRedirect("/Views/member/errorpage.jsp");
	} else {
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>title</title>
</head>

<script>
	alert('회원 정보 변경 완료');
	history.back(-1);
</script>

</html>

<%
	}
%>