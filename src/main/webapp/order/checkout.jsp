<%@page import="model.AccountVO"%>
<%@page import="java.sql.SQLException"%>
<%@page import="model.AccountDAO"%>
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
<!-- DatePicker jQuery -->
<script type="text/javascript" src="../js/jquery-3.6.0.min.js"></script>
<script type="text/javascript" src="../js/jquery-ui.min.js"></script>
<script type="text/javascript">
	$(function(){
		$('#pickupDate').datepicker();
		
		$('#pickupDate').datepicker({
			changeYear:true,
			dayNamesMin:['일','월','화','수','목','금','토'],
 			monthNames:['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
			dateFormat:'yy-mm-dd'
		});
	});
</script>

<%
	String email = (String) session.getAttribute("email");
	String totalPrice = request.getParameter("totalPrice");
	System.out.println(totalPrice);
	String totalQty = request.getParameter("totalQty");
	System.out.println(totalQty);
	
	AccountDAO dao = new AccountDAO();
	AccountVO vo = null;
	try {
		vo = dao.selectAll(email);
	} catch (SQLException e) {
		e.printStackTrace();
	}
%>
<section class="section_padding">
	<div class="container">
		<div class="billing_details">
			<div class="row">
				<form class="row contact_form" action="checkout_ok.jsp"	method="post" novalidate="novalidate">
				<div class="row col-lg-8">
					<h3>주문정보입력</h3>
						<div class="col-md-12 form-group">
							<input type="text" class="form-control" id="email" name="email"
								value="<%=email%>" />
						</div>
						<div class="col-md-12 form-group">
							<input type="text" class="form-control" id="name" name="name"
								value="<%=vo.getName()%>" />
						</div>
						<div class="col-md-12 form-group">
							<input type="text" class="form-control" id="tel" name="tel"
								value="<%=vo.getTel()%>" />
						</div>
						<div class="col-md-12 form-group p_star">
							<label>지점선택</label> <select name="storeNo" class="country_select">
								<option value="1001">강남지점</option>
								<option value="1002">서초지점</option>
								<option value="1003">동작지점</option>
								<option value="1004">송파지점</option>
							</select>
						</div>
						<div class="col-md-12 form-group">
							<div class="creat_account">
								<input type="checkbox" id="f-option2" name="selector" /> <label
									for="f-option0">선택하신 지점정보를 확인하셨나요?</label>
							</div>
						</div>
						<div class="col-md-12 form-group">
							<span>수거날짜선택<input type="text" name ="pickupDate" id="pickupDate"></span>
						</div>
      	         	 </div>
				<div class="col-lg-4">
					<div class="order_box">
						<h2>Your Order</h2>
						<ul class="list list_2">
							<li><a href="#">총주문수량 <span><%=totalQty%></span>
							<input type="hidden" name="totalQty" value="<%=totalQty%>">
							</a></li>
						</ul>
						<ul class="list list_2">
							<li><a href="#">총주문금액 <span><%=totalPrice%></span>
							<input type="hidden" name="totalPrice" value="<%=totalPrice%>">
							</a></li>
						</ul>
						<div class="payment_item">
							<div class="radion_btn">
								<input type="radio" id="f-option1" name="selector" /> <label
									for="f-option1">신용카드</label>
								<div class="check"></div>
							</div>
						</div>
						<div class="payment_item">
							<div class="radion_btn">
								<input type="radio" id="f-option3" name="selector" />
								<label for="f-option3">카카오페이</label> 
								<div class="check"></div>
							</div>
						</div>
						<div class="reat_account">
							<span>주문정보를 확인하였습니다.</span> 
							<input type="checkbox" id="f-option4" name="selector" />
							<input type="submit" class="btn_3" value="결제하기">
						</div>
					</div>
				</div>
				</form>
			</div>
		</div>
	</div>

</section>


<%@ include file="../inc/bottom.jsp"%>