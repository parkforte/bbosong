<%@page import="common.orderUtil"%>
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
	String email = (String) session.getAttribute("email");
	System.out.println(email);
	String laundryNo=request.getParameter("laundryNo");
	int parseLaundryNo=Integer.parseInt(laundryNo);
	String qty="1";
	String price=orderUtil.displayPrice(parseLaundryNo);
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