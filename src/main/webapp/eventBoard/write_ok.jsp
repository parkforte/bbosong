<%@page import="model.EventBoardVO"%>
<%@page import="model.EventBoardDAO"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.SQLClientInfoException"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//write.jsp에서 post방식으로 서브밋됨
	request.setCharacterEncoding("utf-8");

	String title= request.getParameter("title");
	String content= request.getParameter("content");
	
	System.out.println(title);
	System.out.println(content);
	
	EventBoardDAO dao=new EventBoardDAO();
	try{
		EventBoardVO vo=new EventBoardVO();
		vo.setTitle(title);
		vo.setContent(content);
		int result=dao.insertEvent(vo);	
		if(result>0){
			System.out.println("글등록 성공! result="+result+", 매개변수vo="+vo);
		}else{
			System.out.println("글등록 실패! result="+result+", 매개변수vo="+vo);
		}
	}catch(SQLException e){
		e.printStackTrace();
	}
	
	response.sendRedirect("list.jsp");
%>