<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
	.valid {
		border: solid 2px green;
	}
	
	.validText {
		color: green;
	}
	
	.invalid {
		border: solid 2px red;
	}
	
	.invalidText {
		color: red;
	}
</style>
<meta charset="UTF-8">
<title>회원가입</title>
<script type="text/javascript" src="js/jquery-3.6.0.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript" src="js/daumPostCode.js"></script>
<script type="text/javascript">
 	$(function() {
 		make_select();
 		
 		$('#signinForm').submit(function() {
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
			target.next().removeClass('invalidText');
			target.next().addClass('validText');
			target.next().html('');
		}
		
		function changeInvalid(target) {
			target.removeClass('valid');
			target.addClass('invalid');
			target.next().removeClass('validText');
			target.next().addClass('invalidText');
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
<form id="signinForm" action="signup_ok.jsp" method="post">
	<input type="hidden" name="birth">
	<input id="email" type="text" name="email" placeholder="이메일"><p></p>
	<input id="name" type="text" name="name" placeholder="이름"><br>
	<select id="year" name="yy"></select>년
	<select id="month" name="mm"></select>월
	<select id="day" name="dd"></select>일<br>
	<input id="pw1" type="password" name="pw1" placeholder="비밀번호"><p></p>
	<input id="pw2" type="password" name="pw2" placeholder="비밀번호 확인"><p></p>
	<input id="nickname" type="text" name="nickname" placeholder="닉네임"><br> 
	
	
	<input id="sample6_postcode" type="text" name="postcode" placeholder="우편번호">
	<input type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기"><br>
	<input id="sample6_address" type="text" name="address_" placeholder="주소">
	<span id="guide" style="color:#999;display:none"></span>
	<input id="sample6_detailAddress" type="text" name="detailAddress" placeholder="상세주소"><br>
	<!-- <input id="sample6_extraAddress" type="text" id="extraAddress" placeholder="참고항목"><br> -->


	<input type="text" name="tel" placeholder="전화번호 ( - 생략)"><br>
	
	<input id="submit" type="submit" value="로그인">
</form>
</body>
</html>