<%@page import="semi.user.model.vo.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

<% 
	String path = request.getContextPath();
	User loginUser = (User)session.getAttribute("loginUser");
	
%>
 <!-- Required Meta Tags Always Come First -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Title -->
    <title>Fishing Partner</title>
    <link rel="icon" href="<%=path %>/views/css/fp_ico.png">

    <!-- Font -->
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;500;700&display=swap" rel="stylesheet">

    <!-- CSS Front Template -->
    <link rel="stylesheet" href="<%=path %>/views/css/theme.min.css">
    <link rel="stylesheet" href="<%=path %>/views/css/snippets.min.css">

    <!-- CSS Implementing Plugins -->
    <link rel="stylesheet" href="<%=path %>/views/css/hs-mega-menu.min.css">
    <link rel="stylesheet" href="<%=path %>/views/css/bootstrap-icons/font/bootstrap-icons.css">
    
    <!-- JS Front -->
    <script src="<%=path %>/views/css/theme.min.js"></script>

    <!-- JS Global Compulsory -->
    <script src="<%=path %>/views/css/bootstrap.bundle.min.js"></script>
    
    <!-- JavaScript -->
    <script src="<%=path %>/views/css/jquery-3.6.0.min.js"></script>
    
</head>
<body>
<!-- ========== HEADER ========== -->
    <header id="header" class="navbar navbar-height navbar-expand-lg navbar-end navbar-sticky-top bg-white bg-opacity-75 navbar-light fw-bold">
        <div class="container">
            <nav class="js-mega-menu navbar-nav-wrap">
                <!-- Default Logo -->
                <a class="navbar-brand" href="<%=path %>/index.html" aria-label="Front">
                    <img class="navbar-brand-logo" src="<%=path %>/views/css/img/nav_logo.png" alt="Logo">
                </a>
                <!-- End Default Logo -->
                <!-- Toggler -->
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNavDropdown" aria-controls="navbarNavDropdown" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-default">
              <i class="bi-list"></i>
          </span>
          <span class="navbar-toggler-toggled">
            <i class="bi-x"></i>
          </span>
        </button>
                <!-- End Toggler -->
                <!-- Collapse -->
                <div class="collapse navbar-collapse" id="navbarNavDropdown">
                    <ul class="navbar-nav">
                        <!-- Landings -->
                        <li class="nav-item">
                            <a id="landingsMegaMenu" class="nav-link" aria-current="page" href="<%=path %>/fishing/list" role="button">낚시터</a>
                        </li>
                        <!-- End Landings -->
                        <!-- Company -->
                        <li class="nav-item">
                            <a id="companyMegaMenu" class="nav-link" href="<%=path %>/fish/list" role="button">어종</a>
                        </li>
                        <!-- End Company -->

                        <!-- Account -->
                       <!--  <li class="nav-item">
                            <a id="accountMegaMenu" class="nav-link" href="reserve.html" role="button">예약</a>
                        </li> -->
                        <!-- End Account -->

                        <!-- Pages -->
                        <li class="hs-has-sub-menu nav-item">
                            <a id="pagesMegaMenu" class="hs-mega-menu-invoker nav-link dropdown" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">게시판</a>
                            <!-- Mega Menu -->
                            <div class="dropdown-menu" aria-labelledby="pagesMegaMenu" style="min-width: 5rem;">
                                <a class="dropdown-item" href="<%=path%>/board/notice">공지사항</a>
                                <a class="dropdown-item" href="<%=path%>/board/list">자유게시판</a>
                                <a class="dropdown-item" href="<%=path%>/views/board/center.jsp">고객센터</a>
                                <a class="dropdown-item" href="<%=path%>/views/board/faq.jsp">FAQ</a>
                            </div>
                            <!-- End Mega Menu -->
                        </li>
                        <!-- End Pages -->

                        <!-- Blog -->
                        <%if (loginUser == null) { %>
                        <li class="nav-item">
                            <a id="blogMegaMenu" class="nav-link" href="<%=path %>/views/user/login.jsp" role="button" aria-expanded="false">로그인</a>
                        </li>
                        <%}else { %>
                        <li class="nav-item">
                            <a id="blogMegaMenu" class="nav-link" href="<%=path %>/views/user/myPage/main.jsp" role="button" aria-expanded="false">내 정보</a>
                        </li>
                        <li class="nav-item">
                            <a id="blogMegaMenu" class="nav-link" href="<%=path %>/logout" role="button" aria-expanded="false">로그아웃</a>
                        </li>
                        <%} %>
                        <!-- End Blog -->

                    </ul>
                </div>
                <!-- End Collapse -->
            </nav>
        </div>
    </header>

