<%@page import="model.CartDAO"%>
<%@page import="java.sql.SQLException"%>
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
	request.setCharacterEncoding("utf-8");
	String email=(String)session.getAttribute("email");
	if(email==null){%>
		<script type="text/javascript">
			alert('로그인이 필요합니다.');
			location.href="<%=request.getContextPath() %>/sign/signin.jsp";
		</script>
<%	}

	CartDAO cartDao=new CartDAO();
	try{
		int cnt=cartDao.deleteCart(email);
		
		if(cnt>0){%>
			<script type="text/javascript">
				alert('장바구니를 전부 비웠습니다.');
				location.href="cart.jsp";
			</script>
	<%
		}else{%>
			<script type="text/javascript">
				alert('장바구니를 비우지 못하였습니다. 다시 확인해주세요.');
				location.href="cart.jsp";
			</script>
	<% }
	}catch(SQLException e){
		e.printStackTrace();
	}
%>
</body>
</html>