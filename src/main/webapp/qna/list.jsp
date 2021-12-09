<%@page import="util.PagingVO"%>
<%@page import="util.BoardUtil"%>
<%@page import="model.QnAVO"%>
<%@page import="model.QnADAO"%>
<%@page import="common.MypageUtil"%>
<%@page import="java.util.List"%>
<%@page import="model.EventBoardVO"%>
<%@page import="java.sql.SQLException"%>
<%@page import="model.EventBoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../inc/top.jsp" %>

  <!--table style1-->
<style>
	th{ text-align: center; }
	#btn{ text-align: right; }
	#frm{ text-align: center; }
	
	#serchForm img { 
		width: 20px; height: 20px;
		background: none;
		border: none;
	}
	
	#paging { font-size: 1.2em }
	
	
	td:not(#title) {
	text-align: center; 		
	}
</style>
<%
	String searchType = request.getParameter("searchType");
	String keyword = request.getParameter("keyword");
	
	QnADAO dao = new QnADAO();
	List<QnAVO> list = null;
	
	try{
		list = dao.selectAll();
	}catch(SQLException e){
		e.printStackTrace();
	}
	
	int currentPage = 1;
	if(request.getParameter("currentPage")!=null){
		currentPage=Integer.parseInt(request.getParameter("currentPage"));
	}
	
	int totalRecord = list.size();
	int pageSize = 10; 
	int blockSize = 10;
	
	PagingVO pg = new PagingVO(currentPage, totalRecord, pageSize, blockSize);
	int totalPage = pg.getTotalPage();
	int firstPage = pg.getFirstPage();
	int lastPage = pg.getLastPage();
	int curPos = pg.getCurPos();
	int num = pg.getNum();
%>
	<section class="section_padding">
		<div class="container">
			<h2>Q&A</h2>
			<br>
			<div class="mt20 tb_area">
		        <table  class="table1">
		            <colgroup>
		                <col width="10%">
		                <col width="50%">
		                <col width="10%">
		                <col width="20%">
		                <col width="10%">
		            </colgroup>
		            <thead>
		            <tr> 
		                <th scope="col">번호</th>
		                <th scope="col">제목</th>
		                <th scope="col">작성자</th>
		                <th scope="col">작성일</th>
		                <th scope="col">조회수</th>
		            </tr>
		            </thead>
		            <tbody>
		            <!-- 반복문시작 -->
		            <%
		            	for(int i=0; i<pageSize; i++){
		            		if(num<1) break;	
		            	    
		        			QnAVO vo = list.get(curPos++);
		        			num--;
		            	
		           	%>
		            <tr>
		                <td><%=vo.getNo()%></td>
		                <td id="title">
		                	<a href="countUpdate.jsp?no=<%=vo.getNo()%>">
			                	<%=BoardUtil.displayNew(vo.getRegdate()) %>
			                	<%=vo.getTitle()%>
			                	<%=BoardUtil.displayFile(vo.getFileName()) %>
		                	</a>
		                </td>
		                <td><%=vo.getNickname() %></td>
		                <td><%=BoardUtil.changeFormat(vo.getRegdate()) %></td>
		                <td><%=vo.getReadcount() %></td>
		            </tr>
		            <!-- 반복문종료 -->
		            <%} %>
		            </tbody>
		        </table>
			</div>
		
   
    <div id="paging" align="center">
	<!-- 이전 블럭으로 이동 -->					
	<%	if(firstPage>1){ %>
			<a href
="list.jsp?currentPage=<%=firstPage-1%>&searchCondition=<%=searchType%>&searchKeyword=<%=keyword%>">
				<img src="../img/first.JPG" alt="이전블럭">
			</a>	
	<%	}	%>					
						
	<!-- [1][2][3][4][5][6][7][8][9][10] -->
	<%
		for(int i=firstPage;i<=lastPage;i++){
			if(i>totalPage) break; 
			
			if(i==currentPage){ 	%>
				<b><%=i %></b>
			<%}else{ %>
				<a href
="list.jsp?currentPage=<%=i%>&searchCondition=<%=searchType%>&searchKeyword=<%=keyword%>">
					[<%=i %>]</a>			
			<%}//if %>
	<%	}//for 	%>
	
	<!-- 다음 블럭으로 이동 -->					
	<%	if(lastPage < totalPage){ %>
			<a href
="list.jsp?currentPage=<%=lastPage+1%>&searchCondition=<%=searchType%>&searchKeyword=<%=keyword%>">
				<img src="../img/last.JPG" alt="다음블럭">
			</a>	
	<%	}	%>					
	<!--  페이지 번호 끝 -->	
</div><br>
    
    <!--검색 area-->
    
    <div id="frm">
		<form method="post" id="serchForm" action="list.jsp">
			<input type="text" id="keyword" value="" class="t_input">
			<button type="submit" class="mint_btn hover">검색</button>
	    </form>
    </div>
    <div class="btn_all" id="btn">
    	<a href="write.jsp"><button class="btn_all mint_btn hover">글쓰기</button></a> 
    </div>
    <!--//table style1-->
   </div>
</section>


<%@ include file="../inc/bottom.jsp" %>