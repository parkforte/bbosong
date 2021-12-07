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
<title>404 에러 메세지</title>
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
   	<h2 style="text-align: center; color:slategray;">요청하신 페이지를 <span style="color:#ff7e5f">찾을수가 없습니다.</span></h2>
   	<br>
   	<p style="text-align: left; margin-left:28%;">방문을 원하시는 페이지 주소가 입력되었거나, <br>변경 혹은 삭제되어 요청하신 페이지를 찾을 수가 없습니다.</p>
   	<p style="text-align: left; margin-left:28%;">입력하신 페이지 주소가 정확한지 다시 한번 확인해 주시기 바랍니다.</p>
	<br>
   <a href="<%=request.getContextPath() %>/index.jsp" class="mint_btn hover a_btn">Home으로 이동</a>
  </div>
</div>
   <!-- WEB-INF폴더 web.xml에서 에러코드별 페이지주소 수정가능 -->

</section>
<%@include file="../inc/bottom.jsp" %>
</body>
</html>