<%@page import="common.ReviewUtil"%>
<%@page import="java.sql.SQLException"%>
<%@page import="model.ReviewBoardVO"%>
<%@page import="model.ReviewBoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../inc/top.jsp" %>
<%
	String no=request.getParameter("no");
	if(no==null || no.isEmpty()){ %>
		<script type="text/javascript">
			alert("잘못된 url입니다.");
			location.href="list.jsp";
		</script>
	<%	return;
	}
	
	ReviewBoardDAO dao = new ReviewBoardDAO();
	
	ReviewBoardVO vo=null;
	try{
		vo=dao.selectByNo(Integer.parseInt(no));
	}catch(SQLException e){
		e.printStackTrace();
	}
	
	//3
	String content=vo.getContent();
	if(content!=null){  
		content=content.replace("\r\n", "<br>");
	}else{
		content="";
	}
	
	String fileInfo="", downInfo="";
	if(vo.getFileName()!=null && !vo.getFileName().isEmpty()){
		fileInfo=ReviewUtil.showFileInfo(vo.getOriginalFileName(), vo.getFileSize());
		downInfo="다운 : " + vo.getDowncount();
	}
	
	String oldFileName=vo.getFileName();	
	if(oldFileName==null) oldFileName="";
%>    
<link rel="stylesheet" type="text/css" href="../css/reviewboard/detail.css" />
<style>
     *{border-collapse: collapse;list-style-type: none; box-sizing: border-box; margin:0; padding:0;}
     .mt20{margin-top:10px;}
     .t_right{text-align: right;}
     
      /*button*/
    .btn_all{margin-bottom:20px;}
    .mint_btn{background:#aac3c3;  height:30px; padding:0 20px; color:#fff; border-radius:10px; border:none; outline:none; cursor: pointer;}
    .hover:hover{box-shadow:3px 3px rgba(0, 0, 0, .1)}
    .begie_btn{background:#f2ebde;  height:40px; padding:0 20px; color:#666; border-radius: 10px; border:none; outline:none; cursor: pointer;}    
     
     /*table*/
    .sp1{width:1000px;}
    .sp1{border-spacing: 0;border: 0;}
    .sp1{border:0; }
    .sp1{padding:10px 20px; background:#f2ebde; border-bottom:1px solid #ccc;}
    .sp1{padding:10px 20px;text-align:center; border-bottom:1px solid #ccc;}
    span.sp1{padding: 5px 10px 5px 0;}

	span.sp2 {
	    width: 20%;
	    float: left;
	    text-align: left;
	    padding: 5px 0 5px 10px;
	}
	
</style>
<style type="text/css">
	body{
		padding:5px;
		margin:5px;
	 }
	.divForm {
		width: 500px;
		}
</style>  
</head>
<body>
	<h2>글 상세보기</h2>
	<div class="divForm">
		<div class="firstDiv">
			<span class="sp1">제목</span> <span><%=vo.getTitle() %></span>
		</div>
		<div>
			<span class="sp1">작성자</span> <span><%=vo.getName() %></span>
		</div>
		<div>
			<span class="sp1">등록일</span> <span><%=vo.getRegdate() %></span>
		</div>
		<div>
			<span class="sp1">조회수</span> <span><%=vo.getReadcount() %></span>
		</div>
		<div>
			<span class="sp1">첨부파일</span> 
			<span>
				<a href="downCount.jsp?no=<%=no%>&fileName=<%=vo.getFileName()%>">
				<%=fileInfo %></a> 
				<%=downInfo %></span>
		</div>		
		<div class="lastDiv">			
			<p class="content"><%=content %></p>
		</div>
		<div class="center">
			<a href='edit.jsp?no=<%=no%>'>수정</a> |
        	<a href
='delete.jsp?no=<%=no%>&groupNo=<%=vo.getGroupNo()%>&step=<%=vo.getStep()%>&oldFileName=<%=oldFileName%>'>
        	삭제</a> |
        	<a href='write.jsp?no=<%=no%>'>답변</a> |        	
        	<a href='list.jsp'>목록</a>			
		</div>
	</div>

<%@include file="../inc/bottom.jsp" %>