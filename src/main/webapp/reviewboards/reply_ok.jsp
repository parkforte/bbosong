<%@page import="model.ReviewBoardVO"%>
<%@page import="java.sql.SQLException"%>
<%@page import="model.ReviewBoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>reply_ok.jsp</title>
</head>
<body>
<%
	request.setCharacterEncoding("utf-8");

	String title=request.getParameter("title");
	String name=request.getParameter("name");
	String pwd=request.getParameter("pwd");
	String email=request.getParameter("email");
	String content=request.getParameter("content");
	String groupNo=request.getParameter("groupNo");
	String step=request.getParameter("step");
	String sortNo=request.getParameter("sortNo");

	ReviewBoardDAO dao = new ReviewBoardDAO();
	try{
		ReviewBoardVO vo= new ReviewBoardVO();
		vo.setContent(content);
		vo.setEmail(email);
		vo.setGroupNo(Integer.parseInt(groupNo));
		vo.setName(name);
		vo.setPwd(pwd);
		vo.setSortNo(Integer.parseInt(sortNo));
		vo.setStep(Integer.parseInt(step));
		vo.setTitle(title);
		
		int cnt=dao.reply(vo);

		if(cnt>0){ %>
			<script type="text/javascript">
				alert('답변 등록되었습니다.');
				location.href="list.jsp";
			</script>		
	<%	}else{%>
			<script type="text/javascript">
				alert('답변 등록 실패!');
				history.back();
			</script>
	<%	}
	}catch(SQLException e){
		e.printStackTrace();
	}	
	
%>
</body>
</html>