<%@page import="common.MypageUtil"%>
<%@page import="java.util.List"%>
<%@page import="model.EventBoardVO"%>
<%@page import="java.sql.SQLException"%>
<%@page import="model.EventBoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../inc/top.jsp"%>

<script type="text/javascript">
$(function(){
	 
	$('#write').hide();
	if(email.equals("bbosong1001@dream.com")){
		$('#write').show();
	}
});
</script>
<!--table style1-->
<style>
th {
	text-align: center;
}

#btn {
	text-align: right;
}

#frm {
	text-align: center;
}
</style>
<%
String email=(String)session.getAttribute("email");
System.out.println(email);
request.setCharacterEncoding("utf-8");
String condition = request.getParameter("searchCondition");
String keyword = request.getParameter("searchKeyword");
if (keyword == null)
	keyword = "";

EventBoardDAO dao = new EventBoardDAO();
List<EventBoardVO> list = null;
try {
	list = dao.selectAll(condition, keyword);
} catch (SQLException e) {
	e.printStackTrace();
}

int currentPage = 1;

if (request.getParameter("currentPage") != null) {
	currentPage = Integer.parseInt(request.getParameter("currentPage"));
}

int totalRecord = list.size();
int pageSize = 5;
int totalPage = (int) Math.ceil((float) totalRecord / pageSize);
int blockSize = 10;

int firstPage = currentPage - ((currentPage - 1) % blockSize);
int lastPage = firstPage + (blockSize - 1);

int curPos = (currentPage - 1) * pageSize;

int num = totalRecord - curPos;
%>
<style>
.text_center{
	text-align: center;
}
</style>
<section class="section_padding">
	<div class="container">
			<div class="container">
				<h2>이벤트</h2>
				<%
				if (keyword != null && !keyword.isEmpty()) {
				%>
				<p>
					검색어 :
					<%=keyword%>,
					<%=list.size()%>건 검색되었습니다.
				</p>
				<%
				}
				%>
				<div class="mt20 tb_area">
					<table class="table1">
						<colgroup>
							<col width="10%">
							<col width="50%">
							<col width="15%">
							<col width="15%">
							<col width="10%">
						</colgroup>
						<thead>
							<tr>
								<th scope="col">번호</th>
								<th scope="col">제목</th>
								<th scope="col">작성자</th>
								<th scope="col">작성일</th>
								<th scope="col">조회수</th>
							</tr>
						</thead>
						<tbody>
							<!-- 반복문시작 -->
							<%
							for (int i = 0; i < pageSize; i++) {
								if (num < 1)
									break;

								EventBoardVO vo = list.get(curPos++);
								num--;
							%>
							<tr>
								<td class="text_center"><%=vo.getNo()%></td>
								<td><a href="countUpdate.jsp?no=<%=vo.getNo()%>"><%=vo.getTitle()%><%=MypageUtil.displayNew(vo.getRegdate()) %></a></td>
								<td class="text_center"><%=MypageUtil.displayStoreName(vo.getEmail())%></td>
								<td class="text_center"><%=MypageUtil.changeFormat(vo.getRegdate())%></td>
								<td class="text_center"><%=vo.getReadcount()%></td>
							</tr>
							<!-- 반복문종료 -->
							<%
							}
							%>
						</tbody>
					</table>
				</div>
			</div>
			<br>
			<div style="text-align: center">
				<%
				if (firstPage > 1) {
				%>
				<a
					href="list.jsp?currentPage=<%=firstPage - 1%>&searchCondition=<%=condition%>&searchKeyword=<%=keyword%>">
					<img src="../images/first.JPG" alt="이전블럭">
				</a>
				<%
				}
				%>

				<%
				for (int i = firstPage; i <= lastPage; i++) {
					if (i > totalPage)
						break;

					if (i == currentPage) {
				%>
				<span
					style="color: blue; font-weight: bold; font-size: 1em; text-align: center">
					<%=i%></span>
				<%
				} else {
				%>
				<a
					href="list.jsp?currentPage=<%=i%>&searchCondition=<%=condition%>&searchKeyword=<%=keyword%>">
					[<%=i%>]
				</a>
				<%
				} //if
				%>
				<%
				} //for
				%>

				<%
				if (lastPage < totalPage) {
				%>
				<a
					href="list.jsp?currentPage=<%=lastPage + 1%>&searchCondition=<%=condition%>&searchKeyword=<%=keyword%>">
					<img src="../images/last.JPG" alt="다음블럭">
				</a>
				<%
				}
				%>


				<div class="divSearch t_center">
					<form name="frmSearch" method="post" action='list.jsp'>
						<span class="select">
						<select name="searchCondition">
							<option value="title" <%if ("title".equals(condition)) {%>
								selected="selected" <%}%>>제목</option>
							<option value="content" <%if ("content".equals(condition)) {%>
								selected="selected" <%}%>>내용</option>
							<option value="name" <%if ("name".equals(condition)) {%>
								selected="selected" <%}%>>작성자</option>
						</select>
						</span>
						 <input type="text" class="t_input" name="searchKeyword" title="검색어입력"
							value="<%=keyword%>"> <input type="submit"
							class="btn_all mint_btn hover" name="submit" value="검색">
					</form>
				</div>

				<div class="btn_all" id="btn">
					<a href="write.jsp"><button class="btn_all mint_btn hover">글쓰기</button></a>
				</div>


		<!--//table style1-->

	</div>
</section>


<%@ include file="../inc/bottom.jsp"%>