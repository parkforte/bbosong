<%@page import="model.MyCouponVO"%>
<%@page import="model.CouponVO"%>
<%@page import="model.CouponDAO"%>
<%@page import="java.sql.SQLException"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../inc/top.jsp"%>
<%
	CouponDAO cpdao = new CouponDAO();
	MyCouponVO vo = new MyCouponVO();
	
	String serialno=request.getParameter("serialno");
	String email=(String)session.getAttribute("email");
	try{
	
	vo.setSerialNo(Integer.parseInt(serialno));
	int cnt = cpdao.insertCoupon(vo, email);
	if(cnt>0){
%>	
		<script type="text/javascript">
			alert("쿠폰등록이 완료");
			location.href="mypageMain.jsp";
		</script>
		<%  }else{ %>
				<script type="text/javascript">
					alert("쿠폰등록 실패");
					history.back();
				</script>			
		<%	}//if
		}catch(SQLException e){%>
		<% e.printStackTrace();
		}	
	
%>

<%@ include file="../inc/bottom.jsp"%>