<%@page import="model.EventBoardVO"%>
<%@page import="model.EventBoardDAO"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.SQLClientInfoException"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>write_ok.jsp</title>
</head>
<body>
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
		if(result>0){ %>
			<script type="text/javascript">
				alert('등록을 완료하였습니다.');
				location.href="list.jsp";
			</script>
	<%	}else{	%>
			<script type="text/javascript">
				alert('등록을 실패하였습니다.');
				history.back();
			</script>
	<%	}
	}catch(SQLException e){
		e.printStackTrace();
	}
	
%>
</body>
</html>