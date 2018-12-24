<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../css/w3.css">
<script type="text/javascript" src="../js/jquery.min.js"></script>
<style>
	.rround {
		border-radius: 0 5px 5px 0;
	}
	.lround {
		border-radius: 5px 0 0 5px;
	}
	
	.mid {
		line-height: 100%;
	}
	
	.cls5 {
		width: 19%;
		margin-top: 13px;
	}
	
	.mgnt {
		margin-top: 0px;
	}
	
	.mgnb {
		margin-bottom: 0px;
	}
	
</style>

<script>
	$(document).ready(function(){
		var ssid = '${SID }';
		
		$('#btn').click(function(){
			$('#frm').attr('method', 'POST');
			$('#frm').attr('action', '/WEB/member/LoginProc.class');
			$('#frm').submit();
		});
		
		$('#join').click(function(){
			$(location).attr('href', '/WEB/member/joinView.class');
		});
		
		$("#btn2").click(function(){
			$(location).attr("href", "../board/BoardList.class");
		});
		
		$("#btn3").click(function(){
			$(location).attr("href", "/JSP_Lesson/pr2/survey/SurveyView.class");
		});
		$('#gbtn').click(function(){
			$(location).attr('href', '/JSP_Lesson/pr2/guest/GBoardListProc.class');
		});
		$('#mbtn').click(function(){
			$(location).attr('href', '/WEB/member/MemberEdit.class');
		});
		
		$('#mbtn2').click(function(){
			$(location).attr('href', '/WEB/member/Logout.class')
		});
	});
</script>
</head>
<body>
	<div class="w3-col m3" id="blk"><p></p></div>
	<div class="w3-col m6 w3-center w3-card-4 w3-round-large w3-margin-top w3-red mgnb"><h2>Login</h2></div>
	<c:if test="${empty SID }">
	<div class="w3-row hdn1">
		<div class="w3-col m3" id="blk"><p></p></div>
		<form name="frm" id="frm">
			<div class="w3-col m6 w3-center w3-card-4 w3-round-large w3-margin-top">
				<div class="w3-container w3-center w3-margin-top">
					<label class="w3-col m2 w3-label w3-center mid" for="id" ><h3 class="w3-text-grey">I D :</h3></label>
					<input class="w3-col m9 w3-border w3-input w3-light-grey" type="text" id="id" name="id" placeholder="아이디를 입력하세요!" required />
				</div>
				<div class="w3-container w3-center w3-margin-top">
					<label class="w3-col m2 w3-label w3-center mid" for="pw" ><h3 class="w3-text-grey">P W :</h3></label>
					<input class="w3-col m9 w3-border w3-input w3-light-grey" type="password" id="pw" name="pw" placeholder="비밀번호를 입력하세요!" required />
					<div class="w3-container"><p id="pexp">* 비밀번호를 입력하세요!</p></div>
				</div>
				<div class="w3-container w3-center w3-margin-top">
					<div class="w3-content w3-third w3-button w3-margin-bottom w3-border w3-border-blue w3-light-grey w3-hover-blue w3-card-2 lround" id="join">회원가입</div>
					<div class="w3-content w3-third w3-button w3-margin-bottom w3-border w3-border-amber w3-light-grey w3-hover-blue w3-card-2" id="gbtn">방명록보기</div>
					<div class="w3-content w3-third w3-button w3-margin-bottom w3-border w3-border-red w3-light-grey w3-hover-red w3-card-2 rround" id="btn">login</div>
				</div>
			</div>
		</form>
	</div>
	</c:if>
	<%-- 여기는 로그인이 된 회원이 보게될 폼 --%>
	<c:if test="${not empty SID }">
	<div class="w3-row hdn2 mgnt">
		<div class="w3-col m3" id="blk"><p></p></div>
		<div class="w3-col m6 w3-center">
			<div class="w3-margin-top">
				<div class="w3-content w3-button w3-margin-bottom w3-border w3-border-blue w3-light-grey w3-hover-blue w3-card-2 lround cls5" id="btn2">게시판보기</div>
				<div class="w3-content w3-button w3-margin-bottom w3-border w3-border-amber w3-light-grey w3-hover-amber w3-card-2 cls5" id="gbtn">방명록보기</div>
				<div class="w3-content w3-button w3-margin-bottom w3-border w3-border-pink w3-light-grey w3-hover-pink w3-card-2 cls5" id="mbtn">회원정보보기</div>
				<div class="w3-content w3-button w3-margin-bottom w3-border w3-border-pink w3-light-grey w3-hover-pink w3-card-2 cls5" id="mbtn2">로그아웃</div>
				<div class="w3-content w3-button w3-margin-bottom w3-border w3-border-red w3-light-grey w3-hover-red w3-card-2 rround cls5" id="btn3">설문참여하기</div>
			</div>
			<h2 class="w3-container w3-card-4 w3-round-large w3-margin-top w3-padding">${SID} 회원님은 이미 로그인 했습니다.</h2>
		</div>
	</div>
	</c:if>
	<!-- <div class="w3-col m3" id="blk"><p></p></div>
	<div class="w3-col m6 w3-center w3-margin-top">
	</div> -->
</body>
</html>