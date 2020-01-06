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

	function search() {
		
		var f = document.searchForm;
		
		f.action = "<%=cp%>/mainList.action";
		f.submit();
		
	}

</script>

</head>

<body data-spy="scroll" data-target=".site-navbar-target" data-offset="300">
	
	<nav
		class="navbar navbar-expand-lg navbar-dark ftco_navbar bg-dark ftco-navbar-light site-navbar-target"
		id="ftco-navbar">
	<div class="container">
		<a class="navbar-brand" href="<%=cp%>/main.action"><font color="#232931">Partycket</font></a>
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
	
	<div class="home-slider owl-carousel" style="height: 670px;">
		
		<!--  --><!--  --><!--  --><!--  --><!-- 첫번째 슬라이더 --><!--  --><!--  --><!--  --><!--  -->
		
		<div class="slider-item">
			<div class="overlay"></div>
			
			<div class="container-fluid p-0" style="">
				<div class="row d-md-flex no-gutters slider-text align-items-center justify-content-end" 
				data-scrollax-parent="true" style="height: 700px;">
					<div class="one-third order-md-last" style="height: 700px;">
						<div class="img"
							style="width: 600px; height: 550px;">
							<div class="overlay"></div>
						</div>
					</div>
					<div class="one-forth d-flex align-items-center ftco-animate"
						data-scrollax=" properties: { translateY: '100%' }" style="height: 700px; width: 1260px; 
						background-image: url(/ticketing/resources/images/cap2.jpg); background-size: 1280px; 
						background-position: center;  background-repeat: no-repeat;"">
						<div class="text">
							<span class="subheading pl-5"><font color="white">The Phantom Of The Opera</font></span>
							<h1 class="mb-4 mt-3"><font color="white" size="">God's<br/>Gift to Musical Thretre</font></h1>
							<b><p style="font-family: rank-tit"><font color="white">
							뮤지컬의 거장인 앤드루 로이드 웨버의 주옥 같은 명곡 거대한 샹들리에, 환상의 오케스트라 연주,<br/> 환영과도 같은 무대</font></p>
							<p></b>
								<a href="/ticketing/poster.action?performCode=7zY7Rdz6bK" class="btn btn-dark px-5 py-3 mt-3">예매하기
									<span class="ion-ios-arrow-forward"></span>
								</a>
							</p>
						</div>
					</div>
				</div>
			</div>
		</div>

		<!--  --><!--  --><!--  --><!--  --><!-- 첫번째 슬라이더 --><!--  --><!--  --><!--  --><!--  -->
		
		<div class="slider-item">
			<div class="overlay"></div>
			
			<div class="container-fluid p-0" style="">
				<div class="row d-md-flex no-gutters slider-text align-items-center justify-content-end" 
				data-scrollax-parent="true" style="height: 700px;">
					<div class="one-third order-md-last" style="height: 700px;">
						<div class="img"
							style="width: 600px; height: 550px;">
							<div class="overlay"></div>
						</div>
					</div>
					<div class="one-forth d-flex align-items-center ftco-animate"
						data-scrollax=" properties: { translateY: '100%' }" style="height: 700px; width: 1280px; 
						background-image: url(/ticketing/resources/images/cap3.jpg); background-size: 1280px; background-position: center;
						background-repeat: no-repeat;">
						<div class="text">
							<span class="subheading pl-5"><font color="white">The Joshua Tree</font></span>
							<h1 class="mb-4 mt-3"><font color="white" size="6pt;">U2 Legende Is Comming</font></h1>
							<b><p style="font-family: rank-tit"><font color="white" size="4pt;">
							THE JOSHUA TREE TOUR 2019 IN SEOUL</font></p>
							<p></b>
								<a href="/ticketing/poster.action?performCode=txY5A99PiW" class="btn btn-dark px-5 py-3 mt-3">예매하기
									<span class="ion-ios-arrow-forward"></span>
								</a>
							</p>
						</div>
					</div>
				</div>
			</div>
		</div>
		
		<!--  --><!--  --><!--  --><!--  --><!-- 네번째 슬라이더 --><!--  --><!--  --><!--  --><!--  -->

		<div class="slider-item">
			<div class="overlay"></div>
			
			<div class="container-fluid p-0" style="">
				<div class="row d-md-flex no-gutters slider-text align-items-center justify-content-end" 
				data-scrollax-parent="true" style="height: 700px;">
					<div class="one-third order-md-last" style="height: 700px;">
						<div class="img"
							style="width: 600px; height: 550px;">
							<div class="overlay"></div>
						</div>
					</div>
					<div class="one-forth d-flex align-items-center ftco-animate"
						data-scrollax=" properties: { translateY: '100%' }" style="height: 700px; width: 1280px; 
						background-image: url(/ticketing/resources/images/cap.jpg); background-size: 1280px; 
						background-position: center; background-repeat: no-repeat;">
						<div class="text">
							<span class="subheading pl-5"><font color="white">2019 JYP Solo Concert</font></span>
							<h1 class="mb-4 mt-3"><font color="white" size="">who's<br/>Your Mother</font></h1>
							<b><p style="font-family: rank-tit"><font color="white">
							장르 불문 히트곡 퍼레이드로 채워질 박진영(JYP)의<br/>2019년 연말 단독 콘서트</font></p>
							<p></b>
								<a href="/ticketing/poster.action?performCode=0P02F1RCG2" class="btn btn-dark px-5 py-3 mt-3">예매하기
									<span class="ion-ios-arrow-forward"></span>
								</a>
							</p>
						</div>
					</div>
				</div>
			</div>
		</div>
		
		<!--  --><!--  --><!--  --><!--  --><!-- 네번째 슬라이더 --><!--  --><!--  --><!--  --><!--  -->
		
	</div>
	
	<div class="container" style="text-align: right; width: 1150px;" >
		<div class="row justify-content-center pb-0 pb-mb-5 pt-5 pt-md-0">
			<div class="col-md-12 heading-section ftco-animate">
				<span class="subheading" style="font-size: 22pt;"><font color="#232931">Party &amp; Ticket</font></span>
				<!-- <h2 class="mb-4">Where do you participate in?</h2> -->
				<div class="row" align="left">
			<div class="col-md-12" align="right" style="">
				<!-- <div class="search-wrap-1 ftco-animate p-4"> -->
					<form action="" class="search-property-1" name="searchForm" method="post">
						<div class="row" style="width: 1125px; height: 10px;" align="right">
							<div class="form-group" align="left" style="width: 120px; text-align: center;">
								<!-- <label for="name" style="font-weight: normal;">Category</label> -->
								<select class="form-control" name="genreCode">
									<option value="">장 르</option>
									<c:forEach var="result" items="${genreList}">
										<option value="${result.genreCode}">${result.genreName}</option>
									</c:forEach>
								</select>
							</div>	
							<div class="col-lg align-items-end" style="height: 30px;">
								<div class="form-group">
									<!-- <label for="#">Participate</label> -->
									<div class="form-field" align="right">
										<div class="icon">
											<span class="ion-ios-search"></span>
										</div>
										<b><input type="text" class="form-control" name="searchValue"
											placeholder="검색어를 입력해주세요" style="width: 810px;"></b>
									</div>
								</div>
							</div>
							<div class="col-lg align-self-end">
								<div class="form-group">
									<div class="form-field" > 
										<b><input style= "height: 51px;" type="submit" value="     검색하기     " 
											class="btn btn-dark" onclick="search()"></b>
									</div>
								</div>
							</div>
						</div>
					</form>
				<!-- </div> -->
			</div>
		</div>
			</div>
		</div>
		
	</div>
	
	<br/><br/><br/><br/>
	
	<!--  --><!--  --><!--  --><!--  --><!-- TOP3 --><!--  --><!--  --><!--  --><!--  -->
	
	<!-- <section class="ftco-section bg-light" id="blog-section"> -->
	<div class="container">
	<div align="center">
			<div class="col-md-7 heading-section text-center ftco-animate" align="right">
				<span class="subheading">Ranking</span>
				<h2 class="mb-4">Top Ranking</h2>
			</div>						 
		</div>
		<br/>
		<div class="row d-flex">
			<div class="col-md-6 col-lg-4 d-flex ftco-animate">
				<div class="blog-entry justify-content-end">
					<a href="/ticketing/poster.action?performCode=hRg4m8238l" class="block-20"
						style="background-image: url(/ticketing/resources/images/article.jpg);"> </a>
					<div class="text float-right d-block">
						<div class="d-flex align-items-center pt-2 mb-4 topp">
							<div class="one mr-2">
								<span class="day">19</span>
							</div>
							<div class="two">
								<span class="yr">2019</span> <span class="mos">December</span>
							</div>
						</div>
						<h3 class="heading" align="center">
							<a href="/ticketing/poster.action?performCode=hRg4m8238l">BTS ' Love Your Self ' In Seoul Final Concert</a>
						</h3>
						<p>지난 윙스 투어 때처럼 멤버들의 개성이 담긴 솔로곡 무대도 공개됐다. 콘서트에서만 볼 수 있는 7인 7색의 다채로운 무대는 강렬한 인상을 남기기에 충분했다. 
						퍼포먼스부터 랩, 노래까지 팬들에게 조금 더 다양한 모습을 보여주기 위해 지난 1월부터 쏟아부은 노력이 빛이 났다.</p>
						<div class="d-flex align-items-center mt-4 meta" align="center">
							<p class="mb-0" align="center">
								<a href="/ticketing/poster.action?performCode=hRg4m8238l" class="btn btn-dark" style="background-color: #232931;">
								<font color="white"> 예매하기 </font><span></span></a>
							</p>
						</div>
					</div>
				</div>
			</div>
			<div class="col-md-6 col-lg-4 d-flex ftco-animate">
				<div class="blog-entry justify-content-end">
					<a href="/ticketing/poster.action?performCode=JJ0RCA07BS" class="block-20"
						style="background-image: url(/ticketing/resources/images/iz.jpg);"> </a>
					<div class="text float-right d-block">
						<div class="d-flex align-items-center pt-2 mb-4 topp">
							<div class="one mr-2">
								<span class="day">31</span>
							</div>
							<div class="two">
								<span class="yr">2019</span> <span class="mos">December</span>
							</div>
						</div>
						<h3 class="heading" align="center">
							<a href="/ticketing/poster.action?performCode=JJ0RCA07BS">IZ ONE FIRST CONCERT IN SEOUL 2019</a>
						</h3>
						<p>아이즈원은 지난해 데뷔 직후부터 전송차트를 누볐고 올해 발매된 일본 데뷔 싱글 ‘좋아한다고 말하게 하고 싶어’, 
						두 번째 싱글 ‘부에노스 아이레스(Buenos Aires)’가 2작품 연속으로 20만장 넘게 팔리는 쾌거를 달성하는 등 ‘나는 새도 떨어뜨릴 기세’로 
						대약진하고 있다.</p>
						<div class="d-flex align-items-center mt-4 meta">
							<p class="mb-0">
								<a href="/ticketing/poster.action?performCode=JJ0RCA07BS" class="btn btn-dark" style="background-color: #232931;"><font color="white"> 예매하기 </font><span
									></span></a>
							</p>
						</div>
					</div>
				</div>
			</div>
			<div class="col-md-6 col-lg-4 d-flex ftco-animate">
				<div class="blog-entry">
					<a href="/ticketing/poster.action?performCode=S6ftdU6260" class="block-20"
						style="background-image: url(/ticketing/resources/images/iu.jpg);"> </a>
					<div class="text float-right d-block">
						<div class="d-flex align-items-center pt-2 mb-4 topp">
							<div class="one mr-2">
								<span class="day">24</span>
							</div>
							<div class="two">
								<span class="yr">2019</span> <span class="mos">December</span>
							</div>
						</div>
						<h3 class="heading" align="center">
							<a href="/ticketing/poster.action?performCode=S6ftdU6260">2019 IU Tour Concert "Love, Poem" In Seoul</a>
						</h3>
						<p>아이유 소속사 측은 “아이유 전국투어 단독 콘서트 ‘러브, 포엠(Love,poem)’의 서울 공연이 지난 24일, 
						티켓 오픈 1분만에 양일 약 2만 8천석이 매진 기록했다”고 밝혔다. 
						이번 서울 공연은 오는 11월 23~24일, 서울 송파구 KSPO DOME(올림픽 체조경기장)에서 개최된다. 
