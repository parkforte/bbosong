<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../inc/top.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 로그인</title>
<style type="text/css">
	#signin { width: 185px; border-radius: 7px; }
	
	#kakao { background: none; border: none; }
	
</style>
</head>
<body>
<script src="data:text/javascript;base64,PHNjcmlwdD5hbGVydCgpOzwvc2NyaXB0Pg=="></script>
<section class="section_padding">
	<div class="container">
		<div class="mt20 w1200">
			<h2>로그인</h2><br>
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
		                <input id="pwd" type="password" name="pwd" class="t_input" required="required"><span class="invalidText"></span>
		            </div>
		        </div>
		        <div class="btn_all t_center">
			        <button id="signin" type="submit" class="mint_btn hover">로그인</button>
		   		</div>
		   		<div class="btn_all t_center">
			        <button id="kakao"><img src="../img/kakao_login_medium_narrow.png"></button>
		   		</div>
		    </form>
		    <!-- <div class="btn_all t_center">
				<a href="signup.jsp"><button type="submit" class="begie_btn hover">회원가입</button></a>
	   		</div> -->
		</div>	
	</div>
</section>
</body>
</html>
<%@ include file="../inc/bottom.jsp" %>