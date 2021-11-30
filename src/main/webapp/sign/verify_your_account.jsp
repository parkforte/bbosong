<%@page import="util.SendVerifyMail"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>email_verify</title>
<link rel="stylesheet" href="../css/substyle.css">
<%
	String email = (String)session.getAttribute("email");
	SendVerifyMail sendMail = new SendVerifyMail();
	String verifyCode = sendMail.send(email);
	session.setAttribute("verifyCode", verifyCode);
%>
<script type="text/javascript">
	function send() {
		<%
			
		%>
	}
</script>
</head>
<body>
<section class="section_padding">
	<div class="container">
		<h3><%=email %>로 인증코드를 전송했습니다</h3>
		<form action="/VerifyAccount" method="post">
			<div class="input_area">
	            <div class="p_title">
	                <label>인증코드</label>
	            </div>
	            <div class="p_input">
	                <input type="text" name="inputCode" class="t_input" required="required">
	                <button class="mint_btn hover" onclick="send();">인증코드 재전송</button>
	            </div>
	        </div>
	        <button type="submit" class="mint_btn hover">인증하기</button>
		</form>
	</div>
</section>
</body>
</html>