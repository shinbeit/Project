<%@ page contentType="text/html; charset=EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>

<style type="text/css">

.white{
	width: 85%;
	height: 80%;
	margin: 0 auto;
	align: center;
}
#button {
	margin: 0 auto;
	align: center;
}

</style>
</head>



<body style="background: rgba(0,0,0,0.8)" onload="start();">



<div style="border: 3px solid #0076A3; margin-top:40px; margin-left: 40px; background: white;" class="white" >

	<table
		style="background-color: #F6F6F8; border-bottom-width: 1px; border-bottom-style: dotted; border-bottom-color: #cccccc;"
		width="100%">
		<tr>
			<td style="padding-left: 10px; padding-top: 10px;"><font
				color="#4D7CCE" size="4px"><b>TICKET&nbsp;</b></font><font
				size="4px"><b>������ ���������� �Ϸ�Ǿ����ϴ�.</b></font></td>
		</tr>
		<tr>
			<td
				style="padding-left: 10px; padding-bottom: 3px; font-size: 8pt; color: #888888;">������
				�󼼳����� ���������� > MY���� > ����Ȯ��/��ҿ��� Ȯ���Ͻ� �� �ֽ��ϴ�.</td>
		</tr>

	</table>
	
	<!-- �������� -->
		
				
				<table width="33%" style="float: left; margin-left: 20px;" >
				
					<tr>
						<td colspan="2"><font size="3px"><b>��&nbsp;��������</b></font></td>
					</tr>
					<tr>
						<td style="border-bottom-width: 1px; border-bottom-style: dotted; border-bottom-color: #4D7CCE;"  colspan="2"></td>
					</tr>	

					<tr >
						<td style="padding-left: 10px;"><font size="2px" color="#888888">�����ȣ</font> </td>
						<td><font size="3px" color="#ED4955"><b> Y1519462827[�� 1��]</b></font> </td>
					</tr>
					<tr>
						<td style="padding-left: 10px;"><font size="2px" color="#888888">������</font> </td>
						<td><font size="2px" color="#888888"><b>�ҹ���</b></font> </td>
					</tr>
					<tr>
						<td style="padding-left: 10px;"><font size="2px" color="#888888">������</font> </td>
						<td><font size="2px" color="#888888"><b>LIVE HE</b></font> </td>
					</tr>
					<tr>
						<td style="padding-left: 10px;"><font size="2px" color="#888888">�����Ͻ�</font> </td>
						<td><font size="2px" color="#888888">2019.12.08 (��) [1ȸ] 17�� 00��</font> </td>
					</tr>
					<tr>
						<td style="padding-left: 10px;"><font size="2px" color="#888888">�¼�</font> </td>
						<td>
							<c:forEach var="l" items="${list }">
								<c:if test="${l.finalPay != 1 }">
									<p>${l.seatRow }�� ${ l.seatNum}��</p>
								</c:if>
							</c:forEach>
						</td>
						<!-- <td><textarea rows="5" cols="20"></textarea></td> -->
					</tr>
					<tr>
						<td style="padding-left: 10px;"><font size="2px" color="#888888">���ɹ��</font> </td>
						<td><font size="2px" color="#888888">�������</font> </td>
					</tr>
					
					<tr height="30"></tr>
						
					<!-- ���� �� ���ǻ��� -->
					<tr>
						<td colspan="2"><font size="3px"><b>��&nbsp;���� �� ���ǻ���</b></font></td>
					</tr>
					<tr>
						<td style="border-bottom-width: 1px; border-bottom-style: dotted; border-bottom-color: #4D7CCE;"  colspan="2"></td>
					</tr>	
					<tr>
						<td style="padding-left: 10px;"><font size="2px" color="#888888">��Ұ����Ͻ�: </font> </td>
						<td><font size="2px" color="#4D7CCE"><b> ${cancelDate }</b></font> </td>
					</tr>
				</table>	
			
			
			<!-- �������� -->
				<table width="33%" style="float: left; margin-left: 20px; border-collapse: collapse;" cellpadding="2" >
						<tr>
						<td colspan="2"><font size="3px"><b>��&nbsp;��������</b></font></td>
					</tr>
						<tr>
						<td style="border-bottom-width: 1px; border-bottom-style: dotted; border-bottom-color: #4D7CCE;"  colspan="2"></td>
					</tr>	
						<tr>
							<td style="padding-left: 10px;"><font size="2px" color="#888888">Ƽ�ϱݾ�</font> </td>
							<td align="right"><font size="2px" color="#888888">${stdto.ticketPrice }</font> </td>
						</tr>
						<tr>
							<td style="padding-left: 10px;"><font size="2px" color="#888888">���ż�����</font> </td>
							<td align="right"><font size="2px" color="#888888">${500*stdto.inwon }</font> </td>
						</tr>
						<tr>
							<td style="padding-left: 10px;"><font size="2px" color="#888888">��۷�</font> </td>
							<td align="right"><font size="2px" color="#888888">0</font> </td>
						</tr>
						<tr style="background-color: #F3F5F6;">
							<td style="padding-left: 10px;"><font size="2px" color="#888888"><b>(+)�ݾ�</b></font> </td>
							<td align="right"><font size="2px" color="#888888"><b>${stdto.ticketPrice}</b></font> </td>
						</tr>
						<tr>
							<td style="padding-left: 10px;"><font size="2px" color="#888888">���αݾ�</font></td>
							<td align="right"><font size="2px" color="#888888">${stdto.discountPrice*stdto.inwon }</font> </td>
						</tr>
						<tr>
							<td style="padding-left: 10px;"><font size="2px" color="#888888">��������</font> </td>
							<td align="right"><font size="2px" color="#888888">${stdto.couponPrice*stdto.inwon }</font> </td>
						</tr>
						<tr>
							<td style="padding-left: 10px;"><font size="2px" color="#888888">Yes�Ӵ�</font> </td>
							<td align="right"><font size="2px" color="#888888">${stdto.pointPrice }</font> </td>
						</tr>
						<tr>
							<td style="padding-left: 10px;"><font size="2px" color="#888888">��ġ��</font> </td>
							<td align="right"><font size="2px" color="#888888"></font> </td>
						</tr>
						<tr>
							<td style="padding-left: 10px;"><font size="2px" color="#888888">YES��ǰ��</font> </td>
							<td align="right"><font size="2px" color="#888888"></font> </td>
						</tr>
						<tr>
							<td style="padding-left: 10px;"><font size="2px" color="#888888">�������ű�</font> </td>
							<td align="right"><font size="2px" color="#888888"></font> </td>
						</tr>
						<tr>
							<td style="padding-left: 10px;"><font size="2px" color="#888888">��Ÿ����</font> </td>
							<td align="right"><font size="2px" color="#888888"></font> </td>
						</tr>
						<tr style="background-color: #F3F5F6;">
							<td style="padding-left: 10px;"><font size="2px" color="#888888"><b>(-)�ݾ�</b></font> </td>
							<td align="right"><font size="2px" color="#888888"><b>${stdto.discountPrice*stdto.inwon+stdto.couponPrice*stdto.inwon-stdto.pointPrice }</b></font> </td>
						</tr>
						<tr height="1"><td>&nbsp;</td></tr>
						<tr style="background-color: #0076A3; ">
							<td style="padding: 13px; "><font color="#ffffff" size="2px">�� ���� �ݾ�</font></td>
							<td align="right"><font color="#ffffff" size="4px"><b>${stdto.ticketPrice+500*stdto.inwon-stdto.discountPrice*stdto.inwon-stdto.couponPrice*stdto.inwon-stdto.pointPrice }</b></font> <font color="#ffffff" size="2px">��</font></td>	
						</tr>
						
						<tr>
							<td style="padding-left: 10px;"><font size="2px" color="#888888">��������</font> </td>
							<td></td>
							<!-- <td align="right"><font size="2px" color="#888888">�������Ա�</font> </td> -->
						</tr>
						<tr>
							<td style="padding-left: 10px;"><font size="2px" color="#888888">�Աݰ���/����</font> </td>
							<td align="right"><font size="2px" color="#888888">${adto.accountNum} / ${adto.accountBank }</font></td>
						</tr>
						<tr>
							<td style="padding-left: 10px;"><font size="2px" color="#888888">�Աݱݾ�/����</font> </td>
							<td align="right"><font size="2px" color="#888888">${stdto.ticketPrice*stdto.inwon+500*stdto.inwon+stdto.discountPrice*stdto.inwon+stdto.couponPrice*stdto.inwon+stdto.pointPrice } / ${deadline }</font> </td>
						</tr>
				
				</table>	
				
				<table width="25%" style="margin-top: 20px;">
					<tr>
						<td style="padding-left: 30px;">
							<img src="/ticketing/resources/images/hong.png"/>
						</td>
					</tr>
	    		</table>
	    		<!-- ���ų���Ȯ�� ��ư -->	
	    		<table id="button">
	    			<tr>
	    				<td><input type="button" value="Ȩ���� ���ư���" onclick="javascript:location.href='<%=cp%>/';" style="padding-left: 50px; padding-right: 50px; padding-top:5px; padding-bottom:5px; font-size: 15pt; font-weight: bold; color: #ffffff; background-color: #4D7CCE; border-color: #4D7CCE; margin-top: 50px; margin-left: -40%;"></td>
	    				<td><input type="button" value="���ų���Ȯ��" onclick="javascript:location.href='<%=cp%>/myPage.action';" style="padding-left: 50px; padding-right: 50px; padding-top:5px; padding-bottom:5px; font-size: 15pt; font-weight: bold; color: #ffffff; background-color: #4D7CCE; border-color: #4D7CCE; margin-top: 50px; margin-left: -30%;"></td>
	    			</tr>
	    		</table>
	    		<%-- <input type="button" value="Ȩ���� ���ư���" onclick="javascript:location.href='<%=cp%>/';" style="padding-left: 50px; padding-right: 50px; padding-top:5px; padding-bottom:5px; font-size: 15pt; font-weight: bold; color: #ffffff; background-color: #4D7CCE; border-color: #4D7CCE; margin-top: 50px; margin-left: -40%;">
	    		<input type="button" value="���ų���Ȯ��" onclick="javascript:location.href='<%=cp%>/myPage.action';" style="padding-left: 100px; padding-right: 50px; padding-top:5px; padding-bottom:5px; font-size: 15pt; font-weight: bold; color: #ffffff; background-color: #4D7CCE; border-color: #4D7CCE; margin-top: 50px; margin-left: -30%;"> --%>
	    		<!-- <input type="button" value="�����ϱ�" onclick="pay();" style="padding-left: 50px; padding-right: 50px; padding-top:5px; padding-bottom:5px; font-size: 15pt; font-weight: bold; color: #ffffff; background-color: #4D7CCE; border-color: #4D7CCE; margin-top: 50px; margin-left: -40%;"> -->
	    		
	    		<br/><br/><br/>
	    		
	    	</div>


