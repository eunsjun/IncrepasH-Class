<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%-- 
	이 페이지는 게시판에 글을 쓰는 페이지이다.
--%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../css/w3.css">
<script type="text/javascript" src="../js/jquery.min.js"></script>
<style>
	.body {
		resize: none;
	}
	
	.mid {
		line-height: 0%;
	}
	
	img {
		height: 100%;
		width: auto;
	}
</style>
<script>
$(function(){
	var ln = 0;
	$('.p1').change(function(event){
		alert(ln);
		if(ln > 4){
			return;
		}
		var tmp = URL.createObjectURL(event.target.files[0]);
		$('.p1').append('<input type="file" class="w3-col w3-input w3-margin-top upfile" name="upfile" />');
		if(ln == 0){
			$('#pic').attr('src', tmp);
		}
		if(ln != 0 && ln <= 4){
			alert(ln);
			$('.p2').append('<img src='+ tmp +' />');
		}
			ln = ln + 1;
	});
	
	$('#submit').click(function(){
		// 정규식 검사를 실행하세요...
		
		$('#frm').submit();
	});
});
</script>
</head>
<body>
	<div class="w3-col m3"><p></p></div>
	<div class="w3-col m6">
		<h2 class="w3-pink w3-center w3-margin-top w3-margin-bottom w3-card-4 w3-round-large">H-Class 게시판 글쓰기</h2>
		<div class="w3-container w3-round-large w3-card-4">
			<form method="POST" action="../board/BoardWriteProc.class" id="frm" enctype="multipart/form-data" >
				<div class="w3-container w3-margin-top">
					<label for="id" class="w3-col m2 w3-label mid"><h4 class="w3-right w3-padding w3-text-gray">I D : </h4></label>
					<input class="w3-col m10 w3-input w3-padding" type="text" name="id" id="id" value="${SID}" readonly />
				</div>
				<div class="w3-container w3-margin-top">
					<label for="title" class="w3-col m2 w3-label mid"><h4 class="w3-right w3-padding w3-text-gray">제 목 : </h4></label>
					<input class="w3-col m10 w3-input w3-border" type="text" name="title" id="title" />
				</div>
				<div class="w3-container w3-margin-top">
					<div class="w3-col m2 w3-label mid"><h4 class="w3-right w3-padding w3-text-gray">첨 부 : </h4></div>
					<div class="w3-col m10 p1">
						<input class="w3-input w3-border upfile" type="file" name="upfile" />
					</div>
					<div class="w3-col m2"><p></p></div>
					<div class="w3-col m10 w3-container w3-center w3-margin-top p2" style="height:120px;">
						<img src="/WEB/img/noimage.jpg" id="pic" />
					</div>
				</div>
				<div class="w3-container w3-margin-top w3-margin-bottom">
					<label for="body" class="w3-col m2 w3-label mid"><h4 class="w3-right w3-padding w3-text-gray">본 문 : </h4></label>
					<textarea class="w3-col m10 w3-input w3-border body" cols="20" rows="8" name="body" id="body" ></textarea>
				</div>
			</form>
		</div>
		<div class="w3-row w3-content w3-margin-top">
			<button class="w3-cell w3-half w3-button w3-blue w3-hover-aqua" id="reset">reset</button>
			<button class="w3-cell w3-half w3-button w3-red w3-hover-amber" id="submit">submit</button>
		</div>
	</div>
</body>
</html>