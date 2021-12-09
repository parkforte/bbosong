<%@page import="common.MypageUtil"%>
<%@page import="util.OrderUtil"%>
<%@page import="model.CartVO"%>
<%@page import="java.util.List"%>
<%@page import="java.sql.SQLException"%>
<%@page import="model.CartDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../inc/top.jsp" %>

  <meta name="description" content="">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="manifest" href="site.webmanifest">
  <link rel="shortcut icon" type="image/x-icon" href="../assets/img/favicon.ico">

<!-- CSS here -->
<link rel="stylesheet" href="../assets/css/bootstrap.min.css">
<link rel="stylesheet" href="../assets/css/owl.carousel.min.css">
<link rel="stylesheet" href="../assets/css/flaticon.css">
<link rel="stylesheet" href="../assets/css/slicknav.css">
<link rel="stylesheet" href="../assets/css/animate.min.css">
<link rel="stylesheet" href="../assets/css/magnific-popup.css">
<link rel="stylesheet" href="../assets/css/fontawesome-all.min.css">
<link rel="stylesheet" href="../assets/css/themify-icons.css">
<link rel="stylesheet" href="../assets/css/slick.css">
<link rel="stylesheet" href="../assets/css/nice-select.css">

<!-- newStyle css -->
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/newStyle.css">
<!-- subStyle css -->
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/substyle.css">
    <%
    request.setCharacterEncoding("utf-8");
	String email=(String)session.getAttribute("email");
	if(email==null){%>
		<script type="text/javascript">
			alert('로그인이 필요합니다.');
			location.href="<%=request.getContextPath() %>/sign/signin.jsp";
		</script>
<%	}%>
<%
	CartDAO dao=new CartDAO();
	List<CartVO> list=null;
	try{
		list=dao.selectAll(email);
	}catch(SQLException e){
		e.printStackTrace();
	}
	
	CartVO vo=new CartVO();
%>
 
  <main>
      <section class="cart_area section_padding">
        <div class="container">
        <h3>장바구니</h3>
          <div class="cart_inner">
            <div class="table-responsive">
              <table class="table">
                 <colgroup>
                <col width="10%">
                <col width="35%">
                <col width="10%">
                <col width="10%">
                <col width="20%">
                <col width="15%">
            	</colgroup>
                <thead>
                  <tr>
                    <th scope="col">번호</th>
                    <th scope="col">상품명</th>
                    <th scope="col">수량</th>
                    <th scope="col">금액</th>
                    <th scope="col">등록일</th>
                    <th scope="col"></th>
                  </tr>
                </thead>
                <tbody>
                <%for(int i=0; i<list.size(); i++){ 
                	vo=list.get(i);
                    int totalPrice=0;
                	%>
                  <tr>
                    <td>
                      <p><%= vo.getCartNo() %></p>
                    </td>
                    <td>
                      <div class="media">
                        <div class="media-body">
                          <p><%=OrderUtil.displayLaundryName(vo.getLaundryNo()) %></p>
                        </div>
                      </div>
                    </td>
                    <td>
                      <p><%=vo.getQty() %></p>
                    </td>
                    <td>
                      <p><%=OrderUtil.changeDecimalFormat(vo.getPrice())%></p>
                    </td>
                    <td>
                      <p><%=MypageUtil.changeFormat(vo.getRegdate()) %></p>
                    </td>
                    <td class="text-right">
                      <p><a href="deleteItem.jsp?cartNo=<%=vo.getCartNo()%>"><button class="btn_all begie_btn hover">삭제</button></a></[]>
                    </td>
                  </tr>
                  <%	} %>
                  <tr class="bottom_button">
                    <td></td>
                    <td>총합계</td>
                    <td>
                     <%int totalQty=0;
		                 for(int i=0; i<list.size(); i++){ 
		                	vo=list.get(i);
		                    totalQty+=vo.getQty();%>
		                    <% }%>
		                     <%=totalQty%>
                    </td>
                    <td>
		                  <%int totalPrice=0;
		                 for(int i=0; i<list.size(); i++){ 
		                	vo=list.get(i);
		                   	totalPrice+=vo.getPrice();%>
		                    <% }%>
		                     <%=OrderUtil.changeDecimalFormat(totalPrice)%>
                     </td>
                    <td>
                    <a href="menuList.jsp"><button class="btn_all mint_btn hover">메뉴목록</button></a>
                    </td>
                    <td class="text-right">
                      <a href="deleteCart.jsp"><button class="btn_all mint_btn hover">전체비우기</button></a>
                    </td>
                  </tr>
                </tbody>
              </table>
              <form method=post action="checkout.jsp">
              <input type="hidden" name="totalQty" value="<%=totalQty%>">
              <input type="hidden" name="totalPrice" value="<%=totalPrice%>">
              <div class="checkout_btn_inner float-right">
                <input type="submit" class="btn_all mint_btn hover" value="수거요청">
              </div>
              </form>
            </div>
          </div>
      </section>
      <!--================End Cart Area =================-->
  </main>>
<%@ include file="../inc/bottom.jsp" %>