<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>

<title>Ecoland - Free Bootstrap 4 Template by Colorlib</title>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link
	href="https://fonts.googleapis.com/css?family=Poppins:100,200,300,400,500,600,700,800,900"
	rel="stylesheet">
<link
	href="https://fonts.googleapis.com/css?family=Cormorant+Garamond:300,300i,400,400i,500,500i,600,600i,700,700i"
	rel="stylesheet">
<link rel="stylesheet"
	href="/ticketing/resources/css/open-iconic-bootstrap.min.css">
<link rel="stylesheet" href="/ticketing/resources/css/animate.css">
<link rel="stylesheet"
	href="/ticketing/resources/css/owl.carousel.min.css">
<link rel="stylesheet"
	href="/ticketing/resources/css/owl.theme.default.min.css">
<link rel="stylesheet"
	href="/ticketing/resources/css/magnific-popup.css">
<link rel="stylesheet" href="/ticketing/resources/css/aos.css">
<link rel="stylesheet" href="/ticketing/resources/css/ionicons.min.css">
<link rel="stylesheet" href="/ticketing/resources/css/flaticon.css">
<link rel="stylesheet" href="/ticketing/resources/css/icomoon.css">
<link rel="stylesheet" href="/ticketing/resources/css/style.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

<br />
<br />
<br />
<br />
<br />

<head>

<script type="text/javascript">

	function pwdChange() {
		
		var f = document.myForm;
		
		var userId = $('#userId').val();
		
		if (f.currentPwd.value != "${userMainDTO.userPwd}") {
			alert("현재 비밀번호와 다릅니다.");
			f.currentPwd.focus();
			return;
		}
		
		if (f.newPwd.value != f.newPwd_check.value) {
			alert("새 비밀번호가 다릅니다.");
			f.newPwd_check.focus();
			return;
		}
		
		f.action = "userPwdChange.action?userId=" + userId + "&userPwd=" + f.newPwd.value;
		f.submit();
		
	}
	
	function nextChange() {
		
		var f = document.myForm;
		var userId = $('#userId').val();
		var userUpdateDate = $('#userUpdateDate').val();

		f.action = "userDateUpdate.action?userId=" + userId + "&userUpdateDate=" + userUpdateDate;
		f.submit();
		
	}

</script>
<style>
li {
	list-style: none
}
</style>

</head>

<!-- Main header 시작  -->
	 <div>
		<jsp:include page="mainHeader.jsp" flush="false" />
		<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
	</div>

