<%@page import="model.ReviewBoardVO"%>
<%@page import="java.sql.SQLException"%>
<%@page import="model.ReviewBoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>edit_ok.jsp</title>
</head>
<body>
<%
	//edit.jsp에서 post방식으로 서브밋됨
	request.setCharacterEncoding("utf-8");

	//1
	String title=request.getParameter("title");
	String name=request.getParameter("name");
	String pwd=request.getParameter("pwd");
	String email=request.getParameter("email");
	String content=request.getParameter("content");
	String no=request.getParameter("no");
	
	//2
	ReviewBoardDAO dao = new ReviewBoardDAO();
	
	try{
		ReviewBoardVO vo = new ReviewBoardVO();
		vo.setContent(content);
		vo.setEmail(email);
		vo.setName(name);
		vo.setNo(Integer.parseInt(no));
		vo.setPwd(pwd);
		vo.setTitle(title);
		
		if(dao.checkPwd(vo)){		
			int cnt=dao.updateReBoard(vo);
			
			//3
			if(cnt>0){ %>
				<script type="text/javascript">
					alert("글 수정되었습니다.");
					location.href="detail.jsp?no=<%=no%>";
				</script>	
		<%	}else{ %>
				<script type="text/javascript">
					alert("글 수정 실패!");
					history.go(-1);				
				</script>
		<%	}
		}else{  //비번 불일치 %>
			<script type="text/javascript">
				alert("비밀번호가 일치하지 않습니다.");
				history.go(-1);				
			</script>	
	<%	}
	}catch(SQLException e){
		e.printStackTrace();
	}
%>
</body>
</html>