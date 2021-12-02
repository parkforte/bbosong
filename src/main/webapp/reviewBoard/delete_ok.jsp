<%@page import="java.sql.SQLException"%>  
<%@page import="model.ReviewBoardDAO"%>
<%@page import="model.ReviewBoardVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../inc/top.jsp"%>
<%
		//delete.jsp에서 post방식으로 서브밋됨
		request.setCharacterEncoding("utf-8");
	
		//1
		String no=request.getParameter("no");
		String pwd=request.getParameter("pwd");
		String step=request.getParameter("step");
		String groupNo=request.getParameter("groupNo");
		
		//2
		ReviewBoardDAO dao = new ReviewBoardDAO();
		
		try{
			ReviewBoardVO vo = new ReviewBoardVO();
			vo.setNo(Integer.parseInt(no));
			vo.setStep(Integer.parseInt(step));
			vo.setGroupNo(Integer.parseInt(groupNo));
			
			if(dao.checkPwd(vo)){
				dao.deleteReviewBoard(vo);			
			%>
				<script type="text/javascript">
					alert("글 삭제되었습니다.");
					location.href="list.jsp";
				</script>	
		<%	}else{ %>
				<script type="text/javascript">
					alert("비밀번호가 일치하지 않습니다.");
					history.back();
				</script>
		<%	}
		}catch(SQLException e){
			e.printStackTrace();
		}
	%>

<%@ include file="../inc/bottom.jsp"%>