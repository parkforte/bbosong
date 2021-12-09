<%@page import="java.sql.SQLException"%>
<%@page import="model.ReviewBoardVO"%>
<%@page import="java.util.List"%>
<%@page import="model.ReviewBoardService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ include file="inc/top.jsp"%>
<style>
h1, h2, h3, h4, h5, h6{color:#000;}
.event_part .owl-nav .owl-next {
   left: auto;
   right: 0% !important;
}

.jc {
   justify-content: space-evenly !important;
}

.event_part .event_slider_content h5{
   color:#c96c62 ;
   font-weight:600 ;
   font-size:16px ;
}
.section_tittle h2{color:#4b4b4b !important;}
</style>
<!-- banner part start-->
<section class="banner_part">
   <div class="container">
      <div class="row align-items-center justify-content-center">
         <div class="col-lg-10">
            <div class="banner_text text-center">
               <div class="banner_text_iner">
                  <h1>뽀송Dream</h1>
                  <p>Let’s start your laundry with us, your dream will come true</p>
                  <a href="<%=request.getContextPath()%>/service/service.jsp"
                     class="btn_1">자세히 알아보기</a>
               </div>
            </div>
         </div>
      </div>
   </div>
</section>

<!--top place start-->
<!--::industries start::-->
<section class="hotel_list section_padding">
   <div class="container">
      <div class="row justify-content-center">
         <div class="col-xl-6">
            <div class="section_tittle text-center">
               <h2>지점정보</h2>
            </div>
         </div>
      </div>
      <div class="row">
         <div class="col-lg-3 col-sm-6">
            <div class="single_ihotel_list">
               <a href="store/store_info.jsp?store=a"><img src="img/wash1.png" alt=""></a>
               <div class="hover_text">
                  <div class="hotel_social_icon">
                     <ul>
                        <li><a href="#"><i class="ti-facebook"></i></a></li>
                        <li><a href="#"><i class="ti-twitter-alt"></i></a></li>
                        <li><a href="#"><i class="ti-linkedin"></i></a></li>
                     </ul>
                  </div>
                  <div class="share_icon">
                     <i class="ti-share"></i>
                  </div>
               </div>
               <div class="hotel_text_iner">
                  <h3>
                     <a href="store/store_info.jsp?store=a"> 강남지점</a> 
                  </h3>
                  <div class="place_review">
                     <a href="#"><i class="fas fa-star"></i></a> <a href="#"><i
                        class="fas fa-star"></i></a> <a href="#"><i class="fas fa-star"></i></a>
                     <a href="#"><i class="fas fa-star"></i></a> <a href="#"><i
                        class="fas fa-star"></i></a>
                  </div>
                  <p>강남구, 서울특별시</p>
               </div>
            </div>
         </div>
         <div class="col-lg-3 col-sm-6">
            <div class="single_ihotel_list">
               <a href="store/store_info.jsp?store=b"><img src="img/wash2.png" alt=""></a>
               <div class="hover_text">
                  <div class="hotel_social_icon">
                     <ul>
                        <li><a href="#"><i class="ti-facebook"></i></a></li>
                        <li><a href="#"><i class="ti-twitter-alt"></i></a></li>
                        <li><a href="#"><i class="ti-linkedin"></i></a></li>
                     </ul>
                  </div>
                  <div class="share_icon">
                     <i class="ti-share"></i>
                  </div>
               </div>
               <div class="hotel_text_iner">
                  <h3>
                     <a href="store/store_info.jsp?store=b"> 서초지점</a>
                  </h3>
                  <div class="place_review">
                     <a href="#"><i class="fas fa-star"></i></a> <a href="#"><i
                        class="fas fa-star"></i></a> <a href="#"><i class="fas fa-star"></i></a>
                     <a href="#"><i class="fas fa-star"></i></a> <a href="#"><i
                        class="fas fa-star"></i></a>
                  </div>
                  <p>서초구, 서울특별시</p>
               </div>  
            </div>
         </div>
         <div class="col-lg-3 col-sm-6">
            <div class="single_ihotel_list">
               <a href="store/store_info.jsp?store=c"><img src="img/wash4.png" alt=""></a>
               <div class="hover_text">
                  <div class="hover_text">
                     <div class="hotel_social_icon">
                        <ul>
                           <li><a href="#"><i class="ti-facebook"></i></a></li>
                           <li><a href="#"><i class="ti-twitter-alt"></i></a></li>
                           <li><a href="#"><i class="ti-linkedin"></i></a></li>
                        </ul>
                     </div>
                     <div class="share_icon">
                        <i class="ti-share"></i>
                     </div>
                  </div>
               </div>
               <div class="hotel_text_iner">
                  <h3>
                     <a href="store/store_info.jsp?store=c"> 동작지점</a>
                  </h3>
                  <div class="place_review">
                     <a href="#"><i class="fas fa-star"></i></a> <a href="#"><i
                        class="fas fa-star"></i></a> <a href="#"><i class="fas fa-star"></i></a>
                     <a href="#"><i class="fas fa-star"></i></a> <a href="#"><i
                        class="fas fa-star"></i></a>
                  </div>
                  <p>동작구, 서울특별시</p>
               </div>
            </div>
         </div>
         <div class="col-lg-3 col-sm-6">
            <div class="single_ihotel_list">
               <a href="store/store_info.jsp?store=d"><img src="img/wash9.png" alt=""></a>
               <div class="hover_text">
                  <div class="hover_text">
                     <div class="hotel_social_icon">
                        <ul>
                           <li><a href="#"><i class="ti-facebook"></i></a></li>
                           <li><a href="#"><i class="ti-twitter-alt"></i></a></li>
                           <li><a href="#"><i class="ti-linkedin"></i></a></li>
                        </ul>
                     </div>
                     <div class="share_icon">
                        <i class="ti-share"></i>
                     </div>
                  </div>
               </div>
               <div class="hotel_text_iner">
                  <h3>
                     <a href="store/store_info.jsp?store=d"> 송파지점</a>
                  </h3>
                  <div class="place_review">
                     <a href="#"><i class="fas fa-star"></i></a> <a href="#"><i
                        class="fas fa-star"></i></a> <a href="#"><i class="fas fa-star"></i></a>
                     <a href="#"><i class="fas fa-star"></i></a> <a href="#"><i
                        class="fas fa-star"></i></a>
                  </div>
                  <p>송파구, 서울특별시</p>
               </div>
            </div>
         </div>
      </div>
   </div>
</section>
<!--::industries end::-->
<!--top place start-->
<section class="event_part section_padding">
   <div class="container">
   <div class="row justify-content-center">
         <div class="col-xl-6">
            <div class="section_tittle text-center">
               <h2>메뉴정보</h2>
            </div>
         </div>
      </div>
      <div class="row">
         <div class="col-lg-12">
            <div class="event_slider owl-carousel">
               <div class="single_event_slider">
                  <div class="row jc">
                     <div class="col-lg-6 col-md-6">
                        <div class="event_slider_content">
                           <div class="single-popular-items mb-50 text-center">
                              <h5>뽀송한 정장Dream</h5>
                              <div class="popular-caption">
                                 <h3>정장세트</h3>
                                 <span>8,000원</span>
                              </div>
                              <div class="popular-img">
                                 <img src="img/suit.jpg" alt="정장">
                                 <form method="post"
                                    action="<%=request.getContextPath()%>/order/addCart.jsp">
                                    <input type="hidden" name="laundryNo" value="3">
                                    <div class="img-cap">
                                       <br> <input type="submit"
                                          class="btn_all mint_btn hover" value="장바구니에 담기">
                                    </div>
                                 </form>
                              </div>
                           </div>
                        </div>
                     </div>
                  </div>
               </div>
               <div class="single_event_slider">
                  <div class="row jc">
                     <div class="ol-lg-6 col-md-6">
                        <div class="event_slider_content">
                           <div class="single-popular-items mb-50 text-center">
                              <h5>뽀송한 겨울옷Dream</h5>
                              <div class="popular-caption">
                                 <h3>겨울코트</h3>
                                 <span>8,000원</span>
                              </div>
                              <div class="popular-img">
                                 <img src="img/winter_jaket.jpg" alt="겨울코트">
                                 <form method="post"
                                    action="<%=request.getContextPath()%>/order/addCart.jsp">
                                    <input type="hidden" name="laundryNo" value="6">
                                    <div class="img-cap">
                                       <br> <input type="submit"
                                          class="btn_all mint_btn hover" value="장바구니에 담기">
                                    </div>
                                 </form>
                              </div>
                           </div>
                        </div>
                     </div>
                  </div>
               </div>
               <div class="single_event_slider">
                  <div class="row jc">
                     <div class="ol-lg-6 col-md-6">
                        <div class="event_slider_content">
                           <div class="single-popular-items mb-50 text-center">
                              <h5>뽀송한 이불Dream</h5>
                              <div class="popular-caption">
                                 <h3>이불류</h3>
                                 <span>10,000원</span>
                              </div>
                              <div class="popular-img">
                                 <img src="img/beding22.jpg" alt="이불류">
                                 <form method="post"
                                    action="<%=request.getContextPath()%>/order/addCart.jsp">
                                    <input type="hidden" name="laundryNo" value="11">
                                    <div class="img-cap">
                                       <br> <input type="submit"
                                          class="btn_all mint_btn hover" value="장바구니에 담기">
                                    </div>
                                 </form> 
                              </div>
                           </div>
                        </div>
                     </div>
                  </div>
               </div>
            </div>
         </div>
      </div>
   </div>
</section>
<!--top place end-->
<style>
.client_review .single_review_slider {
   background-color: #f2ebde;
   padding: 30px;
   height: 310px !important;
}

.client_review .single_review_slider p {
   display: block;
   color: black;
   margin: 9px 0 18px;
}
</style>

<%
//1   
//2
ReviewBoardService boardService = new ReviewBoardService();
List<ReviewBoardVO> list = null;
try {
   list = boardService.selectMainNotice();
} catch (SQLException e) {
   e.printStackTrace();
}

//3
%>
<section class="client_review section_padding">
   <div class="container">
      <div class="row ">
         <div class="col-xl-12">
            <div class="section_tittle t_center">
               <h2>이용후기</h2>
            </div>
         </div>
      </div>
      <style>
.place_review p {
   font-size: 18px;
   font-weight: 600;
}
</style>
      <div class="row">
         <div class="col-lg-12">
            <div class="client_review_slider owl-carousel">
               <%
               for (ReviewBoardVO vo : list) {
               %>

               <div class="single_review_slider">
                  <div class="place_review">
                     <a href="#"><i class="fas fa-star"></i></a> <a href="#"><i
                        class="fas fa-star"></i></a> <a href="#"><i class="fas fa-star"></i></a>
                     <a href="#"><i class="fas fa-star"></i></a> <a href="#"><i
                        class="fas fa-star"></i></a>
                     <a href="<%=request.getContextPath()%>/reviewboards/detail.jsp?no=<%=vo.getNo()%>"><p><%=vo.getTitle()%></p></a>
                  </div>
                  <div class="inside">
                     <p>
                        <a
                           href="<%=request.getContextPath()%>/reviewboards/detail.jsp?no=<%=vo.getNo()%>"><%=vo.getContent()%></a>
                     </p>
                  </div>
                  <a href="<%=request.getContextPath()%>/reviewboards/detail.jsp?no=<%=vo.getNo()%>"><p><%=vo.getName()%></p></a>
               </div>
               <%
               }
               %>
            </div>
         </div>
      </div>
   </div>
</section>
<!--top place end-->

<%
System.out.println("Session email    : " + session.getAttribute("email"));
System.out.println("Session verified : " + session.getAttribute("verified"));
System.out.println("Session userid   : "+session.getAttribute("userid"));
%>
<%@include file="inc/bottom.jsp"%>