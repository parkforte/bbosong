<%@page import="model.AdminVO"%>
<%@page import="model.AdminService"%>
<%@page import="java.sql.SQLException"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="AdminService" class="model.AdminService" 
	scope="session"></jsp:useBean>
<%
	//login.jsp에서 post방식으로 서브밋
	//1
	request.setCharacterEncoding("utf-8");
	String email=request.getParameter("email");
	String pwd=request.getParameter("pwd");
	String chkSave=request.getParameter("chkSave");
	
	//2
		System.out.println(pwd);
	String msg="로그인 처리 실패", url="signin.jsp";
	try{
		int result=AdminService.loginCheck(email, pwd);
		if(result==AdminService.LOGIN_OK){
			AdminVO vo=AdminService.selectByEmail(email);
			
			//[1] 세션에 저장
			session.setAttribute("userid", vo.getEmail());
			session.setAttribute("name", vo.getName());
			
			//[2] 쿠키에 저장					
			if(chkSave != null ){  //체크한 경우
				Cookie ck = new Cookie("ck_userid", email);
				ck.setMaxAge(1000*24*60*60);
				ck.setPath("/");
				response.addCookie(ck);
			}else{
				Cookie ck = new Cookie("ck_userid", email);
				ck.setMaxAge(0);  //쿠키 제거
				ck.setPath("/");
				response.addCookie(ck);				
			}
			
			msg= vo.getName()+ "님 환영합니다.";
			url="../adminpage/Main.jsp";
		}else if(result==AdminService.DISAGREE_PWD){
			msg="비밀번호가 일치하지 않습니다.";	
		}else if(result==AdminService.USERID_NONE){
			msg="아이디가 존재하지 않습니다.";
		}
	}catch(SQLException e){
		e.printStackTrace();
	}
	
	//3
	request.setAttribute("msg", msg);
	request.setAttribute("url", url);
%>
<jsp:forward page="../common/message.jsp"></jsp:forward>
</body>
</html>