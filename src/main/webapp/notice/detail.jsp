<%@page import="model.NoticeVO"%>
<%@page import="model.NoticeDAO"%>  
<%@page import="common.Utility"%>
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
	NoticeDAO dao = new NoticeDAO();
	
	NoticeVO vo=null;
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
		fileInfo=Utility.showFileInfo(vo.getOriginalFileName(), vo.getFileSize());
		downInfo="다운 : " + vo.getDowncount();
	}
%>  
<style>

.divForm{width: 100%; border-top: 1px solid #aac3c3; border-bottom: 1px solid #aac3c3; padding: 20; padding: 20px;}
.divForm ul{width:100%;}
.divForm ul li{padding:10px 5px; border-bottom:1px solid #aac3c3;display:flex;}
.divForm ul li:last-child{border-bottom:0;}
.divForm ul li .sp1{width:28%; display:inline-block; display:inline-flex; align-content:space-around; align-items:stretch; flex-direction:column; flex-wrap:nowrap; justify-content:center;}
.divForm ul li .sp2{width:68%; display:inline-block;}
.c_mint{color:#aac3c3;}   
</style>
	<section class="section_padding">
		<div class="container">
			<h2>글 상세보기</h2>
			<div class="divForm">
				<ul class="mb50">
					<li>
						<span class="sp1">제목</span> <span class="sp2"><%=vo.getTitle() %></span>
					</li>
					<li>
						<span class="sp1">작성자</span> <span class="sp2"><%=vo.getContent()%></span>
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
					<a href='edit.jsp?no=<%=no%>'>수정</a> <span class="c_mint">|</span>
		        	<a href
		='delete.jsp?no=<%=no%>&groupNo=<%=vo.getGroupNo()%>&step=<%=vo.getStep()%>'>
		        	삭제</a><span class="c_mint">|</span>
		        	<a href='list.jsp'>목록</a>			
				</div>
			</div>
		</div>
	</section>

<%@ include file="../inc/bottom.jsp"%>