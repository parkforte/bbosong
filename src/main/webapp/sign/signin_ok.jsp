<%@page import="model.AccountVO"%>
<%@page import="model.AccountDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String email = request.getParameter("email");
	String pw = request.getParameter("pw");
	
	AccountVO vo = new AccountVO();
	vo.setEmail(email);
	vo.setPw(pw);
	AccountDAO dao = new AccountDAO();
	
	
	if(dao.isVerified(email))
		session.setAttribute("verified", true);
	
	if(dao.signin(vo)) {
		session.setAttribute("email", vo.getEmail());%>
		<script>location.href="<%=request.getContextPath()%>";</script>
	<%} else {%>
		<script>alert("로그인 실패"); history.back();</script>
	<%}
%>