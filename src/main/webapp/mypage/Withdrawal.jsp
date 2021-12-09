<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../inc/top.jsp"%>
<script src="../js/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
-$(function() {
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
          alert("비밀번호를 재입력하세요");
          $(this).focus();
          event.preventDefault();
       }else if ($('#exampleInputPassword2').val() != $('#exampleInputPassword').val()) {
          alert("두 비밀번호가 다릅니다.");
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
		<div class="Withdrawalwrap pd_side150">
		<h2>회원탈퇴</h2>
      <div class="p_5">
         <div class="text-center">
         </div>
         <form class="user" name="delete" method="post" action="Withdrawal_ok.jsp">
         	<!--agree area-->
		    <div class="mt20">
		        <div>
<textarea class="agree" readonly>
[회원탈퇴 약관]

회원탈퇴 신청 전 안내 사항을 확인 해 주세요.
회원탈퇴를 신청하시면 현재 로그인 된 아이디는 사용하실 수 없습니다.
회원탈퇴를 하더라도, 서비스 약관 및 개인정보 취급방침 동의하에 따라 일정 기간동안 회원 개인정보를 보관합니다.

- 주문 정보
- 상품 구입 및 대금 결제에 관한 기록
- 상품 배송에 관한 기록
- 소비자 불만 또는 처리 과정에 관한 기록
- 게시판 작성 및 사용후기에 관한 기록

</textarea>
	    	</div>
			    </div>  
			    <!--//agree area-->
			    <div class="form-group">
			       <div class="custom-control custom-checkbox small p_box">
			          <span class="w_text">
			          - 탈퇴한 아이디(이메일)는 재사용이 가능하지만, 쿠폰/주문내역 등 입력하신 개인정보는 모두 삭제 처리 됩니다.
			          </span>
			          
			             <div class="ckarea">
						    <label for="customCheck">
						        <input type="checkbox" class="option-input checkbox" id="customCheck" />
						        동의
						    </label>
						</div>
			       </div>
			      </div>
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
			      
			      <div class="t_center">
			       <a class="begie_btn hover a_btn" href ="../index.jsp">취소</a>
			       <input type="submit" value="확인" class="mint_btn hover ">
			      </div>
			   </form>
		 	</div>
		   </div>
		</div>
</section>

<%@ include file="../inc/bottom.jsp"%>