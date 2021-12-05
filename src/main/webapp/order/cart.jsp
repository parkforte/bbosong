<%@page import="common.orderUtil"%>
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
      <link rel="stylesheet" href="../assets/css/style.css">
 
<%
	String email=(String)session.getAttribute("email");
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
          <div class="cart_inner">
            <div class="table-responsive">
              <table class="table">
                <thead>
                 <colgroup>
                <col width="10%">
                <col width="35%">
                <col width="10%">
                <col width="10%">
                <col width="20%">
                <col width="15%">
            	</colgroup>
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
                      <h5><%=vo.getCartNo() %></h5>
                    </td>
                    <td>
                      <div class="media">
                        <div class="media-body">
                          <p><%=vo.getLaundryNo() %></p>
                        </div>
                      </div>
                    </td>
                    <td>
                      <h5><%=vo.getQty() %></h5>
                    </td>
                    <td>
                      <h5><%=vo.getPrice()%></h5>
                    </td>
                    <td>
                      <h5><%=vo.getRegdate() %></h5>
                    </td>
                    <td class="text-right">
                      <h5><a class="mint_btn" href="deleteItem.jsp?cartNo=<%=vo.getCartNo()%>">삭제</a></h5>
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
		                     <%=totalPrice%>
                     </td>
                    <td>
                    <a class="mint_btn" href="menuList.jsp">메뉴목록</a>
                    </td>
                    <td class="text-right">
                      <a class="mint_btn" href="deleteCart.jsp">전체비우기</a>
                    </td>
                  </tr>
                </tbody>
              </table>
              <form method=post action="checkout.jsp">
              <input type="hidden" name="totalQty" value="<%=totalQty%>">
              <input type="hidden" name="totalPrice" value="<%=totalPrice%>">
              <div class="checkout_btn_inner float-right">
                <input type="submit" class="mint_btn" value="수거요청">
              </div>
              </form>
            </div>
          </div>
      </section>
      <!--================End Cart Area =================-->
  </main>>
<%@ include file="../inc/bottom.jsp" %>