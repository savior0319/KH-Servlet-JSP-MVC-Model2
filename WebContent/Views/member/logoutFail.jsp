<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page errorPage="errorpage.jsp"%>
<%
 String strReferer = request.getHeader("referer");
 
 if(strReferer == null){
%>
 <script>
  alert("정상적인 경로를 통해 다시 접근하세요.");
  window.location.href="/index.jsp";
  </script>
<% } %>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<!--<meta http-equiv="refresh" content="5 url=/index.jsp">-->
<title>Document</title>
</head>

<script>
	alert('로그아웃에 실패 했습니다');
	window.location.href = "/index.jsp"
</script>

</html>