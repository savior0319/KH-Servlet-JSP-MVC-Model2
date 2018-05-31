<%@page import="jsp.member.model.vo.MemberVo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page errorPage="errorpage.jsp"%>
<%
	MemberVo mv = (MemberVo) session.getAttribute("user");
%>

<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" integrity="sha384-WskhaSGFgHYWDcbwN70/dfYBj47jz9qbsMId/iRN3ewGhXQFZCSftd1LZCfmhktB"
	crossorigin="anonymous"
>
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script type="text/javascript" src="https://service.iamport.kr/js/iamport.payment-1.1.5.js"></script>
</script>

<title>메인페이지</title>
</head>

<style>
.wrapper {
	margin: 0 auto;
	display: table;
}

.pwdField {
	font-size: 14px;
	color: red;
}

.jumbotron {
	text-align: center;
	background: skyblue;
}
</style>

<body>
	<div class="jumbotron">
		<h1>
			<%=mv.getUserName() + "님 환영합니다"%></h1>
	</div>
	<div class="wrapper">
		<h3>
			<br>
			<a href="#" id="myPage">마이페이지</a>
			<form action="/pwdcheck" method="post" id="pwdChk" style="display: none">
				<div class="pwdField">
					<br>
					비밀번호를 입력하세요
					<input type="password" name="userPwd" id="userPwd">
				</div>
			</form>
			<br>
			<a href="/logout">로그아웃</a>
			<br>
			<a href="#" id="userDelete">회원탈퇴</a>
			<form action="/pwdcheck1" method="post" id="pwdChk1" style="display: none">
				<div class="pwdField">
					<br>
					비밀번호를 입력하세요
					<input type="password" name="userPwd1" id="userPwd1">
				</div>
			</form>
			<br>
			<a href="/notice">공지사항</a>
			<br>
			<a href="/allMember" id="adminOnly" style="display: none">전체 회원 조회</a> <a href="/Views/upload/upload.jsp">파일업로드</a>
			<br>
			<a href="/fileList">다운로드</a>
			<br>
			<a href="/Views/upload/upload2.jsp">파일업로드2</a>
			<br>
			<a href="/fileList2">다운로드2</a>
			<br>
			<br>
			<input type="text" class="form-control" id="moneyName" placeholder="결제할 상품명 입력">
			<br>
			<input type="text" class="form-control" id="moneyVal" placeholder="결제할 금액 입력">
			<br>
			<button type="button" class="btn btn-primary" onclick="moneyTest();">결제 테스트</button>
		</h3>
	</div>
</body>

<script>
	window.onload = function() {
		document.getElementById("adminOnly").style.display = "block";
	}
	$(document).ready(function() {
		$('#myPage').click(function() {
			$('#pwdChk').fadeIn(300);
		});

		$('#userDelete').click(function() {
			$('#pwdChk1').fadeIn(300);
		});
	});

	// 결제 테스트
	var IMP = window.IMP;
	IMP.init('imp59164717');

	function moneyTest() {
		var moneyVal = $('#moneyVal').val();
		var moneyName = $('#moneyName').val();

		IMP.request_pay({
			pg : 'inicis',
			pay_method : 'card',
			merchant_uid : 'merchant_' + new Date().getTime(),
			name : moneyName,
			amount : moneyVal,
			buyer_email : 'savior0319@0319@naver.com',
			buyer_name : '안형조',
			buyer_tel : '010-3787-5606',
			buyer_addr : '인천 계양구 작전동',
			buyer_postcode : '21115',
			m_redirect_url : '/index.jsp'
		}, function(rsp) {
			if (rsp.success) {
				var msg = '결제가 완료되었습니다.';
				msg += '고유ID : ' + rsp.imp_uid;
				msg += '상점 거래ID : ' + rsp.merchant_uid;
				msg += '결제 금액 : ' + rsp.paid_amount;
				msg += '카드 승인번호 : ' + rsp.apply_num;
			} else {
				var msg = '결제에 실패하였습니다.';
				msg += '에러내용 : ' + rsp.error_msg;
			}

			/* 	alert(msg); */
		});
	}
</script>

<%
	if (!mv.getUserId().equals("admin")) {
%>
<script>
	$(document).ready(function() {
		$('#myPage').click(function() {
			$('#pwdChk').fadeIn(300);
		});

		$('#userDelete').click(function() {
			$('#pwdChk1').fadeIn(300);
		});
	});
</script>
<%
	}
%>

</html>