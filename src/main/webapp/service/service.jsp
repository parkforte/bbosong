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
    top:50%;
    margin-top:-40px;
    margin-left:10px;
    text-align:left;
    width:100%;
    font-size:75px;
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
    background: url(../img/door1.jpg) no-repeat; background-size: cover;;
}

#section2 {
    background: url(../img/pillows.jpg) no-repeat; background-size: cover;;
}

#section3 {
    background: url(../img/box1.jpg) no-repeat; background-size: cover;;
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
        if(page == 4) return;
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
        <h2 class="h_01" style="text-align: left; left:10%; color:darkslateblue;">비대면 세탁 서비스</h2>
		<p style="text-align: left; left:10%; color:darkslateblue;">비대면 세탁 수거함을 통해 세탁에서의 자유로움을 느껴보세요.</p>
    </div>
    <div class="section" id="section2">
    	<h2 class="h_02" style="text-align: right; right:10%; color:darkgray;">친환경 세재</h2>
		<p style="text-align: right; right:10%; color:darkgray;">친환경 세재를 사용하여 피부를 보호하고<br><br>환경을 보호하며 세탁 퀄리티를 높입니다.</p>
	</div>
    <div class="section" id="section3">
    	<h2 class="h_03" style="text-align: left; left:10%; color:lightslategrey;">배송</h2>
		<p style="text-align: left; left:10%; color:lightslategrey;">수거 후 최대 2~3일 소요되며 문 앞 세탁함에 배송됩니다.</p>
    </div>
</body>
<%@ include file="../inc/bottom.jsp" %>