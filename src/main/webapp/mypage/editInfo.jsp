<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../inc/top.jsp"%>
<section class="section_padding">
	<div class="container">
		<h2>내정보 수정</h2>
		<div>
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
	</div>
</section>
<%@include file="../inc/bottom.jsp"%>