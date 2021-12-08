<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../inc/top.jsp"%>
<section class="section_padding">
	<div class="container">
		<div class="">
        <div class="Withdrawal">
            <p class="wd_txt t_center mb50">
               회원탈퇴가 <strong>완료되었습니다.</strong> 
            </p>
            <div class="gray_box">
                <p>
                    그동안 뽀송dream 서비스를 이용해주셔서 감사합니다.<br/>
                    보다 더 나은 서비스로 찾아뵙겠습니다.
                </p>
				<%
					session.invalidate();
				%>
                <a href="../index.jsp" class="mint_btn hover a_btn mt20">뽀송dream 첫화면</a>
            </div>
        </div>
    </div>
	</div>
</section>
<%@include file="../inc/bottom.jsp"%>