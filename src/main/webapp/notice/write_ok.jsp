<%@page import="java.io.IOException"%>  
<%@page import="java.sql.SQLException"%>
<%@page import="java.io.File"%>
<%@page import="model.NoticeVO"%>
<%@page import="model.NoticeDAO"%>
<%@page import="common.MypageUtil"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="../inc/top.jsp" %>

<%
String saveDir=application.getRealPath(MypageUtil.UPLOAD_PATH);
	saveDir=config.getServletContext().getRealPath(MypageUtil.UPLOAD_PATH);
	System.out.print(saveDir);
	saveDir=MypageUtil.TEST_PATH;
	
	int maxSize=2*1024*1024;  //업로드파일의 최대 크기, 2M
	String encoding="utf-8";
	
	try{
		MultipartRequest mr
		=new MultipartRequest(request, saveDir, maxSize, encoding,
		new DefaultFileRenamePolicy());
		System.out.println("업로드 완료!");
		
		//업로드 파일의 정보 
		String fileName=mr.getFilesystemName("upfile");
		long fileSize=0;
		String originalFileName="";
		if(fileName!=null){  //파일이 첨부된 경우만
	File file=mr.getFile("upfile");
	fileSize=file.length();
	
	originalFileName=mr.getOriginalFileName("upfile");
		}
		String title=mr.getParameter("title");
		String content=mr.getParameter("content");
		
		String ip=request.getRemoteAddr();
		String ip2=request.getRemoteHost();
		System.out.println("ip="+ip+"ip2="+ip2);
		
		NoticeDAO dao = new NoticeDAO();
		NoticeVO vo = new NoticeVO();
		
		vo.setContent(content);
		vo.setTitle(title);
		vo.setFileName(fileName);
		vo.setOriginalFileName(originalFileName);
		vo.setFileSize(fileSize);
		
		int cnt=dao.insertNotice(vo);
		if(cnt>0){
%>
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
			
<%@include file="../inc/bottom.jsp" %>