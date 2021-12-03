<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>  
<%@ include file="../inc/top.jsp"%>

<script type="text/javascript" src="../js/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
	
</script>
	<section class="section_padding">
		<div class="container">
			<h2>글 삭제</h2>
			<div class="divForm">
				<form name="frmDelete" method="post" action="delete_ok.jsp" >
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