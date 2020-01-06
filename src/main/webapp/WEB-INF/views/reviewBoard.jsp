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
<body id="review">

	<div id="revi"></div>
	 
	 
	<div id="insertDiv" style="display: none">
		<div style="width: 700px; margin: auto;">
			<div class="form-group">
				<label for="name"><b>제 목 *</b></label> <input type="text"
					class="form-control" id="subject" placeholder="제목을 입력하세요.">
			</div>
			<div class="form-group"><b>
				<select name='score' id="score" style="height: 30px; text-align: center;" >
					<option value='' selected>별 점</option>
					<option value='★★★★★'>★★★★★ 강력추천</option>
					<option value='★★★★'>★★★★ 추천</option>
					<option value='★★★'>★★★ 보통</option>
					<option value='★★'>★★ 아쉬움</option>
					<option value='★'>★ 실망</option>
				</select></b>
			</div>
			<div class="form-group">
				<label for="message"><b>내 용 *</b></label>
				<textarea id="message" cols="30" rows="10"  class="form-control" placeholder="내용을 입력하세요."></textarea>
			</div>
			<br/>
			
		</div>
		<div class="form-group" align="center">
				<input type="button" value=" 등록하기 " style="width: 170px;"
					class="btn btn-dark px-5 py-3 mt-3" id="listButton">
			</div>
	</div>
	<div align="center" id="listaddDiv">
		<br/><br/>
		<button id="listadd" 
			style="width: 200px; height: 40px; float: left; margin-left: 290px;" class="btn btn-secondary">
			<p> 리스트 더 보기 </p>
		</button>
		<c:if test="${!cookieid.equals('')}">
			<input type="button" value="작성하기" class="btn btn-dark" id="sendButton" 
			style="float: left; height: 40px; margin-left: 10px;">
		</c:if>
		<c:if test="${cookieid.equals('')}">
			<div class="form-group" align="center" style="float: left; height: 40px; margin-left: 10px;">
				<input type="button" value="후기작성" class="btn btn-dark"
					id="loginButton">
			</div>
		</c:if>
	</div>
	<br/>
	<br/>

<script type="text/javascript">
//시작할 때 댓글 창 만들기 위해
function printReview(){
/* 	alert("함수"); */
	$.ajax({url:"/ticketing/start/review",
			success:function(args){
				$('#revi').html(args);
	},
	error:function(request,status,error){
      /*   alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error); */
       }
	});

}


$(document).ready(function(){
	printReview();
});


//인서트창으로 이동
$('#sendButton').click(function() {
	alert("클릭잘됐냐");
	$('#selectDiv').css("display", "none");
	$('#insertDiv').css("display", "block");
	$('#listaddDiv').css("display", "none");
	$('#sendButton').css("display", "none");
});
			
//셀렉트 창으로 이동
$('#listButton').click(function() {
	var message = $('#message').val();
	var subject = $('#subject').val();
	var score = $("select[name=score]").val();
				
	$.get('/ticketing/insert/review', {
		"message" : message,
		"subject" : subject,
		"score" : score
	}, function(data) {
		$('#selectDiv').html(data);
	});
	alert("클릭");
	$('#selectDiv').css("display", "block");
	$('#insertDiv').css("display", "none");
	$('#sendButton').css("display", "block");
	$('#listaddDiv').css("display", "block");
	$('#message').val("");
	$('#subject').val("");
	$('#score').val("");
});
//로그인 안됐을시
$('#loginButton').click(function() {
	alert("로그인후 시도해주세요");
	$(location).attr('href','http://192.168.16.7:8080/ticketing/userLogin.action')
});
				
//삭제
$('#deleteButton').click(function() {
	alert("후기 삭제");
	alert($(this).attr("id"));
	
	var boardNum = $(this).parents().parents().children().first().html();
	console.log(boardNum+", ");
/* 	alert(boardNum); */
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
$('.data:gt(5)').hide().last().after();

$("#listadd").click(function() {
	var a = this;
	$('.data:not(:visible):lt(5)').fadeIn(function() {
		if ($('.data:not(:visible)').length == 0) {
			$(a).remove();
		}
	});
	return false;
});
</script>
</body>
</html>