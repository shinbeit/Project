<%@ page contentType="text/html; charset=UTF-8"%>
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

<script type="text/javascript">
	
	function companySignUp() {
	 	var f1 = document.companyForm;
	 
		if (!f1.companyId.value) {
			alert("사용할 기업 아이디를 입력하세요");
			f1.companyId.focus();
			return;
		}
		if (!f1.companyPwd.value) {
			alert("패스워드 입력하세요");
			f1.companyPwd.focus();
			return;
		}
		if (!f1.companyName.value) {
			alert("회사명을 입력하세요");
			f1.companyName.focus();
			return;
		}
		if (!f1.companyAddr.value) {
			alert("주소를 입력하세요");
			f1.companyAddr.focus();
			return;
		}
		if (!f1.companyFinalAddr.value) {
			alert("상세 주소를 입력하세요");
			f1.companyFinalAddr.focus();
			return;
		}
		
		if (!f1.companyEmail.value) {
			alert("회사 이메일을 입력하세요");
			f1.companyEmail.focus();
			return;
		}
		if (!f1.companyTelNum.value) {
			alert("회사 전화번호를 입력하세요");
			f1.companyTelNum.focus();
			return;
		} 
		f1.action = "companySignUp_ok.action";
		f1.submit();

	}
	function companyIdCheck() {

		var f1 = document.companyForm;

		if (!f1.companyId.value) {

			alert("사용할 기업 아이디를 입력하세요")
			f1.companyId.focus();
			return;
		}

		f1.action = "companyIdCheck.action";
		f1.submit();

	}
</script>

