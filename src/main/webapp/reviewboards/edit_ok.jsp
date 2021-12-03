<%@page import="java.io.File"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="common.ReviewUtil"%>
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
<title>Insert title here</title>
</head>
<body>
<%
	String saveDir=application.getRealPath(ReviewUtil.UPLOAD_PATH); //업로드 경로
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
		String no=mr.getParameter("no");
		String oldFileName=mr.getParameter("oldFileName");

		ReviewBoardDAO dao = new ReviewBoardDAO();	
		ReviewBoardVO vo = new ReviewBoardVO();
		vo.setContent(content);
		vo.setEmail(email);
		vo.setName(name);
		vo.setNo(Integer.parseInt(no));
		vo.setPwd(pwd);
		vo.setTitle(title);
		vo.setFileName(fileName);
		vo.setOriginalFileName(originalFName);
		vo.setFileSize(fileSize);
		
		if(dao.checkPwd(vo)){		
			int cnt=dao.updateReviewBoard(vo);

			if(cnt>0){ 
				if(fileName!=null){
					if(oldFileName!=null && !oldFileName.isEmpty()){
						File oldFile = new File(saveDir, oldFileName);
						if(oldFile.exists()){
							boolean bool=oldFile.delete();
							System.out.println("기존파일 삭제 여부:"+bool);
						}
					}
				}//if
		%>
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
		}else{  %>
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