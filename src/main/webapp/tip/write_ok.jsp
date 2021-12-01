<%@page import="java.sql.SQLException"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%

	request.setCharacterEncoding("utf-8");

	String title=request.getParameter("title");
	String name=request.getParameter("name");
	String pwd=request.getParameter("pwd");
	String email=request.getParameter("email");
	String content=request.getParameter("content");
	
	
	TipBoardDAO dao = new TipBoardDAO();
	
	try{
		TipBoardVO vo = new TipBoardVO();
		vo.setContent(content);
		vo.setEmail(email);
		vo.setName(name);
		vo.setPwd(pwd);
		vo.setTitle(title);
		int cnt=dao.insertReBoard(vo);
		
		if(cnt>0){ %>
			<script type="text/javascript">
				alert("글쓰기 처리되었습니다.");
				location.href="list.jsp";
			</script>
	<%  }else{ %>
			<script type="text/javascript">
				alert("글쓰기 실패!");
				history.back();
			</script>			
	<%	}
	}catch(SQLException e){
		e.printStackTrace();
	}	
%>
</body>
</html>