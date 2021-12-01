<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<html lang="ko">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" type="text/css" href="../css/reviewboard/list.css" />
<title>후기 게시판</title>
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
    .tb_area{width:1000px;}
    .table1{border-spacing: 0;border: 0;}
    .table1 tr{border:0; }
    .table1 tr th{padding:10px 20px; background:#f2ebde; border-bottom:1px solid #ccc;}
    .table1 tr td{padding:10px 20px;text-align:center; border-bottom:1px solid #ccc;}
</style>

<script type="text/javascript">	

</script>

<style type="text/css">
	body{
		padding:5px;
		margin:5px;
	 }	
</style>	
</head>	
<body>
<h2>후기게시판</h2>
<div class="mt20 tb_area">
<table class="table1">
	<caption>후기 게시판</caption>
	<colgroup>
		<col style="width:10%;" />
		<col style="width:40%;" />
		<col style="width:20%;" />
		<col style="width:20%;" />
		<col style="width:10%;" />		
	</colgroup>
	<thead>
	  <tr>
	    <th scope="col">번호</th>
	    <th scope="col">제목</th>
	    <th scope="col">작성자</th>
	    <th scope="col">작성일</th>
	    <th scope="col">조회수</th>
	  </tr>
	</thead> 
	<tbody>  	
		<tr  style="text-align:center">
			<td>1</td>
			<td style="text-align:left"><a href="detail.jsp">후기 글 남깁니다</a></td>
			<td>오현택</td>
			<td>2021-11-29</td>
			<td>3</td>		
		</tr> 
	  </tbody>
</table>	   
</div>
<div class="divPage">
</div>
<div class="divSearch">
   	<form name="frmSearch" method="post" action=''>
        <select name="searchCondition">
            <option value="title" >제목</option>
            <option value="content">내용</option>
            <option value="name">작성자</option>
        </select>   
        <input type="text" name="searchKeyword" title="검색어 입력">   
		<input type="submit" value="검색">
    </form>
</div>

<div class="divBtn">
    <button class="mint_btn hover"><a href='write.jsp'>글쓰기</a></button>
</div>

</body>
</html>