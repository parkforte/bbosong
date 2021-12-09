<%@page import="service.MypageService"%>
<%@page import="model.WithdrawalDAO"%>
<%@page import="java.sql.SQLException"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="myservice" class="service.MypageService"></jsp:useBean>
<%@ include file="../inc/top.jsp"%>
<%
	request.setCharacterEncoding("utf-8");
	
	String email= request.getParameter("email");
	String pw=request.getParameter("pw");
	
	WithdrawalDAO dao = new WithdrawalDAO();
	
	// 비밀번호 다를 떄 뒤로가기
	//loginCheck()
	try{
		int result=dao.loginCheck(email, pw);
		if(result==myservice.LOGIN_OK){
			dao.deletePW(pw);
			dao.deleteAccount(email);%>
			<script>
			location.href="accountOut.jsp";
			</script>
		<%}else if(result==myservice.DISAGREE_PWD){%>
			<script>
				alert('비밀번호가 틀렸습니다.');
				history.back(-1);
			</script>
		<%}else if(result==myservice.USERID_NONE){%>
			<script>
				alert('아이디가 일치하지 않습니다.');
				history.back(-1);
			</script>
		<%}
		
	}catch(SQLException e){
		e.printStackTrace();
	}
	
	
	

%>

<%-- <jsp:forword page="../common/message.jsp" /> --%>
<%@ include file="../inc/bottom.jsp"%>