<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../inc/top.jsp" %>

<style>
	.container{
		width:100%;
		margin:0 auto;
	}
	
	#btn{
		text-align: center;
	}
	
	h2{
		color: grey;
	}
	
	h5{
		color: grey;
		font-style: italic;
	}
</style>

<section class="section_padding">
   <div class="container">
   <h2>글쓰기</h2>
       <!--회원가입 시 입력-->
    <div class="mt20 w1200">
        <form name="writeFrm" method="post" action="">
            <h5>Title</h5>
            <input type="text" style="width:100%" name="title"  class="t_input">
            <div id="editor" name="content"></div>
            <script src="../ckeditor5/ckeditor.js"></script>
            <script>
            	ClassicEditor
            		.create(document.querySelector('#editor'))
            		.catch(error => {
            			console.error(error)
            		});
            </script>
            <br>
            <div id="btn">
            <input type="submit" class="btn_all mint_btn hover" value="등록" >
            <input type="reset" class="btn_all begie_btn hover" value="취소" >
            </div>
        </form>
   </div>
</section> 


<%@ include file="../inc/bottom.jsp" %>