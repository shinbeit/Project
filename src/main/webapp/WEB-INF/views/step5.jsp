<%@page import="com.ticket.dto.SelectedTicketDTO"%>
<%@page import="com.ticket.dto.AccountDTO"%>
<%@page import="com.ticket.dto.AutoImageDTO"%>
<%@ page contentType="text/html; charset=EUC-KR"%>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
	
	int point = (Integer)request.getAttribute("point");	
	
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Step1</title>

<link rel="stylesheet" href="/ticketing/resources/css/book.css" type="text/css"/>
<style type="text/css">

.white_content {
    position: fixed;
    top: 0;
    right: 0;
    bottom: 0;
    left: 0;
    background: rgba(0, 0, 0, 0.8);
    opacity:0;
    -webkit-transition: opacity 400ms ease-in;
    -moz-transition: opacity 400ms ease-in;
    transition: opacity 400ms ease-in;
    pointer-events: none;
   
}


.white_content:target {
    opacity:1;
    pointer-events: auto;
}
.white_content > div {
	position: absolute;
	top: 25%;
	left: 25%;
	width: 80%;
	height: 80%;
	border: 1px solid black;
	background-color: white;
	overflow: auto;	
	font-size: 13pt;
	
}

.white_content1 {
    position: fixed;
    top: 0;
    right: 0;
    bottom: 0;
    left: 0;
    background: rgba(0, 0, 0, 0.8);
    opacity:0;
    -webkit-transition: opacity 400ms ease-in;
    -moz-transition: opacity 400ms ease-in;
    transition: opacity 400ms ease-in;
    pointer-events: none;
    
   
    
    
}
.white_content1:target {
    opacity:1;
    pointer-events: auto;
}
.white_content1 > div {
	position: absolute;
	top: 5%;
	left: 5%;
	width: 65%;
	height: 60%;
	border: 3px solid #0076A3;
	background-color: white;
	overflow: auto;	
	font-size: 13pt;
	
}

.post5{
display: inline-block;

margin-left: 0px;
}

</style>


</head>

