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
	.tpmgn1 {
		margin-top: 1px;
	}
	.tpmgn5 {
		margin-top: 5px;
	}
	.flist {
		line-height: 10%;
	}
</style>
<script>
	/* var pno = ${DATA.pno};
	var nno = ${DATA.nno}; */
	var bno = ${DATA.NO};
	
	// ArrayList 크기를 구한다.
	// var llen = ${LIST.size()};
	//alert(llen);
	$(function(){
		/* 컨트롤러에서 처리하는 방법
		$('.fbtn').click(function(){
			var sName = $(this).attr('id');
			sName = sName.substring(1);
			//$(location).attr('href', '../img/'+sName);
			$('#sName').val(sName);
			$('#ffrm').submit();
		});
		*/
		
		// 뷰 수를 ajax로 엡데이트 해주고 href 속성으로 처리하는 방법
		$('.fbtn').click(function(){
			var sName = $(this).attr('id');
			sName = sName.substring(1);
			//$(location).attr('href', '../img/'+ sName);
			$.ajax({
				url:"./FiHit.class",
				type: "POST",
				dataType: 'text',
				data:{
					sName : sName
				},
				success:function(data){
					$(location).attr('href', '../img/'+ sName);
				},
				error: function(){
					alert("요청 실패!");
				}
			});
		});
		
		
		/* 
		$('#pre').click(function(){
			if(${DATA.pno ne 0}){
				$('#bno').val(pno);
			} else{
				alert('이전 글이 없습니다.');
				return;
			}
			
			$('#frm').attr('action', './BoardView.class');
			$('#frm').submit();
		});
		 */
		$('#brd').click(function(){
			$(location).attr('href', './BoardList.class');
		});
		/* 
		$('#nxt').click(function(){
			if(${DATA.nno ne 0}){
				$('#bno').val(nno);
			} else {
				alert('다음 글이 없습니다.');
				return;
			}
			$('#frm').attr('action', './BoardView.class');
			$('#frm').submit();
		});
		 */
		$('#del').click(function(){
			$('#bno').val(bno);
			$('#frm').attr('action', './BoardDel.class');
			$('#frm').submit();
		});
		
		$('#edit').click(function(){
			$('#no').val('${DATA.NO}');
			//alert('#bno : ' + ${DATA.NO});
			$('#frm').attr('action', './BoardEdit.class');
			$('#frm').submit();
		});
	});
</script>
</head>
<body>
	<form method="POST" id="frm">
		<input type="hidden" name="no" id="no" />
	</form>
	<form method="post" id="ffrm" action="./FiHit.class">
		<input type="hidden" name="sName" id="sName" />
	</form>
	
	<div class="w3-col m3"><p></p></div>
	<div class="w3-col m6 w3-container">
		<h2 class="w3-margin-top w3-padding w3-margin-bottom w3-center w3-round-large w3-card-4 w3-deep-purple">게시판 글 보기</h2>
		<div class="w3-row w3-container w3-round-large w3-card-4">
			<br>
			<div class="w3-col w3-content">
				<div class="w3-col m2"><h4 class="w3-center w3-text-gray">글 제 목 : </h4></div>
				<h4 class="w3-col m6 w3-text-gray" id="title">${DATA.TITLE}</h4>
				<c:if test="${DATA.ID eq SID}">
				<button class="w3-col m2 w3-button w3-small w3-red tpmgn5" id="del">삭제</button>
				<button class="w3-col m2 w3-button w3-small w3-blue tpmgn5" id="edit">수정</button>
				</c:if>
				<hr class="w3-col tpmgn1">
			</div>
			<div class="w3-col w3-content">
				<div class="w3-col m2"><h4 class="w3-center w3-text-gray">작 성 자 : </h4></div>
				<h4 class="w3-col m10 w3-text-gray" id="id">${DATA.ID }</h4>
				<hr class="w3-col tpmgn1">
			</div>
			<div class="w3-col w3-content">
				<div class="w3-col m2"><h4 class="w3-center w3-text-gray">작 성 일 : </h4></div>
				<h4 class="w3-col m10 w3-text-gray" id="date">${DATA.SDATE}</h4>
				<hr class="w3-col tpmgn1">
			</div>
			<c:if test="${not empty LIST}">
			<div class="w3-col w3-content">
				<div class="w3-col m2"><h4 class="w3-center w3-text-gray">첨부파일 : </h4></div>
				
				<!--  -->
				
				<div class="w3-col m10 w3-container">
				<ol>
				<c:forEach var="VO" items="${LIST}">
					<li class="w3-col">
					<div class="w3-col flist"> <!-- line-height: 10%; -->
						<div class="w3-content w3-col m9"><h6>${VO.oName}</h6></div>
						<div class="w3-col m3 w3-button w3-lime fbtn" id="f${VO.sName}">보기</div>
					</div>
					</li>
				</c:forEach>
				</ol>
				</div>
				
				<!--  -->
				<hr class="w3-col tpmgn1">
			</div>
			</c:if>
			<div class="w3-col w3-content">
				<div class="w3-col m2"><h4 class="w3-center w3-text-gray">글 본 문 : </h4></div>
				<h6 class="w3-col m10 w3-contatiner w3-text-gray">
					${DATA.REBODY}
				</h6>
				<hr class="w3-col tpmgn1">
			</div>
		</div>
		
		<div class="w3-row w3-content w3-margin-top w3-card-4">
			<div class="w3-col w3-third w3-button w3-yellow" id="pre"> << 이전글</div>
			<div class="w3-col w3-third w3-button w3-deep-purple" id="brd">목록보기</div>
			<div class="w3-col w3-third w3-button w3-blue" id="nxt"> 다음글  >> </div>
		</div>
	</div>
</body>
</html>