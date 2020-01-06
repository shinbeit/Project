<%@ page contentType="text/html; charset=UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<script type="text/javascript">
function update(){
	
	f = document.myUpdateForm;
	
	str = f.companyPwd.value;
	str = str.trim();
	if(!str){
		alert("\n변경 할 비밀번호를 입력하세요.");
		f.companyPwd.focus();
		return;
	}
	f.companyPwd.value = str;
	
	str = f.companyAddr.value;
	str = str.trim();
	if(!str){
		alert("\n변경 할 주소를 입력하세요.");
		f.companyAddr.focus();
		return;
	}		
	
	f.companyAddr.value = str;
	
	str = f.companyFinalAddr.value;
	str = str.trim();
	if(!str){
		alert("\n변경 할 상세주소를 입력하세요.");
		f.companyFinalAddr.focus();
		return;
	}	
	
	f.companyFinalAddr.value = str;
	
	f.companyEmail.value = str;
	
	str = f.companyEmail.value;
	str = str.trim();
	if(!str){
		alert("\n변경 할 메일주소를 입력하세요.");
		f.companyEmail.focus();
		return;
	}	
	
	f.companyEmail.value = str;
	
	str = f.companyPhoneNum.value;
	str = str.trim();
	if(!str){
		alert("\n변경 할 상세주소를 입력하세요.");
		f.companyPhoneNum.focus();
		return;
	}	
	
	f.companyPhoneNum.value = str;
	
	f.action = "<%=cp%>/myPage_ok.action";
	f.submit();
	
	alert("기업정보가 수정되었습니다.");
	
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
<body>
	<div style="width: 500px; text-align: left;">
	
						<form action="" class="bg-white p-4 p-md-5 contact-form" method="post" name="myUpdateForm">
							<div class="form-group">
							<label style="font-weight: normal;"><font color="black">기업 아이디</font></label>
								<input type="text" class="form-control"
									value="${companyMainDTO.getCompanyId()}" id="companyId" name="companyId" readonly/>
							</div>
							<div class="form-group">
							<label style="font-weight: normal;"><font color="black">패스워드</font> </label>
								<input type="password" class="form-control"
									value="${companyMainDTO.getCompanyPwd() }" id="companyPwd" name="companyPwd">
							</div>
							<div class="form-group" align="left">
								<label style="font-weight: normal;"><font color="black">회사 주소</font> </label> <br /> <input
									type="text" class="form-control" name="companyAddr"
									id="sample4_postcode" value="${companyMainDTO.getCompanyAddr() }"
									style="width: 67%; float: left" /> <input type="button"
									class="btn btn-secondary" onclick="sample4_execDaumPostcode();"
									style="float: right; height: 53px; vertical-align: center;"
									value="우편번호 수정" /><span style="line-height: 100%"><br /></span>
							</div>
							<span style="line-height: 200%"><br /></span>
							<div class="form-group">
							<label style="font-weight: normal;"><font color="black">상세주소</font> </label>
								<input type="text" class="form-control"
									value="${companyMainDTO.getCompanyFinalAddr() }" id="companyFinalAddr" name="companyFinalAddr" >
							</div>
							<div class="form-group">
							<label style="font-weight: normal;"><font color="black">회사 이메일</font> </label>
								<input type="text" class="form-control"
									value="${companyMainDTO.getCompanyEmail() }" id="companyEmail" name="companyEmail" >
							</div>
							<div class="form-group">
							<label style="font-weight: normal;"><font color="black">회사 전화번호</font> </label>
								<input type="text" class="form-control"
									value="${companyMainDTO.getCompanyPhoneNum() }" id="companyPhoneNum" name="companyPhoneNum">
							</div>
							<br/>
							<div class="form-group" align="center">
							<input class="btn btn-dark" style="background-color: #232931; height: 50px;" type="submit" onclick="update();" value="정보 수정하기">
						</div>
						</form>
					</div>
</body>
</html>










































































