<%@page import="java.sql.SQLException"%>
<%@page import="model.QnADAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>삭제</title>
</head>
<body>
<%
	String email = (String)session.getAttribute("email");
	String no_ = request.getParameter("no");
	if(email == null || no_ == null || no_.isEmpty()) {%>
		<script>
			alert('잘못된 접근입니다.');
			location.href = '<%=request.getContextPath()%>/qna/list.jsp';
		</script>
	<%}
	
	QnADAO dao = new QnADAO();
	try {
		if(dao.delete(email, Integer.parseInt(no_))) {%>
			<script>
				alert('삭제되었습니다.');
				location.href = '<%=request.getContextPath()%>/qna/list.jsp';
			</script>			
		<%} else {%>
			<script>
				alert('삭제에 실패하였습니다.');
				history.back();
			</script>
		<%}
			
	} catch(SQLException e) {
		e.printStackTrace();
	}
%>
</body>
</html>