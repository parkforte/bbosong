<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../inc/top.jsp" %>

  <!--table style1-->
<style>
 th{
 	text-align: center;
 }
 
 #btn{
 	text-align: right;
 }
 
 #frm{
 	text-align: center;
 }
</style>
<section class="section_padding">
<div class="container">
 <h2>이벤트</h2>
 <br>
 <div class="mt20 tb_area">
        <table  class="table1">
            <colgroup>
                <col width="10%">
                <col width="50%">
                <col width="10%">
                <col width="20%">
                <col width="10%">
            </colgroup>
            <tr> 
                <th scope="col">번호</th>
                <th scope="col">제목</th>
                <th scope="col">작성자</th>
                <th scope="col">작성일</th>
                <th scope="col">조회수</th>
            </tr>
            <tr>
                <td>내용1</td>
                <td>내용2</td>
                <td>내용3</td>
                <td>내용4</td>
                <td>내용5</td>
            </tr>
        </table>
    </div>
    <br>
    <!-- 페이징처리 -->
    
    
    <!--검색 area-->
    
    <div id="frm">
	<form method="post" id="serchForm" action="list.jsp">
	<input type="text" id="keyword" value="">
	<input type="submit" class="btn_all mint_btn hover" name="submit" value="검색">
    </form>
    </div>
    <div class="btn_all" id="btn">
    	<a href="write.jsp"><button class="btn_all mint_btn hover">글쓰기</button></a> 
    	<a href="write.jsp"><button class="btn_all mint_btn hover">수정</button></a> 
    	<a href="write.jsp"><button class="btn_all mint_btn hover">삭제</button></a> 
    </div>
     </section> 

</div>

    <!--//table style1-->
<%@ include file="../inc/bottom.jsp" %>