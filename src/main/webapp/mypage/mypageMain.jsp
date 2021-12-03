<%@page import="model.AccountVO"%>
<%@page import="model.AccountDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../inc/top.jsp"%>
<script src="<%=request.getContextPath() %>/js/jquery-3.6.0.js"></script>
<script>

	$(function() {

		$('ul.p_tabs li').click(function() {
			var tab_id = $(this).attr('data-tab');

			$('ul.p_tabs li').removeClass('p_on');
			$('.p_cont').removeClass('p_on');

			$(this).addClass('p_on');
			$("#" + tab_id).addClass('p_on');
		});

	});
	/*tab2*/
	$(function() {

		$('ul.p_tabs2 li').click(function() {
			var tab_id2 = $(this).attr('data-tab');

			$('ul.p_tabs2 li').removeClass('p_on2');
			$('.p_cont2').removeClass('p_on2');

			$(this).addClass('p_on2');
			$("#" + tab_id2).addClass('p_on2');
		});

	});
	
	/*각 페이지로 이동*/
	function order(){ //주문내역확인
		location.href="order_view.jsp";
	}
	
	function editInfo(){//내정보 수정
		location.href="editInfo.jsp";
	}
	function coupon(){//쿠폰
		location.href="coupon.jsp";
	}
	function Withdrawal(){//회원탈퇴
		location.href="Withdrawal.jsp";
	}
</script>

<%
	
	
%>
<section class="section_padding">
	<div class="container">
		<!--마이페이지-->
		<div class="mt20 tb_area row">
			<div class="col-lg-6 sm-6 page_area" onclick="order()">
				<div class="page_cont">
					<div class="line"></div>
					<p>
						<strong class="m_txt">order / </strong> 주문내역 조회
					</p>
					<p>
						고객님께서 주문하신 산품의 주문내역을 확인하실 수 있습니다.<br /> 비회원의 경우, 주문서의 주문번호와 비밀번호로
						주문조회하기가 가능합니다.
					</p>
				</div>
			</div>
			<div class="col-lg-6 sm-6 page_area" onclick="editInfo()">
				<div class="page_cont">
					<div class="line"></div>
					<p>
						<strong class="m_txt"> info/ </strong> 내정보수정
					</p>
					<p>
						고객님께서 주문하신 산품의 주문내역을 확인하실 수 있습니다.<br /> 비회원의 경우, 주문서의 주문번호와 비밀번호로
						주문조회하기가 가능합니다.
					</p>
				</div>
			</div>
			<div class="col-lg-6 sm-6 page_area" onclick="coupon()">
				<div class="page_cont">
					<div class="line"></div>
					<p>
						<strong class="m_txt">coupon / </strong> 쿠폰
					</p>
					<p>
						고객님께서 주문하신 산품의 주문내역을 확인하실 수 있습니다.<br /> 비회원의 경우, 주문서의 주문번호와 비밀번호로
						주문조회하기가 가능합니다.
					</p>
				</div>
			</div>
			<div class="col-lg-6 sm-6 page_area" onclick="Withdrawal()">
				<div class="page_cont">
					<div class="line"></div>
					<p>
						<strong class="m_txt">Withdrawal / </strong> 회원탈퇴
					</p>
					<p>
						고객님께서 주문하신 산품의 주문내역을 확인하실 수 있습니다.<br /> 비회원의 경우, 주문서의 주문번호와 비밀번호로
						주문조회하기가 가능합니다.
					</p>
				</div>
			</div>
		</div>
		<!--//마이페이지-->
	</div>
</section>

<%@include file="../inc/bottom.jsp"%>