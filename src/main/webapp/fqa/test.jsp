<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../inc/top.jsp" %>

<style>
	/************Reset**************/
* { 
  -moz-box-sizing: border-box; 
  -webkit-box-sizing: border-box; 
  box-sizing: border-box; 
}
html, body, div, object, iframe, fieldset { 
  margin: 0; 
  padding: 0; 
  border: 0;
} 
ol, ul { 
  list-style: none;
  margin: 0;
  padding: 0;
} 
table { 
  border-collapse: collapse; 
  border-spacing: 0; 
}
header, footer, nav, section, article, hgroup, figure {
  display: block; 
}
legend {
  display: none;
}
/************End Reset**************/

h3 {
  border-bottom: 1px solid #ccc;
}
.tab {
  padding: 1em;
  margin: 0;
  position: relative;
  cursor: pointer;
  outline: 0;
}
.tab:after {
      content: '+';
      position: absolute;
      top: 0;
      right: 0;
      display: block;
      font-size: 1.5em;
      padding: 0.5em;
}
.tab.active {
  background: rgba(0,0,0,0.3);
}
.tab.active:after {
   content: '-'; 
}

.panel { 
  overflow: hidden;
}
.js .panel {
  max-height: 0;
  -webkit-transition: max-height 0.3s ease-out;
  -moz-transition: max-height 0.3s ease-out;
  -ms-transition: max-height 0.3s ease-out;
  -o-transition: max-height 0.3s ease-out;
  transition: max-height 0.3s ease-out;
}
.js .panel.active {
  max-height: 30em;
}
.panel p {
  padding: 1em;
}
.panel p:last-child {
   margin: 0; 
}

/* Where it makes sense to display the full content */
@media all and (min-width:50em) {
  .tab {
    cursor: default;
  } 
  .tab.active {
     background: none; 
  }
  .tab:after, .tab.active:after {
     content: ""; 
  }
  
  .js .panel, .js .panel.active {
     max-height: none; 
  }
}
</style>
	
	
	<script type="text/javascript" src="<%=request.getContextPath() %>/data/js/jquery-3.6.0.min.js"></script>
	<script type="text/javascript">
	$(document).ready(function() {
	      $('body').addClass('js');
	      var $tab = $('.tab');
	  
	    $tab.on("click", function(e){
	      e.preventDefault();
	      var $this = $(this);
	      $this.toggleClass('active');
	      $this.next('.panel').toggleClass('active');
	    });
	});
    
    </script>

<section class="section_padding">
   <div class="container">
   		<!--Pattern HTML-->
<div id="pattern" class="pattern">
  <!--Begin Pattern HTML-->
  <h3 id="tab1" class="tab accordian" aria-controls="panel1" role="tab" tabindex="0">세탁을 맡기면 얼마나 걸리나요?</h3>

  <div id="panel1" class="panel accordian" aria-labeledby="tab1" role="tabpanel">
    <p>선택하신 옵션과 옷의 종류에 따라 다르지만 보통 주문 후 2~3일이 소요됩니다.</p>
  </div>

  <h3 id="tab2" class="tab accordian" aria-controls="panel2" role="tab" tabindex="-1">근처에 지점이 없으면 서비스를 이용할 수 없나요?</h3>
  <div id="panel2" class="panel accordian" aria-labeledby="tab2" role="tabpanel">
    <p>현재는 강남점, 서초점, 동작점, 송파점에서만 서비스를 이용할 수 있으며 추후에 지점을 늘려갈 계획입니다.</p>
  </div>

  <h3 id="tab3" class="tab accordian" aria-controls="panel3" role="tab" tabindex="-1">한번에 맡길 수 있는 옷 수량에 제한이 있나요?</h3>
  <div id="panel3" class="panel accordian" aria-labeledby="tab3" role="tabpanel">
    <p>옷 수량에는 제한을 두고 있지 않습니다.</p>
  </div>

  <h3 id="tab4" class="tab accordian" aria-controls="panel4" role="tab" tabindex="-1">세탁 후 받은 옷에 문제가 생기면 어떻게 하나요?</h3>
  <div id="panel4" class="panel accordian" aria-labeledby="tab4" role="tabpanel">
    <p>기존에 옷에 있던 문제가 아닌 세탁 후에 발생한 문제라는 것이 확인되면 그에 따른 보상을 진행합니다.<br>하지만 문제가 생기는 경우는 극히 드문 경우이니 안심하시고 이용하시기 바랍니다.</p>
    
  </div>
  
  <h3 id="tab5" class="tab accordian" aria-controls="panel5" role="tab" tabindex="-1">주문 후 배송지를 변경하고 싶으면 어떻게 하나요?</h3>
  <div id="panel5" class="panel accordian" aria-labeledby="tab5" role="tabpanel">
    <p>현재는 배송지 변경이 불가합니다. 주문 전 신중하게 작성해주시기 바랍니다.</p>
  </div>

</div>
<!--End Pattern HTML-->
   </div>
</section>


<%@ include file="../inc/bottom.jsp" %>