<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회원가입 페이지</title>
<link rel="stylesheet" href="/WEB/css/w3.css">
<script type="text/javascript" src="/WEB/js/jquery.min.js"></script>
<style>
 	#hdn1 {
		display: none;
	}
</style>
<script>
	$(function(){
		var chk = "N";
		$('#pw').focus(function(){
			var tpw = $(this).val();
			var pstat = $('#hdn1').css('display');
			if(!tpw && (pstat == 'none')){
				$('#hdn1').slideDown(500);
			}
			// 이후 기능은 여러분 몫...
			
		});
		
		$('#reset').click(function(){
			$('input').not(":radio").not("#idbtn").val('');
			$('textarea').val('');
			$(':checked').prop("checked", false);
		});
		
		$('#join').click(function(){
			// 정규식 검사는 반드시 해야한다. 왜?? 디비에 입력할 때 에러나니까... 반드시 하세요...
			//var elm = $(':required').val();
			/* for(var v in elm){
				alert('########### : ' + elm[v]);
				if(!elm[v]){
					alert('필수 입력항목을 확인하세요!');
					return;
				}
			} */
		 	/* if(chk == 'Y'){ */
				$('#frm').submit();
			/* } */
		});
		
		$('#chkpw').keyup(function(){
			var tpw = $('#pw').val();
			if(!tpw){
				alert('비밀번호가 입력되지 않았습니다.');
			}
			var rpw = $(this).val();
			if( tpw && (tpw == rpw) ){
				$('#chkmsg-pw').removeClass('w3-text-grey');
				$('#chkmsg-pw').removeClass('w3-text-red');
				$('#chkmsg-pw').addClass('w3-text-blue');
				$('#chkmsg-pw').html('* 비밀번호가 일치합니다! *');
				$('#hdn1').delay(500).slideUp(300);
			} else {
				$('#chkmsg-pw').removeClass('w3-text-grey');
				$('#chkmsg-pw').removeClass('w3-text-blue');
				$('#chkmsg-pw').addClass('w3-text-red');
				$('#chkmsg-pw').html('* 비밀번호를 확인하세요! *');
			}
		});
		
		$('#idbtn').click(function(){
			// 먼저 아이디 값을 알아낸다.
			var cid = $('#id').val();
			
			/* 해당 아이디를 가진 회원 인원수를 질의 명령으로 확인한다.
				이 페이지는 서버에서 보내준 페이지이고
				우리가 지금 처리하려는 명령은 클라이언트에서 페이지를 바꾸는 명령이다.
				만약 페이지의 내용을 다시 받는다면
				페이지의 처음부터 끝까지 모든 내용을 다시 받아서 처리를 해야 한다.
				그런데 우리는 메세지만 출력하는 태그 하나만 바꾸기를 원한다.
				이 경우 서버와의 동기화 처리는 하지 않고 비동기 방식으로 처리를 해야 한다.
				
				이 경우 ajax 통신을 많이 사용한다.
			*/
			$.ajax({
				url: '../member/IDCheck.class',
				type: 'POST',
				dataType: 'text',
				data: {
					id: cid
				},
				success: function(obj){
					if(obj == "0"){
						//alert('사용 가능한 아이디입니다.');
						// YES 가 나오는 경우는 질의 명령의 결과가 0 인 경우이고 
						// 그런 회원이 없다는 이야기 이므로 입력한 아이디를 사용할 수 있는 경우다.
						$('#chkmsg-id').removeClass('w3-text-grey');
						$('#chkmsg-id').removeClass('w3-text-red');
						$('#chkmsg-id').addClass('w3-text-blue');
						$('#chkmsg-id').html('*** 사용가능한 아이디 입니다. ***');
						chk = "Y";
					} else {
						// 이 경우는 회원이 존재하는 경우이므로 입력한 아이디를 사용할 수 없다.
						$('#chkmsg-id').removeClass('w3-text-grey');
						$('#chkmsg-id').removeClass('w3-text-blue');
						$('#chkmsg-id').addClass('w3-text-red');
						$('#chkmsg-id').html('### '+ cid + ' 아이디는 사용할 수 없는 아이디 입니다. ###');
						$('#id').val("");
					}
				}
			});
			
			alert('#### ' + chk);
		});
	});
