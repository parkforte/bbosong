<%@page import="util.SendVerifyMail"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../inc/top.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>email_verify</title>
<link rel="stylesheet" href="../css/substyle.css">
<%
	String email = (String)session.getAttribute("email");
	System.out.println("session: " + email);
	if(email == null || email.isEmpty()) {%>
		<script type="text/javascript">
			alert('잘못된 접근입니다.');
			location.href('<%=request.getContextPath()%>');
		</script>
	<%}
	
	SendVerifyMail sendMail = new SendVerifyMail();
%>
<script type="text/javascript">
	function send() {
		<% 
			System.out.println("Enter send()");
			String verifyCode = sendMail.send(email);
			session.setAttribute("verifyCode", verifyCode);
		%>
		getElementById(notice).innelHTML = <%=email%>로 인증메일을 보냈습니다.
	}
	
	function verify() {
		System.out.println("Enter verify()");
		const input = document.getElementById('input');
		
		if(input.value === <%=(String)session.getAttribute("verifyCode")%> {
			alert('인증이 완료되었습니다!');
			location.href('<%=request.getContextPath()%>');
		} else {
			alert('인증코드가 틀립니다.');
			input.focus();
		}
	}
</script>
</head>
<body>
<section class="section_padding">
	<div class="container">
		<h3>회원 인증</h3><br>
		<h3 id="notice"><%=email %>로 인증코드를 전송했습니다</h3>
		<div class="input_area">
            <div class="p_title">
                <label>인증코드</label>
            </div>
            <div class="p_input">
                <input id="input" type="text" name="inputCode" class="t_input">
                <button class="mint_btn hover" onclick="send();">인증코드 전송</button>
            </div>
        </div>
        <div class="input_area">
            <div class="p_title">
                <label></label>
            </div>
            <div class="p_input">
            	<button class="begie_btn hover" onclick="verify();">확인</button>
            </div>
        </div>
	</div>
</section>
</body>
</html>
<%@ include file="../inc/bottom.jsp" %>