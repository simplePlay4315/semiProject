<%@page import="common.util.PageInfo"%>
<%@page import="semi.reservation.model.vo.Reserve"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/views/header.jsp"%>


<%
	List<Reserve> yList = (List<Reserve>) request.getAttribute("yList");
	PageInfo pageInfoY = (PageInfo) request.getAttribute("pageInfoY");
%>

 <!-- ========== MAIN CONTENT ========== -->
    <main id="content" role="main" class="bg-light">
        <!-- Breadcrumb -->
        <div class="navbar-dark bg-dark" style="background-image: url(<%=path%>/views/css/img/wave-pattern-light.svg);">
            <div class="container content-space-2 content-space-b-lg-2">
                <div class="row align-items-center">
                    <div class="col">
                        <div class="d-none d-lg-block">
                            <h1 class="h2 text-white">사용자 정보</h1>
                        </div>

                        <!-- Breadcrumb -->
                        <nav aria-label="breadcrumb">
                            <ol class="breadcrumb breadcrumb-light mb-0">
                                <li class="breadcrumb-item">예약</li>
                                <li class="breadcrumb-item active" aria-current="page">예약 목록</li>
                            </ol>
                        </nav>
                        <!-- End Breadcrumb -->
                    </div>
                    <!-- End Col -->


                        <!-- Responsive Toggle Button -->
                        <button class="navbar-toggler d-lg-none" type="button" data-bs-toggle="collapse" data-bs-target="#sidebarNav" aria-controls="sidebarNav" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-default">
          <i class="bi-list"></i>
        </span>
        <span class="navbar-toggler-toggled">
          <i class="bi-x"></i>
        </span>
      </button>
                        <!-- End Responsive Toggle Button -->
                    </div>
                    <!-- End Col -->
                </div>
                <!-- End Row -->
            </div>
        </div>
        <!-- End Breadcrumb -->

        <!-- Content -->
        <div class="container content-space-1 content-space-t-lg-0 content-space-b-lg-2 mt-lg-n10">
            <div class="row">
                <div class="col-lg-3">
                    <!-- Navbar -->
				<div class="navbar-expand-sm navbar-light">
					<div id="sidebarNav"
						class="collapse navbar-collapse navbar-vertical">
						<!-- Card -->
						<div class="card flex-grow-1 mb-5">
							<div class="card-body">
								<!-- Avatar -->
								<div class="d-none d-lg-block text-center mb-5">

									<h4 class="card-title mb-0"><%=loginUser.getUserName() %></h4>
									<p class="card-text small"><%=loginUser.getEmail() %></p>
								</div>
								<!-- End Avatar -->

								<!-- Nav -->
								<h6>계정</h6>

								<!-- List -->
								<ul class="nav nav-sm nav-tabs nav-vertical mb-4">
									<li class="nav-item"><a class="nav-link"
										href="<%=path%>/views/user/myPage/main.jsp"> <i
											class="bi-person-badge nav-icon"></i> 회원정보
									</a></li>
									<li class="nav-item"><a class="nav-link"
									href="<%=path%>/views/user/myPage/updatePwd.jsp"> 
									<i class="bi-shield-shaded nav-icon"></i> 비밀번호 변경
									</a></li>
								</ul>
								<!-- End List -->

								<h6>예약</h6>

								<!-- List -->
								<ul class="nav nav-sm nav-tabs nav-vertical mb-4">
									<li class="nav-item"><a class="nav-link active"> 
									<i class="bi-basket nav-icon"></i> 예약 목록
									</a></li>
									<li class="nav-item"><a class="nav-link "
										href="<%=path%>/myPage/wishList"> <i
											class="bi-heart nav-icon"></i> 찜 목록
									</a></li>
								</ul>
								<!-- End List -->

								
								<!-- End Nav -->
                                </div>
                            </div>
                            <!-- End Card -->
                        </div>
                    </div>
                    <!-- End Navbar -->
                </div>
                <!-- End Col -->

                <div class="col-lg-9">
                    <!-- Card -->
                    <div class="card">

                        <!-- Body -->
                        <div class="card-body">
                            <!-- Nav Scroller -->
                            <div class="js-nav-scroller hs-nav-scroller-horizontal">
                                <span class="hs-nav-scroller-arrow-prev" style="display: none;">
                  <a class="hs-nav-scroller-arrow-link" href="javascript:;">
                    <i class="bi-chevron-left"></i>
                  </a>
                </span>

                                <span class="hs-nav-scroller-arrow-next" style="display: none;">
                  <a class="hs-nav-scroller-arrow-link" href="javascript:;">
                    <i class="bi-chevron-right"></i>
                  </a>
                </span>

                                <!-- Nav -->
                                <ul class="nav nav-segment nav-fill mb-7" id="featuresTab" role="tablist">
                                    <li class="nav-item" role="presentation">
                                        <a class="nav-link active" id="accountOrdersOne-tab" >예약 내역</a>
                                    </li>

                                    <li class="nav-item" role="presentation">
                                        <a class="nav-link" href="<%=path %>/myPage/cancleList" id="accountOrdersThree-tab" >취소 내역</a>
                                    </li>
                                </ul>
                                <!-- End Nav -->
                            </div>
                            <!-- End Nav Scroller -->
                            

                            <!-- Tab Content -->
                            <div class="tab-content" id="accountOrdersTabContent">
                                <div class="tab-pane fade show active" id="accountOrdersOne" role="tabpanel" aria-labelledby="accountOrdersOne-tab">
									<%if(yList == null || yList.size() == 0) {%>
										<!-- Empty State -->
                                    	<div class="text-center content-space-1">
                                        	<img class="avatar avatar-xl mb-3" src="<%=path %>/views/css/svg/empty-state-no-data.svg" alt="Image Description">
                                        	<p class="card-text">예약 내역이 없습니다.</p>
                                    	</div>
                                    <!-- End Empty State -->
									<%}else { %>
										<ul class="list-unstyled mb-5">
                                        <%for(int i = 0; i < yList.size(); i++) {%>
                           				 <!-- Card -->
                                        <li class="card card-bordered shadow-none mb-3">
                                            <div class="card-body">
                                                <div class="row">
                                                    <div class="col-6 col-md mb-3 mb-md-0">
                                                        <small class="card-subtitle mb-0">예약 번호</small>
                                                        <small class="text-dark fw-semi-bold"><%=yList.get(i).getResNo() %></small>
                                                    </div>
                                                    <!-- End Col -->

                                                    <div class="col-6 col-md mb-3 mb-md-0">
                                                        <small class="card-subtitle mb-0">낚시터 이름</small>
                                                        <small class="text-dark fw-semi-bold"><%=yList.get(i).getFishing().getName() %></small>
                                                    </div>
                                                    <!-- End Col -->

                                                    <!-- End Col -->

                                                    <div class="col-6 col-md">
                                                        <small class="card-subtitle mb-0">예약 일자</small>
                                                        <small class="text-dark fw-semi-bold"><%=yList.get(i).getResDate() %></small>
                                                    </div>
                                                    <!-- End Col -->
                                                </div>
                                                <!-- End Row -->

                                                <hr>

                                                <div class="row">
                                                    <div class="col-md-7">
                                                        <div class="row gx-2">
                                                            <div class="col">
                                                                <img style="height:225px; width: 400px;" src="<%=path %>/views/css/img/PLACE_<%=yList.get(i).getFishing().getNo() % 18 %>.jpg">
                                                            </div>
                                                        </div>
                                                        <!-- End Row -->
                                                    </div>

                                                    <div class="col-md-5 mt-5">
                                                        <div class="d-grid gap-2">
                                                        	<a></a>
                                                            <a style="margin-top: 20px;" class="btn btn-white btn-sm" href="<%=path%>/fishing/view?fishingNo=<%=yList.get(i).getFishing().getNo()%>">
                                                                <i class="bi-people-fill small me-2"></i> 리뷰 보러가기
                                                            </a>
                                                            <a class="btn btn-primary btn-sm" onclick="cancle(<%=yList.get(i).getResNo()%>)">
                                                                <i class="bi-x-circle small me-2"></i> 예약 취소하기
                                                            </a>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </li>
                                        <!-- End Card -->
                            	<%} %>
                                    </ul>

                                    <!-- Pagination -->
                                    <nav aria-label="Page navigation">
                                        <ul class="pagination justify-content-center">
                                        <%if(pageInfoY.getCurrentPage() != 1) {%>
                                        	<li class="page-item">
                                                <a class="page-link" href="<%=path %>/myPage/resList?page=<%=pageInfoY.getPrvePage()%>" aria-label="Prev">이전</a>
                                            </li>
                                        <%} %>
                                             
                                            <%for (int i = pageInfoY.getStartPage(); i <= pageInfoY.getEndPage(); i++) {%>
                                            	<%if(i == pageInfoY.getCurrentPage()){ %>
                                            		<li class="page-item active"><a class="page-link"><%=i %></a></li>	
                                            	<%}else { %>
                                            		<li class="page-item"><a class="page-link" href="<%=path %>/myPage/resList?page=<%=i%>"><%=i %></a></li>
                                            	<%} %>
                                            <%} %>
                                            <!-- <li class="page-item disabled"><a class="page-link" href="#">...</a></li> -->
                                            <%if(pageInfoY.getCurrentPage() != pageInfoY.getEndPage()) {%>
                                        	<li class="page-item">
                                                <a class="page-link" href="<%=path %>/myPage/resList?page=<%=pageInfoY.getNextPage() %>" aria-label="Next">다음</a>
                                            </li>
                                        <%} %>
                                            
                                            
                                            
                                        </ul>
                                    </nav>
                                    <!-- End Pagination -->
									<%} %>
                                    
                                </div>

                                <div class="tab-pane fade" id="accountOrdersThree" role="tabpanel" aria-labelledby="accountOrdersThree-tab">
                                    <!-- Empty State -->
                                    <div class="text-center content-space-1">
                                        <img class="avatar avatar-xl mb-3" src="css/img/empty-state-no-data.svg" alt="Image Description">
                                        <p class="card-text">취소한 내역이 없습니다.</p>
                                    </div>
                                    <!-- End Empty State -->
                                </div>

                               
                            </div>
                            <!-- End Tab Content -->
                        </div>
                        <!-- End Body -->
                    </div>
                    <!-- End Card -->
                </div>
                <!-- End Col -->
            </div>
            <!-- End Row -->
        </div>
        <!-- End Content Section -->
    </main>
    <!-- ========== END MAIN CONTENT ========== -->

<script>
	function cancle(no){
		if(confirm("정말로 예약을 취소하시겠습니까?")) {
			location.replace("<%=path %>/fishing/reserve/cancle?resNo=" + no);
		}
	}
</script>



<%@ include file="/views/footer.jsp"%>