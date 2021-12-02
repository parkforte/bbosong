<%@page import="model.NoticeDAO"%>  
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../inc/top.jsp" %>
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
          
        //1. editor의 값을 잡아온다
        var content = $('#editor').val(); // 1. 데이터잡는 값인지는 제쪽에서 확인이 안되요 ㅠㅠ
        //2. input name="content에 넣는다"
        $("#content").val(content);
        
        //3.form 태그의 action값을 list.jsp로 넣는다
        $('form[type=admin_notice]').attr('action','list.jsp');
         
         //4. 서브밋
         $('form[name=admin_notice]').submit();


         //location.href='list.jsp';   
	   });
      
   });
</script>

<section class="section_padding">
   <div class="container">
   <h2 class="mb50">공지사항</h2>
      <fieldset>
         <form name="admin_notice" action="write_ok.jsp" method="post" enctype="multipart/form-data">
            <input type="text" id="email" name="email" value="bbosong1001@dream.com"> 
               <!-- <div class="input_area">
               	   <div class="p_title">비밀번호</div>
                   <div class="p_input">
                       <input type="text" name="title"  class="t_input w100 infobox">
                   </div>
               </div>  -->   
               <div class="input_area">
                   <div class="p_input2">
                       <input type="text" name="title"  class="t_input w100 infobox">
                   </div>
               </div>
               <script src="../ckeditor5/ckeditor.js"></script>
	            <textarea name="content" id="content"></textarea>
	            <script>
	            	ClassicEditor
	            		.create(document.querySelector('#content'))
	            		.catch(error => {
	            			console.error(error)
	            		});
	            </script>
           </form>
      </fieldset>
      <div class="btn_all t_center mt50">
           <input type="submit" class="mint_btn hover" id="btList" value="글등록" />
           <input type = "Button" value="글목록" class="begie_btn hover" onclick="location.href='list.jsp'" value="취소"/>
       </div>
   </div>
</section>
<%@include file="../inc/bottom.jsp" %>