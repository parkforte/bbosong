<%@page import="model.QnAVO"%>
<%@page import="model.QnADAO"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.SQLClientInfoException"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>QnA 등록</title>
</head>
<%
	//write.jsp에서 post방식으로 서브밋됨
	request.setCharacterEncoding("utf-8");

	String title = request.getParameter("title");
	String content = request.getParameter("content");
	System.out.println(content);
	%><script>console.log('<%=content%>');</script><%
	String email = (String)session.getAttribute("email");
	
	QnADAO dao = new QnADAO();
	try{
		QnAVO vo = new QnAVO();
		vo.setTitle(title);
		vo.setContent(content);
		vo.setEmail(email);
		
		if(dao.insertNewWrite(vo)){ %>
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
</html>