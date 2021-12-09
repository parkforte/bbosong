<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.sql.SQLException"%>
<%@page import="model.InfoEditDAO"%>
<%@page import="model.AccountVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../inc/top.jsp"%>
<%
	String email =(String)session.getAttribute("email");
	AccountVO vo = null;
	InfoEditDAO dao = new InfoEditDAO();
	SimpleDateFormat sdf= new SimpleDateFormat();
	try{
	vo=dao.selectByEmail(email);
	
	email=vo.getEmail();
	String name=vo.getName();
	
	
	}catch(SQLException e){
		e.printStackTrace();
	}
	
	// 비로그인시 메인으로 리다이렉트
%>
<style>
.valid { border: solid 2px green; }
.invalid { border: solid 2px red; }
.invalidText { color: red; }
</style>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript" src="../js/daumPostCode.js"></script>
<script src="<%=request.getContextPath() %>/js/jquery-3.6.0.js"></script>
<section class="section_padding">
	<div class="container">
		<h2>내정보</h2>
		<div>
            <div>
		        <div class="input_area">
		            <div class="p_title">
		                <label>이름</label>
		            </div>
		            <div class="p_input">
		            	<p><%=vo.getName()%></p>
		            </div>
		        </div>
		        <div class="input_area">
		            <div class="p_title">
		                <label>이메일</label>
		            </div>
		            <div class="p_input">
		            	<p><%=session.getAttribute("email") %></p>
		            </div>
		        </div>
		        <div class="input_area">
		            <div class="p_title">
		                <label>닉네임</label>
		            </div>
		            <div class="p_input">
		            	<p><%=vo.getNickname() %></p>
		            </div>
		        </div>
		        <div class="input_area">
		            <div class="p_title">
		                <label>생년월일</label>
		            </div>
		            <div class="p_input">
		                <p><%=sdf.format(vo.getBirth()) %></p>
		            </div>
		        </div>
		        <div class="input_area">
		            <div class="p_title">
		                <label>주소</label>
		            </div>
		            <div class="p_input">
		                <p><%=vo.getAddress() %></p>
		            </div>
		        </div>
		        <div class="input_area">
		            <div class="p_title">
		                <label>전화번호</label>
		            </div>
		            <div class="p_input">
		            	<p><%=vo.getTel() %></p>
		            </div>
		        </div>
		        
		    
            <div class="btn_all t_center">
                <a href="mypageMain.jsp" class="mint_btn hover a_btn">확인</a>
            </div>
            </div>
        </div>
	</div>
</section>
<%@include file="../inc/bottom.jsp"%>