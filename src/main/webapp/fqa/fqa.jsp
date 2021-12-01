<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../inc/top.jsp" %>

<style>
	.ui-state-active, .ui-widget-content .ui-state-active, .ui-widget-header .ui-state-active, a.ui-button:active, .ui-button:active, .ui-button.ui-state-active:hover
    {border: 1px solid #ccc !important;background: #aac3c3 !important;font-weight: normal;color: #ffffff;}
    .ui-accordion .ui-accordion-header{background:#f2ebde;}
</style>
	
	<!-- <link rel="stylesheet" href="https://code.jquery.com/ui/1.13.0/themes/base/jquery-ui.css"> -->
    <link rel="stylesheet" href="<%=request.getContextPath() %>/js/jquery-ui.min.css">
    <script src="<%=request.getContextPath() %>/js/jquery-3.6.0.min.js"></script>
	<script src="<%=request.getContextPath() %>/js/jquery-ui.min.js"></script>
	<script type="text/javascript">
	
    /*accordion*/
    $(function() {
        $( "#accordion" ).accordion({
        collapsible: true
        });
    });
    </script>

<section class="section_padding">
   <div class="container">
   <!--accordion-->
    <h1 class="mt20 mb20">faq accordion</h1>
    <div id="accordion" class="w1200">
        <h3>세탁을 맡기면 얼마나 걸리나요?</h3>
        <div>
          <p>선택하신 옵션과 옷의 종류에 따라 다르지만 보통 주문 후 2~3일이 소요됩니다.</p>
        </div>
        <h3>근처에 지점이 없으면 서비스를 이용할 수 없나요?</h3>
        <div>
          <p>현재는 강남점, 서초점, 동작점, 송파점에서만 서비스를 이용할 수 있으며 추후에 지점을 늘려갈 계획입니다.</p>
        </div>
        <h3>한번에 맡길 수 있는 옷 수량에 제한이 있나요?</h3>
        <div>
          <p>옷 수량에는 제한을 두고 있지 않습니다.</p>
        </div>
        <h3>세탁 후 받은 옷에 문제가 생기면 어떻게 하나요?</h3>
        <div>
          <p>기존에 옷에 있던 문제가 아닌 세탁 후에 발생한 문제라는 것이 확인되면 그에 따른 보상을 진행합니다.</p><p>하지만 문제가 생기는 경우는 극히 드문 경우이니 안심하시고 이용하시기 바랍니다.</p>
        </div>
        <h3>주문 후 배송지를 변경하고 싶으면 어떻게 하나요?</h3>
        <div>
          <p>현재는 배송지 변경이 불가합니다. 주문 전 신중하게 작성해주시기 바랍니다.</p>
        </div>
    </div>
    <!--accordion-->
   </div>
</section>


<%@ include file="../inc/bottom.jsp" %>