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


<style>
 .Withdrawal{}
 .gray_box{background: #f1f1f1; text-align: center; border-radius: 10px; padding:100px 0;}
 .wd_txt{font-size:24px; }
 .gray_box p{}
</style>
<%
request.setCharacterEncoding("utf-8");
String email = (String) session.getAttribute("email");

if (email == null) {
%>
<script type="text/javascript">
			alert('로그인이 필요합니다.');
			location.href="<%=request.getContextPath()%>/sign/signin.jsp";
</script>

<%
}
%>
<section class="section_padding">
	<div class="container">
		<div class="">
        <div class="Withdrawal">

            <p class="wd_txt t_center mb50">
               결제가<strong class="">완료되었습니다.</strong> 
            </p>
            <div class="gray_box">
                <p>
                    뽀송dream 서비스를 이용해주셔서 감사합니다.<br/>
                </p>
                <a href="<%=request.getContextPath()%>/index.jsp" class="mint_btn hover a_btn mt20">뽀송dream 첫화면</a>
                <a href="<%=request.getContextPath()%>/mypage/order_view.jsp" class="mint_btn hover a_btn mt20">주문내역확인</a>
            </div>
        </div>
    </div>
	</div>
</section>


<%@ include file="../inc/bottom.jsp"%>