<%@page import="java.sql.SQLException"%>  
<%@page import="model.TipBoardVO"%>
<%@page import="model.TipBoardDAO"%>
<%@page import="common.TipUtil"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../inc/top.jsp"%>
<%
	//detail.jsp에서 [수정]링크 클릭하면 get방식으로 이동
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
	
	String content=vo.getContent();
	String email=vo.getEmail();
	String oldFileName=vo.getFileName();
	
	if(content==null) content="";
	if(email==null) email="";
	if(oldFileName==null) oldFileName="";
	
%>
	<section class="section_padding">
		<div class="container">
			<h2>글 수정</h2>
			<div class="divForm">
				<form name="frmEdit" method="post" action="edit_ok.jsp"
					enctype="multipart/form-data"> 
					<!-- 수정시 no가 필요하므로 히든 필드에 담아서 넘겨준다 -->
					<input type="hidden" name="no" value="<%=no%>">
					<%-- <input type="text" name="oldFileName" value="<%=oldFileName%>"> --%>
					
				    <fieldset>
				        <ul>
				        	<li>    
				            	<label for="title" class="sp1">제목</label>
				            	<input type="text" id="title" name="title" value="<%=vo.getTitle() %>" class="t_input sp2" />
				        	</li>
					        <li>
					            <label for="upfile" class="sp1">첨부파일</label>
					            <input type="file" id="upfile" name="upfile" />
					        </li>
					        <li>
					        	<label for="content" class="sp1">내용</label>        
					 			<textarea id="content" name="content" rows="12" cols="40" class="sp2"><%=content %></textarea>
					        </li>
				        </ul>
				        <div class="t_center">
				            <input type = "submit" value="수정" class="mint_btn"/>
				            <input type = "Button" value="글목록" onclick="location.href	='list.jsp'" class="begie_btn" />         
				        </div>
					</fieldset>
				</form>    
			</div>
		</div>
	</section>
<%@ include file="../inc/bottom.jsp"%>