<%@page import="java.util.Date"%>
<%@page import="model.CartDAO"%>
<%@page import="model.OrderVO"%>
<%@page import="java.sql.SQLException"%>
<%@page import="model.OrderDAO"%>
<%@page import="java.sql.Timestamp"%>
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
	String email =(String)session.getAttribute("email");
	String name=request.getParameter("name");
	String storeNo=request.getParameter("storeNo");
	String totalQty=request.getParameter("totalQty");
	String realPrice=request.getParameter("realPrice");
	String pickupDate =request.getParameter("pickupDate");
%>
	<form method="post" action="complete.jsp">
		<input type=hidden name="name" value="<%=name%>">

	</form>

	<% 	
	
	
	
	System.out.println(pickupDate);
	String[] arr=pickupDate.split("/");
	//0:월, 1:일, 2:년
	String PickupDate=arr[2]+"-"+arr[1]+"-"+arr[0];
	OrderDAO dao=new OrderDAO();
	CartDAO cartDao=new CartDAO();
	try{
		OrderVO vo=new OrderVO();
		vo.setEmail(email);
		vo.setStoreNo(Integer.parseInt(storeNo));
		vo.setTotalPrice(Integer.parseInt(realPrice));
		vo.setTotalQty(Integer.parseInt(totalQty));
		vo.setPickupDate(PickupDate);
		int cnt=dao.insertOrder(vo, email);
		if(cnt>0){%>
			<script type="text/javascript">
				alert('주문이 정상적으로 등록되었습니다.');
				location.href="complete.jsp";
			</script>
	<%
			//주문 성공 시 장바구니비우기
			try{
				int result=cartDao.deleteCart(email);
			}catch(SQLException e){
				e.printStackTrace();
			}
		}else{%>
			<script type="text/javascript">
				alert('주문이 취소되었습니다. 주문내역을 확인해주세요.');
				location.href="cart.jsp";
			</script>
	<% }
	}catch(SQLException e){
		e.printStackTrace();
	}
%>

</body>
</html>