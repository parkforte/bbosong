<%@page import="model.QnADAO"%>
<%@page import="java.sql.SQLException"%>
<%@page import="model.EventBoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String no_ = request.getParameter("no");
	if(no_ == null || no_.isEmpty()) {%>
		<script type="text/javascript">
			alert('비정상적인 접근입니다.');
			history.back();
		</script>
	<%}
	
	int no = Integer.parseInt(no_);
	QnADAO dao = new QnADAO();
	
	try{
		if(dao.updateReadCount(no)){
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