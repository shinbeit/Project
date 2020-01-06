<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>

<div id="selectDiv" style="display: block">
	<div>
		<form name="myReview">
			<table style="width: 900px;">
				<tr style="border-top: 2px; font-size: 13pt;" align="left">
					<td style="width: 400px; font-family: rank-tit;"><b>제목</b></td>
					<td style="width: 200px;"><b>평점</b></td>
					<td style="width: 150px;"><b>작성자</b></td>
					<td style="width: 150px;"><b>작성일</b></td>
				</tr>
				<c:if test="${dataCount!=0 }">
					<c:forEach var="dto" items="${review_lists }">
						<tr class="data" bordercolor="white;" align="left">
							<td style="display: none" id="boardNum">${dto.boardNum }</td>
							<td style="width: 400px;">${dto.subject }</td>
							<td style="width: 200px;"><font color="orange">${dto.score }</font></td>
							<td style="width: 150px;">${dto.userId}</td>
							<td style="width: 150px;">${dto.created }</td>
							<td><input type="button" value="삭제" id="deleteButton"
								class="btn btn-dark"></td>
						</tr>
						<tr>
							<!-- <td>내용</td> -->
							<td colspan="4"><b>→</b>&nbsp;&nbsp;${dto.message }</td>
						</tr>

					</c:forEach>
				</c:if>

				<c:if test="${dataCount==0 }">
					<tr style="width: 900px;">
						<td style="font-family: rank-tit;"><br />등록된게시물이 없습니다.</td>
					</tr>
				</c:if>
			</table>
		</form>
	</div>
</div>

<script type="text/javascript">
//로그인 안됐을시
$('#loginButton').click(function() {
	/* alert("로그인후 시도해주세요"); */
	$(location).attr('href','http://192.168.16.7:8080/ticketing/userLogin.action')
});
				
//삭제
$('#deleteButton').click(function() {
 	/* alert("후기 삭제");
	alert($(this).attr("id"));  */
	
	var boardNum = $(this).parents().parents().children().first().html();
	
	//alert(boardNum);
	$.get('/ticketing/delete/review', {
		"boardNum": boardNum
	}, function(args) {
		//$('#review').html(args);
		$('#revi').html(args);
	});
	$('#selectDiv').css("display", "block");
	$('#insertDiv').css("display", "none"); 
});

//리스트 더보기
$('.data:gt(3)').hide().last().after();

$("#listadd").click(function() {
	var a = this;
	$('.data:not(:visible):lt(3)').fadeIn(function() {
		if ($('.data:not(:visible)').length == 0) {
			$(a).remove();
		}
	});
	return false;
});
</script>