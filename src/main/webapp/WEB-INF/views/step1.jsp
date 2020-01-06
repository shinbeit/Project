<%@page import="com.ticket.dto.SeatingDTO"%>
<%@page import="com.ticket.dto.PerformInfoDTO"%>
<%@page import="java.util.List"%>
<%@ page contentType="text/html; charset=EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();

	String str = (String) request.getAttribute("params");

	String userId = (String) request.getAttribute("userId");
	String performCode = (String) request.getAttribute("performCode");
	String selectedYear = (String) request.getAttribute("selectedYear");
	String selectedMonth = (String) request.getAttribute("selectedMonth");
	String selectedDay = (String) request.getAttribute("selectedDay");
	String time = (String) request.getAttribute("time");

	String step = request.getParameter("step");

	int performGenreCode = (Integer) request.getAttribute("performGenreCode");
	int year1 = (Integer) request.getAttribute("year1");
	int mon1 = (Integer) request.getAttribute("mon1");
	int day1 = (Integer) request.getAttribute("day1");

	int duringDate = (Integer) request.getAttribute("duringDate");

	List<PerformInfoDTO> timeList = (List) request.getAttribute("timeList");
	List<SeatingDTO> seatPriceList = (List) request.getAttribute("seatPriceList");

	System.out.println(timeList + "*****************");
	System.out.println(seatPriceList + "*****************");
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Step1</title>
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link rel="stylesheet" href="/ticketing/resources/css/book.css"
	type="text/css" />
<link rel="icon" type="image/png" href="http://example.com/myicon.png">

<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

<style type="text/css">
.resultDIV {
	font-size: 13px;
	color: #ED292F;
	font-weight: bold;
}

#bgcolor1 {
	background-color: #EB4956;
	color: #ffffff;
}

#bgcolor2 {
	background-color: #ffffff;
	color: #888888;
}

