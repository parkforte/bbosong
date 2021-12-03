<%@page import="java.io.IOException"%>
<%@page import="java.io.File"%>
<%@page import="common.ReviewUtil"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="model.ReviewBoardVO"%>
<%@page import="java.sql.SQLException"%>
<%@page import="model.ReviewBoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>write_ok.jsp</title>
</head>
<body>
<%
	String saveDir=application.getRealPath(ReviewUtil.UPLOAD_PATH); 
	saveDir=config.getServletContext().getRealPath(ReviewUtil.UPLOAD_PATH);
	System.out.print(saveDir);
	saveDir=ReviewUtil.TEST_PATH;
	
	int maxSize=2*1024*1024;  
	String encoding="utf-8";
	
	try{
		MultipartRequest mr
		=new MultipartRequest(request, saveDir, maxSize, encoding,
				new DefaultFileRenamePolicy());
		System.out.println("업로드 완료!");
		
		String fileName=mr.getFilesystemName("upfile");
		long fileSize=0;
		String originalFName="";
		if(fileName!=null){  
			File file=mr.getFile("upfile");
			fileSize=file.length();
			
			originalFName=mr.getOriginalFileName("upfile");
		}
		

		String title=mr.getParameter("title");
		String name=mr.getParameter("name");
		String pwd=mr.getParameter("pwd");
		String email=mr.getParameter("email");
		String content=mr.getParameter("content");

		String ip=request.getRemoteAddr();
		String ip2=request.getRemoteHost();
		System.out.println("ip="+ip+", ip2="+ip2);

		ReviewBoardDAO dao = new ReviewBoardDAO();
		ReviewBoardVO vo = new ReviewBoardVO();
		vo.setContent(content);
		vo.setEmail(email);
		vo.setName(name);
		vo.setPwd(pwd);
		vo.setTitle(title);
		vo.setFileName(fileName);
		vo.setOriginalFileName(originalFName);
		vo.setFileSize(fileSize);
		
		int cnt=dao.insertReviewBoard(vo);
		
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
	<%	}//if
	}catch(SQLException e){
		e.printStackTrace();
	}catch(IOException e){ %>
		<script type="text/javascript">
			alert("2M 이상의 파일은 업로드 불가!");
			history.back();
		</script>	
	<%	e.printStackTrace();
	}	
%>

</body>
</html>




