<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	response.setStatus(HttpServletResponse.SC_OK);
%>
<!-- 부트스트랩 -->
<%@include file="../inc/top.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>500 에러 메세지</title>
<style>
	
	.errorbox{
	background: #f1f1f1; 
	text-align: center; 
	border-radius: 10px; 
	padding:100px 0;
	}
	
	.home {
		text-align:right;
		margin-right:25%;
	}
</style>
</head>
<body>
<section class="section_padding">
   <div class="container">
   <div class="errorbox">
   	<h2 style="text-align: center; color:slategray;">페이지가 작동하지 않습니다.</h2>
   	<br>
   	<p style="text-align: left; margin-left:32%;">서비스 이용에 불편을 드려서 죄송합니다.<br>시스템 에러가 발생하여 페이지를 표시할 수 없습니다.</p>
   	<p style="text-align: left; margin-left:32%;">관리자에게 문의하시거나 잠시 후 다시 시도해주세요.</p>
	<br>
   <a href="<%=request.getContextPath() %>/index.jsp" class="mint_btn hover a_btn">Home으로 이동</a>
  </div>
</div>
   <!-- WEB-INF폴더 web.xml에서 에러코드별 페이지주소 수정가능 -->

</section>
<%@include file="../inc/bottom.jsp" %>
</body>
</html>