.datecolor {
	font-size: 13px;
	color: #ED292F;
	font-weight: bold;
}
</style>
</head>
<body>
	<div class="post" style="vertical-align: top; float: left;">
		<div>
			<table width="800" bgcolor="#363636">
				<tr>
					<td width="16%" bgcolor="#353535"><img
						style="width: 110px; height: 50px;"
						src="/ticketing/resources/images/mark.PNG"></td>
					<td width="16%" bgcolor="#ffffff">&nbsp;&nbsp;<font
						size="1.5px;" color="#3A85C7"><b>Step1</b></font><br />&nbsp;&nbsp;<font
						size="3px;" color="black"><b>������/ȸ��</b></font></td>
					<td width="16%" bgcolor="#696969">&nbsp;&nbsp;<font
						size="1.5px;" color="#B3B3B3"><b>Step2</b></font><br />&nbsp;&nbsp;<font
						size="3px;" color="#ffffff"><b>�¼�����</b></font></td>
					<td width="16%" bgcolor="#5F5F5F">&nbsp;&nbsp;<font
						size="1.5px;" color="#B3B3B3"><b>Step3</b></font><br />&nbsp;&nbsp;<font
						size="3px;" color="#ffffff"><b>����/����</b></font></td>
					<td width="16%" bgcolor="#565656">&nbsp;&nbsp;<font
						size="1.5px;" color="#B3B3B3"><b>Step4</b></font><br />&nbsp;&nbsp;<font
						size="3px;" color="#ffffff"><b>���ɹ��</b></font></td>
					<td width="16%" bgcolor="#494949">&nbsp;&nbsp;<font
						size="1.5px;" color="#B3B3B3"><b>Step5</b></font><br />&nbsp;&nbsp;<font
						size="3px;" color="#ffffff"><b>���� ���</b></font></td>
				</tr>
			</table>
		</div>

		<div id="test">
			<table border="1" bordercolor="#BEBEBE" bgcolor="#ffffff"
				style="margin-left: 15px; margin-top: 10px;" width="770"
				cellpadding="0" cellspacing="0">
				<tr bgcolor="#7C9AB6">
					<td width="300">&nbsp;&nbsp;<font color="#ffffff" size="2px;"><b>������
								����</b></font></td>
					<td width="470">&nbsp;&nbsp;<font color="#ffffff" size="2px;"><b>ȸ������</b></font></td>
				</tr>
				<tr>
					<td>
						<div style="margin-left: 225px; margin-top: 10px;">
							&nbsp;
							<!-- <input type="button" value="���Ͽ���" style="font-size: 11px; border-radius: 5px; border-color: #F9F9F9; background-color: #ffffff"> -->
						</div>
						<div style="margin-left: 10px;">
							<div class="cal_top">
								<div style="margin-left: 38px;">
									<a href="#" id="movePrevMonth"><span id="prevMonth"
										class="cal_tit">&lt;</span></a> <span id="cal_top_year"></span> <span
										id="cal_top_month"></span> <a href="#" id="moveNextMonth"><span
										id="nextMonth" class="cal_tit">&gt;</span></a>
								</div>
							</div>

							<div id="cal_tab" class="cal" style="margin-left: 30px;"></div>
						</div>
						<div style="margin-left: 28px; margin-bottom: 30px;">
							<img src="/ticketing/resources/images/color.PNG">
						</div>
					</td>
					<td>
						<div style="margin-left: 30px;">
							<div style="margin-top: 20px;">
								<table>
									<tr>
										<td><font size="2px"><b>����
													��¥&nbsp;&nbsp;&nbsp;&nbsp;</b></font></td>
										<td width="150" bgcolor="#F9F9F9">
											<div id="resultDIV" class="resultDIV"><%=selectedYear%>.<%=selectedMonth%>.<%=selectedDay%></div>
										</td>
									</tr>
								</table>
							</div>

							<br />

							<div style="margin-top: 10px;">
								<div>
									<table border="0" bordercolor="#ffffff" cellpadding="0"
										cellspacing="0">
										<tr>
											<td width="150"
												style="border-top: 0; border-top-color: #ffffff"><font
												size="2px"><b>ȸ������</b></font></td>
											<td width="200"><font size="2px"><b>&nbsp;&nbsp;�¼����/�ܿ���</b></font></td>
										</tr>
									</table>
								</div>
								<div style="margin-top: 10px;">
									<div class="post">
										<table border="1" bordercolor="#DCDCDC" cellpadding="0"
											cellspacing="0" height="150" width="150">
											<tr>
												<td width="150">
													<div>
														<table border="1" cellpadding="0" cellspacing="0"
															bordercolor="#DCDCDC" style="border-spacing: 5px;">
															<%
																for (int i = 0; i < timeList.size(); i++) {
															%>
															<tr>
																<td class="check"
																	<%if (time.equals(timeList.get(i).getPerformTime())) {%>
																	id="bgcolor1" <%} else {%> id="bgcolor2" <%}%>>&nbsp;<font
																	size="2px">&nbsp;[<%=i + 1%>ȸ]&nbsp;&nbsp;<%=timeList.get(i).getPerformTime()%>&nbsp;&nbsp;&nbsp;
																</font></td>
															</tr>
															<%
																}
															%>
														</table>
													</div>
												</td>
											</tr>
										</table>
									</div>
									<div class="post">
										<table border="1" bordercolor="#DCDCDC" cellpadding="0"
											cellspacing="0" height="150">
											<tr>
												<td width="200">
													<!-- ���� --> <c:if
														test="${performGenreCode == 3 or performGenreCode == 5 or performGenreCode == 6 }">
														<div>
															<table cellpadding="0" cellspacing="0"
																style="margin-left: 5px;">
																<tr height="50">
																	<td bgcolor="#F9F9F9">
																		<div class="post"
																			style="margin-right: 130px; vertical-align: top;">
																			<font size="1.5px;" color="#8888A4"><b>����</b></font>
																		</div>
																	</td>
																	<td bgcolor="#F9F9F9">

																		<div class="post">
																			<font size="1.5px;" color="#8888A4"><b>40000��</b></font><br />
																			<select name="inwon" id="inwon">
																				<option value="0" selected="selected">0��</option>
																				<option value="1">1��</option>
																				<option value="2">2��</option>
																				<option value="3">3��</option>
																				<option value="3">4��</option>
																				<option value="3">5��</option>
																			</select>
																		</div>
																	</td>
																</tr>
																<tr height="50">
																	<td colspan="2"></td>
																</tr>
															</table>
														</div>
													</c:if> <c:if
														test="${performGenreCode == 2 or performGenreCode == 1 or performGenreCode == 4}">
														<!-- �ܼ�Ʈ �¼� ��� �� �ܿ��� ǥ�� -->
														<div
															style="width: 240px; height: 130px; overflow: auto; margin-left: 10px; border-color: #ffffff">
															<table width="220px" border="0"
																style="border-color: #FFFFFF; border-collapse: collapse;"
																cellpadding="0" cellspacing="0">
																<%
																	for (int i = 0; i < seatPriceList.size(); i++) {
																%>
																<tr style="background-color: #F3F3F3;">
																	<td width="200"><font size="2px;"> ������ <font
																			color="#ED292F">R</font>�� &nbsp;&nbsp;<%=seatPriceList.get(i).getRclass()%>��
																	</font></td>
																</tr>
																<tr height="5" style="background-color: #ffffff"></tr>
																<tr style="background-color: #F3F3F3;">
																	<td width="200"><font size="2px;"> ������ <font
																			color="#ED292F">S</font>�� &nbsp;&nbsp;<%=seatPriceList.get(i).getSclass()%>��
																	</font></td>
																</tr>
																<tr height="5" style="background-color: #ffffff"></tr>
																<tr style="background-color: #F3F3F3;">
																	<td width="200"><font size="2px;"> ������ <font
																			color="#ED292F">V</font>�� &nbsp;&nbsp;<%=seatPriceList.get(i).getVclass()%>��
																	</font></td>
																</tr>
																<tr height="5" style="background-color: #ffffff"></tr>
																<%
																	}
																%>
															</table>
														</div>
													</c:if>
												</td>
											</tr>
										</table>
									</div>
								</div>
							</div>
						</div>
					</td>
				</tr>
			</table>
		</div>
		<br />
		<div style="margin-left: 13px">
			<img src="/ticketing/resources/images/notes.PNG" width="730"
				height="130" />
		</div>
	</div>

	<div class="post" id="detailDIV" style="vertical-align: top;">
		<jsp:include page="detail.jsp">
			<jsp:param value="${performGenreCode }" name="performGenreCode" />
		</jsp:include>
	</div>
	<script
		src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	<script src="//code.jquery.com/jquery-3.2.1.min.js"></script>
	<script type="text/javascript">
		var today = null;
		var year = null;
		var month = null;
		var firstDay = null;
		var lastDay = null;
		var $tdDay = null;
		var $tdSche = null;
		var startYear = <%=year1%>;
		var startMonth = <%=mon1%>;
		var startDay = <%=day1%>;
		var duringDate = <%=duringDate%>;
		var t = 0;
		var flag = false;
		var cnt = 0;
		var selectedYear = <%=selectedYear%>;
		var selectedMonth = <%=selectedMonth%>;
		var selectedDay = <%=selectedDay%>;
		var count = 0;
		var selectedDate;
		var chch = true;
 /* 		$(function() {
			$('#inwon').change(function() {
				$.get('/ticketing/changeInwon', {
					"inwon" : this.value
				}, function(result) {
					console.log(result);
					/* $('#detailDIV').html(result); 
				});
			});
		})  */
		$(document).ready(function() {
			drawCalendar();
			initDate();
			drawDays();
			$("#movePrevMonth").on("click", function() {
				movePrevMonth();
			});
			$("#moveNextMonth").on("click", function() {
				moveNextMonth();
			});

		});

		function drawCalendar() {

			var setTableHTML = "";
			setTableHTML += '<table class="calendar" >';
			setTableHTML += '<tr><th><font size="1.5px;" color="red"><b>��</b></font></th><th><font size="1.5px;"><b>��</b></font></th><th><font size="1.5px;"><b>ȭ</b></font></th><th><font size="1.5px;"><b>��</b></font></th><th><font size="1.5px;"><b>��</b></font></th><th><font size="1.5px;"><b>��</b></font></th><th><font size="1.5px;" color="blue"><b>��</b></font></th></tr><br/>';
			for (var i = 0; i < 6; i++) {
				setTableHTML += '<tr height="25">';
				for (var j = 0; j < 7; j++) {
					setTableHTML += '<td class="time" style="text-overflow:ellipsis;overflow:hidden;white-space:nowrap">';
					setTableHTML += '    <div class="cal-day"></div>';
					setTableHTML += '    <div class="cal-schedule"></div>';
					setTableHTML += '</td>';
				}
				setTableHTML += '</tr>';
			}
			setTableHTML += '</table>';
			$("#cal_tab").html(setTableHTML);

			$('.cal-day').click(function() {

				console.log("cnt1: " + cnt);
				var btnColor = $(this).css("backgroundColor");

				var year = $('#cal_top_year').text();
				console.log(year);

				var month = $('#cal_top_month').text();
				console.log(month);

				var day = $(this).text();
				console.log(day);

				selectedDate = year + "-" + month + "-" + day;

				// Ȩ���� �ҷ��� ���� �������� ���� ������ �κ� �����ϴ� �κ�
				if (cnt >= 1) {

					if (btnColor == "rgb(124, 140, 148)") { // gray
						cnt++;
						alert("������ ���� Ŭ���� �����ϼ���....(1)");
						return;

					} else {

						count = 1;
						cnt = 0;
						$(this).css('backgroundColor', '#7C8C94'); // gray
						return;

					}

				}

				// ���� ���� �κ� ( home���� �ҷ��� �� �����ϰ� �����ϴ� �κ� )
				if (count == 1) {
					if (btnColor == "rgb(124, 140, 148)") { //gray -> pink
						console.log("selected: "+selectedDate);
						$.ajax({

							type : "GET",
							url : "changeDate",
							data : {
								"selectedDate" : selectedDate
							},
							success : function(args) {
								$("#detailDIV").html(args);

							}/* ,
							error : function(e) {
								alert(e.responseText);
							} */

						});

						var check = "2222";

						$.ajax({

							type : "GET",
							url : "detailDate",
							data : {
								"check" : check
							},
							success : function(args) {
								$('#detailDIV').html(args);
							}/* ,
							error : function(e) {
								alert(e.responseText);
							} */

						});

						count = 0;
						$(this).css('backgroundColor', '#EC2A32');

					} else if (btnColor == "rgb(236, 42, 50)") { //pink -> gray
						count = 0;
						cnt = 0;
						$(this).css('backgroundColor', '#7C8C94');

					}

				} else {

					if (btnColor == "rgb(236, 42, 50)") { //pink -> gray
						count = 1;
						$(this).css('backgroundColor', '#7C8C94');

					}

					if (btnColor == "rgb(124, 140, 148)") { //gray -> �̵�����
						alert("������ ���� Ŭ���� �����ϼ���....(2)");
					}
				}

			}); // cal-day click ��
		}// drawCalendar ��

		function initDate() {

			$tdDay = $("td div.cal-day")
			$tdSche = $("td div.cal-schedule")
			dayCount = 1;
			today = new Date();
			year = today.getFullYear();
			month = today.getMonth() + 1;
			firstDay = new Date(year, month - 1, 1);
			lastDay = new Date(year, month, 0);
		}

		function drawDays() {

			$("#cal_top_year").text(year);
			$("#cal_top_month").text(month);

			for (var i = firstDay.getDay(); i < firstDay.getDay()
					+ lastDay.getDate(); i++) {

				if (month == startMonth && year == startYear
						&& dayCount == startDay) {

					flag = true;

				} else {
					$tdDay.eq(i).css("background-color", "white");
					$tdDay.eq(i).text(dayCount);
				}

				if (flag) {
					$tdDay.eq(i).css("background-color", "#7C8C94");
					$tdDay.eq(i).css("color", "black");
					$tdDay.eq(i).text(dayCount++);
					t++; // ȸ��������� ǥ�õǾ���ϴ� �Ⱓ count ���� ����
				} else {
					$tdDay.eq(i).text(dayCount++);
				}

				if (t == duringDate) {
					flag = false;
					t = 0;
				}

				if (month == selectedMonth && year == selectedYear
						&& dayCount == selectedDay + 1) {
					$tdDay.eq(i).css("background-color", "#EC2A32");
					$tdDay.eq(i).text(dayCount - 1);
					cnt = 1;
				}

				// $tdDay.eq(i).text(++dayCount);

			}

			for (var i = 0; i < 35; i += 7) {
				$tdDay.eq(i).css("color", "red");
			}
			for (var i = 6; i < 35; i += 7) {
				$tdDay.eq(i).css("color", "blue");
			}
			console.log("cnt: " + cnt);
		}

		function movePrevMonth() {
			month--;
			if (month <= 0) {
				month = 12;
				year--;
			}
			if (month < 10) {
				month = String("0" + month);
			}
			getNewInfo();
		}

		function moveNextMonth() {
			month++;
			if (month > 12) {
				month = 1;
				year++;
			}
			if (month < 10) {
				month = String("0" + month);
			}
			getNewInfo();
		}

		function getNewInfo() {
			for (var i = 0; i < 42; i++) {
				$tdDay.eq(i).text("");
			}
			dayCount = 1;
			firstDay = new Date(year, month - 1, 1);
			lastDay = new Date(year, month, 0);
			drawDays();
		}
		var timecnt = 1;

		// �����ð� ���� �κ�
		$('.check').click(
				function() {

					var btnColor = $(this).css("backgroundColor");
					console.log(btnColor);

					if (timecnt == 0) {

						if (btnColor == "rgba(0, 0, 0, 0)"
								|| btnColor == "rgb(255, 255, 255)") {

							var time = $(this).text();

							$.ajax({
								type : "GET",
								url : "changeTime",
								data : {
									"time" : time
								},
								success : function(args) {
									$("#detailDIV").html(args);
								}/* ,
								error : function(e) {
									alert(e.responseText);
								} */

							});

							var check = "3333";

							$.ajax({

								type : "GET",
								url : "detailDate",
								data : {
									"check" : check
								},
								success : function(args) {
									$('#detailDIV').html(args);
								}/* ,
								error : function(e) {
									alert(e.responseText);
								} */

							});

							$(this).css('backgroundColor', '#EB4956');
							$(this).css('color', '#FFFFFF');

							timecnt = 1;

						} else if (btnColor == "rgb(235, 73, 86)") {
							$(this).css('backgroundColor', '#FFFFFF');
							$(this).css('color', 'black');
							timecnt = 0;
						}

					} else {

						if (btnColor == "rgb(235, 73, 86)") { //pink

							timecnt = 0;

							$(this).css('backgroundColor', '#FFFFFF');
							$(this).css('color', 'black');

						}

						if (btnColor == "rgba(0, 0, 0, 0)"
								|| btnColor == "rgb(255, 255, 255)") {
							alert("������ �ð�ȸ���� �������ּ���.");

						}

					}

				})
		$('#inwon').change(function() {

			var inwon = this.value;

	/* 		$.get('/ticketing/changeInwon', {
				"selectedDate": selectedDate,
				"inwon": inwon
			}, function(args) {
				console.log(args);
			});  */

		$.ajax({
			type : "GET",
			url : "tttt",
			data : {
				"selectedDate": selectedDate,
				"inwon" : inwon
			},
			success : function(args) {
				console.log("success");
				console.log(args);
				/* $("#div").html(args); */
			}
		}); 

			var check = "4444";

			$.ajax({

				type : "GET",
				url : "detailDate",
				data : {
					"check" : check
				},
				success : function(args) {
					$("#detailDIV").html(args);

				}/* ,
				error : function(e) {
					alert(e.responseText);
				} */

			});

		});
		// window���ε� ���ڸ��� ���� dto�� ajax���� modelandview�� ���� detail�� ������.
		$(document).ready(function() {

			var check = "1111";

			$.ajax({

				type : "GET",
				url : "detailDate",
				data : {
					"check" : check
				},
				success : function(args) {

				},
				error : function(e) {
					alert(e.responseText);
				}

			});

		});
	</script>
</body>
</html>