<body onload="start();">
	<form action="" name="myForm">
		<div class="post" style="float: left;">
			<div>
				<table width="800" bgcolor="#363636">
					<tr>
						<td width="16%" bgcolor="#353535"><img style="width: 110px; height: 50px;" src="/ticketing/resources/images/mark.PNG"></td>
						<td width="16%" bgcolor="#797979">&nbsp;&nbsp;<font size="1.5px;" color="#B3B3B3"><b>Step1</b></font><br/>&nbsp;&nbsp;<font size="3px;"  color="#ffffff"><b>������/ȸ��</b></font></td>
						<td width="16%" bgcolor="#696969">&nbsp;&nbsp;<font size="1.5px;" color="#B3B3B3"><b>Step2</b></font><br/>&nbsp;&nbsp;<font size="3px;" color="#ffffff"><b>�¼�����</b></font></td>
						<td width="16%" bgcolor="#5F5F5F">&nbsp;&nbsp;<font size="1.5px;" color="#B3B3B3"><b>Step3</b></font><br/>&nbsp;&nbsp;<font size="3px;" color="#ffffff"><b>����/����</b></font></td>
						<td width="16%" bgcolor="#494949">&nbsp;&nbsp;<font size="1.5px;" color="#B3B3B3"><b>Step4</b></font><br/>&nbsp;&nbsp;<font size="3px;" color="#ffffff"><b>���ɹ��</b></font></td>
						<td width="16%" bgcolor="#ffffff">&nbsp;&nbsp;<font size="1.5px;" color="#3A85C7"><b>Step5</b></font><br/>&nbsp;&nbsp;<font size="3px;" color="black"><b>�������</b></font></td>
					</tr>
				</table>
			</div>
				
				
			
				<div id="content" class="result">
				
					<table width="770" style="margin-left: 15px; margin-right: 15px;">
						<tr style="border: hidden;">
							<td width="770" style="padding: 5px; padding-left: 20px;
								background-color: #7C9AB6; border-color: #7C9AB6; border: 1px; color: white; size: 6px;">
								<b>�������&nbsp;</b>
							</td>
						</tr>
					</table>
					
				
			
				
				<table width="735"  style="margin-left: 35px; color: #888888">
					
					<tr>
						<td width="120">YES�Ӵ�</td>
						<td><input type="text" style="background-color: #EBEBE4;" value="0" id="inputPoint" name="point">��  <input type="checkbox" id="allPointUse"> ���׻��(�� <b>${point }</b>��)
					</tr>
					<tr>
						<td>��ġ��</td>
						<td><input type="text" style="background-color: #EBEBE4;" value="0" id="inputDeposit" name="deposit">�� <input type="checkbox" id="allDepositUse">���׻��(�� <b>0</b>��)</td>
					<tr>
						<td>YES24��ǰ��</td>
						<td><input type="text" style="background-color: #EBEBE4;" value="0">�� <input type="button" value="����ϱ�" id="blue_btn" onclick="giftcart();">  (�� <b>0</b>�� / ��밡�� <b>0</b>��)</td>
					</tr>
					<tr>
						<td>�������ű�</td>
						<td>��밡�� ���ű�[�� <b>0</b>��]<input type="button" value="���ű� ��ȣ ���/����ϱ�" id="pink_btn"></td>
					</tr>
					
					<tr>
						<td class="td" colspan="2"></td>
						<td></td>
					</tr>
					
					<tr>
						<td><font color="#3A85C7">�����������</font></td>
						<td>
							<select id="bank">
								<option style="color: #888888" value="nobank">���༱��</option>
								<option style="color: #888888" value="��������">��������</option>
								<option style="color: #888888" value="��������">��������</option>
								<option style="color: #888888" value="��������">��������</option>
								<option style="color: #888888" value="�츮����">�츮����</option>
								<option style="color: #888888" value="�ϳ�����">�ϳ�����</option>								
							</select>
							<a href="#open"><input type="button" value="���ݿ����� ����ȳ���" style="background-color: #7C8C94; color: white; size: 3pt;"></a>
						</td>
					</tr>
				
					<tr>
						<td class="td" colspan="2"></td>
						<td></td>
					</tr>
					
					<tr>
						<td><font color="#3A85C7">�ڵ��ֹ�����</font></td>
						<td>
							<table>
							
							
								<tr>
									<td rowspan="3">
										<img id="autoImage" name="img" src="/ticketing/resources/images/autoOrder/${aidto.imagePath }" width="200"/>
									</td>
									<td></td>
								</tr>
								<tr>
									<td></td>
									<td style="padding: 0px;"><p class="reloadImage" style="cursor: pointer;"><img src="/ticketing/resources/images/reload.png">���ΰ�ħ</p></td>
									
								</tr>
								<tr>
									<td></td>
									<td>
										<input type="text" id="autoImageValue"/>
									</td>
									
								</tr>
							</table>
						</td>
					</tr>
					
				
					
					<tr>
						<td class="td" colspan="2"></td>
						<td></td>
					</tr>
					
					<tr>
						<td colspan="2"></td>
						<td></td>
					</tr>
			
				</table>
				
				<table border="0px;" width="330" style="margin-left: 35px;">
				
					<tr>
						
						<td style="background-color: #F4F4F4; border-color: gray; padding-left: 10px;"><b>
						<font color="#888888" size="2pt;">��� ���� ���� �ð� : </font><font color="#EC4955" size="2pt;">${cancelDate }</font></b>
						</td>
					</tr>
				
				</table>
				
				<table align="center" width="745" style="margin-left: 35px; color: #888888; font-size: 8pt;"  >
				
					
					<tr>
						<td colspan="2"></td>
						<td></td>
					</tr>
					
					<tr>
						<td colspan="2">
						<img src="/ticketing/resources/images/susu.png" style="margin-left: 0px;" width="725"/>
						</td>		
						<td></td>
					</tr>
					
					
					<tr height="40">
						<td colspan="2"></td>
						<td></td>
					</tr>
			
				</table>
				
				<font style="margin-left: 220px;">
					<font color="#888888"><input type="checkbox" id="agree1" style="cursor: pointer;">��Ҽ����� �� ��ұ����� Ȯ���Ͽ�����, �����մϴ�.<input type="checkbox" id="agree2" style="cursor: pointer;">�� 3�� ���������� �����մϴ�. <a onclick="detailgo()" style="cursor: pointer;">�󼼺���</a></font>
				</font>

				<br/>	
				<br/>
	
			</div>	
		</div>
		
	
		
		<!-- detail.jsp -->
	
		<div id="resultDiv" class="post" style="vertical-align: top; float: left; margin-left: 0px; position: relative;" align="right">
			<jsp:include page="detail5.jsp" >
				<jsp:param value="5" name="step"/>
			</jsp:include> 
		</div>
		
			<table width="200" bgcolor="#363636" class="post5" style="margin-top: 535px; margin-left: -200px;">
				<tr height="9"><td></td></tr>
				<tr>
					<td><input type="button" style="color:#ffffff;  width: 88px; height: 35px; margin-left: 7px; background-color: #818181; border-color: #818181;" value="�����ܰ�"
						onclick="javascript:location.href='<%=cp%>/step4.action';"></td>
					<td><input type="button" id="detail_btn" style="width: 88px; height: 35px;" value="�����ϱ�" onclick="pay();"></td>
				</tr>
				<tr height="15"><td></td></tr>
			</table>
	
	</form>
		<!-- ���ݿ����� ���� �ȳ� â START -->
			<form action="" name="cashReceipt">
    			<div class="white_content" id="open">
	
        			<div>
        			
        				<table width="100%" bgcolor="#4C7CCE" style="border-bottom-color: 1px solid black" >
        					<tr >
        						<td style="color: white">&nbsp;���ݿ����� ���� �ȳ� </td>
        						<td style="color: white" align="right"><a href="#close">x�ݱ�</a></td>
        					</tr>
        				</table>

            			<table style="color: #888888; margin-left: 20px;" >
	            			<tr>
	            				<td style="font-size: 9pt;  font-weight:bold; text-decoration: underline; ">���ݿ������� MY����>����Ȯ��/���>���ų��� �󼼺���</td>
	            			</tr>
	            			<tr>
	            				<td style="font-size: 9pt;  font-weight:bold; text-decoration: underline; ">���� ��û �� �����Ͻ� �� �ֽ��ϴ�.</td>
	            			</tr>
	            			<tr>
	            				<td style="font-size: 9pt;">(YES�Ӵ�, ���� �� �����ݼ� ������ ���Ե��� �ʽ��ϴ�.)</td>
	            			</tr>
	            			
	            			<tr>
	            				<td style="font-size: 9pt; color: red;">��ȭ�� �ҵ������ ���ݿ������� ��û�� ��쿡 ���ؼ��� ����</td>
	            			</tr>
	            			<tr>
	            				<td style="font-size: 9pt; color: red;">������ �� �ֽ��ϴ�.</td>
	            			</tr>
	            			<tr>
	            				<td style="font-size: 9pt;">����(�ҵ�����)�� �޴�����ȣ��, �����(��������)�� ����ڵ��</td>
	            			</tr>
	            			<tr>
	            				<td style="font-size: 9pt;">��ȣ�� ������ �� ������ ���Ρ�Ÿ��, ���Ρ�����, ����ڡ氳</td>
	            			</tr>
	            			<tr>
	            				<td style="font-size: 9pt;">�� ������ �����ؼ� ������ �� �ֽ��ϴ�.</td>
	            			</tr>
	            			<tr height="2"></tr>
	            			<tr>
	            				<td style="font-size: 9pt;">(* ���ݿ����� �߻� ��û 2~3�� �� ����û Ȩ���������� Ȯ�� ��</td>
	            			</tr>
	            			<tr>
	            				<td style="font-size: 9pt;">���մϴ�. )</td>
	            			</tr>
	            			
	            			<tr><td align="center"><a href="#close"><input type="button" value="Ȯ��" onclick="close"></a></td></tr>
            			</table>
            			
        			</div>
        			
        			
    			</div>
    		</form>
   			<!-- �������â END -->
   			
			<div class="white_content1" id="open_pay">
			
				<div>
					<table style="background-color: #F6F6F8; border-bottom-width: 1px; border-bottom-style: dotted; border-bottom-color: #cccccc;" width="850">
						<tr>
							<td  style="padding-left: 10px; padding-top: 10px;"><font color="#4D7CCE" size="4px"><b>TICKET&nbsp;</b></font><font size="4px"><b>������ ���������� �Ϸ�Ǿ����ϴ�.</b></font></td>
						</tr>
						<tr>
							<td style="padding-left: 10px; padding-bottom: 3px; font-size: 8pt; color: #888888;">������ �󼼳����� ���������� > MY���� > ����Ȯ��/��ҿ��� Ȯ���Ͻ� �� �ֽ��ϴ�.</td>
						</tr>
						
					</table>
					
			
					<!-- �������� -->
			
					
					<table width="300" style="float: left; margin-left: 20px;" >
					
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
							<td><textarea rows="5" cols="20">���� 1�� C���� 12�� 007��</textarea></td>
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
							<td><font size="2px" color="#4D7CCE"><b> 2019�� 12�� 07�� 11:00 ����</b></font> </td>
						</tr>
					</table>	
				

				
					<!-- �������� -->
				
					<table width="300" style="float: left; margin-left: 20px;" >
							<tr>
							<td colspan="2"><font size="3px"><b>��&nbsp;��������</b></font></td>
						</tr>
							<tr>
							<td style="border-bottom-width: 1px; border-bottom-style: dotted; border-bottom-color: #4D7CCE;"  colspan="2"></td>
						</tr>	
							<tr>
								<td style="padding-left: 10px;"><font size="2px" color="#888888">Ƽ�ϱݾ�</font> </td>
								<td align="right"><font size="2px" color="#888888">40,000</font> </td>
							</tr>
							<tr>
								<td style="padding-left: 10px;"><font size="2px" color="#888888">���ż�����</font> </td>
								<td align="right"><font size="2px" color="#888888">500</font> </td>
							</tr>
							<tr>
								<td style="padding-left: 10px;"><font size="2px" color="#888888">��۷�</font> </td>
								<td align="right"><font size="2px" color="#888888">0</font> </td>
							</tr>
							<tr style="background-color: #F3F5F6;">
								<td style="padding-left: 10px;"><font size="2px" color="#888888"><b>(+)�ݾ�</b></font> </td>
								<td align="right"><font size="2px" color="#888888"><b>40,500</b></font> </td>
							</tr>
							<tr>
								<td style="padding-left: 10px;"><font size="2px" color="#888888">���αݾ�</font></td>
								<td align="right"><font size="2px" color="#888888">${stdto.discountPrice }</font> </td>
							</tr>
							<tr>
								<td style="padding-left: 10px;"><font size="2px" color="#888888">��������</font> </td>
								<td align="right"><font size="2px" color="#888888">${stdto.couponPrice }</font> </td>
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
								<td align="right"><font size="2px" color="#888888"><b>0</b></font> </td>
							</tr>
							
							<tr style="background-color: #0076A3;">
								<td style="padding: 13px; "><font color="#ffffff" size="2px">�� ���� �ݾ�</font></td>
								<td align="right"><font color="#ffffff" size="4px"><b>50,500</b></font> <font color="#ffffff" size="2px">��</font></td>	
							</tr>
							
							<tr>
								<td style="padding-left: 10px;"><font size="2px" color="#888888">��������</font> </td>
								<td align="right"><font size="2px" color="#888888">�������Ա�</font> </td>
							</tr>
							<tr>
								<td style="padding-left: 10px;"><font size="2px" color="#888888">�Աݰ���/����</font> </td>
								<td align="right"><font size="2px" color="#888888">${adto.accountNum} / ${adto.accountBank }</font></td>
							</tr>
							<tr>
								<td style="padding-left: 10px;"><font size="2px" color="#888888">�Աݱݾ�/����</font> </td>
								<td align="right"><font size="2px" color="#888888">50,500�� / 2019-12-03 23:59:59</font> </td>
							</tr>
					
					</table>	
					
					<table style="margin-top: 20px; margin-left: 20px;">
						<tr>
							<td>
								<img src="/ticketing/resources/images/hong.png"/>
							</td>
						</tr>
		    		</table>
		    		<!-- ���ų���Ȯ�� ��ư -->	
		    		
		    		<input type="button" value="���ų���Ȯ��" style="padding-left: 50px; padding-right: 50px; padding-top:5px; padding-bottom:5px; font-size: 15pt; font-weight: bold; color: #ffffff; background-color: #4D7CCE; border-color: #4D7CCE; margin-top: 50px; margin-left: -330px;">
		    		
		    </div>	
		</div>

