<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/views/header.jsp"%>



<!-- ========== MAIN CONTENT ========== -->
    <main id="content" role="main" class="bg-light">
        <!-- Breadcrumb -->
        <div class="navbar-dark bg-dark" style="background-image: url(css/img/wave-pattern-light.svg);">
            <div class="container content-space-2 content-space-b-lg-2">
                <div class="row align-items-center">
                    <div class="col d-none d-lg-block">
                        <div class="d-none d-lg-block">
                            <h1 class="h2 text-white">사용자 정보</h1>
                        </div>

                        <!-- Breadcrumb -->
                        <nav aria-label="breadcrumb">
                            <ol class="breadcrumb breadcrumb-light mb-0">
                                <li class="breadcrumb-item">계정</li>
                                <li class="breadcrumb-item active" aria-current="page">보안설정</li>
                            </ol>
                        </nav>
                        <!-- End Breadcrumb -->
                    </div>
                    <!-- End Col -->

                    <div class="col-auto">

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
                        <div id="sidebarNav" class="collapse navbar-collapse navbar-vertical">
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
									<li class="nav-item"><a class="nav-link active"> 
									<i class="bi-shield-shaded nav-icon"></i> 비밀번호 변경
									</a></li>
								</ul>
								<!-- End List -->

								<h6>예약</h6>

								<!-- List -->
								<ul class="nav nav-sm nav-tabs nav-vertical mb-4">
									<li class="nav-item"><a class="nav-link"
									href="<%=path%>/myPage/resList"> 
									<i class="bi-basket nav-icon"></i> 예약 목록
									</a></li>
									<li class="nav-item"><a class="nav-link"
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
                    <div class="d-grid gap-3 gap-lg-5">

                        <!-- Card -->
                        <div class="card">
                            <div class="card-header border-bottom">
                                <h5 class="card-header-title">비밀번호 변경</h5>
                            </div>

                            <!-- Body -->
                            <div class="card-body">
                                <!-- Form -->
                                <form method="post" action="<%=path%>/myPage/updatePwd">
                                    <!-- Form -->
                                    <div class="row mb-4">
                                        <label for="currentPasswordLabel" class="col-sm-3 col-form-label form-label">현재 비밀번호</label>

                                        <div class="col-sm-9">
                                            <input type="password" class="form-control" name="userPw" id="currentPasswordLabel" placeholder="현재 비밀번호를 입력해주세요." aria-label="Enter current password">
                                        </div>
                                    </div>
                                    <!-- End Form -->

                                    <!-- Form -->
                                    <div class="row mb-4">
                                        <label for="newPassword" class="col-sm-3 col-form-label form-label">새로운 비밀번호</label>

                                        <div class="col-sm-9">
                                            <input type="password" class="form-control" name="newPassword" id="newPassword" placeholder="새로운 비밀번호를 입력해주세요." aria-label="Enter new password">
                                        </div>
                                    </div>
                                    <!-- End Form -->

                                    <!-- Form -->
                                    <div class="row mb-4">
                                        <label for="confirmNewPasswordLabel" class="col-sm-3 col-form-label form-label">비밀번호 확인</label>

                                        <div class="col-sm-9">
                                            <div class="mb-3">
                                                <input type="password" class="form-control" name="confirmNewPassword" id="confirmNewPasswordLabel" placeholder="새로운 비밀번호를 다시 입력해주세요." aria-label="Confirm your new password">
                                            </div>
                                        </div>
                                    </div>
                                    <!-- End Form -->

                                    <div class="d-flex justify-content-end gap-2">
                                        <a class="btn btn-white" href="javascript:;">취소</a>
                                        <button type="submit" class="btn btn-primary">변경사항 저장</button>
                                    </div>
                                </form>
                                <!-- End Form -->
                            </div>
                            <!-- End Body -->
                        </div>
                        <!-- End Card -->

                    </div>
                </div>
                <!-- End Col -->
            </div>
            <!-- End Row -->
        </div>
        <!-- End Content Section -->
    </main>
    <!-- ========== END MAIN CONTENT ========== -->


<%@ include file="/views/footer.jsp"%>