</p>
						<div class="d-flex align-items-center mt-4 meta">
							<p class="mb-0">
								<a href="/ticketing/poster.action?performCode=S6ftdU6260" class="btn btn-dark" style="background-color: #232931;"><font color="white"> 예매하기 </font><span
									></span></a>
							</p>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- </section> -->

	<!--  --><!--  --><!--  --><!--  --><!-- TOP3 --><!--  --><!--  --><!--  --><!--  -->

	<!-- <section class="ftco-section"> -->
	<div class="container" style="background-color: #232931; width: 1120px;">
		
		<div class="row" style="width: 1110px; height: 700px;">
			<div class="col-md-12 room-wrap">
				<div class="row">
					<div style="width: 600px;">
						<div class="img align-self-stretch"
							style="background-image: url(/ticketing/resources/images/cap102.png); width: 550px; height: 700px;"></div>
					</div>
					<div class="col-md-5 ftco-animate">
						<div class="py-md-5">
							<span class="subheading"><font color="#e2c0bb">GET&nbsp;&nbsp;IN&nbsp;&nbsp;TOUCH&nbsp;&nbsp;WITH&nbsp;&nbsp;US</font></span>
							<h2 class="mb-4"><font color="white" size="12pt;">Get Best Travel Deals</font></h2>
							<!-- <p class="pos" style="font-weight: normal;"><b>
								from <span class="price">공연부 기자 김희우</span>공연부 기자 김희우
							</b></p> -->
							<p style="font-weight: normal">
							영국 빅토리아 앤 알버트 미술관(Victoria and Albert Museum)에서 진행된 'Botticelli Reimagined'에 출품된 작품들 중에서 가장 
							주목받은 작품인 'REBIRTH OF VENUS' 작품이 전시된다. 데이비드 라 샤펠의 최근작인 'Once in the garden' 작품은 다소 충격적일 수
							있으나 작가가 인간을 바라보는 순수한 시각을 온전히 이 작품을 통해 보여주고 있다. 그 외 아만다 레포어, 나오미 캠벨, 파멜라 앤더슨
							등의 누드 작품들 또한 작가가 바라보는 관조를 고스란히 나타내고 있다.  
							<br/><br/>
							총 80분<br/>
							메이킹 영상 : Land Scape, Deluge, Pieta,<br/>
							뮤직비디오 : 에이미 와인하우스, 브리트니 스피어스,<br/> 
							크리스티나 아길레나, 엘튼존, 제니퍼 로페즈, 모비,<br/>
							노다웃, 로라존스, 김희우, 로비 윌리암스, 댄디 워홀<br/>
							</p>
							<!-- <p style="font-weight: normal"> -->
							<!-- </p> -->
							
							<p>
								<a href="/ticketing/poster.action?performCode=0E7l480mqg" class="btn btn-secondary py-3 px-4"> 예약하기 </a> 
								<!-- <a href="#" class="btn btn-white py-3 px-4">예약하기</a> -->
							</p>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	</section>
	
	<br/>
	
	
	<div class="container">
		<div class="row justify-content-center pb-5 pt-5">
			<div class="col-md-12 heading-section text-center ftco-animate">
				<span class="subheading" style="font-weight: normal; font-size: 15pt;">전문가 칼럼</span>
				<h2 class="mb-4">오페라의 유령 오리지널 팀 내한공연</h2>
				<p style="font-weight: normal;">'Phantom of the opera' original team Korean performance</p>
			</div>
		</div>
		<div class="row">
			<div class="col-md-12 room-wrap">
				<div class="row">
					<div class="col-md-7 d-flex ftco-animate" style="width: 600px;">
						<div class="img align-self-stretch"
							style="background-image: url(/ticketing/resources/images/opera100.jpg); width: 600px; height: 780px;"></div>
					</div>
					<div class="col-md-5 ftco-animate">
						<div class="text py-5">
							<h3><p class="pos" style="font-weight: normal;"><b>
								아름다운 유령의 25년 역사
							</b></p></h3>
							<p class="pos" style="font-weight: normal;"><b>
								from <!-- <span class="price">공연부 기자 김희우</span> -->공연부 기자 김희우
							</b></p>
							<p style="font-weight: normal"><오페라의 유령>은 캣츠, 레미제라블, 미스사이공에 이은 세계 4대 뮤지컬 중 하나로, 전 세계가 가장 사랑하는 뮤지컬로 손꼽힙니다. 
							업계 최고 기획자인 카메론 매킨토시(Cameron Mackintosh)와 뮤지컬계의 전설의 작곡가 앤드류 로이드 웨버(Andrew Lloyd Webber)가 
							함께 만든 걸작이라고 할 수 있죠. <오페라의 유령>은 1988년 초연을 한 후부터 지금까지 1만 회가 넘는 공연을 진행해 역사상 최다 공연 신기록을 세웠습니다. 
							원작은 프랑스 작가 가스통 르루가 1910년 발표한 동명의 소설인데요. 라울을 중심으로 이야기가 펼쳐지는 소설과 달리, 
							뮤지컬에서는 크리스틴이 이야기의 중심인물이 되어 진행됩니다. 1대 크리스틴 역은 당시 작곡가 앤드류 로이드 웨버의 부인이었던 
							‘사라 브라이트만(Sarah Brightman)’ 맡았습니다. 웨버는 청순한 외모에 맑은 목소리로 노래하는 부인을 염두에 두고 곡을 썼어요. 
							브라이트만은 부를 수 있는 음역대도 굉장히 넓었기 때문에 극중 크리스틴의 넘버는 엄청난 난이도를 자랑하기도 한답니다. "오페라의 유령"은 애절한 사랑이야기 속, 
							누구나 쉽게 흥얼거릴 수 있는 대중적인 멜로디, 매력적인 배우들의 음성, 극의 배경이 되는 17층 규모의 웅장한 오페라 하우스를 그대로 재현한 무대, 
							화려한 의상 등 요소 하나하나가 여러분의 마음을 사로잡을 거예요!
							</p>
							<p>
								<a href="/ticketing/poster.action?performCode=7zY7Rdz6bK" class="btn btn-secondary">예약하기</a>
							</p>
						</div>
					</div>
				</div>
			</div>
			<div class="col-md-12 room-wrap room-wrap-thumb mt-4">
				<div class="row">
					<div class="col-md-3 ftco-animate">
						<a class="d-flex thumb">
							<div class="img align-self-stretch"
								style="background-image: url(/ticketing/resources/images/opera96.jpg);"></div>
							<div class="text pl-3 py-3" style="font-style: white;">
								<h3 >Still<br/>Photograph</h3>
							</div>
						</a>
					</div>
					<div class="col-md-3 ftco-animate">
						<a class="d-flex thumb">
							<div class="img align-self-stretch"
								style="background-image: url(/ticketing/resources/images/opera98.jpg);"></div>
							<div class="text pl-3 py-3">
								<h3>Still<br/>Photograph</h3>
							</div>
						</a>
					</div>
					<div class="col-md-3 ftco-animate">
						<a class="d-flex thumb">
							<div class="img align-self-stretch"
								style="background-image: url(/ticketing/resources/images/opera3.jpg);"></div>
							<div class="text pl-3 py-3">
								<h3>Still<br/>Photograph</h3>
							</div>
						</a>
					</div>
					<div class="col-md-3 ftco-animate">
						<a class="d-flex thumb">
							<div class="img align-self-stretch"
								style="background-image: url(/ticketing/resources/images/opera97.jpg);"></div>
							<div class="text pl-3 py-3">
								<h3>Still<br/>Photograph</h3>
							</div>
						</a>
					</div>
				</div>
			</div>
		</div>
	</div>
	

	<!-- 뮤지컬이든 뭐든 장르 출력시키기 (첫번째) -->
	<!-- 첫번째 리스트 부분 -->
	<section class="ftco-section">

	
	<div class="row justify-content-center pb-5">
			<div class="col-md-12 heading-section text-center ftco-animate">
				<span class="subheading" style="font-weight: normal;">Partycket Performance</span>
				<h2 class="mb-4">Musical &amp; Theater</h2>
			</div>
		</div>
		
		<!-- <div style="display: inline-block;" align="center"> -->
			<c:set var="i" value="0" />
			<c:set var="j" value="4" />
			<table border="0" width="900px;" cellpadding="4"
				cellspacing="4" align="center">
				<c:forEach var="dto" items="${mtlists }" begin="0" end="11">
				<c:if test="${i%j == 0 }">
				 <tr align="center"> 
				</c:if>
						<td align="left" style="width: 350px;">
						<div class="col-md-6 col-lg-4 ftco-animate"
						style="width: 300px;">
						<div class="project" style="width: 300px;">

							<div class="img">
								<div class="vr">
									
								</div>
								<a href="/ticketing/poster.action?performCode=${dto.performCode}">
								<img src="/ticketing/resources/images/${dto.performMainImage }" style="width: 260px; height: 290px;" class="img-fluid">
								</a>
							</div>
							<div class="text">
								<h4 class="price" style="background-color: #232931;">● ${dto.placeName }</h4>
								<span><b>${dto.performStartDate } ~
										${dto.performEndDate }<b /></span>
								<h3>
									<a href="/ticketing/poster.action?performCode=${dto.performCode}">
									<font size="3pt;" style="font-family: rank-tit">${dto.performName }</font></a>
								</h3>
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
		<!-- </div> -->
		
		<!--  --><!--  --><!--  --><!--  --><!--  --><!--  --><!-- musical and theater --><!--  --><!--  --><!--  --><!--  --><!--  --><!--  -->
		
		<br/>
		
		<!--  --><!--  --><!--  --><!--  --><!--  --><!--  --><!-- concert and classic --><!--  --><!--  --><!--  --><!--  --><!--  --><!--  -->
	<div class="row justify-content-center pb-5">
			<div class="col-md-12 heading-section text-center ftco-animate">
				<span class="subheading" style="font-weight: normal;">Partycket Performance</span>
				<h2 class="mb-4">Concert &amp; Classic</h2>
			</div>
		</div>
			<c:set var="i" value="0" />
			<c:set var="j" value="4" />
			<table border="0" width="900px;" cellpadding="4"
				cellspacing="4" align="center">
				<c:forEach var="dto" items="${cclists }" begin="0" end="11">
				<c:if test="${i%j == 0 }">
				 <tr align="center"> 
				</c:if>
						<td align="left" style="width: 350px;">
						<div class="col-md-6 col-lg-4 ftco-animate"
						style="width: 300px;">
						<div class="project" style="width: 300px;">

							<div class="img" style="width: 300px;">
								<div class="vr">
									
								</div>
								<a href="/ticketing/poster.action?performCode=${dto.performCode}">
								<img src="/ticketing/resources/images/${dto.performMainImage }" style="width: 260px; height: 290px;" class="img-fluid"
									alt="Colorlib Template">
								
								<%-- <img src="<c:url value='/image/${dto.performMainImage }'/>"
									style="width: 260px; height: 290px;" class="img-fluid"
									alt="Colorlib Template"> --%></a>
							
							</div>
							<div class="text">
								<h4 class="price" style="background-color: #232931;">● ${dto.placeName }</h4>
								<span><b>${dto.performStartDate } ~
										${dto.performEndDate }<b /></span>
								<h3>
									<a href="/ticketing/poster.action?performCode=${dto.performCode}">
									<font size="3pt;" style="font-family: rank-tit">${dto.performName }</font></a>
								</h3>
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
		<!-- </div> -->
		
		<!--  --><!--  --><!--  --><!--  --><!--  --><!--  --><!-- concert and classic --><!--  --><!--  --><!--  --><!--  --><!--  --><!--  -->
		
		<br/>
		
	
		
		<!--  --><!--  --><!--  --><!--  --><!--  --><!--  --><!-- Exhibition & Child --><!--  --><!--  --><!--  --><!--  --><!--  --><!--  -->
		<div class="row justify-content-center pb-5">
			<div class="col-md-12 heading-section text-center ftco-animate">
				<span class="subheading" style="font-weight: normal;">Partycket Performance</span>
				<h2 class="mb-4">Exhibition &amp; Child</h2>
			</div>
		</div>
			<c:set var="i" value="0" />
			<c:set var="j" value="4" />
			<table border="0" width="900px;" cellpadding="4"
				cellspacing="4" align="center">
				<c:forEach var="dto" items="${eclists }" begin="0" end="11">
				<c:if test="${i%j == 0 }">
				 <tr align="center"> 
				</c:if>
						<td align="left" style="width: 350px;">
						<div class="col-md-6 col-lg-4 ftco-animate"
						style="width: 300px;">
						<div class="project" style="width: 300px;">

							<div class="img" style="width: 300px;">
								<div class="vr">
									
								</div>
								<a href="/ticketing/poster.action?performCode=${dto.performCode}">
								<img src="/ticketing/resources/images/${dto.performMainImage }" style="width: 260px; height: 290px;" class="img-fluid">
								</a>
							</div>
							<div class="text">
								<h4 class="price" style="background-color: #232931;">● ${dto.placeName }</h4>
								<span><b>${dto.performStartDate } ~
										${dto.performEndDate }<b /></span>
								<h3>
									<a href="/ticketing/poster.action?performCode=${dto.performCode}">
									<font size="3pt;" style="font-family: rank-tit">${dto.performName }</font></a>
								</h3>
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
		<!-- </div> -->
		
		<!--  --><!--  --><!--  --><!--  --><!--  --><!--  --><!-- Exhibition & Child --><!--  --><!--  --><!--  --><!--  --><!--  --><!--  -->
	
	<!-- </section> -->
	<!-- 첫번째 리스트 부분 끝 -->
	<!-- <section class="ftco-section"> -->
	
	
	</section>
	</section>
	<!-- 뮤지컬이든 뭐든 장르 출력시키기 (첫번째) 끝 -->

	

	<!-- <section class="ftco-section contact-section ftco-no-pb" id="contact-section">
      <div class="container">
      	<div class="row justify-content-center mb-5 pb-3">
          <div class="col-md-7 heading-section text-center ftco-animate">
            <span class="subheading">Contact</span>
            <h2 class="mb-4">Contact Me</h2>
            <p>Far far away, behind the word mountains, far from the countries Vokalia and Consonantia</p>
          </div>
        </div>

        <div class="row block-9">
          <div class="col-md-7 order-md-last d-flex">
            <form action="#" class="bg-light p-4 p-md-5 contact-form">
              <div class="form-group">
                <input type="text" class="form-control" placeholder="Your Name">
              </div>
              <div class="form-group">
                <input type="text" class="form-control" placeholder="Your Email">
              </div>
              <div class="form-group">
                <input type="text" class="form-control" placeholder="Subject">
              </div>
              <div class="form-group">
                <textarea name="" id="" cols="30" rows="7" class="form-control" placeholder="Message"></textarea>
              </div>
              <div class="form-group">
                <input type="submit" value="Send Message" class="btn btn-primary py-3 px-5">
              </div>
            </form>
          
          </div>

          <div class="col-md-5 d-flex">
          	<div class="row d-flex contact-info mb-5">
		          <div class="col-md-12 ftco-animate">
		          	<div class="box p-2 px-3 bg-light d-flex">
		          		<div class="icon mr-3">
		          			<span class="icon-map-signs"></span>
		          		</div>
		          		<div>
			          		<h3 class="mb-3">Address</h3>
				            <p>198 West 21th Street, Suite 721 New York NY 10016</p>
			            </div>
			          </div>
		          </div>
		          <div class="col-md-12 ftco-animate">
		          	<div class="box p-2 px-3 bg-light d-flex">
		          		<div class="icon mr-3">
		          			<span class="icon-phone2"></span>
		          		</div>
		          		<div>
			          		<h3 class="mb-3">Contact Number</h3>
				            <p><a href="tel://1234567920">+ 1235 2355 98</a></p>
			            </div>
			          </div>
		          </div>
		          <div class="col-md-12 ftco-animate">
		          	<div class="box p-2 px-3 bg-light d-flex">
		          		<div class="icon mr-3">
		          			<span class="icon-paper-plane"></span>
		          		</div>
		          		<div>
			          		<h3 class="mb-3">Email Address</h3>
				            <p><a href="mailto:info@yoursite.com">info@yoursite.com</a></p>
			            </div>
			          </div>
		          </div>
		          <div class="col-md-12 ftco-animate">
		          	<div class="box p-2 px-3 bg-light d-flex">
		          		<div class="icon mr-3">
		          			<span class="icon-globe"></span>
		          		</div>
		          		<div>
			          		<h3 class="mb-3">Website</h3>
				            <p><a href="#">yoursite.com</a></p>
			            </div>
			          </div>
		          </div>
		        </div>
          </div>
        </div>
      </div>
    </section> -->

	<!-- <section class="ftco-section ftco-no-pt ftco-no-pb">
	<div id="map" class="bg-white"></div>
	</section> -->

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