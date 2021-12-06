<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../inc/top.jsp" %>
<meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    
<style>
html {
    overflow: hidden;
}

html, body {
    display: block;
    width: 100%;
    height: 100%;
    margin: 0;
    
}

.section {
    width: 100%;
    height: 100%;
    position: relative;
}

.section h2{
    position:absolute;
    margin-top:-40px;
    margin-left:10px;
    text-align:left;
    width:100%;
    font-size:55px;
    font-weight:bold;
}

.section p{
	position:absolute;
	top:62%;
	margin-left:10px;
	width:100%;
	font-size:35px;
	font-weight:bold;
}

#section1 {
    background: url(../img/sunset4.jpg) no-repeat; background-size: cover;;
}

#section2 {
    background: url(../img/warm3.jpg) no-repeat; background-size: cover;;
}

#section3 {
    background: url(../img/lamp7.jpg) no-repeat; background-size: cover;;
}

#section4 {
    background: url(../img/test1.jpg) no-repeat; background-size: cover;;
}

</style>
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script src="<%=request.getContextPath() %>/js/jquery-3.6.0.js"></script>
<script type="text/javascript">
window.addEventListener("wheel", function(e){
    e.preventDefault();
},{passive : false});
var mHtml = $("html");
var page = 1;


mHtml.animate({scrollTop : 0},10);
$(window).on("wheel", function(e) {
    if(mHtml.is(":animated")) return;
    if(e.originalEvent.deltaY > 0) {
        if(page == 5) return;
        page++;
    } else if(e.originalEvent.deltaY < 0) {
        if(page == 1) return;
        page--;
    }
    var posTop =(page-1) * $(window).height();
    mHtml.animate({scrollTop : posTop});
});
</script>
<body>
    <div class="section" id="section1">
        <h2 class="h_01" style="top:50%; text-align: left; left:10%; color:gainsboro;">뽀송한 생활의 마무리</h2>
    </div>
    <div class="section" id="section2">
    	<h2 class="h_02" style="top:50%; text-align: left; left:10%; color:gainsboro;">뽀송한 세탁 서비스로<br> 쾌적한 생활을 가져다 드립니다.</h2>
	</div>
    <div class="section" id="section3">
    	<h2 class="h_03" style="top:30%; text-align: right; right:10%; color:gainsboro;">뽀송Dream과 함께 <br> 행복한 꿈 꾸셨으면 좋겠습니다.</h2>
	</div>
    <div class="section" id="section4">
    	<h2 class="h_04" style="top:50%; text-align: right; right:10%; color:gainsboro;">뽀송한 세탁을 제공해 드림!<br> 세탁 서비스 플랫폼, 뽀송Dream</h2>
	</div>
</body>
<%@ include file="../inc/bottom.jsp" %>