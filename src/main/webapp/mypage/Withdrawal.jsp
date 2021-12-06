<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../inc/top.jsp"%>
<script src="../js/jquery-3.6.0.min.js"></script>
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
               
               return true;
            }else{
               return false;
            }
         }
      });
   }); 
</script>
<section class="section_padding">
	<div class="container">
		<h2>회원탈퇴</h2>
		<div class="Withdrawalwrap pd_side150">
      <div class="p-5">
         <div class="text-center">
            <h1 class="h4 text-gray-900 mb-4">회원 탈퇴</h1>
         </div>
         <form class="user" name="delete" method="post" action="Withdrawal_ok.jsp">
            <div class="form-group">
               <input type="email" class="form-control form-control-user"
                  id="exampleInputEmail" aria-describedby="emailHelp"
                  placeholder="아이디(이메일) 입력..." name="email">
            </div>
            <div class="form-group">
               <input type="password" class="form-control form-control-user"
                  id="exampleInputPassword" placeholder="비밀번호" name="pw">
            </div>
            <div class="form-group">
               <input type="password" class="form-control form-control-user"
                  id="exampleInputPassword2" placeholder="비밀번호 재입력" name="pw">
            </div>
            <style>
            	.w_text{color: red; float:left; margin-top:4px;}
            	.ckarea{display:inline-block; float:right;}
            	.pd0{padding:0 !important;}
            	.pd_side150{padding:0 150px;}
            </style>
            <div class="form-group">
               <div class="custom-control custom-checkbox small pd0">
                  <span class="w_text">
                  회원 탈퇴를 했을 경우, 환불 및, 계정복구는 어려울수 있습니다. 동의하십니까?
                  </span>
                  
                     <div class="ckarea">
				        <label for="customCheck">
				            <input type="checkbox" class="option-input checkbox" id="customCheck" />
				            동의
				          </label>
				    </div>
               </div>
            </div>
            <div class="t_center">
	            <a class="begie_btn hover a_btn" href ="../index.jsp">취소</a>
	            <input type="submit" value="확인" class="mint_btn hover ">
            </div>
         </form>
         <hr>
      </div>

   </div>
		
		
	</div>
</section>

<%@ include file="../inc/bottom.jsp"%>