<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../inc/top.jsp"%>
<style>
 .Withdrawal{}
 .gray_box{background: #f1f1f1; text-align: center; border-radius: 10px; padding:100px 0;}
 .wd_txt{font-size:24px; }
 .gray_box p{}
</style>
<section class="section_padding">
	<div class="container">
		<div class="">
        <div class="Withdrawal">

            <p class="wd_txt t_center">
               회원탈퇴가<strong class="">완료되었습니다.</strong> 
            </p>
            <div class="gray_box">
                <p>
                    그동안 뽀송dream 서비스를 이용해주셔서 감사합니다.<br/>
                    보다 더 나은 서비스로 찾아뵙겠습니다.
                </p>

<%
	session.invalidate();
%>
                <a href="../index.jsp" class="mint_btn hover a_btn">뽀송dream 첫화면</a>
            </div>
        </div>
    </div>
	</div>
</section>
<%@include file="../inc/bottom.jsp"%>