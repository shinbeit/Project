<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>포스터</title>


<style>
.post {
	display: inline-block;

}
.selector img{
position: absolute; top:0; left: 0;
width: 100%;
height: 100%;
}


</style>
</head>


<!-- Main header 시작  -->
	 <div>
		<jsp:include page="mainHeader.jsp" flush="false" />
		<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
	</div>
<br/><br/><br/><br/><br/>
<!-- Main header 종료  -->

<body>

	<!--상단 포스터 시작  -->
 	<div align="center" style="width: 950px; margin: auto;">
	<div style="border-bottom: 2px solid black; margin: auto; width: 950px;" align="left">
		<h3 style="font-family: rank-tit;">
			<font size="4pt;"><span id="spanPerfName"><b>${p_dto.performName}</b></span></font>      
		</h3>
	</div>
	<br/>
	<div id="container" align="center" style="vertical-align: top; border: 0pt groove #3f51b5;">
		<div class="post">
			<%-- <img src="<c:url value='/image/${p_dto.performMainImage }'/>"
									style="width: 340px; height: 439px; padding-right: 30px;" class="img-fluid"> --%>
									
		<img src="/ticketing/resources/images/${p_dto.performMainImage }"style="width: 340px; height: 439px; padding-right: 30px;" class="img-fluid">
		</div>
			
		<div class="post" style="vertical-align: top; border: 0pt groove #3f51b5; width: 300px; " >
		<br/>
			<table border="0" width="300px;" style="color: #333333;">
				<tr valign="top">
					<td><b>장르</b></td>
					<td >${p_dto.genreName}</td>
				</tr>  
				<tr valign="top">
					<td><b>일시</b></td>
					<td>${p_dto.performStartDate} ~ ${p_dto.performEndDate}</td>
				</tr>
				<tr valign="top">
					<td><b>장소</b></td>
					<td>${p_dto.placeName}</td>

				</tr>
				<tr valign="top">
					<td><b>등급</b></td>
					<td>${p_dto.ratingName}</td>
				</tr>
				<tr valign="top">
					<td><b>관람시간</b></td>
					<td>${p_dto.performRunningTime}분</td>
				</tr>
				<tr><td colspan="2" style="border-bottom: 1px solid #e6e6e6; height: 0px; width: 400;"><br/><br/></td></tr>
			</table>
			<br/>
			<table align="center" border="0" width="300" style="color: #333333">
				<tr>
					<td width="75px; " style="padding-bottom: 15px;" 
					valign="middle"><b>티켓가격</b></td>
					
					<td width="256px" style="padding-left: 15px; padding-bottom: 15px;">
					<c:if test="${pay_dto.notSelectClass!=0}">
						전석:<font color="#ea002c"> ${pay_dto.notSelectClass}</font><br/>
					</c:if>
					<c:if test="${pay_dto.notSelectClass==0}">
					<br/>
						R석 : <font color="#ea002c">${pay_dto.rclass}</font><br/>
			
						S석 : <font color="#ea002c">${pay_dto.sclass}</font><br/>
					
						V석 : <font color="#ea002c">${pay_dto.vclass}</font><br/><br/>
					</c:if> 
					</td>
				</tr>	
				<tr><td colspan="2" style="border-bottom: 1px solid #e6e6e6; height: 20px; width: 50px;">
			</table>		
	</div> 
		<div class="post" style="vertical-align: top; border: 0pt groove #3f51b5; height: 500px; width: 300px; 
		padding-left: 1px; border-left: 1px solid #e6e6e6;" id="home">
			<%-- <jsp:include page="home.jsp" flush="false" /> --%>
		</div>
	</div>
	<div style="border-bottom: 0px solid black; width: 950px; margin-left: -30px;" ></div>
	<hr style="width: 950px; margin: auto;" align="left">
</div>

	<!--상단 포스터 종료  -->


	<!-- 하단 TAB BAR 시작  -->
 	<br/><br/><br/>
	<div id="tabs" style="width: 950px; margin: auto;">
		<ul style="text-align: center;">
			<li><a href="#tabs-1" style="text-align: center;">상세정보</a></li>
			<li><a href="#tabs-2">관람후기</a></li>
			<li><a href="#tabs-3">공연장정보</a></li>
			<li><a href="#tabs-4">취소 & 환불안내</a></li>
		</ul>
		<div id="tabs-1">
			<jsp:include page="information.jsp" flush="false"/>
		</div>
		<div id="tabs-2">
			<jsp:include page="reviewBoard.jsp" flush="false"/>
		</div>
		<div id="tabs-3">
			<jsp:include page="map.jsp" flush="false" />
		</div>
		<div id="tabs-4">
			<jsp:include page="cancle.jsp" flush="false" />
		</div>
	</div>
	
	<br/><br/><br/>
	<!-- 하단 TAB BAR 종료  -->
	
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
  <link rel="stylesheet" href="/resources/demos/style.css">
  <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script>
	$(function() {
		$("#tabs").tabs();
	});
	
	$(document).ready(function() {
		
		$.get('calData', function(args) {
			$('#home').html(args);
		});
		
		
	});
	
</script>

<!-- footer 시작  -->
	 <div>
		<jsp:include page="mainFooter.jsp" flush="false" />
	</div>
<!-- footer 종료  --> 
	

</body>
</html>