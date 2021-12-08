<%@page import="common.MypageUtil"%>
<%@page import="model.EventBoardVO"%>
<%@page import="model.EventBoardDAO"%>
<%@page import="java.sql.SQLException"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../inc/top.jsp" %>
<%
	String no=request.getParameter("no");
	EventBoardDAO dao=new EventBoardDAO();
	EventBoardVO vo=new EventBoardVO();
	try{
		vo=dao.selectByNo(Integer.parseInt(no));
		System.out.println(vo);
	}catch(SQLException e){
		e.printStackTrace();
	}
%>
<section class="section_padding">
   <div class="container">
   
	<section class="section_padding">
		<div class="container">
			<h2>글 상세보기</h2>
			<div class="divForm">
				<ul class="mb50">
					<li>
						<span class="sp1">제목</span> <span class="sp2"><%=vo.getTitle() %></span>
					</li>
					<li>
						<span class="sp1">등록일</span> <span class="sp2"><%=MypageUtil.changeFormat(vo.getRegdate()) %></span>
					</li>
					<li>
						<span class="sp1">작성자</span> <span class="sp2"><%=MypageUtil.displayStoreName(vo.getEmail())%></span>
					</li>
					<li>
						<span class="sp1">조회수</span> <span class="sp2"><%=vo.getReadcount() %></span>
					</li>
					<li>
						<p class="content"><%=vo.getContent() %></p>
					</li>
				</ul>		
				<div class="t_center">
					<a class="mint_btn hover a_btn" href='#'>수정</a>
		        	<a class="begie_btn hover a_btn" href='#'>삭제</a>
		        	<a class="mint_btn hover a_btn" href='list.jsp'>목록</a>		
				</div>
			</div>
		</div>
	</section>
   
   </div>
</section>


<%@ include file="../inc/bottom.jsp" %>