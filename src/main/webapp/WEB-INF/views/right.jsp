<%@page import="com.ticket.dto.SelectedTicket"%>
<%@page import="java.util.List"%>
<%@ page contentType="text/html; charset=EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
	String seatRow = request.getParameter("seatRow");
	String seatNum = request.getParameter("seatNum");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="//code.jquery.com/jquery-3.2.1.min.js"></script>

<script type="text/javascript">
/* $('.seat').click(function() {
    $(this).css('backgroundColor', '#F0B6B6');
    console.dir($(this).parents().children().first().html()+"�� "+$(this).html()+"��");
});
function warning(){
	
} */

</script>

<style>
#minimap{
background-color: #808080;
color: white;
}
#right{
text-align: left;
font-size: 10pt;
color: #535772;
}

#header{
	background-color: #7C9AB6;
	color: white;
	margin: top;
}


.btn2_1{ 
	background-color: #F2F2F2;
	border-color: #F2F2F2;
	border:1px solid #C8C8C8;
	font-size: 10pt;
	color: #535772;
	width: 110px;
	padding-left: 10px;
	padding-right: 10px;
}

.btn2_2{
	background-color: #F2F2F2;
	border-color: #F2F2F2;
	border:1px solid #C8C8C8;
	font-size: 10pt;
	color: #535772;
	width: 133px;
	padding-left: 10px;
	padding-right: 10px;
}

.btn3{
	background-color: #4C7CCE;
	border-color: #4C7CCE;
	color: white;
	font-size: 15pt;
	font-style: solid;
	width: 245px;
	padding-bottom: 3px;
	padding-top: 3px;
	padding-left: 10px;
	padding-right: 10px;
}


td {
    width: 250px;
}
.blank {
    background-color: white;
}
#rowName {
    background-color: white;
}
.seat {
    background-color: #787878;
    cursor: pointer;
}
.seat:hover {
      background-color: #C18282;
}

.tab{
	border:1px solid #C8C8C8;
	border-radius: 5%;
	color: black;
	font-size: 10pt;
}

</style>

<body>
	<div id="right" style="width: 400">
		������� �̴ϸ�
		<br/>
		<div id="minimap" style="width: 400">�ֱ����̵��� �̴ϸ��� �̿����ּ���</div>
		<!-- <img src="resources/images/stage.PNG" onmouseover="now_seat(this);" name="img1" width="300">
		<img src="resources/images/stage_down.png" name="img2" width="300"> -->
		<table><tr height="10"></tr></table>
			���¼� ���/����
			<table><tr height="2"></tr></table>
			<table class="tab">
				<tr>
					<td align="left">������ 99,000�� (0��)</td> 
				</tr>
				<tr>
					<td align="left">���ĵ��� 99,000�� (230��)</td> 
				</tr>
			</table>
		
		<table><tr height="10"></tr></table>
			
			�弱���� �¼�
			<!-- <img src="resources/images/!!.png" onmouseover="warning();"> -->
			<table><tr height="2"></tr></table>
			
			<table class="selectedTab" align="left" >
			<!-- ���õ� �¼����� ����Ʈ�� �ҷ��ͼ� �����. -->
				<c:forEach var="l" items="${ list }">
					<c:if test="${l.finalPay == 0 }">
						<tr>
							<td>${l.seatRow }�� ${l.seatNum }��</td>
						</tr>
					</c:if>
				</c:forEach>
			</table>
		
		<table><tr height="10"></tr></table>
				
			<table>
				<tr>
				<!-- 	<td>
						<input type="button" value=" ����ȭ�� " class="btn2_1" onclick="prev()"/> 
					</td> -->
					<!-- <td>
						<input type="reset" value=" �¼� �ٽü��� " class="btn2_2" onclick="re()"/> 
					</td> -->
				</tr>
				
				<tr height="2"></tr>
				
				<tr>
					<td align="center" colspan="2" style="padding: 0px;">
						<input type="button" value=" �¼����� �Ϸ� " class="btn3"/>
					</td>
				</tr>
			</table>
		</div>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="//code.jquery.com/jquery-3.2.1.min.js"></script>
<script type="text/javascript">
	function re() {
		
	}
	//�����ܰ�� �Ѿ�� ��ư�� ������ �� �̺�Ʈ
	$('.btn3').click(function() {
		var length = $('.selectedTab tr').length;
		console.log("len: "+length);
		//���õ� �¼����� �ҷ��ͼ� ������ �¼��� �����϶�� alert�� ����
		if(length == 0) {
			alert("�¼��� �����ϼ���!");
			return;
		} 
		location.href='<%=cp%>/step3';
	});
</script>
</body>
</html>