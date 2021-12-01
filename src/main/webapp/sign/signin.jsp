<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../inc/top.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
</head>
<body>
<section class="section_padding">
	<div class="container">
		<div class="mt20 w1200">
			<h2>회원가입</h2><br>
		    <form id="signinForm" action="signin_ok.jsp" method="post">
		        <div class="input_area">
		            <div class="p_title">
		                <label>이메일</label>
		            </div>
		            <div class="p_input">
		                <input id="email" type="email" name="email" class="t_input" placeholder="example@example.com" required="required"><span class="invalidText"></span>
		            </div>
		        </div>
		        <div class="input_area">
		            <div class="p_title">
		                <label>비밀번호</label>
		            </div>
		            <div class="p_input">
		                <input id="pw" type="password" name="pw" class="t_input" required="required"><span class="invalidText"></span>
		            </div>
		        </div>
		        <div class="btn_all t_center">
			        <button type="submit" class="mint_btn hover">로그인</button>
		   		</div>
		    </form>
		</div>	
	</div>
</section>
</body>
</html>
<%@ include file="../inc/bottom.jsp" %>