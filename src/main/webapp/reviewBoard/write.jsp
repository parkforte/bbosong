<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="utf-8">
<link rel="stylesheet" type="text/css" href="../css/reviewboard/write.css" />

<title>게시판 글쓰기</title>
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

</script>

</head>
<body>
<div class="divForm">
<form name="frmWrite" method="post" action="" >
 <fieldset>
	<legend>글쓰기</legend>
        <div class="firstDiv">
            <label for="title">제목</label>
            <input type="text" id="title" name="title"  />
        </div>
        <div>
            <label for="name">작성자</label>
            <input type="text" id="name" name="name" />
        </div>
        <div>
            <label for="pwd">비밀번호</label>
            <input type="password" id="pwd" name="pwd" />
        </div>
        <div>
            <label for="email">이메일</label>
            <input type="text" id="email" name="email" />
        </div>
        
        <div id="editor" name="content"></div>
            <script src="../ckeditor5/ckeditor.js"></script>
            <script>
            	ClassicEditor
            		.create(document.querySelector('#editor'))
            		.catch(error => {
            			console.error(error)
            		});
            </script>
            
            <br>
            
        <div>  
        	<label for="content">내용</label>        
 			<textarea id="content" name="content" rows="12" cols="40"></textarea>
        </div>
        <div class="center">
            <input type = "submit" value="등록"/>
            <input type = "Button" value="글목록" onclick="location.href	='list.jsp'" />         
        </div>
    </fieldset>
</form>
</div>   

              
</body>
</html>