<%@page import="model.EventBoardVO"%>
<%@page import="model.EventBoardDAO"%>
<%@page import="java.io.File"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="java.sql.SQLException"%>
<%@page import="model.NoticeVO"%>
<%@page import="model.NoticeDAO"%>
<%@page import="common.MypageUtil"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>  
<%
		String title=request.getParameter("title");
		String name=request.getParameter("name");
		String pwd=request.getParameter("pwd");
		String email=request.getParameter("email");
		String content=request.getParameter("content");
		String no=request.getParameter("no");
		try{
			EventBoardDAO dao = new EventBoardDAO();	
			EventBoardVO vo=new EventBoardVO();
			vo.setContent(content);
			vo.setEmail(email);
			vo.setNo(Integer.parseInt(no));
			vo.setTitle(title);
			int cnt = dao.updateEvent(vo);
			if(cnt>0){%>
				<script type="text/javascript">
					alert("글 수정되었습니다.");
					location.href="detail.jsp?no=<%=no%>";
				</script>
		<%	}else{ %>
				<script type="text/javascript">
					alert("글 수정 실패!");
					history.go(-1);
				</script>
			<%		}		
			}catch(SQLException e){
				e.printStackTrace();
			}
			%>