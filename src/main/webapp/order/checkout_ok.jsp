<%@page import="model.MyCouponDAO"%>
<%@page import="java.util.Calendar"%>
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
	String serialNo=request.getParameter("serialNo");
	int yy = Integer.parseInt(request.getParameter("yy"));
	int mm = Integer.parseInt(request.getParameter("mm"));
	int dd = Integer.parseInt(request.getParameter("dd"));
	
	if(email==null){%>
	<script type="text/javascript">
		alert('로그인이 필요합니다.');
		location.href="<%=request.getContextPath() %>/sign/signin.jsp";
	</script>
<%	}
	
	Date d = new Date();
	Calendar cal = Calendar.getInstance();
	cal.set(yy, mm-1, dd);
	   
   	Timestamp pickupDate = new Timestamp(cal.getTimeInMillis());
	
	
	OrderDAO dao=new OrderDAO();
	CartDAO cartDao=new CartDAO();
	MyCouponDAO myCouponDao=new MyCouponDAO();
	try{
		OrderVO vo=new OrderVO();
		vo.setEmail(email);
		vo.setStoreNo(Integer.parseInt(storeNo));
		vo.setTotalPrice(Integer.parseInt(realPrice));
		vo.setTotalQty(Integer.parseInt(totalQty));
		vo.setPickupDate(pickupDate);
		int cnt=dao.insertOrder(vo, email);
		if(cnt>0){%>
			<script type="text/javascript">
				alert('고객님의 주문이 정상적으로 등록되었습니다.');
				location.href="complete.jsp";
			</script>
	<%
			//주문 성공 시 장바구니비우기
			try{
				int result=cartDao.deleteCart(email);
				int couponRes=myCouponDao.deleteCoupon(email, Integer.parseInt(serialNo));
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