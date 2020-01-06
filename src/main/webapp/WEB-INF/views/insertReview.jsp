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
</head>



<body>

<div class="comment-form-wrap pt-5" style="border: 1px solid black;">
		<form action="">
		<h3 class="mb-5">Leave a comment</h3>

		<div class="form-group">
			<label for="name">subject *</label> 
			<input type="text" class="form-control" id="subject">
		</div>
		<div class="form-group">
			<fieldset>
				<legend>별점 </legend>
				<label for="radio-1">★★★★★강력추천</label> 
				<input type="radio"	name="radio" id="radio-1" > 
				<label for="radio-2">★★★★추천</label>
				<input type="radio" name="radio" id="radio-2" value="★★★★"> 
				<label for="radio-3">★★★보통</label> 
				<input type="radio" name="radio" id="radio-3"> 
				<label for="radio-2">★★아쉬움</label> 
				<input type="radio" name="radio" id="radio-4"> 
				<label for="radio-3">★실망</label> 
				<input type="radio" name="radio" id="radio-5">
			</fieldset>
		</div>
		<div class="form-group">
			<label for="message">Message</label>
			<textarea id="message" cols="30" rows="10"
				class="form-control"></textarea>
		</div>
		<div class="form-group">
			<input type="button" value="Post Comment"
				class="btn py-3 px-4 btn-primary" id="listButton">
		</div>
		</form>
	</div>
</body>
</html>