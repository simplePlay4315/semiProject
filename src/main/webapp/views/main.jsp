<%@page import="semi.fishing.model.vo.Fishing"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

 <%@include file="header.jsp" %>
 
 <% 
 List<Fishing> list1 = (List<Fishing>)request.getAttribute("list1"); 
 List<Fishing> list2 = (List<Fishing>)request.getAttribute("list2"); 
 List<Fishing> list3 = (List<Fishing>)request.getAttribute("list3"); 
 List<Fishing> list4 = (List<Fishing>)request.getAttribute("list4"); 
 %>
 

 
  <!-- Hero -->
    <div class="bg-img-center" style="background-image: url(<%=path%>/views/css/img/0-2.jpg)">
        <div class=" d-md-flex content-space-2 content-space-md-3">
            <div class="container d-md-flex justify-content-md-center align-items-md-center flex-md-column min-vh-md-50">
                <h1 class="display-1 text-white ">Fishing Partner</h1>
                <p class="lead text-white ">Providing various fishing spots and providing a dictionary of fish species</p>
            </div>
        </div>
    </div>
    <!-- End Hero -->
    <!-- Recommended fishing spots -->
    <div class="container content-space-2 content-space-lg-3">
        <!-- Title -->
        <div class="w-md-50 w-lg-25 text-center mx-md-auto mb-2 mb-md-5">
            <h2>추천 낚시터</h2>
            <p>Recommended fishing spots</p>
        </div>
        <!-- End Title -->

        <div class="text-center">
            <!-- Nav -->
            <ul class="nav nav-segment mb-7" id="featuresTab" role="tablist">
                <li class="nav-item" role="presentation">
                    <a class="nav-link active" href="#sea" id="sea-tab" data-bs-toggle="tab" data-bs-target="#sea" role="tab" aria-controls="sea" aria-selected="true">바다</a>
                </li>

                <li class="nav-item" role="presentation">
                    <a class="nav-link" href="#reservoir" id="reservoir-tab" data-bs-toggle="tab" data-bs-target="#reservoir" role="tab" aria-controls="reservoir" aria-selected="false">저수지</a>
                </li>
                
                <li class="nav-item" role="presentation">
                    <a class="nav-link" href="#flat" id="flat-tab" data-bs-toggle="tab" data-bs-target="#flat" role="tab" aria-controls="flat" aria-selected="false">평지</a>
                </li>
                
                 <li class="nav-item" role="presentation">
                    <a class="nav-link" href="#indoor" id="indoor-tab" data-bs-toggle="tab" data-bs-target="#indoor" role="tab" aria-controls="indoor" aria-selected="false">실내</a>
                </li>
                
            </ul>
            <!-- End Nav -->
        </div>
        
        <!-- Tab Content -->
        <div class="tab-content" id="houseHeroTabContent">
            <div class="tab-pane fade show active" id="sea" role="tabpanel" aria-labelledby="sea-tab">
                <div class="row gx-3">
                
                <%for(int i = 0; i < list1.size(); i++) {%>
                <div class="col-sm-6 col-lg-4 mb-3">
                        <!-- Card -->
                        <a class="card card-stretched-vertical card-transition shadow-none bg-img-start gradient-y-overlay-lg-dark" href="<%=path %>/fishing/view?fishingNo=<%=list1.get(i).getNo() %>" style="background-image: url(<%=path%>/views/css/img/PLACE_<%= list1.get(i).getNo() % 18 %>.jpg); min-height: 15rem;">
                            <div class="card-body">
                                <div class="mb-1">
                                    <span class="badge bg-light text-dark"><%=list1.get(i).getFishes().get(1).getName()%> 외 <%=list1.get(i).getFishes().size() - 1%>종</span>
                                </div>

                                <div class="card-footer">
                                    <h3 class="text-white mb-0"><%=list1.get(i).getName() %></h3>
                                    <span class="d-block text-white"><%=list1.get(i).getAddr1()%></span>
                                    <span class="d-block text-white"><%=list1.get(i).getAddr2()%></span>
                                </div>
                            </div>
                        </a>
                        <!-- End Card -->
                    </div>
                    	<!-- End Col -->
                <%} %>
               
                </div>
                <!-- End Row -->
            </div>

            <div class="tab-pane fade" id="reservoir" role="tabpanel" aria-labelledby="reservoir-tab">
                <div class="row gx-3">
               <%for(int i = 0; i < list2.size(); i++) {%>
                <div class="col-sm-6 col-lg-4 mb-3">
                        <!-- Card -->
                        <a class="card card-stretched-vertical card-transition shadow-none bg-img-start gradient-y-overlay-lg-dark" href="<%=path %>/fishing/view?fishingNo=<%=list2.get(i).getNo() %>" style="background-image: url(<%=path%>/views/css/img/PLACE_<%= list2.get(i).getNo() % 18 %>.jpg); min-height: 15rem;">
                            <div class="card-body">
                                <div class="mb-1">
                                    <span class="badge bg-light text-dark"><%=list2.get(i).getFishes().get(1).getName()%> 외 <%=list2.get(i).getFishes().size() - 1%>종</span>
                                </div>

                                <div class="card-footer">
                                    <h3 class="text-white mb-0"><%=list2.get(i).getName() %></h3>
                                    <span class="d-block text-white"><%=list2.get(i).getAddr1()%></span>
                                    <span class="d-block text-white"><%=list2.get(i).getAddr2()%></span>
                                </div>
                            </div>
                        </a>
                        <!-- End Card -->
                    </div>
                    	<!-- End Col -->
                <%} %>
                </div>
                <!-- End Row -->
            </div>
            
            <div class="tab-pane fade" id="flat" role="tabpanel" aria-labelledby="flat-tab">
                <div class="row gx-3">
                <%for(int i = 0; i < list3.size(); i++) {%>
                <div class="col-sm-6 col-lg-4 mb-3">
                        <!-- Card -->
                        <a class="card card-stretched-vertical card-transition shadow-none bg-img-start gradient-y-overlay-lg-dark" href="<%=path %>/fishing/view?fishingNo=<%=list3.get(i).getNo() %>" style="background-image: url(<%=path%>/views/css/img/PLACE_<%= list3.get(i).getNo() % 18 %>.jpg); min-height: 15rem;">
                            <div class="card-body">
                                <div class="mb-1">
                                    <span class="badge bg-light text-dark"><%=list3.get(i).getFishes().get(1).getName()%> 외 <%=list3.get(i).getFishes().size() - 1%>종</span>
                                </div>

                                <div class="card-footer">
                                    <h3 class="text-white mb-0"><%=list3.get(i).getName() %></h3>
                                    <span class="d-block text-white"><%=list3.get(i).getAddr1()%></span>
                                    <span class="d-block text-white"><%=list3.get(i).getAddr2()%></span>
                                </div>
                            </div>
                        </a>
                        <!-- End Card -->
                    </div>
                    	<!-- End Col -->
                <%} %>
               
                </div>
                <!-- End Row -->
            </div>
            
            <div class="tab-pane fade" id="indoor" role="tabpanel" aria-labelledby="indoor-tab">
                <div class="row gx-3">
                <%for(int i = 0; i < list4.size(); i++) {%>
                <div class="col-sm-6 col-lg-4 mb-3">
                        <!-- Card -->
                        <a class="card card-stretched-vertical card-transition shadow-none bg-img-start gradient-y-overlay-lg-dark" href="<%=path %>/fishing/view?fishingNo=<%=list4.get(i).getNo() %>" style="background-image: url(<%=path%>/views/css/img/PLACE_<%= list4.get(i).getNo() % 18 %>.jpg); min-height: 15rem;">
                            <div class="card-body">
                                <div class="mb-1">
                                    <span class="badge bg-light text-dark"><%=list4.get(i).getFishes().get(1).getName()%> 외 <%=list4.get(i).getFishes().size() - 1%>종</span>
                                </div>

                                <div class="card-footer">
                                    <h3 class="text-white mb-0"><%=list4.get(i).getName() %></h3>
                                    <span class="d-block text-white"><%=list4.get(i).getAddr1()%></span>
                                    <span class="d-block text-white"><%=list4.get(i).getAddr2()%></span>
                                </div>
                            </div>
                        </a>
                        <!-- End Card -->
                    </div>
                    	<!-- End Col -->
                <%} %>
               
                </div>
                <!-- End Row -->
            </div>
            
        </div>
        <!-- End Tab Content -->
        
        
        
    </div>
    <!-- End Recommended fishing spots -->
    <!-- Card Grid -->
    <div class="container content-space-1 content-space-lg-0">
        <!-- Heading -->
        <div class="w-md-50 w-lg-25 text-center mx-md-auto mb-3 mb-md-6">
            <h2>이달의 어종</h2>
            <p>fish of the month</p>
        </div>
        <!-- End Heading -->

        <div class="row row-cols-1 row-cols-sm-2 row-cols-lg-3 mb-5">
            <div class="col mb-5">
                <!-- Card -->
                <div class="card h-100">
                    <img class="card-img-top" src="<%=path %>/views/css/fish/FISH_40.png" alt="Image Description">

                    <div class="card-body">
                        <div class="mb-3">
                            <h4>학꽁치</h4>
                        </div>
                        <p class="card-text">동갈치목 학공치과의 바다 물고기로 꽁치와는 이름이 비슷하지만 과부터 다르기 때문에 꽤 거리가 먼 종이다.</p>
                    </div>

                    <div class="card-footer pt-0">
                        <a class="card-link" href="<%=path%>/fish/view?fishNo=40">더 알아보기 <i class="bi-chevron-right small ms-1"></i></a>
                    </div>
                </div>
                <!-- End Card -->
            </div>
            <!-- End Col -->

            <div class="col mb-5">
                <!-- Card -->
                <div class="card h-100">
                    <img class="card-img-top" src="<%=path %>/views/css/fish/FISH_39.png" alt="Image Description">

                    <div class="card-body">
                        <div class="mb-3">
                            <h4>볼락</h4>
                        </div>
                        <p class="card-text">암갈색을 띤 바다 물고기로서, 볼락의 일종으로 우럭이라 불리운다. </p>
                    </div>

                    <div class="card-footer pt-0">
                        <a class="card-link" href="<%=path%>/fish/view?fishNo=39">더 알아보기 <i class="bi-chevron-right small ms-1"></i></a>
                    </div>
                </div>
                <!-- End Card -->
            </div>
            <!-- End Col -->

            <div class="col mb-5">
                <!-- Card -->
                <div class="card h-100">
                    <img class="card-img-top" src="<%=path %>/views/css/fish/FISH_19.png" alt="Image Description">

                    <div class="card-body">
                        <div class="mb-3">
                            <h4>대구</h4>
                        </div>
                        <p class="card-text">대구과에 속하는 식용 물고기로 입이 커서 대구라고한다.</p>
                    </div>

                    <div class="card-footer pt-0">
                        <a class="card-link" href="<%=path%>/fish/view?fishNo=19">더 알아보기 <i class="bi-chevron-right small ms-1"></i></a>
                    </div>
                </div>
                <!-- End Card -->
            </div>
            <!-- End Col -->
        </div>
        <!-- End Row -->

        <div class="text-center content-space-t-xl-0 content-space-b-lg-0">
            <a class="btn btn-outline-primary" href="<%=path%>/fish/list">전체 보기</a>
        </div>
    </div>
    <!-- End Card Grid -->


    <!-- JS Plugins Init. -->
    <script>
        (function() {
            // INITIALIZATION OF MEGA MENU
            // =======================================================
            new HSMegaMenu('.js-mega-menu', {
                desktop: {
                    position: 'left'
                }
            })
        })()
    </script>

    <!-- 게시판 바로가기-->
    <!-- Card Grid -->
    <div class="container content-space-1 content-space-t-xl-3 content-space-b-lg-4">
        <!-- Heading -->
        <div class="w-md-75 w-lg-50 text-center mx-md-auto mb-5">
            <h2>Service</h2>
        </div>
        <!-- End Heading -->

        <div class="text-center mb-5">
            <!-- List Checked -->
            <ul class="list-inline list-checked list-checked-primary">
                <li class="list-inline-item list-checked-item">공지사항</li>
                <li class="list-inline-item list-checked-item">자유게시판</li>
                <li class="list-inline-item list-checked-item">고객센터</li>
            </ul>
            <!-- End List Checked -->
        </div>

        <div class="row mb-5 mb-md-0">
            <div class="col-sm-6 col-lg-4 mb-4 mb-lg-0">
                <!-- Card -->
                <div class="card card-sm h-100">
                    <div class="p-2">
                        <img class="card-img" src="<%=path %>/views/css/img/13.jpg" alt="Image Description">
                    </div>

                    <div class="card-body">
                        <h4 class="card-title">공지사항</h4>
                        <p class="card-text">Notice.</p>

                        <!-- List Pointer -->
                        <ul class="list-pointer mb-0">
                            <li class="list-pointer-item">공지사항 테스트 3</li>
                            <li class="list-pointer-item">공지사항 테스트 2</li>
                            <li class="list-pointer-item">공지사항 테스트 1</li>
                        </ul>
                        <!-- End List Pointer -->
                    </div>

                    <a class="card-footer card-link border-top" href="<%=path%>/board/notice">더 알아보기 <i class="bi-chevron-right small ms-1"></i></a>
                </div>
                <!-- End Card -->
            </div>
            <!-- End Col -->

            <div class="col-sm-6 col-lg-4 mb-4 mb-lg-0">
                <!-- Card -->
                <div class="card card-sm h-100">
                    <div class="p-2">
                        <img class="card-img" src="<%=path %>/views/css/img/14.jpg" alt="Image Description">
                    </div>

                    <div class="card-body">
                        <h4 class="card-title">자유게시판</h4>
                        <p class="card-text">notice board.</p>

                        <!-- List Pointer -->
                        <ul class="list-pointer mb-0">
                            <li class="list-pointer-item">자유 게시판 테스트 3</li>
                            <li class="list-pointer-item">자유 게시판 테스트 2</li>
                            <li class="list-pointer-item">자유 게시판 테스트 1</li>
                        </ul>
                        <!-- End List Pointer -->
                    </div>

                    <a class="card-footer card-link border-top" href="<%=path%>/board/list">더 알아보기 <i class="bi-chevron-right small ms-1"></i></a>
                </div>
                <!-- End Card -->
            </div>
            <!-- End Col -->

            <div class="col-sm-6 col-lg-4">
                <!-- Card -->
                <div class="card card-sm h-100">
                    <div class="p-2">
                        <img class="card-img" src="<%=path %>/views/css/img/15.jpg" alt="Image Description">
                    </div>

                    <div class="card-body">
                        <h4 class="card-title">고객센터</h4>
                        <p class="card-text">customer service center.</p>

                        <!-- List Pointer -->
                        <ul class="list-pointer mb-0">
                            <li class="list-pointer-item">FAQ : 자주하는 질문</li>
                            <li class="list-pointer-item">[이용/문의]고객센터의 운영시간을 알고 싶어요.</li>
                            <li class="list-pointer-item">[취소/환불]이용날짜를 바꾸고 싶어요.</li>
                        </ul>
                        <!-- End List Pointer -->
                    </div>

                    <a class="card-footer card-link border-top" href="<%=path%>/views/board/center.jsp">더 알아보기 <i class="bi-chevron-right small ms-1"></i></a>
                </div>
                <!-- End Card -->
            </div>
            <!-- End Col -->
        </div>
        <!-- End Row -->
    </div>
    <!-- End Card Grid -->

    
    <!-- JS Implementing Plugins -->
    <script src="<%=path %>/views/css/hs-mega-menu.min.js"></script>

 
 <%@include file="footer.jsp" %>