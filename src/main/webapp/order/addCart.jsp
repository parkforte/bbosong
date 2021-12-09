<%@page import="util.OrderUtil"%>
<%@page import="java.sql.SQLException"%>
<%@page import="model.CartVO"%>
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
    request.setCharacterEncoding("utf-8");
	String email=(String)session.getAttribute("email");
	if(email==null){%>
		<script type="text/javascript">
			alert('로그인이 필요합니다.');
			location.href="<%=request.getContextPath() %>/sign/signin.jsp";
		</script>
<%	}
	System.out.println(email);
	String laundryNo=request.getParameter("laundryNo");
	int parseLaundryNo=Integer.parseInt(laundryNo);
	String qty="1";
	String price=OrderUtil.displayPrice(parseLaundryNo);
	CartDAO dao = new CartDAO();
	try {
		CartVO vo = new CartVO();
		vo.setEmail(email);
		vo.setLaundryNo(Integer.parseInt(laundryNo));
		vo.setQty(Integer.parseInt(qty));
		vo.setPrice(Integer.parseInt(price));
		int cnt = dao.insertCart(vo);
		if(cnt==1){%>
			<script type="text/javascript">
				alert('장바구니 등록 성공!');
				location.href="menuList.jsp";
			</script>
	<%	}
	} catch (SQLException e) {
		e.printStackTrace();
	}
	%>
</body>
</html>