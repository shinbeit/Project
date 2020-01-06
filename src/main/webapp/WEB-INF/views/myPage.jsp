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

<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<!-- <script type="text/javascript" src="/springwebMybatis/resources/js/util.js"></script> -->

<script type="text/javascript">

	function update(){
		
		f = document.myUpdateForm;
		
		str = f.userPwd.value;
		str = str.trim();
		if(!str){
			alert("\n변경 할 비밀번호를 입력하세요.");
			f.userPwd.focus();
			return;
		}
		f.userPwd.value = str;
		
		str = f.userAddr.value;
		str = str.trim();
		if(!str){
			alert("\n변경 할 주소를 입력하세요.");
			f.userAddr.focus();
			return;
		}		
		
		f.userAddr.value = str;
		
		str = f.userFinalAddr.value;
		str = str.trim();
		if(!str){
			alert("\n변경 할 상세주소를 입력하세요.");
			f.userFinalAddr.focus();
			return;
		}	
		
		f.userFinalAddr.value = str;
		
		f.userEmail.value = str;
		
		str = f.userEmail.value;
		str = str.trim();
		if(!str){
			alert("\n변경 할 메일주소를 입력하세요.");
			f.userEmail.focus();
			return;
		}	
		
		f.userEmail.value = str;
		
		str = f.userPhoneNum.value;
		str = str.trim();
		if(!str){
			alert("\n변경 할 상세주소를 입력하세요.");
			f.userPhoneNum.focus();
			return;
		}	
		
		f.userPhoneNum.value = str;
		
		f.action = "<%=cp%>/myPage_ok.action";
		f.submit();

		alert("회원정보가 수정되었습니다.");

	}
</script>

<script>
	function sample4_execDaumPostcode() {
		new daum.Postcode(
				{
					oncomplete : function(data) {
						var fullRoadAddr = data.roadAddress; // 도로명 주소 변수
						var extraRoadAddr = ''; // 도로명 조합형 주소 변수
						if (data.bname !== '' && /[동|로|가]$/g.test(data.bname)) {
							extraRoadAddr += data.bname;
						}
						if (data.buildingName !== '' && data.apartment === 'Y') {
							extraRoadAddr += (extraRoadAddr !== '' ? ', '
									+ data.buildingName : data.buildingName);
						}
						if (extraRoadAddr !== '') {
							extraRoadAddr = ' (' + extraRoadAddr + ')';
						}
						if (fullRoadAddr !== '') {
							fullRoadAddr += extraRoadAddr;
						}
						document.getElementById('sample4_postcode').value = data.zonecode; //5자리 새우편번호 사용
						document.getElementById('sample4_roadAddress').value = fullRoadAddr;
						document.getElementById('sample4_jibunAddress').value = data.jibunAddress;
						if (data.autoRoadAddress) {
							var expRoadAddr = data.autoRoadAddress
									+ extraRoadAddr;
							document.getElementById('guide').innerHTML = '(예상 도로명 주소 : '
									+ expRoadAddr + ')';
						} else if (data.autoJibunAddress) {
							var expJibunAddr = data.autoJibunAddress;
							document.getElementById('guide').innerHTML = '(예상 지번 주소 : '
									+ expJibunAddr + ')';
						} else {
							document.getElementById('guide').innerHTML = '';
						}
					}
				}).open();
	}
</script>


</head>


