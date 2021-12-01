<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE HTML>
<html lang="ko">
<head>
<meta charset="utf-8">
<title>게시판 글 상세보기</title>
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
</head>
<body>
	<h2>글 상세보기</h2>
	<div class="divForm">
		<div class="firstDiv">
			<span class="sp1">제목</span> <span class="sp2">후기 글 남깁니다</span>
		</div>
		<div>
			<span class="sp1">작성자</span> <span class="sp2">오현택</span>
		</div>
		<div>
			<span class="sp1">등록일</span> <span class="sp2">2021-11-29</span>
		</div>
		<div>
			<span class="sp1">조회수</span> <span class="sp2">3</span>
		</div>
		<div class="lastDiv">			
			<p class="content">아끼는 옷에 음식을 쏟아서 많이 속상했는데 새것처럼 깔끔해졌어요 다음에도 또 이용할게요!</p>
		</div>
		<div class="center">
			<a href='edit.jsp'>수정</a>
        	<a href='delete.jsp'>삭제</a>
        	<a href='list.jsp'>목록</a>		
		</div>
	</div>

	
</body>
</html>