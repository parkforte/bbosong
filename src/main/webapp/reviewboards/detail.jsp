<%@page import="common.ReviewUtil"%>
<%@page import="java.sql.SQLException"%>
<%@page import="model.ReviewBoardVO"%>
<%@page import="model.ReviewBoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../inc/top.jsp" %>
<%
	String no=request.getParameter("no");
	if(no==null || no.isEmpty()){ %>
		<script type="text/javascript">
			alert("잘못된 url입니다.");
			location.href="list.jsp";
		</script>
	<%	return;
	}
	
	ReviewBoardDAO dao = new ReviewBoardDAO();
	
	ReviewBoardVO vo=null;
	try{
		vo=dao.selectByNo(Integer.parseInt(no));
	}catch(SQLException e){
		e.printStackTrace();
	}
	
	//3
	String content=vo.getContent();
	if(content!=null){  
		content=content.replace("\r\n", "<br>");
	}else{
		content="";
	}
	
	String fileInfo="", downInfo="";
	if(vo.getFileName()!=null && !vo.getFileName().isEmpty()){
		fileInfo=ReviewUtil.showFileInfo(vo.getOriginalFileName(), vo.getFileSize());
		downInfo="다운 : " + vo.getDowncount();
	}
	
	String oldFileName=vo.getFileName();	
	if(oldFileName==null) oldFileName="";
%>    

<section class="section_padding">
	<div class="container">
	<h2>글 상세보기</h2>
		<div class="divForm">
			<ul class="mb50">
				<li>
					<span class="sp1">제목</span> <span class="sp2"><%=vo.getTitle() %></span>
				</li>
			<li>
				<span class="sp1">작성자</span> <span class="sp2"><%=vo.getName() %></span>
			</li>
			<li>
				<span class="sp1">등록일</span> <span class="sp2"><%=vo.getRegdate() %></span>
			</li>
			<li>
				<span class="sp1">조회수</span> <span class="sp2"><%=vo.getReadcount() %></span>
			</li>
			<li>
				<span class="sp1">첨부파일</span> 
				<span class="sp2">
					<a href="downCount.jsp?no=<%=no%>&fileName=<%=vo.getFileName()%>">
					<%=fileInfo %></a> 
					<%=downInfo %></span>
			</li>		
			<li>			
				<p class="content"><%=content %></p>
			</li>
			</ul>
			<div class="t_center">
				<a href='edit.jsp?no=<%=no%>'>수정</a> |
	        	<a href
	='delete.jsp?no=<%=no%>&groupNo=<%=vo.getGroupNo()%>&step=<%=vo.getStep()%>&oldFileName=<%=oldFileName%>'>
	        	삭제</a> |
	        	<a href='write.jsp?no=<%=no%>'>답변</a> |        	
	        	<a href='list.jsp'>목록</a>			
			</div>
		</div>
	</div>
</section>
<%@include file="../inc/bottom.jsp" %>