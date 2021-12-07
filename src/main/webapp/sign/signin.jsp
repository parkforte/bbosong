<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../inc/top.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
<style type="text/css">
	#signin { width: 185px; border-radius: 7px; }
	
	#kakao { background: none; border: none; }
	
</style>
<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
<script>
    Kakao.init('28f1ff4d42e7380c65ecb41d603da956');
    console.log(Kakao.isInitialized());
    
    function kakaoLogin() {
        Kakao.Auth.login({
          success: function (response) {
            Kakao.API.request({
              url: '/v2/user/me',
              success: function (response) {
            	  console.log(response);
            	  console.log(response.properties);
            	  console.log(response.kakao_account);
            	  location.href = 'social_signin.jsp?id=' + response.id + '&name=' + response.properties.nickname;
              },
              fail: function (error) {
                console.log(error);
              },
            })
          },
          fail: function (error) {
            console.log(error);
          },
        })
      }
</script>
</head>
<body>
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
		                <input id="pw" type="password" name="pw" class="t_input" required="required"><span class="invalidText"></span>
		            </div>
		        </div>
		        <div class="btn_all t_center">
			        <button id="signin" type="submit" class="mint_btn hover">로그인</button>
		   		</div>
		   		<div class="btn_all t_center">
			        <button id="kakao" onclick="kakaoLogin();"><img src="../img/kakao_login_medium_narrow.png"></button>
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