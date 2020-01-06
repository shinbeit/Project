<%-- <div>
	<jsp:include page="mainHeader.jsp" flush="false"/>
	<%@ page contentType="text/html; charset=UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
	<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
	%>
</div> --%>

<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>

<body data-spy="scroll" data-target=".site-navbar-target" data-offset="300">
	<section class="ftco-section" style="padding: 0px">
	<!-- <div class="container"> -->
		<div class="row" align="center">

			<div class="col-md-12 tour-wrap" align="center">
				<!-- <div class="pt-5" style="padding-top: 0px"> -->
					<!-- <div class="comment-form-wrap pt-5" style="width: 900px"> -->
					<div style="width: 760px;" align="center">
						<h3 class="mb-5" style="font-style: blod; font-size: 40px"></h3>
						<form action="" name="myForm" method="post"
							enctype="multipart/form-data" autocomplete="off">
							<div class="form-group" align="left">
								<label for="name">이름 *</label> 
								<input type="text" class="form-control" name="performName" value="">
							</div>
							<div class="form-group" align="left">
								<label for="name">장르 *</label>
								<!-- <input type="email" class="form-control" id="email"> -->
								<select class="form-control" name="performGenreCode">
									<option value="">선택</option>
									<c:forEach var="result" items="${genreList}">
										<option value="${result.genreCode}">${result.genreName}</option>
									</c:forEach>
								</select>
							</div>
							<div class="form-group" align="left">
								<label for="email">일시 *</label></br> <input type="text" name="performStartDate" id="date1"
									style="width: 44%; height: 40px; border: 1px solid #ced4da; border-radius: 5px; height: 52px !important; text-align: center;" />
								&nbsp;&nbsp;~&nbsp; 
								<input type="text" name="performEndDate" id="date2"
								style="width: 44%; height: 40px; border: 1px solid #ced4da; border-radius: 5px; height: 52px !important; text-align: center;" />
							</div>
							<input type="hidden" name="countTime" value="1">
							<div class="form-group" align="left">
								<label for="website">시간 *</label>&nbsp;&nbsp;&nbsp;
								<input type="button" value="+" onclick="addTime();" style="width: 5%; height: 40px; border: 1px solid #ced4da; border-radius: 5px; height: 30px !important; text-align: center;"/>
								<input type="button" value="-" onclick="delTime();" style="width: 5%; height: 40px; border: 1px solid #ced4da; border-radius: 5px; height: 30px !important; text-align: center;"/>
								<br/>
								<div id="addedInputTimeDiv">
									<input type="time" class="form-control" name="PerformTime0" value="13:00:00" min="13:00:00" max="23:00:00">
								</div>
							</div>
							<div class="form-group" align="left">
								<label for="website">장소 *</label> <select class="form-control"
									name="performPlaceCode">
									<option value="">선택</option>
									<c:forEach var="result" items="${placeList}">
										<option value="${result.placeCode}">${result.placeName}</option>
									</c:forEach>
								</select>
							</div>
							<div class="form-group" align="left">
								<label for="website">관람등급 *</label> <select class="form-control"
									name="performRatingCode">
									<option value="">선택</option>
									<c:forEach var="result" items="${ratingList}">
										<option value="${result.ratingCode}">${result.ratingName}</option>
									</c:forEach>
								</select>
							</div>
							<div class="form-group" align="left">
								<label for="website">관람시간(분) *</label> <input type="text"
									class="form-control" name="performRunningtime">
							</div>
							<div class="form-group" align="left">
								<label for="website">티켓가격 *</label> &nbsp;&nbsp;&nbsp;가격동일&nbsp;
								<input type="checkbox" onclick="checkboxClick();" id="chkbox">
								<br />
								<div id="seatPayValue" style="display: block;">
									V 석 : <input type="text" name="Vclass"
										style="width: 20%; height: 40px; border: 1px solid #ced4da; border-radius: 5px; height: 52px !important; text-align: center;">
									&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; S 석 : <input
										type="text" name="Sclass"
										style="width: 20%; height: 40px; border: 1px solid #ced4da; border-radius: 5px; height: 52px !important; text-align: center;">
									&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; R 석 : <input
										type="text" name="Rclass"
										style="width: 20%; height: 40px; border: 1px solid #ced4da; border-radius: 5px; height: 52px !important; text-align: center;">
								</div>
								<div id="seatCommonPayValue" style="display: none;">
									모든 좌석 : <input type="text" name="notSelectClass"
										style="width: 20%; height: 40px; border: 1px solid #ced4da; border-radius: 5px; height: 52px !important; text-align: center;">
								</div>
							</div>
							<div class="form-group" align="left">
								<label for="website">메인 이미지 *</label> 
								<input type="file" class="form-control" name="mainImage">
								<br/>
								<input type="hidden" name="count" value="0">
								<label for="website">상세 이미지 *</label>&nbsp;&nbsp;&nbsp;
								<input type="button" value="+" onclick="addImage();" style="width: 5%; height: 40px; border: 1px solid #ced4da; border-radius: 5px; height: 30px !important; text-align: center;"/>
								<input type="button" value="-" onclick="delImage();" style="width: 5%; height: 40px; border: 1px solid #ced4da; border-radius: 5px; height: 30px !important; text-align: center;"/>
								<div id="addedInputDiv">
									<input type="file" class="form-control" name="performDetailImage">
								</div>
							</div>
							<br/>
							<div class="form-group" align="center">
								<!-- <input type="submit" value=" 등록 "	class="btn py-3 px-4 btn-primary" 
								style="font-size: 30px"> -->
								<input class="btn btn-dark" style="background-color: #232931; height: 50px;" type="submit" 
								onclick="sendIt();" value="정보 등록하기"">
								
							</div>
