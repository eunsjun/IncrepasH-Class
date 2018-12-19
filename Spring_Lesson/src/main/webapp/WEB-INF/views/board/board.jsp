<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<style>
	.btmargin {
		margin-bottom: 10px;
	}
	.btmargin_s {
		margin-bottom: 5px;
	}
	
	.brdr {
		border-right: 2px solid lightgrey;
	}
	
	.lrmgn {
		margin-left: 2px;
		margin-right: 2px;
	}
</style>

<script>
	$(document).ready(function(){
		var ssID = '${SID}';
		
		if(!ssID){
			// 세션에 아이디 없는 경우
		} else {
			// 세션에 아이디가 저장된 경우...
			alert('${SID} 님 로그인 했습니다.');
		}
		
		$("#btn1").click(function(){
			$(location).attr("href", "../member/Login.class");
		});
		$("#btn2").click(function(){
			$(location).attr("href", "#");
		});
		$("#btn3").click(function(){
			$(location).attr("href", "#");
		});
		$('#brdwrite').click(function(){
			$(location).attr('href', '/WEB/board/BoardWriteForm.class');
		});
		

		$('.bdata').click(function(){
			var sno = $(this).attr('id'); // f10003 ==> 10003
			sno = sno.substring(1);
			/*
			// GET 방식
			$(location).attr('href', '/JSP_Lesson/pr2/board/BoardView.class?bno='+sno+'&id='+id);
			// localhost/JSP_Lesson/pr2/board/BoardView.class?bno=10003&id=abcd
			*/
			$('#no').val(sno);
			/* 
			// 이전 글, 다음글 번호추출
			var pno = $(this).prev().attr('id');
			var nno = $(this).next().attr('id');
			if(pno){
				pno = pno.substring(1);
				$('#pno').val(pno);
			}
			if(nno){
				nno = nno.substring(1);
				$('#nno').val(nno);
			}
			 */
			$('#frm').submit();
		});
<%--		
		$('.page').click(function(){
			var str = $(this).html();
			var loc = './BoardList.class?nowPage=' + str;
			var spage = ${PAGE.startPage - 1};
			var epage = ${PAGE.endPage + 1};
			
				&gt;	- >
				&lt;	- <
			
			if(str == '&gt;&gt;'){
				loc = './BoardList.class?nowPage='+ epage;
			} else if(str == '&lt;&lt;'){
				loc = './BoardList.class?nowPage='+ spage;
			}
			$(location).attr('href', loc);
		});
		
		 --%>
		 <c:if test="${not empty SID}">
		 	$(".nanum").addClass("w3-quarter");
		 </c:if>
		 
		 <c:if test="${empty SID}">
		 	$(".nanum").addClass("w3-third");
		 </c:if>
	});
</script>
</head>
<body>
	<form method="POST" action="/WEB/board/BoardView.class" id="frm">
		<input type="hidden" name="no" id="no" />
		<input type="hidden" name="pno" id="pno" />
		<input type="hidden" name="nno" id="nno" />
	</form>
	
	<div class="w3-col m3"><p></p></div>
	<div class="w3-col m6 w3-container w3-margin-top w3-center">
		<div class="w3-row">
			<h2 class="w3-content w3-blue w3-card-4">H-Class Board</h2>
			<div class="w3-row w3-content w3-card-4 w3-margin-bottom">
				<div class="w3-cell w3-button w3-pink nanum" id="btn1">로그인 페이지</div>
				<c:if test="${not empty SID}">
				<div class="w3-cell w3-button w3-teal nanum" id="brdwrite">게시판 글쓰기</div>
				</c:if>
				<div class="w3-cell w3-button w3-blue nanum" id="btn2">설문조사 페이지</div>
				<div class="w3-cell w3-button w3-amber nanum" id="btn3">방명록 페이지</div>
			</div>
		</div>
		
		<div class="w3-row w3-container w3-round-large w3-card-4 w3-blue w3-border-blue btmargin_s">
			<div class="w3-content w3-col m2 brdr">글 번 호</div>
			<div class="w3-content w3-col m2 brdr">아 이 디</div>
			<div class="w3-content w3-col m4 brdr">글 제 목</div>
			<div class="w3-content w3-col m2 brdr">작 성 일</div>
			<div class="w3-content w3-col m2">조 회 수</div>
		</div>
		<c:if test="${empty LIST }">
			<div class="w3-row w3-container w3-round-large w3-card-4 w3-border-blue btmargin">
				<div class="w3-content w3-center">
					<h3>글이 존재하지 않습니다.</h3>
				</div>
			</div>
		</c:if>
		<c:if test="${not empty LIST}">
			<c:forEach var="data" items="${LIST}">
			<%-- <c:if test="${data.rno >= (PAGE.nowPage * PAGE.pageRow - 2) and data.rno <= (PAGE.nowPage * PAGE.pageRow) }"> --%>
			<div class="w3-row w3-container w3-round-large w3-card-4 w3-border-blue btmargin bdata" id="f${data.no}">
				<div class="w3-content w3-col m2 brdr" >${data.no}</div>
				<div class="w3-content w3-col m2 brdr">${data.id}</div>
				<div class="w3-content w3-col m4 brdr">${data.title}</div>
				<div class="w3-content w3-col m2 brdr">${data.sDate}</div>
				<div class="w3-content w3-col m2">${data.hit}</div>
			</div>
			<%-- </c:if> --%>
			</c:forEach>
		</c:if>
		
		<form method="POST" action="./BoardSearch.class" id="sfrm" class="w3-row w3-container w3-padding w3-card-4">
			<label for="srch" class="w3-label w3-col m3"><h4>아이디 검색 : </h4></label>
			<input type="text" class="w3-input w3-col m7" name="bid" id="bid" />
			<input type="submit" class="w3-col m2 w3-button w3-orange w3-hover-pink" value="search" /> 
		</form>
		<br>
<!--
		<div class="w3-content w3-center">
			
			<%-- 이전 페이지가 없는 경우 --%>
			<c:if test="${PAGE.startPage eq 1 }">
				<div class="w3-bar w3-button w3-tiny w3-center w3-gray w3-padding w3-card-2 lrmgn"><<</div>
			</c:if>
			
			<%-- 이전 페이지가 있는 경우 이전 페이지가기 링크 --%>
			<c:if test="${PAGE.startPage ne 1 }">
				<div class="w3-bar w3-button w3-tiny w3-center w3-blue w3-padding w3-card-2 lrmgn page"><<</div>
			</c:if>
			
			<%-- 이제 시작페이지 부터 마지막페이지까지 반복해서 만들면 된다. --%>
			<c:forEach var="page" begin="${PAGE.startPage}" end="${PAGE.endPage}">
				<div class="w3-bar w3-button w3-tiny w3-center w3-blue w3-padding w3-card-2 lrmgn page">${page}</div>
			</c:forEach>
			
			<%-- 다음 페이지가 없는 경우 --%>
			<c:if test="${PAGE.endPage eq PAGE.totalPage}">
				<div class="w3-bar w3-button w3-tiny w3-center w3-gray w3-padding w3-card-2">>></div>
			</c:if>
			
			<%-- 이전 페이지가 있는 경우 이전 페이지가기 링크 --%>
			<c:if test="${PAGE.endPage ne PAGE.totalPage}">
				<div class="w3-bar w3-button w3-tiny w3-center w3-blue w3-padding w3-card-2 page">>></div>
			</c:if>

		</div>
-->
	</div>
</body>
</html>