<%@page import="java.util.Calendar"%>
<%@page import="java.util.Date"%>
<%@page import="java.sql.Timestamp"%>
<%@page import="model.AccountDAO"%>
<%@page import="model.AccountVO"%>
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
	request.setCharacterEncoding("utf-8");
	String email = request.getParameter("email");
	String name = request.getParameter("name");
	String pw = request.getParameter("pw1");
	String nickname = request.getParameter("nickname");
	String postcode = request.getParameter("postcode");
	String address_ = request.getParameter("address_");
	String detailAddress = request.getParameter("detailAddress");
	String tel = request.getParameter("tel");
	int yy = Integer.parseInt(request.getParameter("yy"));
	int mm = Integer.parseInt(request.getParameter("mm"));
	int dd = Integer.parseInt(request.getParameter("dd"));
	
	Date d = new Date();
	Calendar cal = Calendar.getInstance();
	cal.set(yy, mm-1, dd);
	
	Timestamp birth = new Timestamp(cal.getTimeInMillis());
	String address = postcode + " " + address_ + " " + detailAddress;
	
	AccountVO vo = new AccountVO();
	vo.setEmail(email);
	vo.setName(name);
	vo.setPw(pw);
	vo.setNickname(nickname);
	vo.setBirth(birth);
	vo.setAddress(address);
	vo.setTel(tel);
	
	AccountDAO dao = new AccountDAO();
	
	if(dao.insertUser(vo)) {
		session.setAttribute("email", vo.getEmail());%>
		<script>location.href="verify.jsp";</script>
	<%} else {%>
		<script>alert('fatal error'); history.back();</script>
	<%}
%>
</body>
</html>