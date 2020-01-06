<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

</head>
<body>
	<div style="width: 800px; margin: 0 auto;">
		<form action="" method="post" name="performListForm">
			<table>
				<tr style="border-bottom: 1pt solid black; font-weight: bold;">
					<td width="1500px" align="center">공연명</td>
					<td width="700px" align="center">장소</td>
					<td width="500px" align="center">시작일</td>
					<td width="500px" align="center">종료일</td>
					<td style="display: none;">performCode</td>
				</tr>
				<c:forEach var="map" items="${performLists }">
					<tr>
						<td width="1500px" style="font-size: 10pt;"><b>${map['PERFORMNAME'] }</b></td>
						<td width="700px" align="center" style="font-size: 10pt;">${map['PERFORMPLACENAME'] }</td>
						<td width="500px" align="center" style="font-size: 10pt;">${map['PERFORMSTARTDATE'] }</td>
						<td width="500px" align="center" style="font-size: 10pt;">${map['PERFORMENDDATE'] }</td>
						<td style="display: none;" style="font-size: 10pt;">${map['PERFORMCODE'] }</td>
						<%-- <td><input type="button" value=" 삭제 " onclick="sendPerformCode('${map['PERFORMCODE'] }');"/></td> --%>
						<td><input type="button" value=" 삭제 "
							onclick="javascript:location.href='./companyPerformDelete.action?performCode=${map['PERFORMCODE'] }';" /></td>
					</tr>
				</c:forEach>
			</table>
		</form>
	</div>
</body>
</html>