<%@page import="java.sql.SQLException"%>
<%@page import="model.CartDAO"%>
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
	String cartNo=request.getParameter("cartNo");
	String email=(String)session.getAttribute("email");
	CartDAO dao=new CartDAO();
	
	try{
		int cnt=dao.deleteItem(Integer.parseInt(cartNo), email);
		if(cnt>0){%>
			<script type="text/javascript">
				alert('아이템을 삭제하였습니다.');
				location.href="cart.jsp";
			</script>
	<%	}else{ %>
			<script type="text/javascript">
				alert('삭제를 실패였습니다.');
				location.href="cart.jsp";
			</script>
	<%	}
	}catch(SQLException e){
		e.printStackTrace();
	}
%>

</body>
</html>