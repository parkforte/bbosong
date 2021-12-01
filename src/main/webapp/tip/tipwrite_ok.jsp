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
	//write.jsp에서 post방식으로 서브밋됨
	//post- 요청 파라미터에 대한 한글 인코딩 처리
	request.setCharacterEncoding("utf-8");

	//1. 요청 파라미터 읽어오기
	String title=request.getParameter("title");
	String name=request.getParameter("name");
	String pwd=request.getParameter("pwd");
	String email=request.getParameter("email");
	String content=request.getParameter("content");
	
	//ip 읽어오기
	String ip=request.getRemoteAddr();
	String ip2=request.getRemoteHost();
	System.out.println("ip="+ip+", ip2="+ip2);
	
	//2. db작업
	TipBoardDAO dao = new TipBoardDAO();
	
	try{
		TipBoardVO vo = new TipBoardVO();
		vo.setContent(content);
		vo.setEmail(email);
		vo.setName(name);
		vo.setPwd(pwd);
		vo.setTitle(title);
		int cnt=dao.insertReBoard(vo);
		
		//3. 결과 처리  
		if(cnt>0){ %>
			<script type="text/javascript">
				alert("글쓰기 처리되었습니다.");
				location.href="tiplist.jsp";
			</script>
	<%  }else{ %>
			<script type="text/javascript">
				alert("글쓰기 실패!");
				history.back();
			</script>			
	<%	}//if
	}catch(SQLException e){
		e.printStackTrace();
	}	
%>
</body>
</html>