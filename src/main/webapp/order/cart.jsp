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
 
  <main>
      <!--================Cart Area =================-->
      <section class="cart_area section_padding">
        <div class="container">
          <div class="cart_inner">
            <div class="table-responsive">
              <table class="table">
                <thead>
                  <tr>
                    <th scope="col">상품명</th>
                    <th scope="col">수량</th>
                    <th scope="col">단가</th>
                    <th scope="col">합계</th>
                  </tr>
                </thead>
                <tbody>
                  <tr>
                    <td>
                      <div class="media">
                        <div class="d-flex">
                          <img src="../assets/img/gallery/card1.png" alt="" />
                        </div>
                        <div class="media-body">
                          <p>상품명</p>
                        </div>
                      </div>
                    </td>
                    <td>
                      <h5>수량</h5>
                    </td>
                    <td>
                      <h5>$360.00</h5>
                    </td>
                    <td>
                      <h5>$720.00</h5>
                    </td>
                  </tr>
                  <tr>
                    <td></td>
                    <td>
                      <h5>총합계</h5>
                    </td>
                    <td>EA</td>
                    <td>
                      <h5>$2160.00</h5>
                    </td>
                  </tr>
                  <tr class="bottom_button">
                    <td>
                      <a class="btn_1" href="#">메뉴목록</a>
                    </td>
                    <td></td>
                    <td></td>
                    <td>
                      <div class="cupon_text float-right">
                        <a class="btn_1" href="#">Coupon</a>
                      </div>
                    </td>
                  </tr>
                </tbody>
              </table>
              <div class="checkout_btn_inner float-right">
                <a class="btn_1" href="menuList.jsp">메뉴목록</a>
                <a class="btn_1 checkout_btn_1" href="checkout.jsp">수거요청</a>
              </div>
            </div>
          </div>
      </section>
      <!--================End Cart Area =================-->
  </main>>
<%@ include file="../inc/bottom.jsp" %>