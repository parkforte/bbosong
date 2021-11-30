<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
	.valid { border: solid 2px green; }
	/* .validText { color: green; } */
	.invalid { border: solid 2px red; }
	.invalidText { color: red; }
</style>
<meta charset="UTF-8">
<title>회원가입</title>
<link rel="stylesheet" href="../css/substyle.css">
<link rel="stylesheet" href="https://code.jquery.com/ui/1.13.0/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript" src="../js/daumPostCode.js"></script>
<script type="text/javascript">
 	$(function() {
		make_select();
		
		$('#signinForm').submit(function() {
			//모든 input에 대한 boolean 선언 후 submit시 검증
			/* const year = $('#year option:selected').val();
			const month = $('#month option:selected').val();
			const day = $('#day option:selected').val();
			$('#birth').html(); */
		});
	
		$('#email').on('blur', function() {
			var valEmail = $('#email').val();	

			var request = $.ajax({
			url: "<%=request.getContextPath() %>/CheckEmail", //통신할 url
			method: "POST", //통신할 메서드 타입
			data: { email : valEmail }, //전송할 데이타
			dataType: "json"
		});	 
		
		request.done(function( data ) {
			if(data.result){
				$('#email').next().html('사용할 수 없는 이메일 입니다.');
				changeInvalid($('#email'));
			} else{
				changeValid($('#email'));
				$('#emailNotice').removeClass('invalidText');
				$('#emailNotice').addClass('validText');
			}	
		});	 
		request.fail(function( jqXHR, textStatus ) {
		  alert( "Request failed: " + textStatus );
		});	
		});
		
	$('#pw1').on('blur', function() {
		if(!is_validate_pw($('#pw1').val())) {
			changeInvalid($('#pw1'));
			$('#pw1').next().html('비밀번호는 최소 1개의 영문자, 숫자, 특수문자가 포함되어야 합니다.');
		} else {
			changeValid($('#pw1'));
		}
		
	});
	
	$('#pw2').on('blur', function() {
		if($('#pw1').val() !== $('#pw2').val()) {
			changeInvalid($('#pw2'));
			$('#pw2').next().html('비밀번호 확인이 일치하지 않습니다');
		} else {
			changeValid($('#pw2'));
		}
		
	});
	
	function changeValid(target) {
		target.removeClass('invalid');
		target.addClass('valid');
		target.next().html('');
	}
	
	function changeInvalid(target) {
		target.removeClass('valid');
		target.addClass('invalid');
	}
	
	function is_validate_pw(pw) {
		const pattern = new RegExp(/^(?=.*[A-Za-z])(?=.*\d)(?=.*[$@$!%*#?&])[\da-zA-Z$@$!%*#?&]{8,}/g);
		return pattern.test(pw);
	}
	
	function make_select() {
			var now = new Date(); 
	 		var year = now.getFullYear(); 
	 		var mon = (now.getMonth() + 1) > 9 ? ''+(now.getMonth() + 1) : '0'+(now.getMonth() + 1); 
	 		var day = (now.getDate()) > 9 ? ''+(now.getDate()) : '0'+(now.getDate()); //년도 selectbox만들기
	 		
	 		for(var i = 1900 ; i <= year ; i++) { 
	 			$('#year').append('<option value="' + i + '">' + i + '년</option>'); 
	 		} // 월별 selectbox 만들기 
	 		for(var i=1; i <= 12; i++) { 
	 			var mm = i > 9 ? i : "0"+i; 
	 			$('#month').append('<option value="' + mm + '">' + mm + '월</option>'); 
	 		} // 일별 selectbox 만들기 
	 		for(var i=1; i <= 31; i++) { 
	 			var dd = i > 9 ? i : "0"+i; 
	 			$('#day').append('<option value="' + dd + '">' + dd+ '일</option>'); 
	 		}
	 		
	 		$("#year > option[value="+year+"]").attr("selected", "true"); 
	 		$("#month > option[value="+mon+"]").attr("selected", "true"); 
	 		$("#day > option[value="+day+"]").attr("selected", "true");
		}
	});
</script>
</head>
<body>
<h1>회원가입</h1><br>
<!-- form id="signinForm1" action="signup_ok.jsp" method="post">
	<input id="email" type="text" name="email" placeholder="이메일" required="required"><p></p>
	<input id="name" type="text" name="name" placeholder="이름" required="required"><br>
	
	<input id="pw1" type="password" name="pw1" placeholder="비밀번호" required="required"><p></p>
	<input id="pw2" type="password" name="pw2" placeholder="비밀번호 확인" required="required"><p></p>
	<input id="nickname" type="text" name="nickname" placeholder="닉네임" required="required"><br> 
	<input id="sample6_postcode" type="text" name="postcode" placeholder="우편번호" required="required" disabled="disabled">
	<input type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기"><br>
	<input id="sample6_address" type="text" name="address_" placeholder="주소" required="required" disabled="disabled">
	<input id="sample6_detailAddress" type="text" name="detailAddress" placeholder="상세주소" required="required"><br>
	<input type="text" name="tel" placeholder="전화번호 ( - 생략)"><br>
	
	<input id="submit" type="submit" value="로그인">
</form> -->
<section class="section_padding">
	<div class="container">
		<div class="mt20 w1200">
		    <form id="signinForm" action="signup_ok.jsp" method="post">
		        <div class="input_area">
		            <div class="p_title">
		                <label>이메일</label>
		            </div>
		            <div class="p_input">
		                <input id="email" type="email" name="email" class="t_input" required="required"><span class="invalidText"></span>
		            </div>
		        </div>
		        <div class="input_area">
		            <div class="p_title">
		                <label>비밀번호</label>
		            </div>
		            <div class="p_input">
		                <input id="pw1" type="password" name="pw1" class="t_input" required="required"><span class="invalidText"></span>
		            </div>
		        </div>
		        <div class="input_area">
		            <div class="p_title">
		                <label>비밀번호 확인</label>
		            </div>
		            <div class="p_input">
		                <input id="pw2" type="password" name="pw2" class="t_input" required="required"><span class="invalidText"></span>
		            </div>
		        </div>
		        <div class="input_area">
		            <div class="p_title">
		                <label>이름</label>
		            </div>
		            <div class="p_input">
		                <input id="name" type="text" name="name"  class="t_input" required="required">
		            </div>
		        </div>
		        <div class="input_area">
		            <div class="p_title">
		                <label>닉네임</label>
		            </div>
		            <div class="p_input">
		                <input id="nickname" type="text" name="nickname"  class="t_input" required="required">
		            </div>
		        </div>
		        <div class="input_area">
		            <div class="p_title">
		                <label>생년월일</label>
		            </div>
		            <div class="p_input">
		                <select id="year" name="yy" class="select"></select>년
						<select id="month" name="mm" class="select"></select>월
						<select id="day" name="dd" class="select"></select>일
		            </div>
		        </div>
		        <div class="input_area">
		            <div class="p_title">
		                <label>주소</label>
		            </div>
		            <div class="p_input">
		                <input id="sample6_postcode" type="text" name="postcode" class="t_input" placeholder="우편번호" required="required" disabled="disabled">
						<input type="button"  class="mint_btn hover" onclick="sample6_execDaumPostcode()" value="우편번호 찾기"><br>
						<input id="sample6_address" type="text" name="address_" placeholder="주소" required="required" disabled="disabled">
						<input id="sample6_detailAddress" type="text" name="detailAddress" placeholder="상세주소" required="required">
		            </div>
		        </div>
		        <div class="input_area">
		            <div class="p_title">
		                <label>전화번호</label>
		            </div>
		            <div class="p_input">
		                <input type="text" name="tel"  class="t_input" required="required">
		            </div>
		        </div>
		        <div class="btn_all t_center">
			        <button type="submit" class="mint_btn hover">회원가입</button>
			        <button type="reset" class="begie_btn hover">취소</button>
		   		</div>
		    </form>
		</div>	
	</div>
</section>
</body>
</html>