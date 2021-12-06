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
	String msg="회원탈퇴실패" , url="Withdrawal.jsp";
	WithdrawalDAO dao = new WithdrawalDAO();
	try{
		int result=dao.deleteAccount(email, pw);
		System.out.println(result);
		if(result==myservice.LOGIN_OK){
		System.out.println("dd");
		int cnt = dao.deleteAccount(email, pw);
		if(cnt>0){
			msg="회원탈퇴가 처리되었습니다.";
			session.invalidate();
			
			url="accountOut.jsp";			
		}else if(result == myservice.DISAGREE_PWD){
				msg="패스워드가 다릅니다;_;";
		}else if(result == myservice.USERID_NONE){
				msg="아이디가 존재하지 않습니다;_;";
			
		}
			
		}
	}catch(SQLException e){
		e.printStackTrace();
	}
%>

<%-- <jsp:forword page="../common/message.jsp" /> --%>
<%@ include file="../inc/bottom.jsp"%>