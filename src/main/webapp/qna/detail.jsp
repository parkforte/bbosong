<%@page import="model.QnAVO"%>
<%@page import="model.QnADAO"%>
<%@page import="common.MypageUtil"%>
<%@page import="model.EventBoardVO"%>
<%@page import="model.EventBoardDAO"%>
<%@page import="java.sql.SQLException"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../inc/top.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
<%
	String no_ = request.getParameter("no");
	System.out.println(no_);
	
	if(no_ == null || no_.isEmpty()) {%>
		<script>
			alert('잘못된 접근입니다.');
			location.href = '<%=request.getContextPath()%>/qna/list.jsp';
		</script>
	<%}
	int no = Integer.parseInt(no_);
	
	QnADAO dao = new QnADAO();
	QnAVO vo = new QnAVO();
	
	try{
		vo = dao.selectByNo(no);
	}catch(SQLException e){
		e.printStackTrace();
	}
%>
<script>
	function delete_() {
		if(confirm('정말 삭제하시겠습니까?'))
			location.href = 'delete.jsp?no=<%=no%>';
	}
</script>
</head>
<body>
<section class="section_padding">
  <div class="container">
    <section class="section_padding">
	  <div class="container">
		<h2>글 상세보기</h2>
		<div class="divForm">
			<ul class="mb50">
				<li>
					<span class="sp1">제목</span> <span class="sp2"><%=vo.getTitle() %></span>
				</li>
				<li>
					<span class="sp1">등록일</span> <span class="sp2"><%=MypageUtil.changeFormat(vo.getRegdate()) %></span>
				</li>
				<li>
					<span class="sp1">작성자</span> <span class="sp2"><%=vo.getEmail()%></span>
				</li>
				<li>
					<span class="sp1">조회수</span> <span class="sp2"><%=vo.getReadcount() %></span>
				</li>
				<li>
					<span class="content"><%=vo.getContent()%></span>
				</li>
			</ul>
			<div class="t_center">
			<%if(vo.getEmail().equals(session.getAttribute("email"))) {%>
				<a href="write.jsp?no=<%=no%>" class="a_btn mint_btn hover">수정</a> 
	        	<a href="#" onclick="delete_();"class="a_btn begie_btn hover">삭제</a>
	        	<a href='list.jsp' class="a_btn mint_btn hover">목록</a>
			<%} else {%>
				<a href='list.jsp' class="a_btn mint_btn hover">목록</a>
			<%}%>
			</div>
		</div>
	  </div>
    </section>
  </div>
</section>
</body>
</html>
<%@ include file="../inc/bottom.jsp" %>