<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="//code.jquery.com/jquery-3.2.1.min.js"></script>
<script type="text/javascript">

function start(){
	
	var IMP = window.IMP;
	IMP.init('imp53208811');
	
}


function pay(){
	
	IMP.request_pay({
	    pg : 'uplus',
	    pay_method : 'card',
	    merchant_uid : 'merchant_' + new Date().getTime(),
	    name : 'YES24',
	    amount : '${stdto.ticketPrice*stdto.inwon+500*stdto.inwon+stdto.discountPrice*stdto.inwon+stdto.couponPrice*stdto.inwon+stdto.pointPrice }',
	    buyer_email : 'iamport@siot.do',
	    buyer_name : '�������̸�',
	    buyer_tel : '010-1234-5678',
	    buyer_addr : '����Ư���� ������ �Ｚ��',
	    buyer_postcode : '123-456',
	    m_redirect_url : '<%=cp%>/myPage.action'
	}, function(rsp) {
	    if ( rsp.success ) {
	        var msg = '������ �Ϸ�Ǿ����ϴ�.';
	        msg += '����ID : ' + rsp.imp_uid;
	        msg += '���� �ŷ�ID : ' + rsp.merchant_uid;
	        msg += '���� �ݾ� : ' + rsp.paid_amount;
	        msg += 'ī�� ���ι�ȣ : ' + rsp.apply_num;
	    } else {
	        var msg = '������ �����Ͽ����ϴ�.';
	        msg += '�������� : ' + rsp.error_msg;
	    }
	    alert(msg);
	});
	
	
	
}







</script>


</body>
</html>