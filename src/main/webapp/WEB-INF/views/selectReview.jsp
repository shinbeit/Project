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
<div>
	<table border="1" style="width: 900px;">
		<tr>
			<td>제목</td>
			<td>평점</td>
			<td>작성자</td>
			<td>작성일</td>
		</tr>
		<c:forEach var="dto" items="${review_lists }">		
			<tr>
			<td>${dto.subject }</td>
			<td>${dto.message }</td>
			<td>${dto.userId}</td>
			<td>${dto.created }</td>
		</tr>
		</c:forEach>
	</table>
</div>

	<div>
			<p>
				<c:if test="${dataCount!=0 }">
					${pageIndexList }
				</c:if>
				<c:if test="${dataCount==0 }">
					등록된게시물이 없습니다.
				</c:if>
			</p>
	</div>
	
	<div class="form-group">
			<input type="button" value="Post Comment"
				class="btn py-3 px-4 btn-primary" id="sendButton">
	</div>
	
</body>
</html>