<!-- Main header 종료  -->
<body>
	<div style="margin-left: 10%;">
		<form action="" name="myForm" method="post">
		<div style="width: 1000px; background-color: silver; margin: 50px auto; font-size: 12px;" align="center">
			<div>
				개인정보보호를 위한 비밀번호 변경 캠페인<br /> <font size="30px" color="#22255A"
					style="font-weight: bold;">내 정보는 내가 지킨다!</font>
			</div>

			<hr style="height: 3px; width: 90%">
			<div style="text-align: left; margin-left: 8%">
				<strong style="color: #213CB5; font-size: 16px">안녕하세요,
					${userMainDTO.userName }회원님!<br> Partycket 회원님의 소중한 개인정보를 보호하기
					위해 노력하고 있습니다.
				</strong>
				<p style="color: white">
					최근 일부 사이트에서 개인정보 유출로 의심되는 피해 사례가 증가하고 있습니다.<br> 여러 사이트에서 사용중인
					비밀번호나 타인이 짐작하기 쉬운 비밀번호를 사용하는 경우, <em>도용의 위험성</em>이 높아지게 됩니다.<br>
					Partycket에서는 회원님의 소중한 개인정보를 보호하기 위하여 모든 회원님들께 <em>비밀번호 변경을 요청</em>드립니다.<br>
					안전한 인터넷 세상과 소중한 개인정보 보호를 위해 캠페인에 적극적인 참여를 부탁드립니다.
				</p>
			</div>
			<div>
				<br /> <img src="<c:url value='/resources/image/updatePwd.png'/>"
					width="90%">
				<div style="background-color: white; width: 90%; height: 300px">
					<ul
						style="font-size: 14px; text-align: left; color: #213CB5; font-size: 12px;">
						<br />
						<li><em style="font-weight: bold;">비밀번호는 주기적으로 변경</em>하는 것이
							소중한 개인정보를 보호하는 좋은 방법입니다.</li>
						<li>비밀번호 변경 시 타인이 <em style="font-weight: bold;">쉽게 추측이
								불가능한 새로운 조합의 비밀번호 사용</em>을 권해드립니다.
						</li>
						<li>Partycket은 <em style="font-weight: bold;">6개월 이상 비밀번호를
								변경하지 않고 동일한 비밀번호를 사용중인 경우</em>, 로그인 시 비밀번호 변경안내를 해드리고 있습니다.
						</li>
					</ul>
					<div style="float: left; width: 40%; background-color: #F5F5F5; margin-left: 40px; height: 170px;
						text-align: left;" align="right">
						<!-- <legend>비밀번호 입력</legend> -->
						<br/>
						<ul>
							<li>
								<label>현재 비밀번호</label>
								&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								&nbsp;&nbsp;
								<input type="password" maxlength="20" name="currentPwd">
							</li>
							<hr style="margin-right: 40px">
							<li>
								<label>새 비밀번호&nbsp;</label>
								&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								<input type="password" maxlength="20" name="newPwd">
							</li>
							<li>
								<label>새 비밀번호 확인&nbsp;</label>
								&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								&nbsp;&nbsp;
								<input type="password" maxlength="20" name="newPwd_check">
							</li>
						</ul>
					</div>
					<div style="float: left; width: 50%; text-align: left;">
						<ul>
							<li>비밀번호 설정시 참고하세요!</li>
							<li>최소 6자 ~ 최대 20자</li>
							<li>띄어쓰기 없는 영문대소문자, 숫자 및 특수문자 조합(2개문자 이상 조합)</li>
							<li>특수문자 !@#$%^&amp;*()-_+=|[]{}'";:/?.&gt;,&lt;가능</li>
							<li>아이디와 동일한 3자 이상 중복 사용 금지</li>
							<li>동일한 문자(숫자 포함) 3자 이상 연속 금지. (ex)aaa,111)</li>
							<li>연속된 숫자, 문자 반복되는 경우 사용불가. (ex)abc,123)</li>
							<li>생년월일 숫자와 4자이상 중복되는경우 사용불가</li>
						</ul>
					</div>
				</div>
			</div>
			<br/>
			<div>
				<input type="hidden" value="${userMainDTO.userId }" id="userId">
				<input type="hidden" value="${userMainDTO.userUpdateDate }" id="userUpdateDate">
				<input type="button" value="비밀번호 변경" style="border: 1px solid red; color: red; background: #F5F5F5;
					padding: 20px; padding-top: 7px; padding-bottom: 7px; width: 120px"
					onclick="pwdChange();">
				<input type="reset" value="다시입력" style="border: 1px solid gray; color: black; background: #F5F5F5;
					padding: 20px; padding-top: 7px; padding-bottom: 7px; width: 120px">
				<input type="button" value="다음에 변경" style="border: 1px solid gray; color: black; background: #F5F5F5;
					padding: 20px; padding-top: 7px; padding-bottom: 7px; width: 120px"
					onclick="nextChange();">
			</div>
			<br/>
		</div>
		<p align="center" style="font-size: 12px; margin-right: 8%">
			<span>다음에 변경하기 클릭시 30일 동안 캠페인 페이지는 나타나지 않습니다.</span>
		</p>
		</form>
	</div>
	<br/><br/>

	<div>
	 <jsp:include page="mainFooter.jsp" flush="false" />
	</div>

</body>
</html>