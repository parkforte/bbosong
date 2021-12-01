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
</style>
<script type="text/javascript" src="../js/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
	$(function(){
		$('form[name=admin_notice]').submit(function(){
			$('.infobox').each(function(idx, item){
				if($(this).val().length<1){
					alert($(this).prev().html() + "을(를) 입력하세요");
					$(this).focus();
					event.preventDefault();
					return false;  //each 탈출
				}
			});
		});
		
		$('#btList').click(function(){
			location.href='tiplist.jsp';	
		});
		
	});
</script>

<section class="section_padding">
	<div class="container">
	<h2 class="mb50">세탁정보 게시판</h2>
		<fieldset>
			<form name="admin_notice" action="" method="post">
	            <div class="input_area">
	                <div class="p_input">
	                    <input type="text" name="title"  class="t_input w100 infobox">
	                </div>
	            </div>
	            <div id="editor" name="content"></div>
	            <script src="../ckeditor5/ckeditor.js"></script>
	            <script>
	            	ClassicEditor
	            		.create(document.querySelector('#editor'))
	            		.catch(error => {
	            			console.error(error)
	            		});
	            </script>
	        </form>
		</fieldset>
		<div class="btn_all t_center mt50">
	        <input type="submit" class="mint_btn hover" id="btList" value="글등록" />
	        <input type="reset"class="begie_btn hover" value="취소"/>
    	</div>
	</div>
</section>
<%@include file="../inc/bottom.jsp" %>