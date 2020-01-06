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

<script type="text/javascript">
	function sendIt() {

		var f = document.searchForm;

		f.action = "/ticketing/mainList.action";
		f.submit();

	}
</script>

</head>

<body data-spy="scroll" data-target=".site-navbar-target"
	data-offset="300">

	<nav
		class="navbar navbar-expand-lg navbar-dark ftco_navbar bg-dark ftco-navbar-light site-navbar-target"
		id="ftco-navbar">
	<div class="container">
		<a class="navbar-brand" href="<%=cp%>/main.action"><font color="black">Partycket</font></a>
		<button class="navbar-toggler js-fh5co-nav-toggle fh5co-nav-toggle"
			type="button" data-toggle="collapse" data-target="#ftco-nav"
			aria-controls="ftco-nav" aria-expanded="false"
			aria-label="Toggle navigation">
			<span class="oi oi-menu"></span> Menu
		</button>

		<div class="collapse navbar-collapse" id="ftco-nav">
			<ul class="navbar-nav nav ml-auto">
				<li class="nav-item"><a href="<%=cp%>/mainccList.action" class="nav-link"><span><font color="#232931">Concert &amp; Classic</font></span></a></li>
				<li class="nav-item"><a href="<%=cp%>/mainmtList.action" class="nav-link"><span><font color="#232931">Musical &amp; Theater</font></span></a></li>
				<li class="nav-item"><a href="<%=cp%>/mainecList.action" class="nav-link"><span><font color="#232931">Exhibition &amp; Kids</font></span></a></li>
			<c:choose>
					<c:when test="${empty success}">
						<li class="nav-item"><a href="<%=cp%>/userLogin.action"
							class="nav-link"><span><font color="#232931">Login</font></span></a></li>
						<li class="nav-item"><a href="<%=cp%>/userSignUp.action"
							class="nav-link"><span><font color="#232931">Sign Up</font></span></a></li>
					</c:when>
					<c:otherwise>
						<li class="nav-item"><a href="<%=cp%>/logout.action"
							class="nav-link"><span><font color="#232931">Logout</font></span></a></li>
						<li class="nav-item"><a href="<%=cp%>/myPage.action"
							class="nav-link"><span><font color="#232931">My Page</font></span></a></li>
					</c:otherwise>
				</c:choose>
				
			</ul>
		</div>
	</div>
	<div>
	</nav>
	<br />
	<br />
	<br />
	<br />
	<br />
	<div class="container" style="text-align: right; width: 1150px;">
		<div class="row justify-content-center pb-0 pb-mb-5 pt-5 pt-md-0">
			<div class="col-md-12 heading-section ftco-animate">
				<span class="subheading" style="font-size: 22pt;"><font
					color="#232931">Search List</font></span>
				<div class="row" align="left">
					<div class="col-md-12" align="right" style="">
						<form action="" class="search-property-1" name="searchForm"
							method="post">
							<div class="row" style="width: 1125px; height: 10px;"
								align="right">
								<div class="form-group" align="left"
									style="width: 120px; text-align: center;">
									<select class="form-control" name="genreCode">
										<option value="">장 르</option>
										<c:forEach var="result" items="${genreList}">
											<option value="${result.genreCode}">${result.genreName}</option>
										</c:forEach>
									</select>
								</div>
								<div class="col-lg align-items-end" style="height: 30px;">
									<div class="form-group">
										<div class="form-field" align="right">
											<div class="icon">
												<span class="ion-ios-search"></span>
											</div>
											<b><input type="text" class="form-control"
												name="searchValue" placeholder="검색어를 입력해주세요"
												style="width: 810px;"></b>
										</div>
									</div>
								</div>
								<div class="col-lg align-self-end">
									<div class="form-group">
										<div class="form-field">
											<b><input style="height: 51px;" type="submit"
												value="     검색하기     " class="btn btn-dark"
												onclick="search()"></b>
										</div>
									</div>
								</div>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>

	</div>
	</section>

	<!--  -->
	<!--  -->
	<!--  -->
	<!--  -->
	<!--  -->
	<!--  -->
	<!-- musical and theater -->
	<!--  -->
	<!--  -->
	<!--  -->
	<!--  -->
	<!--  -->
	<!--  -->
	
	<br />
	<br />
	<br />
	<br />
	<div class="row justify-content-center pb-5">
		<div class="col-md-12 heading-section text-center ftco-animate">
			<span class="subheading" style="font-weight: normal;">Partycket
				Performance</span>
			<h2 class="mb-4">Search Lists</h2>
		</div>
	</div>
	<c:set var="i" value="0" />
	<c:set var="j" value="4" />
	<table border="0" width="900px;" cellpadding="4" cellspacing="4"
		align="center">
		<c:forEach var="dto" items="${mainLists }">
			<c:if test="${i%j == 0 }">
				<tr align="center">
			</c:if>
			<td align="left" style="width: 350px;">
				<div class="col-md-6 col-lg-4 ftco-animate" style="width: 300px;">
					<div class="project" style="width: 300px;">

						<div class="img" style="width: 300px;">
							<div class="vr"></div>
							<a href="/ticketing/resources/images/${dto.performMainImage }">
							<img src="/ticketing/resources/images/${dto.performMainImage }" style="width: 260px; height: 290px;" class="img-fluid">
							</a>
						</div>
						<div class="text">
							<h4 class="price" style="background-color: #232931;">●
								${dto.placeName }</h4>
							<span><b>${dto.performStartDate } ~
									${dto.performEndDate }<b /></span>
							<h3>
								<a
									href="/ticketing/poster.action?performCode=${dto.performCode}">
									<font size="3pt;" style="font-family: rank-tit">${dto.performName }</font>
								</a>
							</h3>
							<div class="star d-flex clearfix">
								<div class="mr-auto float-left">
									<span class="ion-ios-star"></span> <span class="ion-ios-star"></span>
									<span class="ion-ios-star"></span> <span class="ion-ios-star"></span>
									<span class="ion-ios-star"></span>
								</div>
							</div>
						</div>
					</div>
				</div>
			</td>

			<c:if test="${i%j == j-1 }">
				</tr align="left">
			</c:if>
			<c:set var="i" value="${i+1 }" />
		</c:forEach>
	</table>
	</div>
	</section>

	<br />
	<br />
	<br />

	<section class="ftco-gallery">
	<div class="container-fluid px-0">
		<div class="row no-gutters">
			<div class="col-md-4 col-lg-2 ftco-animate">
				<a href="/ticketing/resources/images/1.jpg"
					class="gallery image-popup img d-flex align-items-center"
					style="background-image: url(/ticketing/resources/images/1.jpg);">
					<div
						class="icon mb-4 d-flex align-items-center justify-content-center">
						<span class="icon-instagram"></span>
					</div>
				</a>
			</div>
			<div class="col-md-4 col-lg-2 ftco-animate">
				<a href="/ticketing/resources/images/2.jpg"
					class="gallery image-popup img d-flex align-items-center"
					style="background-image: url(/ticketing/resources/images/2.jpg);">
					<div
						class="icon mb-4 d-flex align-items-center justify-content-center">
						<span class="icon-instagram"></span>
					</div>
				</a>
			</div>
			<div class="col-md-4 col-lg-2 ftco-animate">
				<a href="/ticketing/resources/images/3.jpg"
					class="gallery image-popup img d-flex align-items-center"
					style="background-image: url(/ticketing/resources/images/3.jpg);">
					<div
						class="icon mb-4 d-flex align-items-center justify-content-center">
						<span class="icon-instagram"></span>
					</div>
				</a>
			</div>
			<div class="col-md-4 col-lg-2 ftco-animate">
				<a href="/ticketing/resources/images/4.jpg"
					class="gallery image-popup img d-flex align-items-center"
					style="background-image: url(/ticketing/resources/images/4.jpg);">
					<div
						class="icon mb-4 d-flex align-items-center justify-content-center">
						<span class="icon-instagram"></span>
					</div>
				</a>
			</div>
			<div class="col-md-4 col-lg-2 ftco-animate">
				<a href="/ticketing/resources/images/5.jpg"
					class="gallery image-popup img d-flex align-items-center"
					style="background-image: url(/ticketing/resources/images/5.jpg);">
					<div
						class="icon mb-4 d-flex align-items-center justify-content-center">
						<span class="icon-instagram"></span>
					</div>
				</a>
			</div>
			<div class="col-md-4 col-lg-2 ftco-animate">
				<a href="/ticketing/resources/images/6.jpg"
					class="gallery image-popup img d-flex align-items-center"
					style="background-image: url(/ticketing/resources/images/6.jpg);">
					<div
						class="icon mb-4 d-flex align-items-center justify-content-center">
						<span class="icon-instagram"></span>
					</div>
				</a>
			</div>
		</div>
	</div>
	</section>

	<footer class="ftco-footer ftco-section">
	<div class="container">
		<div class="row mb-5">
			<div class="col-md">
				<div class="ftco-footer-widget mb-4">
					<h2 class="ftco-heading-2">
						About <span><a href="index.html">Ecoland</a></span>
					</h2>
					<p style="font-weight: normal;">Far far away, behind the word
						mountains, far from the countries Vokalia and Consonantia, there
						live the blind texts.</p>
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
						<li style="font-weight: normal;"><a href="#"><span
								class="icon-long-arrow-right mr-2"></span>Online Enquiry</a></li>
						<li style="font-weight: normal;"><a href="#"><span
								class="icon-long-arrow-right mr-2"></span>General Enquiry</a></li>
						<li style="font-weight: normal;"><a href="#"><span
								class="icon-long-arrow-right mr-2"></span>Booking</a></li>
						<li style="font-weight: normal;"><a href="#"><span
								class="icon-long-arrow-right mr-2"></span>Privacy</a></li>
						<li style="font-weight: normal;"><a href="#"><span
								class="icon-long-arrow-right mr-2"></span>Refund Policy</a></li>
						<li style="font-weight: normal;"><a href="#"><span
								class="icon-long-arrow-right mr-2"></span>Call Us</a></li>
					</ul>
				</div>
			</div>
			<div class="col-md">
				<div class="ftco-footer-widget mb-4">
					<h2 class="ftco-heading-2">Experience</h2>
					<ul class="list-unstyled">
						<li style="font-weight: normal;"><a href="#"><span
								class="icon-long-arrow-right mr-2"></span>Adventure</a></li>
						<li style="font-weight: normal;"><a href="#"><span
								class="icon-long-arrow-right mr-2"></span>Hotel and Restaurant</a></li>
						<li style="font-weight: normal;"><a href="#"><span
								class="icon-long-arrow-right mr-2"></span>Beach</a></li>
						<li style="font-weight: normal;"><a href="#"><span
								class="icon-long-arrow-right mr-2"></span>Nature</a></li>
						<li style="font-weight: normal;"><a href="#"><span
								class="icon-long-arrow-right mr-2"></span>Camping</a></li>
						<li style="font-weight: normal;"><a href="#"><span
								class="icon-long-arrow-right mr-2"></span>Party</a></li>
					</ul>
				</div>
			</div>
			<div class="col-md">
				<div class="ftco-footer-widget mb-4">
					<h2 class="ftco-heading-2">Have a Questions?</h2>
					<div class="block-23 mb-3">
						<ul>
							<li style="font-weight: normal;"><span
								class="icon icon-map-marker"></span><span class="text">203
									Fake St. Mountain View, San Francisco, California, USA</span></li>
							<li style="font-weight: normal;"><a href="#"><span
									class="icon icon-phone"></span><span class="text">+2 392
										3929 210</span></a></li>
							<li style="font-weight: normal;"><a href="#"><span
									class="icon icon-envelope"></span><span class="text">info@yourdomain.com</span></a></li>
						</ul>
					</div>
				</div>
			</div>
		</div>
		<div class="row">
			<div class="col-md-12 text-center" style="font-weight: normal;">

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

	<!-- loader -->
	<%-- <div id="ftco-loader" class="show fullscreen">
		<svg class="circular" width="48px" height="48px">
		<circle class="path-bg" cx="24" cy="24" r="22" fill="none"
			stroke-width="4" stroke="#eeeeee" />
		<circle class="path" cx="24" cy="24" r="22" fill="none"
			stroke-width="4" stroke-miterlimit="10" stroke="#F96D00" /></svg>
	</div> --%>


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