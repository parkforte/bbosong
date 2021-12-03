<%@page import="common.ReviewUtil"%>
<%@page import="java.io.File"%>
<%@page import="java.sql.SQLException"%>
<%@page import="model.ReviewBoardVO"%>
<%@page import="model.ReviewBoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>delete_ok.jsp</title>
</head>
<body>
	<%
		request.setCharacterEncoding("utf-8");
	
		String no=request.getParameter("no");
		String pwd=request.getParameter("pwd");
		String step=request.getParameter("step");
		String groupNo=request.getParameter("groupNo");
		String oldFileName=request.getParameter("oldFileName");
		
		ReviewBoardDAO dao = new ReviewBoardDAO();
		
		try{
			ReviewBoardVO vo = new ReviewBoardVO();
			vo.setNo(Integer.parseInt(no));
			vo.setPwd(pwd);
			vo.setStep(Integer.parseInt(step));
			vo.setGroupNo(Integer.parseInt(groupNo));
			
			if(dao.checkPwd(vo)){
				dao.deleteReviewBoard(vo);	
				if(oldFileName!=null && !oldFileName.isEmpty()){
					String saveDir=application.getRealPath(ReviewUtil.UPLOAD_PATH);
					saveDir=config.getServletContext().getRealPath(ReviewUtil.UPLOAD_PATH);
					saveDir=ReviewUtil.TEST_PATH;
					
					File oldFile = new File(saveDir, oldFileName);
					if(oldFile.exists()){
						boolean bool=oldFile.delete();
						System.out.println("기존파일 삭제 여부:"+bool);
					}
				}
			%>
				<script type="text/javascript">
					alert("글 삭제되었습니다.");
					location.href="list.jsp";
				</script>	
		<%	}else{ %>
				<script type="text/javascript">
					alert("비밀번호가 일치하지 않습니다.");
					history.back();
				</script>
		<%	}
		}catch(SQLException e){
			e.printStackTrace();
		}
	%>
	</body>
	</html>