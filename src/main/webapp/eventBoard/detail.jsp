<%@page import="model.EventBoardVO"%>
<%@page import="model.EventBoardDAO"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="common.MypageUtil"%>
<%@page import="java.sql.SQLException"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../inc/top.jsp"%>
<%  
	String no=request.getParameter("no");
	String email=(String)session.getAttribute("email");
	SimpleDateFormat sdf = new SimpleDateFormat();
	if(no==null || no.isEmpty()){
%>
		<script type="text/javascript">
			alert("잘못된 url입니다.");
			location.href="list.jsp";
		</script>
	<%
	}
		EventBoardDAO dao=new EventBoardDAO();
		EventBoardVO vo=null;
		try{
			vo=dao.selectByNo(Integer.parseInt(no));
		}catch(SQLException e){
			e.printStackTrace();
		}
		
		String content=vo.getContent();
		/* if(content!=null){  
			content=content.replace("\r\n", "<br>");
		}else{
			content="";
		} */
			
	%> 
<script src="../js/jquery-3.6.0.min.js"></script> 
<script>
	/* $(function(){
		 
			$('#write').hide();
			if(session.getAttribute("email") == "bbosong1001@dream.com"){
				$('#write').show();
			}
	}); */
	$(function(){
		if(email.equals("bbosong1001@dream.com")){
			$('#edit').show();
			$('#delete').show();
		}
	});
	
	
</script>
	<section class="section_padding">
		<div class="container">
			<h2>글 상세보기</h2>
			<div class="divForm">
				<ul class="mb50">
					<li>
						<span class="sp1">제목</span> <span class="sp2"><%=vo.getTitle() %></span>
					</li>
					<li>
						<span class="sp1">등록일</span> <span class="sp2"><%=sdf.format(vo.getRegdate()) %></span>
					</li>
					<li>
						<span class="sp1">조회수</span> <span class="sp2"><%=vo.getReadcount() %></span>
					</li>
					<li>
						<p class="content">
						<%=content%>
						</p>
					</li>
				</ul>		
				<div class="t_center">
					<a id="edit" class="mint_btn hover a_btn" href='edit.jsp?no=<%=no%>'>수정</a>
		        	<a id="delete" class="begie_btn hover a_btn" href='delete.jsp?no=<%=no%>'>삭제</a>
		        	<a class="mint_btn hover a_btn" href='list.jsp'>목록</a>			
				</div>
			</div>
		</div>
	</section>

<%@ include file="../inc/bottom.jsp"%>