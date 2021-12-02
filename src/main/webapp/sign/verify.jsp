<%@page import="ajax.SendVerifyMail"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../inc/top.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>이메일 인증</title>
<%
	String email = (String)session.getAttribute("email");
	if(email == null || email.isEmpty()) {%>
		<script type="text/javascript">
			alert('잘못된 접근입니다.');
			location.href = '<%=request.getContextPath()%>';
			/*
				이미 인증된 유저일 경우 해당 페이지 접근불가 처리 추가예정
			*/
		</script>
	<%}
	
	
%>
<link rel="stylesheet" href="../css/substyle.css">
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script type="text/javascript">
	$(function() {
		var verifyCode;
		
		$('#sendBtn').click(function() {
			var varEmail = "<%=email%>";
			console.log('Enter send()');
			var request = $.ajax({
				url: "<%=request.getContextPath() %>/SendVerifyMail", //통신할 url
				method: "POST",
				data: { email : varEmail }, //전송할 데이터
				dataType: "json"
			});
			
			request.done(function( data ) {
				verifyCode = data.result;
				if(verifyCode != null){
					document.getElementById('notice').innerHTML = varEmail + "로 인증메일을 전송했습니다.";
					
				} else{
					alert(data.result);
				}	
			});	 
			
			request.fail(function( jqXHR, textStatus ) {
			  alert( "Request failed: " + textStatus );
			});
		});
		
		$('#verifyBtn').click(function() {
			var input = $('#input');
			
			console.log('input.val(): ' + input.val());
			console.log('verifyCode: ' + verifyCode);
			
			if(input.val() == verifyCode) {
				alert('인증이 완료되었습니다!');
				
				var hiddenForm = $('<form></form>');
				
				hiddenForm.attr('method', 'post');
				console.log('<%=request.getContextPath()%>');
				hiddenForm.attr('action', '<%=request.getContextPath()%>/VerifyAccount');
				hiddenForm.append($('<input/>', {type:'hidden', name: 'verifyCode', value: verifyCode}));
				
				hiddenForm.appendTo('body');
				
				hiddenForm.submit();
			} else {
				alert('인증코드가 틀립니다.');
			}
		});
	});
</script>
</head>
<body>
<section class="section_padding">
	<div class="container">
		<h3>회원 인증</h3><br>
		<h3 id="notice"></h3>
		<div class="input_area">
            <div class="p_title">
                <label>인증코드</label>
            </div>
            <div class="p_input">
                <input id="input" type="text" name="inputCode" class="t_input">
                <button id="sendBtn" class="mint_btn hover">인증코드 전송</button>
            </div>
        </div>
        <div class="input_area">
            <div class="p_title">
                <label></label>
            </div>
            <div class="p_input">
            	<button id="verifyBtn" class="begie_btn hover">확인</button>
            </div>
        </div>
	</div>
</section>
</body>
</html>
<%@ include file="../inc/bottom.jsp" %>