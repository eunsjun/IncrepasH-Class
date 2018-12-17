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
		});
		
		$('#cancel').click(function(){
			$('input').not(":radio").not("#idbtn").val('');
			$('textarea').val('');
			$(':checked').prop("checked", false);
		});
		
		$('#edit').click(function(){
			// 수정기능은 비밀번호, 메일, 프로그래밍능력 을 수정하는 기능이다.
			// 만약 위의 세가지 중 아무것도 수정이 안된다면 수정기능이 작동하면 안된다.
			var spw = $('#pw').val();
			var rpw = $('#chkpw').val();
			var smail = $('#mail').val();
			var slang = $('#lang').val();
			if( !spw && (smail == '${VO.mail}') && (slang == '${VO.lang}')){
				alert('@ 변경정보가 없습니다.');
				return;
			}
			
			// 여기로 넘어왔다는 이야기는 
			// 셋중 하나는 입력됬다는 소리이므로 
			// 입력된 것은 처리해줘야 한다.
			// 비밀 번호는 입력태그가 두개가 있으니 만약 입력이 안됬거나 다른경우는 역시 처리해야겠다.
			if(spw != rpw){
				alert('비밀번호를 동일하게 입력하세요!');
				return;
			} else if(!spw){
				$('#pw').attr('disable', true);
				$('#chkpw').attr('disable', true);
			}
			
			if(smail == '${VO.mail}'){
				$('#mail').attr('disable', true);
			}
			
			if(slang == '${VO.lang}'){
				$('#lang').attr('disable', true);
			}
			
			$('#frm').submit();
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
		
		$('#pwedit').click(function(){
			var spw = $('#pw').val();
			if(!spw || (spw != $('#chkpw').val())){
				return;
			}
			$.ajax({
				url: "/JSP_Lesson/MemberEditProc.edit",
				type: "post",
				dataType: "text",
				data:{
					pw: spw,
					btn: "ipw"
				},
				success: function(data){
					alert('# 수정했습니다.');
					$('#pw, #chkpw').val("");
				},
				error: function(){
					alert('# 수정에 실패했습니다.');
				}
			});
		});
		$('#mailedit').click(function(){
			var smail = $('#mail').val();
			if(!smail || smail == '${VO.mail}'){
				return;
			}
			$.ajax({
				url: "/JSP_Lesson/MemberEditProc.edit",
				type: "post",
				dataType: "text",
				data:{
					mail: smail,
					btn: "imail"
				},
				success: function(data){
					alert('# 수정했습니다.');
				},
				error: function(){
					alert('# 수정에 실패했습니다.');
				}
			});
			
		});
		
		$('#langedit').click(function(){
			var smail = $('#mail').val();
			if(!smail || smail == '${VO.mail}'){
				return;
			}
			$.ajax({
				url: "/JSP_Lesson/MemberEditProc.edit",
				type: "post",
				dataType: "text",
				data:{
					mail: smail,
					btn: "imail"
				},
				success: function(data){
					alert('# 수정했습니다.');
				},
				error: function(){
					alert('# 수정에 실패했습니다.');
				}
			});
			
		});
	});
</script>
</head>

