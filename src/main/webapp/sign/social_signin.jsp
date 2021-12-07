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
	String id = "kakao-"+request.getParameter("name") + "-" + request.getParameter("id");
	System.out.println(id);
	
	session.setAttribute("email", id);
	response.sendRedirect("../sign/signup.jsp");
%>
</body>
</html>