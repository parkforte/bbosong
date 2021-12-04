<%@page import="java.sql.SQLException"%>
<%@page import="model.EventBoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	String no=request.getParameter("no");
	EventBoardDAO dao=new EventBoardDAO();
	try{
		int cnt=dao.updateReadCount(Integer.parseInt(no));
		
		//3
		if(cnt>0){
			response.sendRedirect("detail.jsp?no="+no);	
		}else{ %>
			<script type="text/javascript">
				alert('비정상적인 접근입니다.');
				history.back();
			</script>	
	<%	}
	}catch(SQLException e){
		e.printStackTrace();
	}

%>
</body>
</html>