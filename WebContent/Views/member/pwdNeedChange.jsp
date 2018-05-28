<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page errorPage="errorpage.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>경고</title>
<script type="text/javascript">
	alert('※ 비밀번호를 변경한지 90일이 지났습니다\n비밀번호를 변경해주세요');
	window.location.href = "/Views/member/loginSuccess.jsp";
</script>
</html>