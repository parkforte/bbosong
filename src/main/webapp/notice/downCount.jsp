<%@page import="model.NoticeDAO"%>
<%@page import="java.io.BufferedOutputStream"%>
<%@page import="java.io.FileInputStream"%>
<%@page import="java.io.BufferedInputStream"%>
<%@page import="java.io.File"%>
<%@page import="common.MypageUtil"%>
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
//detail.jsp에서 파일명 클릭하면 get방식으로 이동
	//[1] 다운로드 수 증가
	//=> http://localhost:9090/herbmall/pds/downCount.jsp?no=6&fileName=jsp.pdf 

	//1
	String no=request.getParameter("no");
	String fileName=request.getParameter("fileName");
	
	NoticeDAO dao=new NoticeDAO();
	BufferedInputStream bis=null;
	BufferedOutputStream bos=null;
	try{
		int cnt=dao.updateReadCount(Integer.parseInt(no));
		
		//[2] 파일 다운로드 처리
		response.reset();
		
		response.setContentType("application/octet-stream");
		response.setHeader("Content-Disposition", "attachment;filename="
	+ new String(fileName.getBytes("euc-kr"),"ISO-8859-1"));

		out.clear();
		out=pageContext.pushBody();
		
		
		String dirPath=application.getRealPath(MypageUtil.UPLOAD_PATH);
		dirPath=MypageUtil.TEST_PATH;
		File myfile=new File(dirPath, fileName);
		
		byte[] data=new byte[1024*1024];
		bis=new BufferedInputStream(new FileInputStream(myfile));
		bos=new BufferedOutputStream(response.getOutputStream());
		
		int count=0;
		while((count=bis.read(data))!=-1){
			bos.write(data);
		}
	}catch(SQLException e){
		e.printStackTrace();
	}catch(Exception e){
		e.printStackTrace();
	}finally{
		if(bis!=null)bis.close();
		if(bos!=null)bos.close();
	}
%>
</body>
</html>