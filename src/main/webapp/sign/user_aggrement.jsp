<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../inc/top.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	window.onload = function() {
		var btn = document.getElementById('next');
		var agree = document.getElementById('agree');
		
		btn.addEventListener('click', function() {
			if(agree.checked)
				location.href = 'signup.jsp';
			else
				alert('약관에 동의를 하셔야만 가입하실수 있습니다.');
		});	
	}
</script>
</head>
<body>
<section class="section_padding">
	<div class="container">
	    <!--agree area-->
	    <h1>회원약관</h1>
	    <div class="mt20" style="width:900px;">
	        <div class="text_area" style="text-align: center;">
				<textarea class="agree" style="height: 20em" readonly>
	제 1 조 (목적)
	이 약관은 네이버 주식회사 (이하 “회사”)가 제공하는 위치정보사업 또는 위치기반서비스사업과 관련하여 회사와
	개인위치정보주체와의 권리, 의무 및 책임사항, 기타 필요한 사항을 규정함을 목적으로 합니다.
	
	
	제 2 조 (약관 외 준칙)
	이 약관에 명시되지 않은 사항은 위치정보의 보호 및 이용 등에 관한 법률, 정보통신망 이용촉진 및 정보보호 
	등에 관한 법률, 전기통신기본법, 전기통신사업법 등 관계법령과 회사의 이용약관 및 개인정보취급방침, 
	회사가 별도로 정한 지침 등에 의합니다.
	
	
	제 3 조 (서비스 내용 및 요금)
	
	①회사는 직접 위치정보를 수집하거나 위치정보사업자인 이동통신사로부터 위치정보를 전달받아 아래와 같은 
	위치기반서비스를 제공합니다. 1.Geo Tagging 서비스: 게시글 등록 시점의 개인위치정보주체의 위치정보를 
	게시글과 함께 저장합니다.
	
	2.위치정보를 활용한 검색결과 제공 서비스: 정보 검색을 요청하거나 개인위치정보주체 또는 이동성 있는 
	기기의 위치정보를 제공 시 본 위치정보를 이용한 검색결과 및 주변결과(맛집, 주변업체, 교통수단 등)를
	제시합니다.
	
	3.위치정보를 활용한 친구찾기 및 친구맺기: 현재 위치를 활용하여 친구를 찾아주거나 친구를 추천하여 줍니다.
	
	4.연락처 교환하기: 위치정보를 활용하여 친구와 연락처를 교환할 수 있습니다.
	
	5.현재 위치를 활용한 광고정보 제공 서비스: 광고정보 제공 요청 시 개인위치정보주체의 현 위치를 이용하여 
	광고소재를 제시합니다.
	
	6. 이용자 보호 및 부정 이용 방지: 개인위치정보주체 또는 이동성 있는 기기의 위치를 이용하여 권한없는 자의
	비정상적인 서비스 이용 시도 등을 차단합니다.
				</textarea>
			    <div class="t_right mt20">
			        <label>
			            <input id="agree" type="checkbox" class="option-input checkbox" />
			            약관동의
			        </label>
			    </div>
			    <div class="btn_all t_center">
		       	 	<button id="next" class="mint_btn hover">다음</button>
				</div>
	        </div>
	    </div>
    </div>
</section>
</body>
</html>
<%@ include file="../inc/bottom.jsp" %>