<br/><br/>
						</form>
					</div>
			</div>
		</div>
	</section>
	


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
<!-- 	<script
		src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBVWaKrjvy3MaE7SQ74_uJiULgl1JY0H2s&sensor=false"></script>
	<script src="/ticketing/resources/js/google-map.js"></script> -->

	<script src="/ticketing/resources/js/main.js"></script> 

	<!-- 달력 -->
	<!-- <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	<script src="//code.jquery.com/jquery-3.2.1.min.js"></script> -->
	<link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
	<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

	<script type="text/javascript">
		$(function() {
		    $("#date1").datepicker({
		    		dateFormat: "yy-mm-dd"
		    });
		    $("#date2").datepicker({
	    		dateFormat: "yy-mm-dd"
	    	});
		});
		
		
		
		$.datepicker.setDefaults({
		    prevText: '이전 달',
		    nextText: '다음 달',
		    monthNames: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'], //월 이름
		    monthNamesShort: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'], //
		    dayNames: ['일', '월', '화', '수', '목', '금', '토'],
		    dayNamesShort: ['일', '월', '화', '수', '목', '금', '토'],
		    dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'],
		    showMonthAfterYear: true,
		    yearSuffix: '년'
		});  
		
		function sendIt() {
			
			f = document.myForm;
			 
			if (!f.performName.value) {
				alert("작품명을 입력해주세요");
				f.companyId.focus();
				return;
			}
			if (!f.performGenreCode.value) {
				alert("장르를 선택해주세요");
				f.companyPwd.focus();
				return;
			}
			if (!f.performStartDate.value) {
				alert("시작일자를 선택해주세요");
				f.performStartDate.focus();
				return;
			}
			if (!f.performEndDate.value) {
				alert("종료일자를 선택해주세요");
				f.performEndDate.focus();
				return;
			}
			if (!f.performPlaceCode.value) {
				alert("장소를 선택해주세요");
				f.performPlaceCode.focus();
				return;
			}
			if (!f.performRatingCode.value) {
				alert("관람등급을 선택해주세요");
				f.performRatingCode.focus();
				return;
			}
			
			if (!f.performRunningtime.value) {
				alert("관람시간을 입력해주세요");
				f.performRunningtime.focus();
				return;
			}
			if (!f.Vclass.value) {
				//alert("티켓가격을 입력해주세요");
				f.Vclass.value = 0;
			}  
			if (!f.Rclass.value) {
				//alert("티켓가격을 입력해주세요");
				f.Rclass.value = 0;
			}  
			if (!f.Sclass.value) {
				//alert("티켓가격을 입력해주세요");
				f.Sclass.value = 0;
			}  
			if (!f.notSelectClass.value) {
				//alert("티켓가격을 입력해주세요");
				f.notSelectClass.value = 0;
			}  
			
			if (!f.mainImage.value) {
				alert("작품 이미지를 선택해주세요");
				f.performMainImage.focus();
				return;
			}
			
			f.action = "<%=cp%>/insert.action";
			f.submit();
		}

		function checkboxClick() {
			if ($('#chkbox').is(":checked")) {
				/* alert("체크함"); */
				$('#seatPayValue').css("display", "none");
				$('#seatCommonPayValue').css("display", "block");

			} else {
				/* alert("체크해제"); */
				$('#seatPayValue').css("display", "block");
				$('#seatCommonPayValue').css("display", "none");

			}
		}

		var count = 0;

		function addImage() {
			
			count = document.myForm.count.value;
			
			var str = "<input type='file' class='form-control' name='file1_"+count+"'>";
			
			$('#addedInputDiv').append(str);

			count++;

			document.myForm.count.value = count;

			// 다음 페이지에 몇개의 폼을 넘기는지 전달하기 위해 히든 폼에 카운트 저장

		}

		function delImage() {

			count = document.myForm.count.value;
			
			count = count - 1;

			if (count >= 0) { // 현재 폼이 두개 이상이면

				//$('#addedFormDiv').remove("'#file1_" + count + "'");
				$('#addedInputDiv input:last').remove();
				
				document.myForm.count.value = count;

			}

		}
		
		var countTime = 1;
		
		function addTime() {
			
			countTime = document.myForm.countTime.value;
			
			var str = "<input type='time' class='form-control' name='PerformTime"+countTime+"' value='13:00:00' min='13:00:00' max='23:00:00'>";
			
			$('#addedInputTimeDiv').append(str);

			countTime++;

			document.myForm.countTime.value = countTime;

			// 다음 페이지에 몇개의 폼을 넘기는지 전달하기 위해 히든 폼에 카운트 저장

		}

		function delTime() {

			countTime = document.myForm.countTime.value;
			
			countTime = countTime - 1;

			if (countTime >= 1) { // 현재 폼이 두개 이상이면

				//$('#addedFormDiv').remove("'#file1_" + count + "'");
				$('#addedInputTimeDiv input:last').remove();
				
				document.myForm.countTime.value = countTime;

			}

		}
		
	</script>
	<%-- 
	<div>
		<jsp:include page="mainFooter.jsp" flush="false"/>
	</div> --%>
	
</body>
</html>