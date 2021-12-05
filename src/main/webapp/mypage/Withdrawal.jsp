<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../inc/top.jsp"%>
<section class="section_padding">
	<div class="container">
		<h2>회원탈퇴</h2>
		<script src="../vendor/jquery/jquery.min.js"></script>
<script type="text/javascript">
   $(function() {
      $('form[name=delete]').submit(function() {
         if($('#exampleInputEmail').val().length < 1) {
            alert("아이디를 입력하세요");
            $(this).focus();
            event.preventDefault();
         } else if ($('#exampleInputPassword').val().length < 1) {
            alert("비밀번호를 입력하세요");
            $(this).focus();
            event.preventDefault();
         } else if ($('#exampleInputPassword2').val().length < 1) {
            alert("비밀번호를 입력하세요");
            $(this).focus();
            event.preventDefault();
         } else if (!$('#customCheck').is(":checked")) {
            alert("동의를 체크하세요");
            return false;
         }else{
            if(confirm("정말로 탈퇴 하시겠습니까?") == true){
               alert("탈퇴 되었습니다");
               return true;
            }else{
               return false;
            }
         }
      });
   }); 
</script>

<!-- 내용추가 -->

<article>
   <!-- branch test -->
   <div class="Withdrawalwrap">
      <div class="p-5" style="text-align: right; width: 45%;">
         <div class="text-center">
            <h1 class="h4 text-gray-900 mb-4">회원 탈퇴</h1>
         </div>
         <form class="user" name="delete" method="post" action="login.jsp">
            <div class="form-group">
               <input type="email" class="form-control form-control-user"
                  id="exampleInputEmail" aria-describedby="emailHelp"
                  placeholder="아이디(이메일) 입력..." name="m_email">
            </div>
            <div class="form-group">
               <input type="password" class="form-control form-control-user"
                  id="exampleInputPassword" placeholder="비밀번호" name="m_pwd">
            </div>
            <div class="form-group">
               <input type="password" class="form-control form-control-user"
                  id="exampleInputPassword2" placeholder="비밀번호 재입력" name="m_pwd">
            </div>
            <div class="form-group">
               <div class="custom-control custom-checkbox small">
                  <span style="color: red; float:left; margin-top:4px;">
                  회원 탈퇴를 했을 경우, 환불 및, 계정복구는 어려울수 있습니다. 동의하십니까?
                  </span>
                  <input type="checkbox" class="custom-control-input"
                     id="customCheck"> <label class="custom-control-label"
                     for="customCheck">동의</label>
               </div>
            </div>
            <a style="width:20%;  background: gray;border-color: gray;"
            class="btn btn-primary btn-user" href ="home.jsp">취소</a>
            <input type="submit" value="확인" style="width:20%"
            class="btn btn-primary btn-user">
         </form>
         <hr>
      </div>

   </div>
</article>
		
	</div>
</section>

<%@ include file="../inc/bottom.jsp"%>