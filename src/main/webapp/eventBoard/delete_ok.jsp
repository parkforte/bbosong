<%@page import="model.EventBoardVO"%>
<%@page import="model.EventBoardDAO"%>
<%@page import="java.sql.SQLException"%>  
<%@page import="model.NoticeVO"%>
<%@page import="model.NoticeDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../inc/top.jsp"%>
<%  
		request.setCharacterEncoding("utf-8");
		String no=request.getParameter("no");
		EventBoardDAO dao = new EventBoardDAO();
		
		try{
			EventBoardVO vo = new EventBoardVO();
			vo.setNo(Integer.parseInt(no));
			
			int cnt= dao.deleteEvent(Integer.parseInt(no));
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