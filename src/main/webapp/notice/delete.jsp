<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../inc/top.jsp"%>
<%
	//1
	String no=request.getParameter("no");
	if(no==null || no.isEmpty()){ %>
		<script type="text/javascript">
			alert('잘못된 url입니다.');
			location.href="list.jsp";
		</script>
		
	<%	return;
	}
	
	String step=request.getParameter("step");
	String groupNo=request.getParameter("groupNo");
	
	//2
	
	//3
%>
<script type="text/javascript" src="../js/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
	$(function(){
		$('form[name=frmDelete]').submit(function(){
			if($('#pwd').val().length<1){
				alert('비밀번호를 입력하세요');
				$('#pwd').focus();
				event.preventDefault();
			}else{
				if(!confirm('삭제하시겠습니까?')){
					event.preventDefault();
				}
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
					<input type="hidden" name="groupNo" value="<%=groupNo%>">
					<input type="hidden" name="step" value="<%=step%>">
							<ul>						
						        <li>
						        	<span class="sp"><%=no %>번 글을 삭제하시겠습니까?</span>                        
						        </li>           
						        <li>                      
						            <label for="pwd">비밀번호</label>
						            <input type="password" id="pwd" name="pwd" />   
						        </li>           
					        </ul>
					        <div class="center">
					            <input type ="submit"  value="삭제" />
					            <input type = "Button" value="글목록" 
				                	OnClick="location.href='list.jsp'" />
					        </div>
				    </form>
				</div>
			</div>
	</section>

<%@ include file="../inc/bottom.jsp"%>