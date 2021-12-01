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
			location.href='list.jsp';	
		});
		
	});
</script>

<section class="section_padding">
	<div class="container">
	<h2 class="mb50">공지사항</h2>
		<fieldset>
			<form name="admin_notice" action="" method="post" enctype="multipart/form-data">
	            <div class="input_area">
	                <div class="p_title">
	                    <label for="title">제목</label>
	                </div>
	                <div class="p_input">
	                    <input type="text" name="title"  class="t_input w100 infobox">
	                </div>
	            </div>
	            <div class="input_area">
	                <div class="p_title">
	                    <label for="content">내용</label>
	                </div>
	                <div class="p_input">
 						<textarea id="content" name="content" rows="12" cols="40"></textarea>
	                </div>
	            </div>
	            <div class="input_area">
	                <div class="p_title">
	                    <label for="upfile">첨부파일</label>
	                </div>
	                <div class="p_input">
	                    <input type="file" name="upfile"  class="t_input bord_n " id="upfile">
	                </div>
	            </div>
	        </form>
		</fieldset>
		<div class="btn_all t_center mt50">
	        <button class="mint_btn hover" id="btList">글등록</button>
	        <button class="begie_btn hover">취소</button>
    	</div>
	</div>
</section>
<%@include file="../inc/bottom.jsp" %>