<%@page import="common.Utility"%>  
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.sql.SQLException"%>
<%@page import="model.TipBoardVO"%>
<%@page import="java.util.List"%>
<%@page import="model.TipBoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../inc/top.jsp" %>
<%
	
	
	//1
	request.setCharacterEncoding("utf-8");
	String condition=request.getParameter("searchCondition");
	String keyword=request.getParameter("searchKeyword");
		
	//2
	TipBoardDAO dao = new TipBoardDAO();
	
	List<TipBoardVO> list=null;
	try{
		list=dao.selectAll(condition, keyword);
	}catch(SQLException e){
		e.printStackTrace();		
	}
	
	//3
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
	
	if(keyword==null) keyword="";
	
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
	<section class="section_padding">
			<div class="divList container">
				<h2>공지사항</h2>
				<%
					if(keyword!=null && !keyword.isEmpty()){ %>
						<p>검색어 : <%=keyword %>,  <%=list.size() %>건 검색되었습니다. </p>
				<%	} %>
				
			
				<table class="table1"
					 	summary="공지사항게시판에 관한 표로써, 번호, 제목, 작성자, 작성일, 조회수에 대한 정보를 제공합니다.">
					<caption style="display:none;">답변형게시판</caption>
					<colgroup>
						<col style="width:10%;" />
						<col style="width:50%;" />
						<col style="width:15%;" />
						<col style="width:15%;" />
						<col style="width:10%;" />		
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
					  <!--게시판 내용 반복문 시작  -->	
					  <%
					    for(int i=0;i<pageSize ;i++){
					    	if(num<1) break;	
					    
					    	TipBoardVO vo=list.get(curPos++);
							num--;
					   %>	
						<tr>
							<td><%=vo.getNo() %></td>
							<td>
									<!-- 파일이 첨부된 경우 파일이미지 보여주기 -->
									<%=Utility.displayFile(vo.getFileName()) %>
									
									<a href="countUpdate.jsp?no=<%=vo.getNo()%>">
										<!-- 제목이 긴 경우 일부만 보여주기 -->
										<%=Utility.cutString(vo.getTitle(), 35) %>
									</a>
									
									<!-- 24시간 이내의 글인 경우 new 이미지 보여주기 -->
									<%=Utility.displayNew(vo.getRegdate()) %>
									
							</td>
							<td><%=vo.getTitle()%></td>
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
	</section>
<%@include file="../inc/bottom.jsp" %>