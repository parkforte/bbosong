<%@page import="model.AccountVO"%>
<%@page import="model.AccountDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../inc/top.jsp"%>
<script src="<%=request.getContextPath() %>/js/jquery-3.6.0.js"></script>
<script>

	$(function() {

		$('ul.p_tabs li').click(function() {
			var tab_id = $(this).attr('data-tab');

			$('ul.p_tabs li').removeClass('p_on');
			$('.p_cont').removeClass('p_on');

			$(this).addClass('p_on');
			$("#" + tab_id).addClass('p_on');
		});

	});
	/*tab2*/
	$(function() {

		$('ul.p_tabs2 li').click(function() {
			var tab_id2 = $(this).attr('data-tab');

			$('ul.p_tabs2 li').removeClass('p_on2');
			$('.p_cont2').removeClass('p_on2');

			$(this).addClass('p_on2');
			$("#" + tab_id2).addClass('p_on2');
		});

	});

</script>

<script type="text/javascript">
       /*accordion*/
       $(function(){
            // variables
            var accordionBtn = document.querySelectorAll('.accordionTitle');
            var allTexts = document.querySelectorAll('.text');
            var accIcon = document.querySelectorAll('.accIcon');

            // event listener
            accordionBtn.forEach(function (el) {
                el.addEventListener('click', toggleAccordion)
            });

            // function
            function toggleAccordion(el) {
            var targetText = el.currentTarget.nextElementSibling.classList;
            var targetAccIcon = el.currentTarget.children[0];
            var target = el.currentTarget;
            
            if (targetText.contains('show')) {
                targetText.remove('show');
                targetAccIcon.classList.remove('anime');
                target.classList.remove('accordionTitleActive');
            } 
            else {
                accordionBtn.forEach(function (el) {
                    el.classList.remove('accordionTitleActive');
                    
                    allTexts.forEach(function (el) {
                        el.classList.remove('show');
                    })
                    
                    accIcon.forEach(function (el) {
                    el.classList.remove('anime');
                    }) 
                    
                })
                
                    targetText.add('show');
                    target.classList.add('accordionTitleActive');
                    targetAccIcon.classList.add('anime');
            }  
            }
                });
    </script>
<%
	
	
%>
	<section class="section_padding">
		<div class="container">
			<div class="mt20 tabarea">
		        <ul class="p_tabs2">
		            <li class="tab-link p_on2" data-tab="tab-3">회원정보 관리 및 변경</li>
		            <li class="tab-link" data-tab="tab-4">주문내역 확인</li>
		            <li class="tab-link" data-tab="tab-5">쿠폰확인</li>
		        </ul>
		        <div id="tab-3" class="p_cont2 p_on2">
		            <form action="">
		                <div class="input_area">
		                    <div class="p_title">
		                        <label>이메일</label>
		                    </div>
		                    <div class="p_input">
		                        <input type="text" name="email" value="o3o122@naver.com" class="t_input">
		                        <button type="" class="mint_btn hover">이메일 변경</button>
		                    </div>
		                </div>
		                <div class="input_area">
		                    <div class="p_title">
		                        <label>이름</label>
		                    </div>
		                    <div class="p_input">
		                        <input type="text" name="name" value="나혜린" class="t_input" disabled>
		                    </div>
		                </div>
		                <div class="input_area">
		                    <div class="p_title">
		                        <label>닉네임</label>
		                    </div>
		                    <div class="p_input">
		                        <input type="text" name="nickname" value="니니" class="t_input">
		                        <button type="" class="mint_btn hover">닉네임 변경</button>
		                    </div>
		                </div>
		                <div class="input_area">
		                    <div class="p_title">
		                        <label>주소</label>
		                    </div>
		                    <div class="p_input">
		                        <input type="text" name="address" value="반포1동" class="t_input">
		                        <button type="" class="mint_btn hover">배송지 변경</button>
		                    </div>
		                </div>
		                <div class="input_area">
		                    <div class="p_title">
		                        <label>전화번호</label>
		                    </div>
		                    <div class="p_input">
		                        <input type="text" name="address" value="010-0000-0000" class="t_input">
		                    </div>
		                </div>
		                <div class="input_area">
		                    <div class="p_title">
		                        <label>비밀번호</label>
		                    </div>
		                    <div class="p_input">
		                        <div class="pwd_area">
		                            <div>
		                                <label>현재 비밀번호</label><input type="password" name="password" class="t_input dispb mt20 mb10">
		                            </div>
		                            <div>
		                                <label>새 비밀번호</label><input type="password" name="password" class="t_input dispb mt20 mb10">
		                            </div>
		                            <div>
		                                <label>비밀번호 다시 입력</label><input type="password" name="password" class="t_input dispb mt20 mb10">
		                            </div>
		                        </div>
		                        <div class="btn_all mt20">
		                            <button class="mint_btn hover" type="">비밀번호 변경</button>
		                        </div>
		                    </div>
		                </div>
		                <div class="input_area">
		                    <div class="p_title">
		                        <label for="gradeNo">등급번호</label>
		                    </div>
		                    <div class="p_input">
		                        <input type="text" name="gradeNo" value="pure" class="t_input" disabled>
		                    </div>
		                </div>
		                <div class="input_area">
		                    <div class="p_title">
		                        <label for="joindate">회원가입일</label>
		                    </div>
		                    <div class="p_input">
		                        <input type="text" name="joindate" value="2021-05-19" class="t_input" disabled>
		                    </div>
		                </div>
		            </form>
		            <div class="btn_all t_center">
		                <button type="" class="mint_btn hover" >회원정보 수정</button>
		                <button type="" class="begie_btn hover">취소</button>
		            </div>
		        </div>
