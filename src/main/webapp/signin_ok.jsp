<%@page import="model.AccountVO"%>
<%@page import="model.AccountDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	String email = request.getParameter("email");
	String pw = request.getParameter("pw");
	
	AccountVO vo = new AccountVO();
	vo.setEmail(email);
	vo.setPw(pw);
	AccountDAO dao = new AccountDAO();
	boolean isSucceed = dao.signin(vo);
	if(isSucceed) {%>
		<script>alert("로그인 성공"); location.href="main.jsp";</script>
	<%} else {%>
		<script>alert("로그인 실패"); history.back();</script>
	<%}
%>
</body>
</html>