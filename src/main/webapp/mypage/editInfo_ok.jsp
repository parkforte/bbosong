<%@page import="model.AccountVO"%>
<%@page import="java.sql.SQLException"%>
<%@page import="model.InfoEditDAO"%>
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
	String email=(String)session.getAttribute("email");
	String pw = request.getParameter("pw1");
	String nickname=request.getParameter("nickname");
	String tel=request.getParameter("tel");
	String postcode = request.getParameter("postcode1");
	String address_ = request.getParameter("address_1");
	String detailAddress = request.getParameter("detailAddress1");
	String address = postcode + " " + address_ + " " + detailAddress;
	InfoEditDAO dao = new InfoEditDAO();
	AccountVO vo = new AccountVO();
	AccountVO vo2 = new AccountVO();
	try{
		if(!pw.isEmpty() && pw!=null){
			vo.setPw(pw);
			vo.setEmail(email);
			int cnt= dao.updatePw(vo);
			System.out.println("cnt="+cnt);
			vo2.setNickname(nickname);
			vo2.setAddress(address);
			vo2.setTel(tel);
			
			vo2.setEmail(email);
			dao.updateInfo(vo2);	
		}else{%>
			<script>
			alert('정보수정을 실패했습니다.');
			</script>
	<%}
	// password가 ""이나 null이면 다음 로직 실행 x
	
	
	}catch(SQLException e){
		e.printStackTrace();
	}
	/*
		비밀번호 변경 로직
		updatePw()
	*/
	
	
%>
</body>
</html>