<%@page import="semi.fishing.model.vo.Fishing"%>
<%@page import="semi.reservation.model.vo.Reserve"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="/views/header.jsp" %>

<%
	Reserve res = (Reserve)request.getAttribute("reservation");
	Fishing fishing = res.getFishing();
%>

<!-- Hero -->
    <div class="bg-img-start" style="background-image: url(css/img/card11.svg);">
        <div class="container content-space-t-3 content-space-t-lg-5 content-space-b-2 min-vh-md-100">
            <div class="w-md-80 w-lg-100 text-center mx-md-auto">
                <h2 style="color: rgb(134, 138, 148); margin-bottom: 20px;">예약</h2>


                <!-- Card -->
                <div class="card card-lg mb-4" style="width: 40%; margin-left: 330px;">
                    <div class="card-body">
                        <!-- End Col -->


                        <div>
                            <dl class="row">
                                <dd> <img src="<%=path %>/views/css/img/PLACE_<%=fishing.getNo() % 18 %>.jpg" style="width: 350px; height: 200px;"><br><br> <%=fishing.getName() %> <br> <%=fishing.getAddr1() %> <br> <%=res.getResDate() %> <br> <%=res.getUserNum() %>명 <br> <%=loginUser.getUserName() %>님 <br><br>
                                    <dt> <h5>예약되었습니다. 감사합니다.</h5> </dt> <br>
                                </dd>
                            </dl>
                        </div>
                        <!-- End Col -->
                    </div>
                </div><br>
                <!-- End Card -->


                <dl class="row">
                    <dt class="col-sm-2"></dt>
                    <dd class="col-sm-8">
                        <!-- Socials -->
                        <ul class="list-inline mb-3">
                            <li class="list-inline-item">
                                <a class="btn btn-soft-secondary btn-lg btn-icon" href="<%=path %>/index.html" style="width: 120px; margin-right: 50px;">
                    홈으로<i class="reservation"></i>
                  </a>

                                <a class="btn btn-soft-secondary btn-lg btn-icon" href="<%=path %>/myPage/resList" style="width: 120px;">
                    예약 목록<i class="reservation"></i>
                  </a>
                            </li>
                        </ul>
                        <!-- End Socials -->
                    </dd>
                </dl>
                <!-- End Row -->
            </div>
        </div>
    </div>



<%@ include file="/views/footer.jsp" %>