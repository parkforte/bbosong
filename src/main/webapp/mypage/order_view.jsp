<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.sql.SQLException"%>
<%@page import="model.OrderInfoDAO"%>
<%@page import="model.OrderVO"%>
<%@page import="java.util.List"%>
<%@page import="model.OrderDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../inc/top.jsp"%>
<%
	request.setCharacterEncoding("utf-8");
	
	String condition=request.getParameter("searchCondition");
	String keyword=request.getParameter("searchKeyword");
	OrderInfoDAO dao= new OrderInfoDAO();
	
	List<OrderVO> list=null;
	
	try{
	list=dao.selectAll(condition, keyword);
	}catch(SQLException e){
		e.printStackTrace();
	}
	
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
	
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
</script>

<section class="section_padding">
	<div class="container">
		<h2>주문내역확인</h2>
		<%
			if(keyword!=null && !keyword.isEmpty()){
			%>
			<p>검색어 : <%=keyword%>,  <%=list.size()%>건 검색되었습니다. </p>
			<%
			}
		%>
		<div>
           <table class="table1" summary="주문번호, 이메일, 지점번호, 세탁번호, 결제금액, 주문일자, 수거일자, 배송현황, 발급번호로 구성되어있는 주문내역확인테이블 입니다.">
               <colgroup>
                   <col width="12.5%" />
                   <col width="12.5%" />
                   <col width="12.5%" />
                   <col width="12.5%" />
                   <col width="12.5%" />
                   <col width="12.5%" />
                   <col width="12.5%" />
                   <col width="12.5%" />
               </colgroup>
               <thead>
	               <tr>
	                   <th scope="col">주문번호</th>
	                   <th scope="col">이메일</th>
	                   <th scope="col">지점번호</th>
	                   <th scope="col">결제금액</th>
	                   <th scope="col">주문날짜</th>
	                   <th scope="col">수거날짜</th>
	                   <th scope="col">주문상태</th>
	                   <th scope="col">발급번호</th>
	               </tr>
               </thead>
               <tbody>
               		<tr>
	                   <td colspan="9" class="t_center">주문한 내역이 없습니다.</td>
	               </tr>
	               <!--게시판 내용 반복문 시작  -->	
					  <%
						  for(int i=0;i<pageSize ;i++){
		  			    	if(num<1) break;	
		  			    
		  					OrderVO vo=list.get(curPos++);
		  					num--;
					%>	
	               <tr>
	                   <td><%=vo.getOrderNo() %></td>
	                   <td><%=vo.getEmail() %></td>
	                   <td><%=vo.getStoreNo() %></td>
	                   <td><%=vo.getLaundryNo() %></td>
	                   <td><%=vo.getQty() %></td>
	                   <td><%=vo.getOrderDate() %></td>
	                   <td><%=vo.getPickupDate() %></td>
	                   <td><%=vo.getOrderState() %></td>
	                   <td><%=vo.getSerialNo() %></td>
	               </tr>
	               <%}%>
	               <!-- 반복처리 끝 -->
               </tbody>
           </table>
           <div class="divPage t_center mt20 mb20">
					<!-- 페이지 번호 추가 -->		
					<!-- 이전 블럭으로 이동 -->					
					<%	if(firstPage>1){ %>
							<a href
				="list.jsp?currentPage=<%=firstPage-1%>&searchCondition=<%=condition%>&searchKeyword=<%=keyword%>">
								<img src="../images/first.JPG" alt="이전블럭">
							</a>	
					<%	}	%>					
										
					<!-- [1][2][3][4][5][6][7][8][9][10] -->
					<%
						for(int i=firstPage;i<=lastPage;i++){
							if(i>totalPage) break; 
							
							if(i==currentPage){ 	%>
								<span style="color:blue;font-weight: bold;font-size: 1em">
									<%=i %></span>
							<%}else{ %>
								<a href
				="list.jsp?currentPage=<%=i%>&searchCondition=<%=condition%>&searchKeyword=<%=keyword%>">
									[<%=i %>]</a>			
							<%}//if %>
					<%	}//for 	%>
					
					<!-- 다음 블럭으로 이동 -->					
					<%	if(lastPage < totalPage){ %>
							<a href
				="list.jsp?currentPage=<%=lastPage+1%>&searchCondition=<%=condition%>&searchKeyword=<%=keyword%>">
								<img src="../images/last.JPG" alt="다음블럭">
							</a>	
					<%	}	%>					
					<!--  페이지 번호 끝 -->	
				</div>
				<div class="divSearch t_center">
				   	<form name="frmSearch" method="post" action='list.jsp'>
				        <span class="select">
					        <select name="searchCondition">
					            <option value="title" 
					            	<%if("title".equals(condition)){ %>
					            		selected="selected"
					            	<%} %>
					            >제목</option>
					            <option value="content" 
					            	<%if("content".equals(condition)){ %>
					            		selected="selected"
					            	<%} %>
					            >내용</option>
					        </select>  
				        </span> 
				        <input type="text" name="searchKeyword" title="검색어 입력"
				        	value="<%=keyword%>" class="t_input">   
						<input type="submit" value="검색" class="mint_btn hover">
				    </form>
				</div>
			
				<div class="divBtn t_right mt20 mb20">
				    <a href='write.jsp' class="mint_btn a_btn hover">글쓰기</a>
				</div>
         </div>
        </div>
	</div>
</section>
<%@ include file="../inc/bottom.jsp"%>