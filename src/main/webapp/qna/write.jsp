<%@page import="model.QnAVO"%>
<%@page import="model.QnADAO"%>
<%@page import="model.NoticeDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../inc/top.jsp" %>
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/substyle.css">
<style>
textarea{width:100%; padding:10px; border:1px solid #ccc; border-radius:5px;}
.mt50{margin-top:50px;}
.mb50{margin-bottom:50px;}    
.w100{width:100%;}
.bord_n{border:none;}
.hidden{ display: none; }
</style>
<script type="text/javascript" src="../js/jquery-3.6.0.min.js"></script>
<script src="https://cdn.ckeditor.com/ckeditor5/29.1.0/classic/ckeditor.js"></script>
<script type="text/javascript">
	$(function(){
		$('form[name=frmWrite]').submit(function(){
			$('.infobox').each(function(idx, item){
				if($(this).val().length<1){
					alert($(this).prev().html() + "을 입력하세요");
					$(this).focus();
					event.preventDefault();
					return false;  //each 탈출
				}
			});
		});
		
	});
</script>
<%
	String email = (String)session.getAttribute("email");
	if(email == null) {%>
		<script>
			alert('로그인을 해주세요');
			location.href = '<%=request.getContextPath()%>/sign/signin.jsp';
		</script>
	<%}
	
	String no = request.getParameter("no");
	if(!(no == null) && !(no == "")) {
		QnADAO dao = new QnADAO();
		QnAVO vo = dao.selectByNo(Integer.parseInt(no));
		%> 
		<script type="text/javascript">
			var title = document.getElementById('title');
			var content = document.getElementById('content');
			
			title.innerHTML = '<%=vo.getTitle()%>';
			content.innerHTML = '<%=vo.getContent()%>';
		</script>
		<%
	}
		
%>
<section class="section_padding">
	<div class="container">
	<h2 class="mb50">질문하기</h2>
		<fieldset>
			<form name="frmWrite" action="write_ok.jsp" method="post">
				<input type="hidden" name="" value="<%=no%>"/>
			
				<input type="hidden" name="email" value="<%=email%>">
	            <div class="input_area">
	                <div class="p_input">
	                	<label class="hidden">제목</label>
	                    <input type="text" id="title" name="title" class="t_input w100 infobox infobox" placeholder="제목을 입력하세요">
	                </div>
	            </div>
	            <script src="../ckeditor5/ckeditor.js"></script>
	            <label class="hidden">내용</label>
	            <textarea name="content" id="content" class="infobox"></textarea>
	            <script>
	            	ClassicEditor
	            		.create(document.querySelector('#content'))
	            		.catch(error => {
	            			console.error(error)
	            		});
	            </script>
				<div class="btn_all t_center mt50">
			        <input type="submit" class="mint_btn hover" id="btList" value="글등록" />
			        <a href="list.jsp"><button type="button" class="begie_btn hover">목록</button></a>
		    	</div>
	        </form>
		</fieldset>
	</div>
</section>
<%@include file="../inc/bottom.jsp" %>