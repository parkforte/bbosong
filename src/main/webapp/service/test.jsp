<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../inc/top.jsp" %>

<style type="text/css">
 *{
    margin:0;
    padding: 0;
}
.nav{
    position: fixed;  
    top: 0px;
    left:0px; 
    height: 60px; 
    width: 100%;                 //맨상단에 고정시키고 크기 지정
    background: rgba(0, 0, 0, 0.219);    //투명도 주기
    text-align: center;
    font-size: 15px;
    font-weight: bolder;
}
.nav ul {
    list-style:none;
    margin-top:20px;

}
.nav li{
    display: inline;
    margin-right: 25px;
}
.nav li a{
    text-decoration: none;
    color : rgb(255, 255, 255);    //글자색
}
.nav li a:hover{
    color:rgb(228, 133, 25);      //커서를 올렸을때 주황색으로 지정
}
.wrap{
    width:100%;
    height: auto;
    margin:0 auto;
    margin-top:80px;
}
.page1{
    width: 100%;
    height: 1000px;
    background: url(../img/gallery/gallery_1.png) no-repeat center center fixed; //이미지 반복하지않고 가운데 고정
    background-size: cover;   //사진을 화면사이즈에 맞게 조절
}
.page2{
    width: 100%;
    height: 1000px;
    background: url(../img/forest.jpg) no-repeat center center fixed; 
    background-size: cover;
}
.page3{
    width: 100%;
    height: 1000px;
    background: url(../img/sky.jpg) no-repeat center center fixed;
    background-size: cover;
}
.page4{
    width: 100%;
    height: 1000px;
    background: url(../img/city.jpg) no-repeat center center fixed;
    background-size: cover;
}
.ex{
    width: 70%;
    font-size: 50px;
    font-weight: bolder;
    text-align: center;
    margin:auto;
    padding-top: 400px;
    color: white;
}
</style>
<script src="<%=request.getContextPath() %>/js/jquery-3.6.0.js"></script>
<script type="text/javascript">
var flag = false;
$("html, body").on('mousewheel DOMMouseScroll', function(e) { 
	var E = e.originalEvent; eventValues = 0; 
	if (E.detail) { eventValues = E.detail * -40; 
	}else{ 
		eventValues = E.wheelDelta; }; 
		var scmove = $(this).height() - $(".l-header-pc").height(); 

if(eventValues == -120 && !flag){ 
	flag = true; $('html, body').animate( { 
		scrollTop : '+='+scmove }, 2000 ,function(){ flag = false; }); }; 
		if(eventValues == 120 && !flag){
			flag = true; $('html, body').animate( { 
				scrollTop : '-='+scmove }, 2000 ,function(){ flag = false; }); }; });

</script>

<section class="section_padding">
   <div class="container">
   		<section class="section-fisrt effect-fade" >

		</section>

		

		<section class="section-second effect-fade">

		</section>

		

		<section class="section-third effect-fade">

		</section>

   </div>
</section>


<%@ include file="../inc/bottom.jsp" %>