<body data-spy="scroll" data-target=".site-navbar-target"
	data-offset="300">
	<nav
		class="navbar navbar-expand-lg navbar-dark ftco_navbar bg-dark ftco-navbar-light site-navbar-target"
		id="ftco-navbar">
	<div class="container">
		<a class="navbar-brand" href="<%=cp%>/main.action">Partycket</a>
		<button class="navbar-toggler js-fh5co-nav-toggle fh5co-nav-toggle"
			type="button" data-toggle="collapse" data-target="#ftco-nav"
			aria-controls="ftco-nav" aria-expanded="false"
			aria-label="Toggle navigation">
			<span class="oi oi-menu"></span> Menu
		</button>

		<div class="collapse navbar-collapse" id="ftco-nav">
			<ul class="navbar-nav nav ml-auto">
				<li class="nav-item"><a href="<%=cp%>/mainccList.action"
					class="nav-link"><span>Concert &amp; Classic</span></a></li>
				<li class="nav-item"><a href="<%=cp%>/mainmtList.action"
					class="nav-link"><span>Musical &amp; Theater</span></a></li>
				<li class="nav-item"><a href="<%=cp%>/mainecList.action"
					class="nav-link"><span>Exhibition &amp; Kids</span></a></li>
		
				<c:choose>
					<c:when test="${empty success and c_success}">
						<li class="nav-item"><a href="<%=cp%>/userLogin.action"
							class="nav-link"><span>Login</span></a></li>
						<li class="nav-item"><a href="<%=cp%>/userSignUp.action"
							class="nav-link"><span>Sign Up</span></a></li>
					</c:when>
					<c:otherwise>
						<li class="nav-item"><a href="<%=cp%>/logout.action"
							class="nav-link"><span>Logout</span></a></li>
						<li class="nav-item"><a href="<%=cp%>/myPage.action"
							class="nav-link"><span>My Page</span></a></li>
					</c:otherwise>
				</c:choose>

			</ul>
		</div>
	</div>
	</nav>

	<section class="ftco-section contact-section ftco-no-pb"
		id="contact-section">
	<div class="container">
		<div class="row block-9">
			<c:choose>
				<c:when test="${!empty success }">
					<div class="col-md-7 order-md-last d-flex">
						<form action="" class="bg-white p-4 p-md-5 contact-form"
							method="post" name="myUpdateForm">
							<br />
							<br />
							<div class="form-group">
								<label style="font-weight: normal;"><font color="black">아이디</font></label>
								<input type="text" class="form-control"
									value="${userMainDTO.getUserId()}" id="userId" name="userId"
									readonly />
							</div>
							<div class="form-group">
								<label style="font-weight: normal;"><font color="black">패스워드</font>
								</label> <input type="password" class="form-control"
									value="${userMainDTO.getUserPwd() }" id="userPwd"
									name="userPwd">
							</div>
							<div class="form-group" align="left">
								<label style="font-weight: normal;"><font color="black">주소</font>
								</label> <br /> <input type="text" class="form-control" name="userAddr"
									id="sample4_postcode" value="${userMainDTO.getUserAddr() }"
									style="width: 73%; float: left" /> <input type="button"
									class="btn btn-secondary" onclick="sample4_execDaumPostcode();"
									style="float: right; height: 53px; vertical-align: center;"
									value="우편번호 수정" /><span style="line-height: 100%"><br /></span>
							</div>
							<span style="line-height: 200%"><br /></span>
							<div class="form-group">
								<label style="font-weight: normal;"><font color="black">상세주소</font>
								</label> <input type="text" class="form-control"
									value="${userMainDTO.getUserFinalAddr() }" id="userFinalAddr"
									name="userFinalAddr">
							</div>
							<div class="form-group">
								<label style="font-weight: normal;"><font color="black">이메일</font>
								</label> <input type="text" class="form-control"
									value="${userMainDTO.getUserEmail() }" id="userEmail"
									name="userEmail">
							</div>
							<div class="form-group">
								<label style="font-weight: normal;"><font color="black">전화번호</font>
								</label> <input type="text" class="form-control"
									value="${userMainDTO.getUserPhoneNum() }" id="userPhoneNum"
									name="userPhoneNum">
							</div>

							<div class="form-group" align="center">
								<input class="btn btn-dark"
									style="background-color: #232931; height: 50px;" type="submit"
									onclick="update();" value="정보 수정하기">
							</div>
						</form>
					</div>
				</c:when>

				<c:when test="${!empty c_success }">
					<div align="center" style="width: 1140px;">
						<br />
						<div id="tabs" style="width: 850px;">
							<ul style="text-align: center; width: 840px">
								<li><a href="#tabs-1" style="text-align: center;">기업정보</a></li>
								<li><a href="#tabs-2">등록한 공연 내역</a></li>
								<li><a href="#tabs-3">공연 등록</a></li>
							</ul>
							<div id="tabs-1" align="center">
								<jsp:include page="companyInfo.jsp" flush="false" />
							</div>
							<div id="tabs-2" align="center">
								<jsp:include page="performList.jsp" flush="false" />
							</div>
							<div id="tabs-3" align="center">
								<jsp:include page="regConcert.jsp" flush="false" />
							</div>
						</div>
					</div>
				</c:when>
			</c:choose>


			<br />
			<br />
			<br />
			<br />
			<c:choose>
				<c:when test="${!empty success }">
					<div class="col-md-5 d-flex">
						<div class="row d-flex contact-info mb-5">
							<div class="col-md-12 ftco-animate">
								<div class="box p-2 px-3 bg-white d-flex" style="width: 460px;">
									<div>
										<h3 class="mb-3">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</h3>
										<font color="white"><p>&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;|&nbsp;
												&nbsp;&nbsp;&nbsp;|&nbsp;</p></font>
									</div>
									<br />
								</div>
								<div class="box p-2 px-3 bg-dark d-flex">
									<div class="Layer" align="center">
										<a class="navbar-brand"> <font color="white" size="5pt">My&nbsp;&nbsp;&nbsp;Page</font></a>
										<p>
											<a><font color="white">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${userMainDTO.getUserId() }님
													반갑습니다.</font></a>
										</p>
									</div>
								</div>

								<div class="box p-2 px-3 bg-secondary d-flex">
									<div>
										<font color="white" size="4pt;">&nbsp;&nbsp;&nbsp;&nbsp;나의
											관람 공연</font>
											<c:forEach var="dto" items="${preserved_list }">
											<table>
			
											<tr>
											<td><font color="white">&nbsp;&nbsp;&nbsp;&nbsp;공연:</font></td>
											<td><font color="white">&nbsp;${dto.performName },</font></td>
											<td><font color="white">&nbsp;좌석:</font></td>
											<td><font color="white">&nbsp;${dto.seatRow}열 ${dto.seatNum}번,</font></td> 
											</tr> 
											<tr> 
											<td><font color="white">&nbsp;&nbsp;&nbsp;&nbsp;날짜:</font></td>
											<td><font color="white">&nbsp;${dto.selectedDate } ${dto.time }</font></td>
											</tr>
										<%-- 	<p>
												<font color="white">
													공연이름:
													좌석 열: ${dto.seatRow}
													좌석번호: ${dto.seatNum}
													공연날짜: ${dto.selectedDate }
													공연시간: ${dto.time }
												</font>
											</p> --%>
											
											</table>
											
									 	</c:forEach>
									</div>
								</div>
								<div class="box p-2 px-3 bg-secondary d-flex">
									<div>
										<font color="white" size="4pt;">&nbsp;&nbsp;&nbsp;&nbsp;포인트</font>
										<p>
											<a href="#"><font color="white">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${userMainDTO.getUserPoint() }</font></a>
										</p>
									</div>
								</div>
								<div class="box p-2 px-3 bg-secondary d-flex">
									<div>
										<font color="white" size="4pt;">&nbsp;&nbsp;&nbsp;&nbsp;쿠
											폰</font>
										<p>
											<a href="#"><font color="white">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${userMainDTO.getUserCoupon() }</font></a>
										</p>
									</div>
								</div>
								<div class="box p-2 px-3 bg-secondary d-flex">
									<div>
										<font color="white" size="4pt;">&nbsp;&nbsp;&nbsp;&nbsp;날짜별
											예매</font>
										<p>
											&nbsp;&nbsp;&nbsp;&nbsp;<a
												href="<%=cp%>/calendarView.action" class="btn btn-dark"
												style="background-color: #232931;"> <font color="white">
													달력보기 </font><span></span></a>
										</p>
									</div>
								</div>
								<div class="box p-2 px-3 bg-secondary d-flex">
									<div>
										<a href="mailto:info@yoursite.com"><font color="white"
											size="4pt;">&nbsp;&nbsp;&nbsp;&nbsp;문 의</font></a>
										<p>
											<font color="white">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;02-523-1485</font><br />
											<font color="white">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;www.partycket.com</font><br />
											<font color="white">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;평
												일&nbsp;&nbsp;09:00 ~ 18:00</font><br /> <font color="white">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;토요일&nbsp;&nbsp;09:00
												~ 17:00</font><br /> <font color="white">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;일요일,
												공휴일 휴무</font><br />

										</p>
									</div>
								</div>
							</div>
						</div>
					</div>
				</c:when>
			</c:choose>
		</div>
	</div>
	</section>

	<br />
	<br />
	<br />
	<br />

	<footer class="ftco-footer ftco-section">
	<div class="container">
		<div class="row mb-5">
			<div class="col-md">
				<div class="ftco-footer-widget mb-4">
					<h2 class="ftco-heading-2">
						About <span><a href="index.html">Ecoland</a></span>
					</h2>
					<p>Far far away, behind the word mountains, far from the
						countries Vokalia and Consonantia, there live the blind texts.</p>
					<ul
						class="ftco-footer-social list-unstyled float-md-left float-lft mt-5">
						<li class="ftco-animate"><a href="#"><span
								class="icon-twitter"></span></a></li>
						<li class="ftco-animate"><a href="#"><span
								class="icon-facebook"></span></a></li>
						<li class="ftco-animate"><a href="#"><span
								class="icon-instagram"></span></a></li>
					</ul>
				</div>
			</div>
			<div class="col-md">
				<div class="ftco-footer-widget mb-4 ml-md-4">
					<h2 class="ftco-heading-2">Information</h2>
					<ul class="list-unstyled">
						<li><a href="#"><span class="icon-long-arrow-right mr-2"></span>Online
								Enquiry</a></li>
						<li><a href="#"><span class="icon-long-arrow-right mr-2"></span>General
								Enquiry</a></li>
						<li><a href="#"><span class="icon-long-arrow-right mr-2"></span>Booking</a></li>
						<li><a href="#"><span class="icon-long-arrow-right mr-2"></span>Privacy</a></li>
						<li><a href="#"><span class="icon-long-arrow-right mr-2"></span>Refund
								Policy</a></li>
						<li><a href="#"><span class="icon-long-arrow-right mr-2"></span>Call
								Us</a></li>
					</ul>
				</div>
			</div>
			<div class="col-md">
				<div class="ftco-footer-widget mb-4">
					<h2 class="ftco-heading-2">Experience</h2>
					<ul class="list-unstyled">
						<li><a href="#"><span class="icon-long-arrow-right mr-2"></span>Adventure</a></li>
						<li><a href="#"><span class="icon-long-arrow-right mr-2"></span>Hotel
								and Restaurant</a></li>
						<li><a href="#"><span class="icon-long-arrow-right mr-2"></span>Beach</a></li>
						<li><a href="#"><span class="icon-long-arrow-right mr-2"></span>Nature</a></li>
						<li><a href="#"><span class="icon-long-arrow-right mr-2"></span>Camping</a></li>
						<li><a href="#"><span class="icon-long-arrow-right mr-2"></span>Party</a></li>
					</ul>
				</div>
			</div>
			<div class="col-md">
				<div class="ftco-footer-widget mb-4">
					<h2 class="ftco-heading-2">Have a Questions?</h2>
					<div class="block-23 mb-3">
						<ul>
							<li><span class="icon icon-map-marker"></span><span
								class="text">203 Fake St. Mountain View, San Francisco,
									California, USA</span></li>
							<li><a href="#"><span class="icon icon-phone"></span><span
									class="text">+2 392 3929 210</span></a></li>
							<li><a href="#"><span class="icon icon-envelope"></span><span
									class="text">info@yourdomain.com</span></a></li>
						</ul>
					</div>
				</div>
			</div>
		</div>
		<div class="row">
			<div class="col-md-12 text-center">

				<p>
					<!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
					Copyright &copy;
					<script>
						document.write(new Date().getFullYear());
					</script>
					All rights reserved | This template is made with <i
						class="icon-heart color-danger" aria-hidden="true"></i> by <a
						href="https://colorlib.com" target="_blank">Colorlib</a>
					<!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
				</p>
			</div>
		</div>
	</div>
	</footer>

	<script src="/ticketing/resources/js/jquery.min.js"></script>
	<script src="/ticketing/resources/js/jquery-migrate-3.0.1.min.js"></script>
	<script src="/ticketing/resources/js/popper.min.js"></script>
	<script src="/ticketing/resources/js/bootstrap.min.js"></script>
	<script src="/ticketing/resources/js/jquery.easing.1.3.js"></script>
	<script src="/ticketing/resources/js/jquery.waypoints.min.js"></script>
	<script src="/ticketing/resources/js/jquery.stellar.min.js"></script>
	<script src="/ticketing/resources/js/owl.carousel.min.js"></script>
	<script src="/ticketing/resources/js/jquery.magnific-popup.min.js"></script>
	<script src="/ticketing/resources/js/aos.js"></script>
	<script src="/ticketing/resources/js/jquery.animateNumber.min.js"></script>
	<script src="/ticketing/resources/js/scrollax.min.js"></script>
	<script src="/ticketing/resources/js/main.js"></script>

	<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

	<script>
		$(function() {
			$("#tabs").tabs();
		});
	</script>


</body>
</html>