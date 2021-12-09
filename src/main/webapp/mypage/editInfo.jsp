<%@page import="java.sql.SQLException"%>
<%@page import="model.InfoEditDAO"%>
<%@page import="model.AccountVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../inc/top.jsp"%>
<%
	String email =(String)session.getAttribute("email");
	AccountVO vo = null;
	InfoEditDAO dao = new InfoEditDAO();
	try{
	vo=dao.selectByEmail(email);
	
	email=vo.getEmail();
	String name=vo.getName();
	
	
	}catch(SQLException e){
		e.printStackTrace();
	}
	String [] addressSp = vo.getAddress().split("\\|");
	String asArr1 = addressSp[0];
	String asArr2 = addressSp[1];
	String asArr3 = addressSp[2];
		// 비로그인시 메인으로 리다이렉트
%>
<style>
.valid { border: solid 2px green; }
.invalid { border: solid 2px red; }
.invalidText { color: red; }
</style>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript" src="../js/daumPostCode.js"></script>
<script src="<%=request.getContextPath() %>/js/jquery-3.6.0.js"></script>
<script type="text/javascript">
 	$(function() {
		make_select();
		var checkedEmail = false;
		var checkedpw1 = false;
		var checkedpw2 = false;
		
		$('#editform').submit(function(e) {
			/* if(!checkedEmail) {
				alert('이메일을 확인해주세요');
				$('#email').focus();
				e.preventDefault();
				e.stopPropagation()
				return;
			}
			 */
			/* if(!checkedpw1) {
				alert('비밀번호를 확인해주세요');
				$('#pw1').focus();
				e.preventDefault();
				e.stopPropagation();
				return;
			}
			
			if(!checkedpw2) {
				alert('비밀번호를 확인해주세요');
				$('#pw2').focus();
				e.preventDefault();
				e.stopPropagation();
				return;
			} */
			
			$('#sample6_postcode').attr('disabled', false);
			$('#sample6_address').attr('disabled', false);
			console.log($('#sample6_postcode').attr('disabled'));
			console.log($('#sample6_address').attr('disabled'));
		});
	
		<%-- <%-- $('#email').on('blur', function() {
			var valEmail = $('#email').val();	
			if(!is_validate_email(valEmail)) {
				$('#email').next().html('이메일 형식이 잘못되었습니다.');
				changeInvalid($('#email'));
				return;
			} 
				
			var request = $.ajax({
			url: "<%=request.getContextPath() %>/CheckEmail", //통신할 url
			method: "POST",
			data: { email : valEmail }, //전송할 데이타
			dataType: "json"
		});	 --%> 
		
		 /* request.done(function( data ) {
			if(data.result){
				$('#email').next().html('사용할 수 없는 이메일 입니다.');
				changeInvalid($('#email'));
				checkedEmail = false;
			} else{
				changeValid($('#email'));
				$('#emailNotice').removeClass('invalidText');
				$('#emailNotice').addClass('validText');
				checkedEmail = true;
			}	
		});	 
		request.fail(function( jqXHR, textStatus ) {
		  alert( "Request failed: " + textStatus );
		});	
		}); */
		
	$('#pw1').on('blur', function() {
		if(!is_validate_pw($('#pw1').val())) {
			changeInvalid($('#pw1'));
			$('#pw1').next().html('비밀번호는 최소 1개의 영문자, 숫자, 특수문자가 포함되어야 합니다.');
			checkedpw1 = false;
		} else {
			changeValid($('#pw1'));
			checkedpw1 = true;
		}
		
	});
	
	$('#pw2').on('blur', function() {
		if($('#pw1').val() !== $('#pw2').val()) {
			changeInvalid($('#pw2'));
			$('#pw2').next().html('비밀번호 확인이 일치하지 않습니다');
			checkedpw2 = false;
		} else {
			changeValid($('#pw2'));
			checkedpw2 = true;
		}
		
	});
	
	function changeValid(target) {
		target.removeClass('invalid');
		target.addClass('valid');
		target.next().html('');
	}
	
	function changeInvalid(target) {
		target.removeClass('valid');
		target.addClass('invalid');
	}
	
	/* function is_validate_email(email) {
		const pattern = new RegExp(/^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i);
		return pattern.test(email);
	} */
	
	function is_validate_pw(pw) {
		const pattern = new RegExp(/^(?=.*[A-Za-z])(?=.*\d)(?=.*[$@$!%*#?&])[\da-zA-Z$@$!%*#?&]{8,}/g);
		return pattern.test(pw);
	}
	
	function make_select() {
			var now = new Date(); 
	 		var year = now.getFullYear(); 
	 		var mon = (now.getMonth() + 1) > 9 ? ''+(now.getMonth() + 1) : '0'+(now.getMonth() + 1); 
	 		var day = (now.getDate()) > 9 ? ''+(now.getDate()) : '0'+(now.getDate()); //년도 selectbox만들기
	 		
	 		for(var i = 1900 ; i <= year ; i++) { 
	 			$('#year').append('<option value="' + i + '">' + i + '년</option>'); 
	 		} // 월별 selectbox 만들기 
	 		for(var i=1; i <= 12; i++) { 
	 			var mm = i > 9 ? i : "0"+i; 
	 			$('#month').append('<option value="' + mm + '">' + mm + '월</option>'); 
	 		} // 일별 selectbox 만들기 
	 		for(var i=1; i <= 31; i++) { 
	 			var dd = i > 9 ? i : "0"+i; 
	 			$('#day').append('<option value="' + dd + '">' + dd+ '일</option>'); 
	 		}
	 		
	 		$("#year > option[value="+year+"]").attr("selected", "true"); 
	 		$("#month > option[value="+mon+"]").attr("selected", "true"); 
	 		$("#day > option[value="+day+"]").attr("selected", "true");
		}
	});
</script>
<script>
function back(){
	history.back(-1);
}
</script>
<style>
select{padding:10px 20px; border-radius: 5px; outline: none; cursor: pointer; border:1px solid #ccc;}
option:checked{background:#aac3c3 !important;}
</style>
<section class="section_padding">
	<div class="container">
		<h2>내정보 수정</h2>
		<div>
            <form id="editform" name="update" action="editInfo_ok.jsp" method="post">
		        <div class="input_area">
		            <div class="p_title">
		                <label>이름</label>
		            </div>
		            <div class="p_input">
		                <input id="name" type="text" name="name" placeholder="<%=vo.getName()%>" class="t_input" required="required" disabled="disabled">
		            </div>
		        </div>
		        <div class="input_area">
		            <div class="p_title">
		                <label>이메일</label>
		            </div>
		            <div class="p_input">
		                <input id="email" type="email" name="email" class="t_input" placeholder="<%=session.getAttribute("email") %>" required="required" disabled="disabled"><span class="invalidText"></span>
		            </div>
		        </div>
		        
		        <div class="input_area">
		            <div class="p_title">
		                <label>비밀번호</label>
		            </div>
		            <div class="p_input">
		                <input id="pw1" type="password" name="pw1" class="t_input" /><span class="invalidText"></span>
		            </div>
		        </div>
		        <div class="input_area">
		            <div class="p_title">
		                <label>비밀번호 확인</label>
		            </div>
		            <div class="p_input">
		                <input id="pw2" type="password" name="pw2" class="t_input" /><span class="invalidText"></span>
		            </div>
		        </div>
		        <div class="input_area">
		            <div class="p_title">
		                <label>닉네임</label>
		            </div>
		            <div class="p_input">
		                <input id="nickname" type="text" name="nickname" placeholder="<%=vo.getNickname() %>" class="t_input"/>
		            </div>
		        </div>
		        <div class="input_area">
		            <div class="p_title">
		                <label>생년월일</label>
		            </div>
		            <div class="p_input">
		                <select id="year" name="yy" class="select"></select>&nbsp; 년 &nbsp;
						<select id="month" name="mm" class="select"></select>&nbsp; 월 &nbsp;
						<select id="day" name="dd" class="select"></select>&nbsp; 일 &nbsp;
		            </div>
		        </div>
		        <div class="input_area">
		            <div class="p_title">
		                <label>주소</label>
		            </div>
		            <div class="p_input">
		                <input id="sample6_postcode" type="text" name="postcode1" class="t_input"  value="<%=asArr1 %>"  disabled="disabled" />
						<button type="button"  class="mint_btn hover" onclick="sample6_execDaumPostcode()">우편번호찾기</button><br>
						<input id="sample6_address" type="text" name="address_1" value="<%=asArr2 %>" required="required" disabled="disabled" class="t_input mt20"/>
						<input id="sample6_detailAddress" type="text" name="detailAddress1" placeholder="<%=asArr3 %>" class="t_input mt20"/>
		            </div>
		        </div>
		        <div class="input_area">
		            <div class="p_title">
		                <label>전화번호</label>
		            </div>
		            <div class="p_input">
		                <input type="text" name="tel" value="<%=vo.getTel() %>" class="t_input" />
		            </div>
		        </div>
		        
		    
            <div class="btn_all t_center">
                <button type="submit" class="mint_btn hover" id="infoedit_btn">회원정보 수정</button>
                <button type="button" class="begie_btn hover" onclick="back()">취소</button>
            </div>
            </form>
        </div>
	</div>
</section>
<%@include file="../inc/bottom.jsp"%>