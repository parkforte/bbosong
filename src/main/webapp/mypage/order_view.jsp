<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../inc/top.jsp"%>
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
	
	
</script>
<section class="section_padding">
	<div class="container">
		<h2>주문내역확인</h2>
		<div>
			<ul class="p_tabs2">
	            <li class="tab-link p_on2" data-tab="tab-1">주문내역 확인</li>
	            <li class="tab-link" data-tab="tab-2">주문상세현황</li>
		    </ul>
            <div id="tab-1"class="p_cont2 p_on2">
                <table  class="table1">
                    <colgroup>
                        <col width="15%">
                        <col width="15%">
                        <col width="20%">
                        <col width="15%">
                        <col width="20%">
                        <col width="*">
                    </colgroup>
                    <tr>
                        <th scope="col">주문번호</th>
                        <th scope="col">지점번호</th>
                        <th scope="col">상품정보</th>
                        <th scope="col">결제금액</th>
                        <th scope="col">주문날짜</th>
                        <th scope="col">수거날짜</th>
                    </tr>
                    <tr>
                        <td colspan="6">주문한 내역이 없습니다.</td>
                    </tr>
                    <tr>
                        <td>100-1</td>
                        <td>02-515-0000</td>
                        <td>드라이클리닝 (이미지삽입)</td>
                        <td>12,000 원</td>
                        <td>2021-11-29</td>
                        <td>2021-11-31</td>
                    </tr>
                </table>
            </div>
            <div id="tab-2"class="p_cont2">
            d
            </div>
        </div>
	</div>
</section>
<%@ include file="../inc/bottom.jsp"%>