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

<section class="section_padding">
	<div class="container">
		<div class="billing_details">
			<div class="row">
				<div class="col-lg-8">
					<h3>주문정보입력</h3>
					<form class="row contact_form" action="#" method="post"
						novalidate="novalidate">
						<div class="col-md-12 form-group">
							<input type="text" class="form-control" id="name" name="name"
								placeholder="이름" />
						</div>
						<div class="col-md-12 form-group">
							<input type="text" class="form-control" id="email" name="email"
								placeholder="이메일" />
						</div>
						<div class="col-md-12 form-group">
							<input type="text" class="form-control" id="tel" name="tel"
								placeholder="연락처" />
						</div>
						<div class="col-md-12 form-group">
							<input type="text" class="form-control" id="zip" name="zip"
								placeholder="우편번호" />
						</div>
						<div class="col-md-12 form-group">
							<input type="text" class="form-control" id="zip" name="zip"
								placeholder="시/도" />
						</div>
						<div class="col-md-12 form-group">
							<input type="text" class="form-control" id="zip" name="zip"
								placeholder="상세주소" />
						</div>
						<div class="col-md-12 form-group p_star">
							<label>지점선택</label> <select class="country_select">
								<option value="1">강남지점</option>
								<option value="2">서초지점</option>
								<option value="3">동작지점</option>
								<option value="4">송파지점</option>
							</select>
						</div>
						<div class="col-md-12 form-group">
							<div class="creat_account">
								<input type="checkbox" id="f-option2" name="selector" /> <label
									for="f-option2">선택하신 지점정보를 확인하셨나요?</label>
							</div>
						</div>
						<div class="col-md-12 form-group">
							<span>배송요청사항</span>
							<textarea class="form-control" name="message" id="message"
								rows="1" placeholder="배송요청사항 입력"></textarea>
						</div>
					</form>
				</div>
				<div class="col-lg-4">
					<div class="order_box">
						<h2>Your Order</h2>
						<ul class="list">
							<li><a href="#">Product <span>Total</span>
							</a></li>
							<li><a href="#">Fresh Blackberry <span class="middle">x
										02</span> <span class="last">$720.00</span>
							</a></li>
							<li><a href="#">Fresh Tomatoes <span class="middle">x
										02</span> <span class="last">$720.00</span>
							</a></li>
							<li><a href="#">Fresh Brocoli <span class="middle">x
										02</span> <span class="last">$720.00</span>
							</a></li>
						</ul>
						<ul class="list list_2">
							<li><a href="#">Subtotal <span>$2160.00</span>
							</a></li>
							<li><a href="#">Shipping <span>Flat rate: $50.00</span>
							</a></li>
							<li><a href="#">Total <span>$2210.00</span>
							</a></li>
						</ul>
						<div class="payment_item">
							<div class="radion_btn">
								<input type="radio" id="f-option5" name="selector" /> <label
									for="f-option5">신용카드</label>
								<div class="check"></div>
							</div>
						</div>
						<div class="payment_item active">
							<div class="radion_btn">
								<input type="radio" id="f-option6" name="selector" /> <label
									for="f-option6">카카오페이</label> <img
									src="img/product/single-product/card.jpg" alt="" />
								<div class="check"></div>
								<p>Please send a check to Store Name, Store Street, Store
									Town, Store State / County, Store Postcode.</p>
							</div>
						</div>
						<div class="creat_account">
							<span>주문정보를 확인하였습니다</span> <input type="checkbox"
								id="f-option4" name="selector" /> <a class="btn_3" href="#">수거요청</a>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

</section>


<%@ include file="../inc/bottom.jsp"%>