</script>
</head>
<body>
	<div class="w3-col m3"><p></p></div>
	<div class="w3-col m6 w3-container w3-margin-top">
		<h2 class="w3-content w3-center w3-pink w3-round-large w3-card-2 w3-padding">회원가입</h2>
		<form method="POST" action="./joinProc.class" name="frm" id="frm" class="w3-content w3-margin-top w3-card-2 w3-round-large w3-padding">
			<div class="w3-row w3-margin-top">
				<label class="w3-col m3" for="name" ><h4 class="w3-content w3-center w3-text-grey">Name</h4></label>
				<input class="w3-col m9 w3-input w3-border w3-round-large w3-right" type="text" name="name" id="name" placeholder="이름을 입력하세요!" required />
			</div>
			<hr class="w3-border-light-blue">
			<div class="w3-row w3-margin-top">
				<label class="w3-col m3" for="id" ><h4 class="w3-content w3-center w3-text-grey">I D</h4></label>
				<div class="w3-col m9 w3-right">
					<input class="w3-col m9 w3-input w3-border w3-round-large" type="text" name="id" id="id" placeholder="아이디를 입력하세요!" required />
					<input class="w3-col m3 w3-button w3-border w3-round-large w3-blue w3-hover-aqua" type="button" name="idbtn" id="idbtn" value="check!" />
				</div>
				<p class="w3-content w3-col w3-center w3-text-grey" id="chkmsg-id">* 아이디 확인이 필요합니다. *</p>
			</div>
			<hr class="w3-border-light-blue">
			<div class="w3-row w3-margin-top">
				<label class="w3-col m3" for="pw" ><h4 class="w3-content w3-center w3-text-grey">비밀번호</h4></label>
				<input class="w3-col m9 w3-input w3-border w3-round-large w3-right" type="password" name="pw" id="pw" placeholder="비밀번호를 입력하세요!" required />
			</div>
			<div class="w3-row w3-margin-top" id="hdn1">
				<label class="w3-col m3" for="chkpw" ><h4 class="w3-content w3-center w3-text-grey">비밀번호확인</h4></label>
				<input class="w3-col m9 w3-input w3-border w3-round-large w3-right" type="password" name="chkpw" id="chkpw" placeholder="비밀번호를 재입력하세요!" required />
				<p class="w3-content w3-col w3-center w3-text-grey" id="chkmsg-pw">* 비밀번호 확인이 필요합니다. *</p>
			</div>
			<hr class="w3-border-light-blue">
			<div class="w3-row w3-margin-top">
				<label class="w3-col m3" for="mail" ><h4 class="w3-content w3-center w3-text-grey">E-Mail</h4></label>
				<input class="w3-col m9 w3-input w3-border w3-round-large w3-right" type="text" name="mail" id="mail" placeholder="e-mail을 입력하세요!" required />
			</div>
			<hr class="w3-border-light-blue">
			<div class="w3-row w3-margin-top">
				<label class="w3-col m3" for="birth" ><h4 class="w3-content w3-center w3-text-grey">생년월일</h4></label>
				<input class="w3-col m9 w3-input w3-border w3-round-large w3-right" type="text" name="birth" id="birth" placeholder="생년월일을 입력하세요! 예] 2000/12/12" required />
			</div>
			<hr class="w3-border-light-blue">
			<div class="w3-row w3-margin-top">
				<label class="w3-col m3" for="gen" ><h4 class="w3-content w3-center w3-text-grey">성 별</h4></label>
				<div class="w3-col m9">
					<div class="w3-col m1"><p></p></div>
					<div class="w3-col m5">
						<input class="w3-radio" type="radio" name="gen" value="M" required /> 남자
					</div>
					<div class="w3-col m5">
						<input class="w3-radio" type="radio" name="gen" value="W" required /> 여자
					</div>
				</div>
			</div>
			<hr class="w3-border-light-blue">
			<div class="w3-row w3-margin-top">
				<label class="w3-col m3" for="lang" ><h4 class="w3-content w3-center w3-text-grey">코딩언어</h4></label>
				<input class="w3-col m9 w3-input w3-border w3-round-large w3-right" type="text" name="lang" id="lang" placeholder="다루는 언어를 입력하세요! &nbsp;&nbsp;&nbsp;예] java,sql,javascript,jquery" required />
			</div>
			<hr class="w3-border-light-blue">
			<div class="w3-row w3-margin-top">
				<label class="w3-col m3" for="mgr" ><h4 class="w3-content w3-center w3-text-grey">스 승</h4></label>
				<input class="w3-col m9 w3-input w3-border w3-round-large w3-right" type="text" name="mgr" id="mgr" placeholder="선생님 이름을 입력하세요! &nbsp;&nbsp;&nbsp;예] 전은석" required />
			</div>
			<hr class="w3-border-light-blue">
			<div class="w3-row w3-margin-top">
				<label class="w3-col m3" for="msg" ><h4 class="w3-content w3-center w3-text-grey">가입동기</h4></label>
				<textarea class="w3-col m9 w3-input w3-border w3-round-large w3-right" cols="120" rows="7" name="msg" id="msg" placeholder="가입동기를 입력하세요!" style="resize: none;" required></textarea>
			</div>
			<hr class="w3-border-light-blue">
		</form>
		<div class="w3-content w3-col w3-half w3-button w3-blue w3-hover-aqua w3-margin-top" id="reset">reset</div>
		<div class="w3-content w3-col w3-half w3-button w3-orange w3-hover-red w3-margin-top" id="join">Join</div>
	</div>
	<div class="w3-container w3-col w3-margin-top"><p> </p></div>
</body>
</html>