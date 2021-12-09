<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../inc/top.jsp" %>

<script src="<%=request.getContextPath() %>/js/jquery-3.6.0.js"></script>
<script type="text/javascript">
       /*accordion*/
       $(function(){
            // variables
            var accordionBtn = document.querySelectorAll('.accordionTitle');
            var allTexts = document.querySelectorAll('.text');
            var accIcon = document.querySelectorAll('.accIcon');

            // event listener
            accordionBtn.forEach(function (el) {
                el.addEventListener('click', toggleAccordion)
            });

            // function
            function toggleAccordion(el) {
            var targetText = el.currentTarget.nextElementSibling.classList;
            var targetAccIcon = el.currentTarget.children[0];
            var target = el.currentTarget;
            
            if (targetText.contains('show')) {
                targetText.remove('show');
                targetAccIcon.classList.remove('anime');
                target.classList.remove('accordionTitleActive');
            } 
            else {
                accordionBtn.forEach(function (el) {
                    el.classList.remove('accordionTitleActive');
                    
                    allTexts.forEach(function (el) {
                        el.classList.remove('show');
                    })
                    
                    accIcon.forEach(function (el) {
                    el.classList.remove('anime');
                    }) 
                    
                })
                
                    targetText.add('show');
                    target.classList.add('accordionTitleActive');
                    targetAccIcon.classList.add('anime');
            }  
            }
                });
    </script>

<section class="section_padding">
   <div class="container">
   		<h2>FQA</h2><br>
  		<!-- accordion -->
        <div class="acc_cont">
            <ul class="accordion">
	            <li class="item">
	                <h2 class="accordionTitle">세탁을 맡기면 얼마나 걸리나요? <span class="accIcon"></span></h2>
	                <div class="text">선택하신 옵션과 옷의 종류에 따라 다르지만 보통 주문 후 2~3일이 소요됩니다. </div>
	            </li>
	            <li class="item">
	                <h2 class="accordionTitle">근처에 지점이 없으면 서비스를 이용할 수 없나요? <span class="accIcon"></span></h2>
	                <div class="text">현재는 강남점, 서초점, 동작점, 송파점에서만 서비스를 이용할 수 있으며 추후에 지점을 늘려갈 계획입니다.</div>
	            </li>
	            <li class="item">
	                <h2 class="accordionTitle">한번에 맡길 수 있는 옷 수량에 제한이 있나요? <span class="accIcon"></span></h2>
	                <div class="text">옷 수량에는 제한을 두고 있지 않습니다.</div>
	            </li>
	            <li class="item">
	                <h2 class="accordionTitle">세탁 후 받은 옷에 문제가 생기면 어떻게 하나요? <span class="accIcon"></span></h2>
	                <div class="text">기존에 옷에 있던 문제가 아닌 세탁 후에 발생한 문제라는 것이 확인되면 그에 따른 보상을 진행합니다. 하지만 문제가 생기는 경우는 극히 드문 경우이니 안심하시고 이용하시기 바랍니다.</div>
	            </li>
	            <li class="item">
	                <h2 class="accordionTitle">주문 후 배송지를 변경하고 싶으면 어떻게 하나요? <span class="accIcon"></span></h2>
	                <div class="text">현재는 배송지 변경이 불가합니다. 주문 전 신중하게 작성해주시기 바랍니다.</div>
	            </li>
         	</ul>
	    </div>
	    <!--// accordion -->
   </div>
</section>


<%@ include file="../inc/bottom.jsp" %>