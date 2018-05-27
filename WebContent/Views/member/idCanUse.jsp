<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
 String strReferer = request.getHeader("referer");
 
 if(strReferer == null){
%>
<script>
  alert("정상적인 경로를 통해 다시 접근하세요.");
  window.location.href="/index.jsp";
  </script>
<% } %>
<%
	String userId = (String) request.getAttribute("userId");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>title</title>
</head>
<body>
	<script>
		var userid = window.confirm('사용가능한 아이디 입니다');
		if (userid == true) {
			opener.document.getElementById('id').value = "<%=userId%>";
			close();
		} else {
			history.back(-1);
		}
	</script>
</body>
</html>