<%@page import="model.AccountDAO"%>
<%@page import="java.sql.SQLException"%>
<%@page import="model.InfoEditDAO"%>
<%@page import="model.AccountVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file='../inc/top.jsp'%>
<%
	String email =(String)session.getAttribute("email");
	
	AccountVO vo = null;
	AccountDAO dao = new AccountDAO();
	try{
	vo=dao.selectAll(condition, keyword);
	
	email=vo.getEmail();
	String name=vo.getName();
	
	
	}catch(SQLException e){
		e.printStackTrace();
	}
	
	
%>
<section calss="section_padding">
	<div class="container">
		<h2>내정보 수정</h2>
		<div>
            <form id="signinForm" action="" method="post">
		        <div class="input_area">
		            <div class="p_title">
		                <label>이름</label>
		            </div>
		            <div class="p_input">
		                <input id="name" type="text" name="name" placeholder="<%=vo.getName()%>" class="t_input" required="required" disabled="disabled">
		            </div>
		        </div>
		        <div class="input_area">
		            <div class="p_title">
		                <label>이메일</label>
		            </div>
		            <div class="p_input">
		                <input id="email" type="email" name="email" class="t_input" placeholder="<%=session.getAttribute("email") %>" required="required" disabled="disabled"><span class="invalidText"></span>
		            </div>
		        </div>
		        
		        <div class="input_area">
		            <div class="p_title">
		                <label>비밀번호</label>
		            </div>
		            <div class="p_input">
		                <input id="pw1" type="password" name="pw1" class="t_input" required="required"><span class="invalidText"></span>
		            </div>
		        </div>
		        <div class="input_area">
		            <div class="p_title">
		                <label>비밀번호 확인</label>
		            </div>
		            <div class="p_input">
		                <input id="pw2" type="password" name="pw2" class="t_input" required="required"><span class="invalidText"></span>
		            </div>
		        </div>
		        <div class="input_area">
		            <div class="p_title">
		                <label>닉네임</label>
		            </div>
		            <div class="p_input">
		                <input id="nickname" type="text" name="nickname" placeholder="<%=vo.getNickname() %>" class="t_input" required="required">
		            </div>
		        </div>
		        <div class="input_area">
		            <div class="p_title">
		                <label>생년월일</label>
		            </div>
		            <div class="p_input">
		                <select id="year" name="yy" class="select"></select>년
						<select id="month" name="mm" class="select"></select>월
						<select id="day" name="dd" class="select"></select>일
		            </div>
		        </div>
		        <div class="input_area">
		            <div class="p_title">
		                <label>주소</label>
		            </div>
		            <div class="p_input">
		                <input id="sample6_postcode" type="text" name="postcode" class="t_input" placeholder="우편번호" required="required" disabled="disabled">
						<input type="button"  class="mint_btn hover" onclick="sample6_execDaumPostcode()" value="우편번호 찾기"><br>
						<input id="sample6_address" type="text" name="address_" placeholder="<%=vo.getAddress() %>" required="required" disabled="disabled">
						<input id="sample6_detailAddress" type="text" name="detailAddress" placeholder="상세주소" required="required">
		            </div>
		        </div>
		        <div class="input_area">
		            <div class="p_title">
		                <label>전화번호</label>
		            </div>
		            <div class="p_input">
		                <input type="text" name="tel" value="<%=vo.getTel() %>" class="t_input" required="required">
		            </div>
		        </div>
		        
		    </form>
            <div class="btn_all t_center">
                <button type="submit" class="mint_btn hover" id="infoedit_btn">회원정보 수정</button>
                <button type="button" class="begie_btn hover">취소</button>
            </div>
        </div>
	</div>
</section>

<%@include file='../inc/bottom.jsp'%>