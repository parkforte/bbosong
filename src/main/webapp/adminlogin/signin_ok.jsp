<%@page import="model.AdminVO"%>
<%@page import="model.AdminDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String email = request.getParameter("email");
	String pwd = request.getParameter("pwd");
	
	AdminVO vo = new AdminVO();
	vo.setEmail(email);
	vo.setPwd(pwd);
	AdminDAO dao = new AdminDAO();
	
	if(dao.isVerified(email))
		session.setAttribute("verified", true);
	
	if(dao.signin(vo)) {
		session.setAttribute("email", vo.getEmail());%>
		<script>location.href="<%=request.getContextPath()%>";</script>
	<%} else {%>
		<script>alert("로그인 실패"); history.back();</script>
	<%}
%>