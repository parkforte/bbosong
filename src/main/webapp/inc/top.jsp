<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>

<html lang="ko">
<head>
<meta charset="utf-8">
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>뽀송Dream</title>
    <link rel="icon" href="<%=request.getContextPath() %>/img/favicon.png">
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="<%=request.getContextPath() %>/css/bootstrap.min.css">
    <!-- animate CSS -->
    <link rel="stylesheet" href="<%=request.getContextPath() %>/css/animate.css">
    <!-- owl carousel CSS -->
    <link rel="stylesheet" href="<%=request.getContextPath() %>/css/owl.carousel.min.css">
    <!-- themify CSS -->
    <link rel="stylesheet" href="<%=request.getContextPath() %>/css/themify-icons.css">
    <!-- flaticon CSS -->
    <link rel="stylesheet" href="<%=request.getContextPath() %>/css/flaticon.css">
    <!-- fontawesome CSS -->
    <link rel="stylesheet" href="<%=request.getContextPath() %>/fontawesome/css/all.min.css">
    <!-- magnific CSS -->
    <link rel="stylesheet" href="<%=request.getContextPath() %>/css/magnific-popup.css">
    <link rel="stylesheet" href="<%=request.getContextPath() %>/css/gijgo.min.css">
    <!-- niceselect CSS -->
    <link rel="stylesheet" href="<%=request.getContextPath() %>/css/nice-select.css">
    <!-- slick CSS -->
    <link rel="stylesheet" href="<%=request.getContextPath() %>/css/slick.css">
    <!-- style CSS -->
    <link rel="stylesheet" href="<%=request.getContextPath() %>/css/style.css">
    <!-- newStyle css -->
    <link rel="stylesheet" href="<%=request.getContextPath() %>/css/newStyle.css">
    <!-- subStyle css -->
    <link rel="stylesheet" href="<%=request.getContextPath() %>/css/substyle.css">

</head>

