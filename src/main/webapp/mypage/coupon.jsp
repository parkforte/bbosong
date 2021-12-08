<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.sql.SQLException"%>
<%@page import="model.CouponVO"%>
<%@page import="java.util.List"%>
<%@page import="model.CouponDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../inc/top.jsp"%>
<%
	request.setCharacterEncoding("utf-8");
	String email=(String)session.getAttribute("email");
	CouponDAO dao= new CouponDAO();
	
	List<CouponVO> list=null;
	
	try{
	list=dao.showAllCoupon(email);
	}catch(SQLException e){
		e.printStackTrace();
	}
	SimpleDateFormat sdf = new SimpleDateFormat();
	
	//페이징 처리
		int currentPage=1;  //현재 페이지
		
		//list.jsp?currentPage=2
		if(request.getParameter("currentPage")!=null){
			currentPage=Integer.parseInt(request.getParameter("currentPage"));
		}
		
		//현재 페이지와 무관한 변수
		int totalRecord=list.size();
	    int pageSize=5;
	    int blockSize=10;
	    int curPos=(currentPage-1)*5;
	    int firstPage=currentPage-((currentPage-1)%10);
	    int lastPage=firstPage+blockSize-1;
	    int totalPage=(int)Math.ceil((double)totalRecord/pageSize);
	    int num=totalRecord-curPos;
%>
<script src="<%=request.getContextPath() %>/js/jquery-3.6.0.js"></script>
<script>

	$(function() {

		$('ul.p_tabs li').click(function() {
			var tab_id = $(this).attr('data-tab');

			$('ul.p_tabs li').removeClass('p_on');
			$('.p_cont').removeClass('p_on');

			$(this).addClass('p_on');
			$("#" + tab_id).addClass('p_on');
		});

	});
	/*tab2*/
	$(function() {

		$('ul.p_tabs2 li').click(function() {
			var tab_id2 = $(this).attr('data-tab');

			$('ul.p_tabs2 li').removeClass('p_on2');
			$('.p_cont2').removeClass('p_on2');

			$(this).addClass('p_on2');
			$("#" + tab_id2).addClass('p_on2');
		});

	});
	
	$('#c_btn').click(function (){
		$('form[name=coupon]').attr('action','couponList.jsp');
		$('form[name=coupon]').submit();
	});
</script>
<section class="section_padding">
	<div class="container">
		<h2>쿠폰</h2>
        <div class="mt20">
            <ul class="p_tabs">
                <li class="tab-link p_on" data-tab="tab-1">쿠폰 등록</li>
                <li class="tab-link" data-tab="tab-2">보유쿠폰</li>
            </ul>
            <form id="tab-1" class="p_cont p_on" name="coupon" action="couponOk.jsp" method="post">
                <h3>쿠폰번호 입력해주세요.</h3>
                <input type="text" class="t_input" name="serialno">
                <button type="submit" class="mint_btn hover" id="c_btn">쿠폰등록</button>
                <ul class="list_style mt20">
                    <li>쿠폰 번호는 영문과 숫자로 이루어져 있습니다.</li>
                     <li>쿠폰에 표기된 유효기간을 꼭 확인해주세요.</li>
                </ul>
            </form>
          <div id="tab-2" class="p_cont">
              <div class="cp_area">
                  <p>보유쿠폰 : &nbsp;<span class="color_green">0</span>&nbsp; 개</p>
             </div>
             
             <ul class="list_style mt20">
                 <li>사용유효기간이 지났거나 도래하지 않은 쿠폰은 사용할 수 없습니다.</li>
                  <li>이미 사용한 쿠폰은 사용 취소하거나 사용 전으로 되돌릴 수 없습니다.</li>
             </ul>
             <div class="mt20 tb_area">
               <table  class="table1">
                   <colgroup>
                       <col width="25%">
                       <col width="25%">
                       <col width="25%">
                       <col width="25%">
                   </colgroup>
                   <tr>
                       <th scope="col">쿠폰번호</th>
                       <th scope="col">쿠폰이름</th>
                       <th scope="col">할인금액</th>
                       <th scope="col">사용기한</th>
                   </tr>
                   <!-- <tr>
                       <td colspan="4">사용한 쿠폰이 없습니다.</td>
                   </tr> -->
                   <!-- 게시판 내용 반복 시작-->
                   <%
                   	for(int i=0; i<pageSize; i++){
                   		if(num<1)break;
                   		
                   		CouponVO vo=list.get(i);
                   		num--;
                  	%>
                  	<tr>
                  		<td><%=vo.getSerialno() %></td>
                  		<td><%=vo.getCouponname() %></td>
                  		<td><%=vo.getDiscount() %>%</td>
                  		<td><%=sdf.format(vo.getExpire()) %></td>
                  	</tr>
                  	<%}//for%>
                   
                <!--// 게시판 내용 반복 끝-->
               </table>
              </div>
          </div>
        	 <div class="t_center">
  				<a href="mypageMain.jsp" class="btn_1">마이페이지</a>
  			</div>
    	</div>
	</div>
</section>
<%@include file="../inc/bottom.jsp"%>