<%@page import="model.TipBoardVO"%>
<%@page import="model.TipBoardDAO"%>  
<%@page import="common.TipUtil"%>
<%@page import="java.sql.SQLException"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../inc/top.jsp"%>
<%
	//countUpdate.jsp에서 조회수 증가 성공하면 get방식으로 이동
	//=> http://localhost:9090/herbmall/reBoard/detail.jsp?no=3
	//1
	String no=request.getParameter("no");
	if(no==null || no.isEmpty()){ %>
		<script type="text/javascript">
			alert("잘못된 url입니다.");
			location.href="list.jsp";
		</script>
	<%	return;
	}
	
	//2
	TipBoardDAO dao = new TipBoardDAO();
	
	TipBoardVO vo=null;
	try{
		vo=dao.selectByNo(Integer.parseInt(no));
	}catch(SQLException e){
		e.printStackTrace();
	}
	
	//3
	String content=vo.getContent();
	if(content!=null){  //내용 줄바꿈 처리, \r\n => <br>
		content=content.replace("\r\n", "<br>");
	}else{
		content="";
	}
	
	String fileInfo="", downInfo="";
	if(vo.getFileName()!=null && !vo.getFileName().isEmpty()){
		fileInfo=TipUtil.showFileInfo(vo.getOriginalFileName(), vo.getFileSize());
		downInfo="다운 : " + vo.getDowncount();
	}
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
					<a href='edit.jsp?no=<%=no%>' class="mint_btn hover a_btn">수정</a> <span class="c_mint">|</span>
		        	<a href='delete.jsp?no=<%=no%>' class="begie_btn hover a_btn">
		        	삭제</a><span class="c_mint">|</span>
		        	<a href='list.jsp'class="mint_btn hover a_btn">목록</a>			
				</div>
			</div>
		</div>
	</section>

<%@ include file="../inc/bottom.jsp"%>