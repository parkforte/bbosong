<%@page import="common.ReviewUtil"%>
<%@page import="java.sql.SQLException"%>
<%@page import="model.ReviewBoardVO"%>
<%@page import="java.util.List"%>
<%@page import="model.ReviewBoardService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="inc/top.jsp" %>    
<%
	//1	
	//2
	ReviewBoardService boardService=new ReviewBoardService();
	List<ReviewBoardVO> list=null;
	try{
		list=boardService.selectMainNotice();	
	}catch(SQLException e){
		e.printStackTrace();
	}
	//3
%>
<div class="divNotice">
 	<div>
		<h2>후기 게시판</h2> 
		<span>
			<a href="<%=request.getContextPath()%>/reviewboards/list.jsp"> 
				<p>more</p>
			</a>
		</span>
	</div>
<%-- 	<div>
		<img src="<%=request.getContextPath() %>/images/Line.JPG" 
			class="img1">
	</div>  --%>
	<div>
		<!-- 공지사항 -->
		<table summary="최근 공지사항 6건을 보여주는 표입니다.">			
			<tbody>
				<!-- 반복시작 -->
				<% for(ReviewBoardVO vo : list){ %>
					<tr>
						<td>
								<a href	="<%=request.getContextPath()%>/reviewboards/detail.jsp?no=<%=vo.getNo()%>">
								<%=vo.getContent() %>
							</a>
						</td>
					</tr>
				<%} %>
				<!-- 반복끝 -->
			</tbody>
		</table>
	</div>
</div>
<%@ include file="inc/bottom.jsp" %> 	