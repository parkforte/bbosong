<%@page import="common.ReviewUtil"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.sql.SQLException"%>
<%@page import="model.SelectAccountVO"%>
<%@page import="java.util.List"%>
<%@page import="model.SelectAccountDAO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	String condition=request.getParameter("searchCondition");
	String keyword=request.getParameter("searchKeyword");

	SelectAccountDAO dao = new SelectAccountDAO();
	
	List<SelectAccountVO> list=null;
	try{
		list=dao.selectAll(condition, keyword);
	}catch(SQLException e){
		e.printStackTrace();		
	}

	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
	
	if(keyword==null) keyword="";

	int currentPage=1;  
	if(request.getParameter("currentPage")!=null){
		currentPage=Integer.parseInt(request.getParameter("currentPage"));
	}
	
	int totalRecord=list.size();
	int pageSize=8; 
	int totalPage=(int)Math.ceil((float)totalRecord/pageSize);
	int blockSize=10;  
	
	int firstPage=currentPage-((currentPage-1)%blockSize); 
	int lastPage=firstPage+ (blockSize-1);

	int curPos=(currentPage-1)*pageSize;

	int num=totalRecord-curPos;
%>


<link rel="stylesheet" type="text/css" href="../css/reviewboard/list.css" />
<script type="text/javascript" src="../js/jquery-3.6.0.min.js"></script>
<script type="text/javascript">	
	$(function(){
		$('.divList .box2 tbody tr').hover(function(){
			$(this).css('background','skyblue');
		}, function(){
			$(this).css('background','');
		});
	});
</script>
<style type="text/css">
	body{
		padding:5px;
		margin:5px;
	 }	
</style>	
<style>
     *{border-collapse: collapse;list-style-type: none; box-sizing: border-box; margin:0; padding:0;}
     .mt20{margin-top:10px;}
     .t_right{text-align: right;}
     
      /*button*/
    .btn_all{margin-bottom:20px;}
    .mint_btn{background:#aac3c3;  height:30px; padding:0 20px; color:#fff; border-radius:10px; border:none; outline:none; cursor: pointer;}
    .hover:hover{box-shadow:3px 3px rgba(0, 0, 0, .1)}
    .begie_btn{background:#f2ebde;  height:40px; padding:0 20px; color:#666; border-radius: 10px; border:none; outline:none; cursor: pointer;}    
	.section_padding {
	    padding: 130px 0px;
	}     
     /*table*/
    .tb_area{width:1000px;}
    .table1{border-spacing: 0;border: 0;}
    .table1 tr{border:0; }
    .table1 tr th{padding:10px 20px; background:#f2ebde; border-bottom:1px solid #ccc;}
    .table1 tr td{padding:10px 20px;text-align:center; border-bottom:1px solid #ccc;}
</style>
</head>	
<body>
<h2>??????????????????</h2>
<%
	if(keyword!=null && !keyword.isEmpty()){ %>
		<p>????????? : <%=keyword %>,  <%=list.size() %>??? ?????????????????????. </p>
<%	} %>
<div class="mt20 tb_area">
<table class="table1"
		summary="?????????????????? ?????????">
	<caption>??????????????????</caption>
	<colgroup>
		<col style="width:40%;" />
		<col style="width:15%;" />
		<col style="width:30%;" />
		<col style="width:25%;" />		
	</colgroup>
	<thead>
	  <tr style="text-align:center">
	    <th scope="col">??????</th>
	    <th scope="col">??????</th>
	    <th scope="col">HP</th>
	    <th scope="col">?????????</th>
	  </tr>
	</thead> 
	<tbody>  
	  <!--????????? ?????? ?????????-->	
	  <%
			
	    for(int i=0;i<pageSize ;i++){
	    	if(num<1) break;	
	    
	    	SelectAccountVO vo=list.get(curPos++);
			num--;
	   %>	
		<tr style="text-align:center">
			<td><%=vo.getEmail() %></td>
			<td style="text-align:center">
			<%=vo.getName() %>
			</td>
			<td style="text-align:center"><%=sdf.format(vo.getTel()) %></td>
			<td style="text-align:center"><%=vo.getJoinDate() %></td>		
		</tr> 
	  <%}//for %>
	  <!--???????????? ???  -->
	  </tbody>
</table>	   
</div>


<div class="divPage">
	<!-- ????????? ?????? ?????? -->		
	<!-- ?????? ???????????? ?????? -->					
	<%	if(firstPage>1){ %>
			<a href
="list.jsp?currentPage=<%=firstPage-1%>&searchCondition=<%=condition%>&searchKeyword=<%=keyword%>">
				<img src="../images/first.JPG" alt="????????????">
			</a>	
	<%	}	%>					
	<%
		for(int i=firstPage;i<=lastPage;i++){
			if(i>totalPage) break; 
			
			if(i==currentPage){ 	%>
				<span style="color:blue;font-weight: bold;font-size: 1em">
					<%=i %></span>
			<%}else{ %>
				<a href
="list.jsp?currentPage=<%=i%>&searchCondition=<%=condition%>&searchKeyword=<%=keyword%>">
					[<%=i %>]</a>			
			<%}//if %>
	<%	}//for 	%>
	
	<!-- ?????? ???????????? ?????? -->					
	<%	if(lastPage < totalPage){ %>
			<a href
="list.jsp?currentPage=<%=lastPage+1%>&searchCondition=<%=condition%>&searchKeyword=<%=keyword%>">
				<img src="../images/last.JPG" alt="????????????">
			</a>	
	<%	}	%>					
	<!--  ????????? ?????? ??? -->	
</div>


<div class="divSearch">
   	<form name="frmSearch" method="post" action='list.jsp'>
        <select name="searchCondition">
            <option value="email" 
            	<%if("email".equals(condition)){ %>
            		selected="selected"
            	<%} %>
            >??????</option>
            <option value="name" 
            	<%if("name".equals(condition)){ %>
            		selected="selected"
            	<%} %>
            >??????</option>
            <option value="tel" 
            	<%if("tel".equals(condition)){ %>
            		selected="selected"
            	<%} %>
            >hp</option>
        </select>   
        <input type="text" name="searchKeyword" title="????????? ??????"
        	value="<%=keyword%>">   
		<input type="submit" value="??????">
    </form>
</div>

<%@include file="../../inc/bottom.jsp" %>
