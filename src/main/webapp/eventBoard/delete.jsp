<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>  
<%@ include file="../inc/top.jsp"%>
<%  
	String no=request.getParameter("no");
	if(no==null || no.isEmpty()){ %>
		<script type="text/javascript">
			alert('잘못된 url입니다.');
			location.href="list.jsp";
		</script>
		
	<%	return;
	}
%>
<script type="text/javascript" src="../js/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
	$(function(){
		$('form[name=frmDelete]').submit(function(){
				if(!confirm('삭제하시겠습니까?')){
					event.preventDefault();
				}
		});
	});	
</script>
	<section class="section_padding">
		<div class="container">
			<h2>글 삭제</h2>
			<div class="divForm">
				<form name="frmDelete" method="post" action="delete_ok.jsp" >
					<input type="hidden" name="no" value="<%=no%>">
							<ul>						
						        <li>
						        	<span class="sp"><%=no %>번 글을 삭제하시겠습니까?</span>                        
						        </li>           
						             
					        </ul>
					        <div class="center">
					            <input type ="submit" class="mint_btn hover" value="삭제" />
					            <input type = "Button" class="begie_btn hover" value="글목록" 
				                	OnClick="location.href='list.jsp'" />
					        </div>
				    </form>
				</div>
			</div>
	</section>

<%@ include file="../inc/bottom.jsp"%>