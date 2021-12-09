<%@page import="java.io.InputStreamReader"%>
<%@page import="model.ReviewBoardVO"%>
<%@page import="model.ReviewBoardDAO"%>
<%@page import="java.sql.SQLException"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../inc/top.jsp" %>
<%
	String no=request.getParameter("no");
	String title="", btVal="", actionVal="";
	String titleVal="";
	boolean isReply=false;
	ReviewBoardVO vo=null;
	if(no!=null && !no.isEmpty()){
		isReply=true;
		title="답변하기";
		btVal="답변";
		actionVal="reply_ok.jsp";
		
		ReviewBoardDAO dao = new ReviewBoardDAO();		
		try{
			vo=dao.selectByNo(Integer.parseInt(no));
			titleVal="Re : "+vo.getTitle();
		}catch(SQLException e){
			e.printStackTrace();
		}
	}else{
		title="글쓰기";		
		btVal="등록";
		actionVal="write_ok.jsp";
	}
	
%>    
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="utf-8">
<link rel="stylesheet" type="text/css" href="../css/reviewboard/write.css" />

<title>후기 게시판 <%=title %></title>
<script type="text/javascript" src="../js/jquery-3.6.0.min.js"></script>
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
<script type="text/javascript">
	$(function(){
		$('form[name=frmWrite]').submit(function(){
			$('.infobox').each(function(idx, item){
				if($(this).val().length<1){
					alert($(this).prev().html() + "을(를) 입력하세요");
					$(this).focus();
					event.preventDefault();
					return false;  //each 탈출
				}
			});
		});
		
		$('#btList').click(function(){
			location.href='list.jsp';	
		});
		
	});
</script>

</head>
<body>
<div class="divForm container">
<form name="frmWrite" method="post" action="<%=actionVal %>"
	enctype="multipart/form-data">
	<%	if(isReply){ %>
			<input type="text" name="groupNo" value="<%=vo.getGroupNo()%>">
			<input type="text" name="step" value="<%=vo.getStep()%>">
			<input type="text" name="sortNo" value="<%=vo.getSortNo()%>">
	<%	}	%>
 <fieldset>
	<legend><%=title %></legend>
        <div class="firstDiv">
            <label for="title">제목</label>
            <input type="text" id="title" name="title" class="infobox" 
            	value="<%=titleVal %>" />
        </div>
        <div>
            <label for="name">작성자</label>
            <input type="text" id="name" name="name" class="infobox" />
        </div>
        <div>
            <label for="pwd">비밀번호</label>
            <input type="password" id="pwd" name="pwd" class="infobox" />
        </div>
        <div>
            <label for="email">이메일</label>
            <input type="text" id="email" name="email" />
        </div>
        <div>  
        	<label for="content">내용</label>        
 			<textarea id="content" name="content" rows="12" cols="40"></textarea>
        </div>
        <div>
            <label for="upfile">첨부파일</label>
            <input type="file" id="upfile" name="upfile" />
            <span>(최대 2M)</span>
        </div>
        <div class="center">
            <input type = "submit" value="<%=btVal %>"/>
            <input type = "Button" id="btList" value="글목록" />         
        </div>
    </fieldset>
</form>
</div>   

<%@include file="../inc/bottom.jsp" %>