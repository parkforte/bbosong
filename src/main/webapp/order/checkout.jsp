<%@page import="model.MyCouponVO"%>
<%@page import="java.util.List"%>
<%@page import="model.MyCouponDAO"%>
<%@page import="common.MypageUtil"%>
<%@page import="util.OrderUtil"%>
<%@page import="model.AccountVO"%>
<%@page import="java.sql.SQLException"%>
<%@page import="model.AccountDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../inc/top.jsp"%>
<!-- DatePicker jQuery -->
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script type="text/javascript">
	$(function() {
		make_select();
		function make_select() {
			var now = new Date(); 
				var year = now.getFullYear(); 
				var mon = (now.getMonth() + 1) > 9 ? ''+(now.getMonth() + 1) : '0'+(now.getMonth() + 1); 
				var day = (now.getDate()) > 9 ? ''+(now.getDate()) : '0'+(now.getDate()); //년도 selectbox만들기
				
				for(var i = 1900 ; i <= year ; i++) { 
					$('#year').append('<option value="' + i + '">' + i + '년</option>'); 
				} // 월별 selectbox 만들기 
				for(var i=1; i <= 12; i++) { 
					var mm = i > 9 ? i : "0"+i; 
					$('#month').append('<option value="' + mm + '">' + mm + '월</option>'); 
				} // 일별 selectbox 만들기 
				for(var i=1; i <= 31; i++) { 
					var dd = i > 9 ? i : "0"+i; 
					$('#day').append('<option value="' + dd + '">' + dd+ '일</option>'); 
				}
				
				$("#year > option[value="+year+"]").attr("selected", "true"); 
				$("#month > option[value="+mon+"]").attr("selected", "true"); 
				$("#day > option[value="+day+"]").attr("selected", "true");
		}
	});
</script>
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

<!-- newStyle css -->
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/newStyle.css">
<!-- subStyle css -->
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/substyle.css">


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
	
	<%
	String TotalPrice = request.getParameter("totalPrice");
	System.out.println(TotalPrice);
	
	//결제금액
	int totalPrice = Integer.parseInt(TotalPrice);
	int discountPrice = (int) (totalPrice * OrderUtil.DISCOUNT_RATE);
	int realPrice = (int) (totalPrice - discountPrice);
	
	String TotalQty = request.getParameter("totalQty");
	System.out.println(TotalQty);
	int totalQty = Integer.parseInt(TotalQty);
	
	AccountDAO dao = new AccountDAO();
	AccountVO vo = null;
	try {
		vo = dao.selectAll(email);
	
	} catch (SQLException e) {
		e.printStackTrace();
	}
	
	MyCouponDAO myCouponDao = new MyCouponDAO();
	List<MyCouponVO> list = null;
	try {
		list = myCouponDao.getMyCoupon(email);
	} catch (SQLException e) {
		e.printStackTrace();
	}
	%>
<section class="section_padding">
	<div class="container">
		<div class="billing_details">
			<div class="row">
				<form class="row contact_form" action="checkout_ok.jsp"
					method="post" novalidate="novalidate">
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
						<div class="col-md-12 form-group">
							<span>수거날짜선택</span>
							<div class="p_input">
								<select id="year" name="yy" class="select"></select>년 <select
									id="month" name="mm" class="select"></select>월 <select id="day"
									name="dd" class="select"></select>일
							</div>
						</div>
						<div class="col-md-12 form-group p_star">
							<label>지점선택</label> <select name="storeNo" class="country_select">
								<option value="1001">강남지점</option>
								<option value="1002">서초지점</option>
								<option value="1003">동작지점</option>
								<option value="1004">송파지점</option>
							</select>
						</div>
						<div class="col-md-12 form-group p_star">
							<label>쿠폰선택</label> <select name="serialNo" id="serialNo"
								class="country_select">
								<option name="serialNo" id="op" value="0">사용안함</option>
								<%
								//쿠폰가져오기
								MyCouponVO couponVo = null;
								for (int i = 0; i < list.size(); i++) {
									couponVo = list.get(i);
								%>
								<option name="serialNo" id="op" value="<%=couponVo.getSerialNo()%>"><%=OrderUtil.displayCouponName(couponVo.getSerialNo())%></option>
								<%
								}
								%>
							</select>
						</div>

					</div>
					<div class="col-lg-4">
						<div class="order_box">
							<h2>Your Order</h2>
							<ul class="list list_2">
								<li><a href="#">총주문수량 <span><%=totalQty%>개</span> <input
										type="hidden" name="totalQty" value="<%=totalQty%>">
								</a></li>
							</ul>
							<ul class="list list_2">
								<li><a href="#">총주문금액 <span><%=OrderUtil.changeDecimalFormat(totalPrice)%></span>
										<input type="hidden" name="totalPrice" value="<%=totalPrice%>">
								</a></li>
							</ul>
							<ul class="list list_2">
								<li><a href="#">할인금액 <span id="discountPrice"><%=OrderUtil.changeDecimalFormat(discountPrice)%></span>
								</a></li>
							</ul>
							<ul class="list list_2">
								<li><a href="#">결제금액 <span><%=OrderUtil.changeDecimalFormat(realPrice)%></span>
										<input type="hidden" name="realPrice" value="<%=realPrice%>">
								</a></li>
							</ul>
							<div class="mt20" style="text-aligh: center">
								<label> <input type="radio" class="option-input radio"
									name="example" checked /> 신용카드
								</label> <label> <input type="radio" class="option-input radio"
									name="example" /> 카카오페이
								</label>
							</div>
							<div class="mt20" style="text-align: center">
								<label> <input type="checkbox"
									class="option-input checkbox" /> 주문정보를 확인하였습니다.
								</label> <input type="submit" class="mint_btn" value="결제하기">
							</div>

						</div>
					</div>
				</form>
			</div>
		</div>
	</div>

</section>


<%@ include file="../inc/bottom.jsp"%>