<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>

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
				<li class="nav-item"><a href="<%=cp%>/userLogin.action"  class="nav-link"><span>Login</span></a></li>
				<li class="nav-item"><a href="<%=cp%>/userSignUp.action" class="nav-link"><span>Sign Up</span></a></li>
				<li class="nav-item"><a href="<%=cp%>/mainccList.action" class="nav-link"><span><font color="black">Concert &amp; Classic</font></span></a></li>
				<li class="nav-item"><a href="<%=cp%>/mainmtList.action" class="nav-link"><span><font color="black">Musical &amp; Theater</font></span></a></li>
				<li class="nav-item"><a href="<%=cp%>/mainecList.action" class="nav-link"><span><font color="black">Exhibition &amp; Kids</font></span></a></li>
			</ul>
		</div>
	</div>
	</nav>

	<br />
	
	<section class="ftco-section ftco-services-2 ftco-no-pt">

	<div class="container">
		<div class="row">
			<div style="margin: 0 auto;" align="center">
				<div class="comment-form-wrap pt-5" style="width: 580px;">
				<form action="" class="p-5 bg-white" name="companyForm" method="post">
				<div class="Layer" align="center">
							<a class="navbar-brand">
							<font color="black">Partycket&nbsp;&nbsp;&nbsp;SignUp</font></a>
							<br /><br />
							<p>
								<a href="<%=cp%>/userSignUp.action " class="btn btn-secondary py-2 px-4" style="width: 190px;">
								<font color="white">일반회원 회원가입</font></a> 
								<a href="<%=cp%>/companySignUp.action" class="btn btn-dark py-2 px-4" style="width: 190px;"
								style="background-color: #232931;"><font color="white">기업회원 회원가입</font></a>
							</p>
						</div>
						<br/>
						<div class="form-group" align="left">
							<label style="font-weight: normal; color: black">기업 아이디 *</label> <br /> <input
								type="text" class="form-control" name="companyId" id="companyId"
								style="width: 80%; float: left"> <input type="button"
								class="btn btn-secondary" onclick="companyIdCheck();"
								style="float: right; height: 53px; vertical-align: center;"
								value="중복확인">
							<!-- <tr>
								<td colspan="2" align="center"> -->
							<br />
							<br />
							<font color="#000000" size="3"><b>${message }</b></font>
							<!-- </td>	
								<tr> -->
						</div>

						<div class="form-group" align="left">
							<label style="font-weight: normal; color: black">패스워드 *</label> <input
								type="password" class="form-control" name="companyPwd" id="companyPwd"/>
						</div>


						<div class="form-group" align="left">
							<label for="name" style="font-weight: normal; color: black">회사명 *</label> <input
								type="text" class="form-control" name="companyName"/>
						</div>

						<div class="form-group" align="left">
							<label style="font-weight: normal; color: black">주소 *</label> <br /> <input
								type="text" class="form-control" name="companyAddr" id="sample4_postcode"
								style="width: 73%; float: left"/> <input type="button"
								class="btn btn-secondary" onclick="sample4_execDaumPostcode();"
								style="float: right; height: 53px; vertical-align: center;"
								value="우편번호 찾기"/><span style="line-height: 100%"><br/></span>
						</div><span style="line-height: 200%"><br/></span>

						<div class="form-group" align="left">
							<label for="name" style="font-weight: normal; color: black">도로명 주소 *</label> 
							<input type="text" class="form-control" name="companyRoadAddr" id="sample4_roadAddress"/>
						</div>
							
						<div class="form-group" align="left">
							<label for="name" style="font-weight: normal; color: black">지번 주소 *</label> 
							<input type="text" class="form-control" name="companyJibunAddr" id="sample4_jibunAddress"/>
						</div>

						<div class="form-group" align="left">
							<label for="name" style="font-weight: normal; color: black">상세주소 *</label> 
							<input type="text" class="form-control" name="companyFinalAddr" id="sample4_jibunAddress"/>
						</div>

						<div class="form-group" align="left">
							<label for="email" style="font-weight: normal; color: black">Email *</label> <input
								type="email" class="form-control" name="companyEmail"/>
						</div>

						<div class="form-group" align="left">
							<label for="website" style="font-weight: normal; color: black">Company-Tel
								*</label> <input type="text" class="form-control" name="companyTelNum"/>
						</div>

						<br/>

						<div class="form-group">
							<input type="button" value="아이디 생성하기"
								class="btn py-3 px-4 btn-dark" onclick="companySignUp();">
								
						</div>

					</form>
				</div>
			</div>
		</div>
	</div>
	
	</div>

	</section>
	<!-- .section -->


	<footer class="ftco-footer ftco-section">
	<div class="container" >
		<div class="row mb-5">
			<div class="col-md">
				<div class="ftco-footer-widget mb-4">
					<h2 class="ftco-heading-2">
						About <span><a href="index.html">PartycKet</a></span>
					</h2>
						<p style="font-weight: normal;">파티캣㈜<br/>
						대표 김태환<br/>
						개인정보보호책임자 : 서진교 <br/>
						<a href="http://www.ftc.go.kr/www/bizCommList.do?key=232">사업자등록번호 229-91-37000<br/></a>
						호스팅 서비스사업자 : 파티캣㈜</p>					
				</div>
			</div>
			<div class="col-md">
				<div class="ftco-footer-widget mb-4 ml-md-4">
					<h2 class="ftco-heading-2">Information</h2>
					<ul class="list-unstyled">
						<li style="font-weight: normal;"><a href="#"><span class="icon-long-arrow-right mr-2"></span>이용약관</a></li>
						<li style="font-weight: normal;"><a href="#"><span class="icon-long-arrow-right mr-2"></span>개인정보처리방침</a></li>
						<li style="font-weight: normal;"><a href="#"><span class="icon-long-arrow-right mr-2"></span>청소년보호정책</a></li>
						<li style="font-weight: normal;"><a href="#"><span class="icon-long-arrow-right mr-2"></span>티켓판매안내</a></li>
						<li style="font-weight: normal;"><a href="https://www.mcst.go.kr/kor/s_policy/subPolicy/cultureart/cultureart08.jsp?pSeq=21"><span class="icon-long-arrow-right mr-2"></span>도서공연비소득공제</a></li>
					</ul>
				</div>
			</div>
			<div class="col-md">
				<div class="ftco-footer-widget mb-4">
					<h2 class="ftco-heading-2">Community</h2>
					<ul class="list-unstyled">
						<li style="font-weight: normal;"><a href="https://pf.kakao.com/_vRvxcV"><span class="icon-long-arrow-right mr-2"></span>Kakao Talk</a></li>
						<li style="font-weight: normal;"><a href="https://www.facebook.com/YES24Play"><span class="icon-long-arrow-right mr-2"></span>FaceBook</a></li>
						<li style="font-weight: normal;"><a href="https://www.instagram.com/yes24ticket/"><span class="icon-long-arrow-right mr-2"></span>Instargram</a></li>
						<li style="font-weight: normal;"><a href="https://play.google.com/store/apps/details?id=com.yes24.ticket"><span class="icon-long-arrow-right mr-2"></span>Google Play</a></li>
						<li style="font-weight: normal;"><a href="https://apps.apple.com/kr/app/yeseu24-gong-yeon-yemae/id937042887?l=en"><span class="icon-long-arrow-right mr-2"></span>Apple Store</a></li>
					</ul>
				</div>
			</div> 
			<div class="col-md">
				<div class="ftco-footer-widget mb-4">
					<h2 class="ftco-heading-2">Have a Questions?</h2>
					<div class="block-23 mb-3">
						<ul>
							<li style="font-weight: normal;"><span class="icon icon-map-marker"></span><span
								class="text">서울시 강남구 테헤란로 123, 15층(여삼빌딩)
									</span></li>
							<li style="font-weight: normal;"><span class="icon icon-phone"></span><span
									class="text">9333-4904<br/>
									평일   09:00~18:00<br/>
									토요일 09:00~17:00<br/>
									(일요일 및 공휴일 휴무)</span></a></li>
							<li style="font-weight: normal;"><span class="icon icon-envelope"></span><span
									class="text">partycKet@partycKet.com</span></a></li>
						</ul>
					</div>
				</div>
			</div>
		</div>
		<div class="row">
			<div class="col-md-12 text-center" style="font-weight: normal;">

				<p>
					<!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
					Copyright © PARTYCKET Corp. All Rights Reserved
					<script>
						document.write(new Date().getFullYear());
					</script>					
				</p>
			</div>
		</div>
	</div>
	</footer>



	<!-- loader -->
	<div id="ftco-loader" class="show fullscreen">
		<svg class="circular" width="48px" height="48px"> <circle
			class="path-bg" cx="24" cy="24" r="22" fill="none" stroke-width="4"
			stroke="#eeeeee" /> <circle class="path" cx="24" cy="24" r="22"
			fill="none" stroke-width="4" stroke-miterlimit="10" stroke="#F96D00" /></svg>
	</div>


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
	<script
		src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBVWaKrjvy3MaE7SQ74_uJiULgl1JY0H2s&sensor=false"></script>
	<script src="/ticketing/resources/js/google-map.js"></script>

	<script src="/ticketing/resources/js/main.js"></script>

</body>
</html>