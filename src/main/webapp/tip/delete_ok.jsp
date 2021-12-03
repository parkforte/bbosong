<%@page import="model.TipBoardVO"%>
<%@page import="java.sql.SQLException"%>  
<%@page import="model.TipBoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../inc/top.jsp"%>
<%
		//delete.jsp에서 post방식으로 서브밋됨
		request.setCharacterEncoding("utf-8");
	
		//1
		String no=request.getParameter("no");
		
		//2
		TipBoardDAO dao = new TipBoardDAO();
		
		try{
			TipBoardVO vo = new TipBoardVO();
			vo.setNo(Integer.parseInt(no));
			
			int cnt= dao.deleteTip(Integer.parseInt(no));
			if(cnt>0){
			%>
				<script type="text/javascript">
					alert("글 삭제되었습니다.");
					location.href="list.jsp";
				</script>	
		<%	}else{ %>
				<script type="text/javascript">
					alert("수정실패");
					history.back();
				</script>
		<%	}
		}catch(SQLException e){
			e.printStackTrace();
		}
	%>



<%@ include file="../inc/bottom.jsp"%>