<%

%>
		        <div id="tab-4" class="p_cont2 w1200">
		            <div class="mt20">
		                <table  class="table1">
		                    <colgroup>
		                        <col width="15%">
		                        <col width="15%">
		                        <col width="20%">
		                        <col width="15%">
		                        <col width="20%">
		                        <col width="*">
		                    </colgroup>
		                    <tr>
		                        <th scope="col">주문번호</th>
		                        <th scope="col">지점번호</th>
		                        <th scope="col">상품정보</th>
		                        <th scope="col">결제금액</th>
		                        <th scope="col">주문날짜</th>
		                        <th scope="col">수거날짜</th>
		                    </tr>
		                    <tr>
		                        <td colspan="6">주문한 내역이 없습니다.</td>
		                    </tr>
		                    <tr>
		                        <td>100-1</td>
		                        <td>02-515-0000</td>
		                        <td>드라이클리닝 (이미지삽입)</td>
		                        <td>12,000 원</td>
		                        <td>2021-11-29</td>
		                        <td>2021-11-31</td>
		                    </tr>
		                </table>
		            </div>
		        </div>
<%

%>
		        <div id="tab-5" class="p_cont2 w1200">
		            <div class="mt20">
		                <ul class="p_tabs">
		                    <li class="tab-link p_on" data-tab="tab-1">쿠폰 등록</li>
		                    <li class="tab-link" data-tab="tab-2">보유쿠폰</li>
		                </ul>
		                <div id="tab-1" class="p_cont p_on">
		                    <h3>쿠폰번호를 입력해주세요.</h3>
		                    <input type="text" class="t_input"><button type="button" class="mint_btn hover">쿠폰등록</button>
		                    <ul class="list_style mt20">
		                        <li>쿠폰 번호는 영문과 숫자로 이루어져 있습니다.</li>
		                         <li>쿠폰에 표기된 유효기간을 꼭 확인해주세요.</li>
		                    </ul>
		                </div>
		                <div id="tab-2" class="p_cont">
		                    <div class="cp_area">
		                        <p>보유쿠폰 : &nbsp;<span class="color_green">0</span>&nbsp; 개</p>
		                   </div>
		                   
		                   <ul class="list_style mt20">
		                       <li>사용유효기간이 지났거나 도래하지 않은 쿠폰은 사용할 수 없습니다.</li>
		                        <li>이미 사용한 쿠폰은 사용 취소하거나 사용 전으로 되돌릴 수 없습니다.</li>
		                   </ul>
		                   <div class="mt20 tb_area">
		                    <table  class="table1">
		                        <colgroup>
		                            <col width="10%">
		                            <col width="20%">
		                            <col width="25%">
		                            <col width="15%">
		                            <col width="15%">
		                            <col width="*">
		                        </colgroup>
		                        <tr>
		                            <th scope="col">NO</th>
		                            <th scope="col">쿠폰번호</th>
		                            <th scope="col">쿠폰이름</th>
		                            <th scope="col">할인금액</th>
		                            <th scope="col">사용기한</th>
		                            <th scope="col">발급번호</th>
		                        </tr>
		                        <tr>
		                            <td colspan="6">사용한 쿠폰이 없습니다.</td>
		                        </tr>
		                    </table>
		                </div>
		                </div>
		            </div>
		        </div>
    		</div>
    		<!-- accordion -->
	        <div class="acc_cont">
	            <ul class="accordion">
		            <li class="item">
		                <h2 class="accordionTitle">세탁을 맡기면 얼마나 걸리나요? <span class="accIcon"></span></h2>
		                <div class="text">선택하신 옵션과 옷의 종류에 따라 다르지만 보통 주문 후 2~3일이 소요됩니다. </div>
		            </li>
		            <li class="item">
		                <h2 class="accordionTitle">근처에 지점이 없으면 서비스를 이용할 수 없나요? <span class="accIcon"></span></h2>
		                <div class="text">현재는 강남점, 서초점, 동작점, 송파점에서만 서비스를 이용할 수 있으며 추후에 지점을 늘려갈 계획입니다.</div>
		            </li>
		            <li class="item">
		                <h2 class="accordionTitle">한번에 맡길 수 있는 옷 수량에 제한이 있나요? <span class="accIcon"></span></h2>
		                <div class="text">옷 수량에는 제한을 두고 있지 않습니다.</div>
		            </li>
		            <li class="item">
		                <h2 class="accordionTitle">세탁 후 받은 옷에 문제가 생기면 어떻게 하나요? <span class="accIcon"></span></h2>
		                <div class="text">기존에 옷에 있던 문제가 아닌 세탁 후에 발생한 문제라는 것이 확인되면 그에 따른 보상을 진행합니다. 하지만 문제가 생기는 경우는 극히 드문 경우이니 안심하시고 이용하시기 바랍니다.</div>
		            </li>
		            <li class="item">
		                <h2 class="accordionTitle">주문 후 배송지를 변경하고 싶으면 어떻게 하나요? <span class="accIcon"></span></h2>
		                <div class="text">현재는 배송지 변경이 불가합니다. 주문 전 신중하게 작성해주시기 바랍니다.</div>
		            </li>
	         	</ul>
		    </div>
		    <!--// accordion -->
		</div>
	</section>

<%@include file="../inc/bottom.jsp"%>