<body>
   <!--::header part start::-->
   <header class="main_menu">
        <div class="sub_menu">
            <div class="container">
                <div class="row">
                    <div class="col-lg-6 col-sm-12 col-md-6">
                        <div class="sub_menu_right_content">
                            <span>지점 정보</span>
                            <a href="#">강남구</a>
                            <a href="#">서초구</a>
                            <a href="#">동작구</a>
                            <a href="#">송파구</a>
                        </div>
                    </div>
                    <div class="col-lg-6 col-sm-12 col-md-6">
                        <div class="sub_menu_social_icon">
                            <a href="#"><i class="flaticon-facebook"></i></a>
                            <a href="#"><i class="flaticon-twitter"></i></a>
                            <a href="#"><i class="flaticon-skype"></i></a>
                            <a href="#"><i class="flaticon-instagram"></i></a>
                            <span><i class="flaticon-phone-call"></i>+81 02 3481 1005</a></span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="main_menu_iner">
            <div class="container">
                <div class="row align-items-center ">
                    <div class="col-lg-12">
                        <nav class="navbar navbar-expand-lg navbar-light justify-content-between">
                            <a class="navbar-brand" href="<%=request.getContextPath() %>/index.jsp"> <img src="<%=request.getContextPath() %>/img/bbosonglogo.png" alt="logo"> </a>
                            <button class="navbar-toggler" type="button" data-toggle="collapse"
                                data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent"
                                aria-expanded="false" aria-label="Toggle navigation">
                                <span class="navbar-toggler-icon"></span>
                            </button>

                            <div class="collapse navbar-collapse main-menu-item justify-content-center"
                                id="navbarSupportedContent">
                                <ul class="navbar-nav">
                                    <li class="nav-item">
                                        <a class="nav-link" href="<%=request.getContextPath() %>/index.jsp">Home</a>
                                    </li>
                                    <li class="nav-item dropdown">
                                        <a class="nav-link dropdown-toggle" href="blog.html" id="navbarDropdown"
                                            role="button" data-toggle="dropdown" aria-haspopup="true"
                                            aria-expanded="false">
                                            회사소개
                                        </a>
                                        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                                            <a class="dropdown-item" href="<%=request.getContextPath() %>/company/introduce.jsp">회사정보</a>
                                            <a class="dropdown-item" href="<%=request.getContextPath() %>/store/store_info.jsp">지점정보</a>
                                        </div>
                                    </li>
                                    <li class="nav-item dropdown">
                                        <a class="nav-link dropdown-toggle" href="blog.html" id="navbarDropdown"
                                            role="button" data-toggle="dropdown" aria-haspopup="true"
                                            aria-expanded="false">
                                            서비스안내
                                        </a>
                                        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                                            <a class="dropdown-item" href="<%=request.getContextPath() %>/service/service.jsp">서비스소개</a>
                                            <a class="dropdown-item" href="<%=request.getContextPath() %>/eventBoard/list.jsp">이벤트</a>
                                            <a class="dropdown-item" href="<%=request.getContextPath() %>/notice/list.jsp">공지사항</a>
                                        </div>
                                    </li>
                                    <li class="nav-item dropdown">
                                        <a class="nav-link dropdown-toggle" href="blog.html" id="navbarDropdown"
                                            role="button" data-toggle="dropdown" aria-haspopup="true"
                                            aria-expanded="false">
                                            고객센터
                                        </a>
                                        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                                            <a class="dropdown-item" href="<%=request.getContextPath() %>/fqa/fqa.jsp">FAQ</a>
                                            <a class="dropdown-item" href="<%=request.getContextPath() %>/qna/list.jsp">Q&A</a>
                                            <a class="dropdown-item" href="<%=request.getContextPath() %>/tip/list.jsp">세탁정보</a>
                                            <a class="dropdown-item" href="<%=request.getContextPath() %>/reviewboards/list.jsp"">이용후기</a>
                                        </div>
                                    </li>
                                    <li class="nav-item dropdown">
                                  		  <%if(session.getAttribute("email") == null) { %>
                                        		<a class="nav-link dropdown-toggle" href="blog.html" id="navbarDropdown_1"
		                                            role="button" data-toggle="dropdown" aria-haspopup="true"
		                                            aria-expanded="false">
		                                            로그인
                                      			</a>
                                    	   	<%} else {%>
                                    	   		<a class="nav-link dropdown-toggle" href="<%=request.getContextPath()%>/mypage/mypageMain.jsp" id="navbarDropdown_1"
		                                            role="button" data-toggle="dropdown" aria-haspopup="true"
		                                            aria-expanded="false">
		                                            마이페이지
                                      			</a>
                                      		<%}%>
                                       
                                        <div class="dropdown-menu" aria-labelledby="navbarDropdown_1">
	                                        	<%if(session.getAttribute("email") == null) { %>
	                                        		<a class="dropdown-item" href="<%=request.getContextPath()%>/sign/signin.jsp">로그인</a>
                                           			<a class="dropdown-item" href="<%=request.getContextPath()%>/sign/signup.jsp">회원가입</a>
	                                        	<%} else {%>
		                                        	<a class="dropdown-item" href="<%=request.getContextPath()%>/mypage/mypageMain.jsp">마이페이지</a>
		                                        	<a class="dropdown-item" href="<%=request.getContextPath()%>/sign/signout.jsp">로그아웃</a>
		                                            <a class="dropdown-item" href="<%=request.getContextPath()%>/mypage/Withdrawal.jsp">회원탈퇴</a>
                                        		<%}%>
                                        </div>
                                    </li>
                                </ul>
                            </div>
                            <a href="<%=request.getContextPath() %>/order/menuList.jsp" class="btn_1 d-none d-lg-block bbosong">주문</a>
                        </nav>
                    </div>
                </div>
            </div>
        </div>
    </header> 
    <!-- Header part end-->