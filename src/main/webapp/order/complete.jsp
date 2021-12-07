<%@page import="java.sql.SQLException"%>
<%@page import="model.OrderVO"%>
<%@page import="model.CartDAO"%>
<%@page import="model.OrderDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../inc/top.jsp"%>

<!-- CSS here -->
<link rel="stylesheet" href="../assets/css/bootstrap.min.css">
<link rel="stylesheet" href="../assets/css/owl.carousel.min.css">
<link rel="stylesheet" href="../assets/css/flaticon.css">
<link rel="stylesheet" href="../assets/css/slicknav.css">
<link rel="stylesheet" href="../assets/css/animate.min.css">
<link rel="stylesheet" href="../assets/css/magnific-popup.css">
<link rel="stylesheet" href="../assets/css/fontawesome-all.min.css">
<link rel="stylesheet" href="../assets/css/themify-icons.css">
<link rel="stylesheet" href="../assets/css/slick.css">
<link rel="stylesheet" href="../assets/css/nice-select.css">
<link rel="stylesheet" href="../assets/css/style.css">

<style>
.container {
	text-align: center;
}

section {
	height: 880px;
	position: relative;
	overflow: hidden;
	background-image: url('../img/laundry-gd.jpg');
	background-repeat: no-repeat;
	background-size: cover;
	background-position: center;
	z-index: 1;
}

.orderbox {
	border-radius: 10px;
}
</style>
<%
request.setCharacterEncoding("utf-8");
String email = (String) session.getAttribute("email");

if (email == null) {
%>
<script type="text/javascript">
			alert('로그인이 필요합니다.');
			location.href="<%=request.getContextPath()%>
	/sign/signin.jsp";
</script>

<%
}
%>
<section class="section_padding">
	<div class="container">
		<br>
		<div class="col-lg-12">
			<div class="order_box orderbox">
				<h2>결제가 완료되었습니다.</h2>
			<div class="reat_account">
				<div class="btn_all">
					<br> <a href="menuList.jsp"><button class="mint_btn hover">메뉴목록</button></a>
					<a href="<%=request.getContextPath()%>/mypage/order_view.jsp"><button
							class="begie_btn hover">주문내역</button></a>
				</div>
			</div>
			</div>
			<br>
		</div>
	</div>

</section>


<%@ include file="../inc/bottom.jsp"%>