<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="//code.jquery.com/jquery-3.2.1.min.js"></script>
<script>

function start(){
	
	var IMP = window.IMP;
	IMP.init('imp53208811');
	
}

	function detailgo(){
		
		 window.open("WEB-INF/views/cal.jsp","��3�� ��������","width=500,height=500");
	}
	
	function deposit(){
		
		var f = document.myForm;
		
		var depo = f.deposit.value;
		if(depo==0){
			alert("����� ��ġ���� �����ϴ�.");
			f.deposit.focus();
		}
		
		
	}
	
	function point(){
		
		var f = document.myForm;
		
		var point = f.point.value;
		if(point==0){
			alert("����� ����Ʈ�� �����ϴ�.");
			f.deposit.focus();
		}
		
		
	}
	
	//����Ʈ ���� ���
	$("#allPointUse").change(function(){
	
		var point = '${point}';
		
		if($('#allPointUse').is(":checked")){
			
			if(point==0){
				alert("��� ������ ����Ʈ�� �����ϴ�.");
				
			}else{
				$('#inputPoint').val(point);
			}
			
			
		}else{
			
			$('#inputPoint').val(0);
			
		}

		var f = document.myForm;
		var usePoint = $('#inputPoint').val();
			
			$.ajax({
				type:"GET",
				url:"use_point.action",
				data:{"pointPrice":-usePoint},
				dataType:"text",
				success:function(args){
					
					$("#resultDiv").html(args);

				},
				error:function(e){
					alert(e.responseText);
				}
			})
	
		
	})
	
	//��ġ�� ���� ���
	$("#allDepositUse").change(function(){
	
		var deposit = '${deposit}';
		
		if($('#allDepositUse').is(":checked")){
			
			if(deposit==0) {
				alert("��� ������ ��ġ���� �����ϴ�.");
				return;
			}else{
				$('#inputDeposit').val(point);
			}	
			
		}else{
			
			$('#inputDeposit').val(0);
			
		}

		var f = document.myForm;
		var useDeposit = $('#inputDeposit').val();
			
			$.ajax({
				type:"GET",
				url:"use_deposit.action",
				data:{"useDeposit":useDeposit},
				dataType:"text",
				success:function(args){
					
					$("#resultDiv").html(args);

				},
				error:function(e){
					alert(e.responseText);
				}
			})
	
		
	})

	$("#inputPoint").change(function(){

		var f = document.myForm;
		var point = $('#inputPoint').val();		
		
		if(point>'${point }'){
			
			alert("������ ����Ʈ���� ���� ����� �� �����ϴ�.");
			$('#inputPoint').val(0);
			
		}
		
		
		$.ajax({
			type:"GET",
			url:"use_point.action",
			data:{"pointPrice":-point},
			dataType:"text",
			success:function(args){
				
				$("#resultDiv").html(args);

			},
			error:function(e){
				alert(e.responseText);
			}
		})
		
	})
	
	var imagePath = '${aidto.imagePath}';

	
	//���� ����
	function pay(){
		
		var f = document.myForm;
		
		var bank = f.bank.value;
		
		if(bank=="nobank"){
			alert("�������Ա� ������ �����ϼ���");
			f.bank.focus();
			return;
		}
		
		var agree1_c = f.agree1.checked;
		
		if(!agree1_c){
			alert("��Ҽ����� ����� �����ϼ���");
			f.agree1.focus();
			return;
		}
		
		var agree2_c = f.agree2.checked;
		
		if(!agree2_c){
			alert("�� 3�� �������� ����� �����ϼ���");
			f.agree2.focus();
			return;
		}
		
		var imageCode = f.autoImageValue.value;
		//var imagePath = '${aidto.imagePath}';
		
		
		
		var flag="";
		
		if(!imageCode){
			alert("�ڵ��ֹ����� ���ڸ� �Է��ϼ���");
			f.autoImageValue.focus();
			return;
		}else{
			$.ajax({
				type:"GET",
				url:"autoPayPre.action",
				data:{"imageCode":imageCode,"imagePath":imagePath},
				dataType:"text",
				success:function(args) {
					console.log(args);
					flag=args;
					
					if(flag=="1"){
						
						IMP.request_pay({
						    pg : 'uplus',
						    pay_method : 'card',
						    merchant_uid : 'merchant_' + new Date().getTime(),
						    name : 'YES24',
						    amount : '100',
						    /* ${stdto.ticketPrice+500*stdto.inwon+stdto.discountPrice*stdto.inwon+stdto.couponPrice*stdto.inwon+stdto.pointPrice } */
						    buyer_email : 'iamport@siot.do',
						    buyer_name : '�������̸�',
						    buyer_tel : '010-1234-5678',
						    buyer_addr : '����Ư���� ������ �Ｚ��',
						    buyer_postcode : '123-456',
						    m_redirect_url : '/ticketing/laststep?bank='+encodeURI(bank)
						}, function(rsp) {
						    if ( rsp.success ) {
						        var msg = '������ �Ϸ�Ǿ����ϴ�.';
						        msg += '����ID : ' + rsp.imp_uid;
						        msg += '���� �ŷ�ID : ' + rsp.merchant_uid;
						        msg += '���� �ݾ� : ' + rsp.paid_amount;
						        msg += 'ī�� ���ι�ȣ : ' + rsp.apply_num;
						        
						        location.href = '/ticketing/laststep?bank='+encodeURI(bank);
						        
						    } else {
						        var msg = '������ �����Ͽ����ϴ�.';
						        msg += '�������� : ' + rsp.error_msg;
						    }
						    alert(msg);
						});
						
						//document.myForm.action = 'ticketing/laststep?bank='+encodeURI(bank);
						//document.myForm.submit();
						
						//location.href = '/ticketing/laststep?bank='+encodeURI(bank);
						
						/* $.get('/ticketing/laststep',{"bank":bank},function(result){
							location.href = '/ticketing/'+result;
						}) */
					
					}else{
						
						alert("�ڵ��ֹ����� ���ڸ� �߸� �Է��ϼ̽��ϴ�. \n�ڵ��ֹ����� ���ڸ� �ٽ� Ȯ�����ּ���.");
						f.autoImageValue.focus();
						return;
					}
	
				},
				error:function(e){
					alert(e.responseText);
				}
			})
			
			
			
	}
			
	
	}
	
	$(".reloadImage").click(function(){ 
			
		var img = document.getElementById('img');
		
		$.ajax({
			type:"GET",
			url:"reloadImage.action",
			success:function(args){
				
				imagePath = args;
				$('#autoImage').attr("src","/ticketing/resources/images/autoOrder/"+args)
				
			},
			error:function(e){
				alert(e.responseText);
			}
		})	
	});
	
  
</script>
</body>
</html>