<%@page import="common.ReviewUtil"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.sql.SQLException"%>
<%@page import="model.ReviewBoardVO"%>
<%@page import="java.util.List"%>
<%@page import="model.ReviewBoardDAO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../inc/top.jsp" %>
<%
	request.setCharacterEncoding("utf-8");
	String condition=request.getParameter("searchCondition");
	String keyword=request.getParameter("searchKeyword");

	ReviewBoardDAO dao = new ReviewBoardDAO();
	
	List<ReviewBoardVO> list=null;
	try{
		list=dao.selectAll(condition, keyword);
	}catch(SQLException e){
		e.printStackTrace();		
	}

	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
	
	if(keyword==null) keyword="";

	int currentPage=1;  
	if(request.getParameter("currentPage")!=null){
		currentPage=Integer.parseInt(request.getParameter("currentPage"));
	}
	
	int totalRecord=list.size();
	int pageSize=8; 
	int totalPage=(int)Math.ceil((float)totalRecord/pageSize);
	int blockSize=10;  
	
	int firstPage=currentPage-((currentPage-1)%blockSize); 
	int lastPage=firstPage+ (blockSize-1);

	int curPos=(currentPage-1)*pageSize;

	int num=totalRecord-curPos;
%>

<section class="section_padding">
      <div class="divList container">
		<h2>후기 게시판</h2>
		<%
			if(keyword!=null && !keyword.isEmpty()){ %>
				<p>검색어 : <%=keyword %>,  <%=list.size() %>건 검색되었습니다. </p>
		<%	} %>
		
		<table class="table1"
				summary="후기게시판은 이용하신 고객님들이 자유롭게 작성 가능 합니다.">
			<colgroup>
				<col style="width:10%;" />
				<col style="width:50%;" />
				<col style="width:15%;" />
				<col style="width:15%;" />
				<col style="width:10%;" />		
			</colgroup>
			<thead>
			  <tr style="text-align:center">
			    <th scope="col">번호</th>
			    <th scope="col">제목</th>
			    <th scope="col">작성자</th>
			    <th scope="col">작성일</th>
			    <th scope="col">조회수</th>
			  </tr>
			</thead> 
			<tbody>  
			  <!--게시판 내용 반복문-->	
			  <%
					
			    for(int i=0;i<pageSize ;i++){
			    	if(num<1) break;	
			    
					ReviewBoardVO vo=list.get(curPos++);
					num--;
			   %>	
				<tr  style="text-align:center">
					<td><%=vo.getNo() %></td>
					<td style="text-align:left">
						<%if(vo.getDelFlag().equals("Y")){ %>
							<span style="color:gray">삭제된 글입니다.</span>
						<%}else{ %>
							<!-- 답변글인 경우 단계별로 이미지 보여주기 -->
							<%=ReviewUtil.displayRe(vo.getStep()) %>
							
							<!-- 파일이 첨부된 경우 파일이미지 보여주기 -->
							<%=ReviewUtil.displayFile(vo.getFileName()) %>
							
							<a href="countUpdate.jsp?no=<%=vo.getNo()%>">
								<!-- 제목이 긴 경우 일부만 보여주기 -->
								<%=ReviewUtil.cutString(vo.getTitle(), 19) %>
							</a>					
							<!-- 24시간 이내의 글인 경우 new 이미지 보여주기 -->
							<%=ReviewUtil.displayNew(vo.getRegdate()) %>
						<%} %>	
					</td>
					<td><%=vo.getName() %></td>
					<td><%=sdf.format(vo.getRegdate()) %></td>
					<td><%=vo.getReadcount() %></td>		
				</tr> 
			  <%}//for %>
			  <!--반복처리 끝  -->
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
		            <option value="name" 
		            	<%if("name".equals(condition)){ %>
		            		selected="selected"
		            	<%} %>
		            >작성자</option>
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
</section>

<%@include file="../inc/bottom.jsp" %>

