<%@page import="java.sql.SQLException"%>
<%@page import="model.ReviewBoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>countUpdate.jsp</title>
</head>
<body>
<%
	String no=request.getParameter("no");

	ReviewBoardDAO dao=new ReviewBoardDAO();
	try{
		int cnt=dao.updateReadCount(Integer.parseInt(no));
		
		if(cnt>0){
			response.sendRedirect("detail.jsp?no="+no);	
		}else{ %>
			<script type="text/javascript">
				alert('조회수 증가 실패!');
				history.back();
			</script>	
	<%	}
	}catch(SQLException e){
		e.printStackTrace();
	}
%>
</body>
</html>






