<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../inc/top.jsp" %>

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

.container{
	text-align: center;
}


</style>

<section class="section_padding">
   <div class="container">
   
   <div class="col-lg-12">
					<div class="order_box">
						<h2>Your Order</h2>
						<ul class="list list_2">
							<li><a href="#">주문번호 <span></span>
							<input type="hidden" name="totalQty" value="">
							</a></li>
						</ul>
						<ul class="list list_2">
							<li><a href="#">이름 <span></span>
							<input type="hidden" name="totalQty" value="">
							</a></li>
						</ul>
						<ul class="list list_2">
							<li><a href="#">주소 <span></span>
							<input type="hidden" name="totalQty" value="">
							</a></li>
						</ul>
						<ul class="list list_2">
							<li><a href="#">총주문수량 <span></span>
							<input type="hidden" name="totalQty" value="">
							</a></li>
						</ul>
						<ul class="list list_2">
							<li><a href="#">총주문금액 <span></span>
							<input type="hidden" name="totalPrice" value="">
							</a></li>
						</ul>
						<div class="reat_account">
							<input type="submit" class="btn_3" value="메뉴리스트">
							<input type="submit" class="btn_3" value="주문내역확인">
						</div>
					</div>
				</div>
				
   
   </div>
</section>


<%@ include file="../inc/bottom.jsp" %>