<body>
	<div class="w3-col m3"><p></p></div>
	<div class="w3-col m6 w3-container w3-margin-top">
		<h2 class="w3-content w3-center w3-pink w3-round-large w3-card-2 w3-padding">회원가입</h2>
		<form method="POST" action="/pr2/member/MemberEditProc.class" name="frm" id="frm" class="w3-content w3-margin-top w3-card-2 w3-round-large w3-padding">
			<div class="w3-row w3-margin-top">
				<label class="w3-col m3" for="name" ><h4 class="w3-content w3-center w3-text-grey">Name </h4></label>
				<div class="w3-col m9" id="name">${VO.name}</div>
			</div>
			<hr class="w3-border-light-blue">
			<div class="w3-row w3-margin-top">
				<label class="w3-col m3" for="id" ><h4 class="w3-content w3-center w3-text-grey">I D </h4></label>
				<div class="w3-col m9">${VO.id}</div>
			</div>
			<hr class="w3-border-light-blue">
			<div class="w3-row w3-margin-top">
				<label class="w3-col m3" for="pw" ><h4 class="w3-content w3-center w3-text-grey">비밀번호 </h4></label>
				<div class="w3-col m9">
					<input class="w3-col m9 w3-input w3-border w3-round-large" type="password" name="pw" id="pw" placeholder="수정하려면 비밀번호를 입력하세요!" />
					<input class="w3-col m3 w3-button w3-border w3-round-large w3-blue w3-hover-aqua" type="button" id="pwedit" value="edit" />
				</div>
			</div>
			<div class="w3-row w3-margin-top" id="hdn1">
				<label class="w3-col m3" for="chkpw" ><h4 class="w3-content w3-center w3-text-grey">비밀번호확인 </h4></label>
				<div class="w3-col m9">
					<input class="w3-col m9 w3-input w3-border w3-round-large" type="password" name="chkpw" id="chkpw" placeholder="비밀번호를 재입력하세요!" />
					<div class="w3-col m3"><p></p></div>
				</div>
				<p class="w3-content w3-col w3-center w3-text-grey" id="chkmsg-pw">* 비밀번호 확인이 필요합니다. *</p>
			</div>
			<hr class="w3-border-light-blue">
			<div class="w3-row w3-margin-top">
				<label class="w3-col m3" for="mail" ><h4 class="w3-content w3-center w3-text-grey">E-Mail </h4></label>
				<div class="w3-col m9">
					<input class="w3-col m9 w3-input w3-border w3-round-large" type="text" name="mail" id="mail" value="${VO.mail}"/>
					<input class="w3-col m3 w3-button w3-border w3-round-large w3-blue w3-hover-aqua" type="button" id="mailedit" value="edit" />
				</div>
			</div>
			<hr class="w3-border-light-blue">
			<div class="w3-row w3-margin-top">
				<label class="w3-col m3" for="birth" ><h4 class="w3-content w3-center w3-text-grey">생년월일 </h4></label>
				<div class="w3-col m9" id="birth">${VO.birth}</div>
			</div>
			<hr class="w3-border-light-blue">
			<div class="w3-row w3-margin-top">
				<label class="w3-col m3" for="gen" ><h4 class="w3-content w3-center w3-text-grey">성 별 </h4></label>
				<div class="w3-col m9">${VO.gen}</div>
			</div>
			<hr class="w3-border-light-blue">
			<div class="w3-row w3-margin-top">
				<label class="w3-col m3" for="lang" ><h4 class="w3-content w3-center w3-text-grey">코딩언어 </h4></label>
				<div class="w3-col m9">
					<input class="w3-col m9 w3-input w3-border w3-round-large" type="text" name="lang" id="lang" value="${VO.lang }" />
					<input class="w3-col m3 w3-button w3-border w3-round-large w3-blue w3-hover-aqua" type="button" id="langedit" value="edit" />
				</div>
			</div>
			<hr class="w3-border-light-blue">
			<div class="w3-row w3-margin-top">
				<label class="w3-col m3" for="mgr" ><h4 class="w3-content w3-center w3-text-grey">스 승 </h4></label>
				<div class="w3-col m9" id="mgr">${VO.mgr}</div>
			</div>
			<hr class="w3-border-light-blue">
			<div class="w3-row w3-margin-top">
				<label class="w3-col m3" for="msg" ><h4 class="w3-content w3-center w3-text-grey">가입동기 </h4></label>
				<div class="w3-col m9" id="msg">${VO.msg}</div>
			</div>
			<hr class="w3-border-light-blue">
		</form>
		<div class="w3-content w3-col w3-half w3-button w3-blue w3-hover-aqua w3-margin-top" id="cancel">cancel</div>
		<div class="w3-content w3-col w3-half w3-button w3-orange w3-hover-red w3-margin-top" id="edit">edit</div>
	</div>
	<div class="w3-container w3-col w3-margin-top"><p> </p></div>
</body>
</html>