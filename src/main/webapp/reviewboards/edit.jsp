<%@page import="common.ReviewUtil"%>
<%@page import="java.sql.SQLException"%>
<%@page import="model.ReviewBoardVO"%>
<%@page import="model.ReviewBoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../inc/top.jsp" %>
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
    div.center{width:1000px;}
    div.center{border-spacing: 0;border: 0;}
    div.center{border:0; }
    div.center{padding:10px 20px; background:#f2ebde; border-bottom:1px solid #ccc;}
    div.center{padding:10px 20px;text-align:center; border-bottom:1px solid #ccc;}
</style>
<meta charset="utf-8">
<link rel="stylesheet" type="text/css" href="../css/reviewboard/edit.css" />
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
	
	String content=vo.getContent();
	String email=vo.getEmail();
	String oldFileName=vo.getFileName();
	
	if(content==null) content="";
	if(email==null) email="";
	if(oldFileName==null) oldFileName="";
	
%>

<script type="text/javascript">

</script>

</head>
<body>
<div class="divForm">
<form name="frmEdit" method="post" action="edit_ok.jsp"
	enctype="multipart/form-data"> 
	<!-- 수정시 no가 필요하므로 히든 필드에 담아서 넘겨준다 -->
	<input type="hidden" name="no" value="<%=no%>">
	<input type="text" name="oldFileName" value="<%=oldFileName%>">
	
    <fieldset>
	<legend>수정하기</legend>
        <div class="firstDiv">
            <label for="title">제목</label>
            <input type="text" id="title" name="title" value="<%=vo.getTitle() %>" />
        </div>
        <div>
            <label for="name">작성자</label>
            <input type="text" id="name" name="name" value="<%=vo.getName() %>" />
        </div>
        <div>
            <label for="pwd">비밀번호</label>
            <input type="password" id="pwd" name="pwd" />
        </div>
        <div>
            <label for="email">이메일</label>
            <input type="text" id="email" name="email" value="<%=email %>" />
        </div>
        <div>
            <label for="upfile">첨부파일</label>
            <input type="file" id="upfile" name="upfile" />
        </div>
        <div>
            <span class="sp1">첨부파일목록</span>
            <%if(vo.getFileName()!=null && !vo.getFileName().isEmpty() ){ %>
	            <span><%=ReviewUtil.showFileInfo(vo.getOriginalFileName(), vo.getFileSize()) %>
	            </span><br>
	            <span style="color:green;font-weight: bold">
	            	첨부파일을 새로 지정할 경우 기존 파일은 삭제됩니다.</span>
            <%} %>
        </div>
        
        <div>  
        	<label for="content">내용</label>        
 			<textarea id="content" name="content" rows="12" cols="40"><%=content %></textarea>
        </div>
        <div class="center">
            <input type = "submit" value="수정"/>
            <input type = "Button" value="글목록" onclick="location.href	='list.jsp'" />         
        </div>
	</fieldset>
</form>    
</div>

<%@include file="../inc/bottom.jsp" %>