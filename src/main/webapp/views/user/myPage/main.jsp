<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="/views/header.jsp" %>


<!-- ========== MAIN CONTENT ========== -->
<main id="content" role="main" class="bg-light">
	<!-- Breadcrumb -->
	<div class="navbar-dark bg-dark"
		style="background-image: url(<%=path%>/views/css/img/wave-pattern-light.svg);">
		<div class="container content-space-2 content-space-b-lg-2">
			<div class="row align-items-center">
				<div class="col">
					<div class="d-none d-lg-block">
						<h1 class="h2 text-white">사용자 정보</h1>
					</div>

					<!-- Breadcrumb -->
					<nav aria-label="breadcrumb">
						<ol class="breadcrumb breadcrumb-light mb-0">
							<li class="breadcrumb-item">계정</li>
							<li class="breadcrumb-item active" aria-current="page">회원정보</li>
						</ol>
					</nav>
					<!-- End Breadcrumb -->
				</div>
				<!-- End Col -->


					<!-- Responsive Toggle Button -->
					<button class="navbar-toggler d-lg-none" type="button"
						data-bs-toggle="collapse" data-bs-target="#sidebarNav"
						aria-controls="sidebarNav" aria-expanded="false"
						aria-label="Toggle navigation">
						<span class="navbar-toggler-default"> <i class="bi-list"></i>
						</span> <span class="navbar-toggler-toggled"> <i class="bi-x"></i>
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
	<div
		class="container content-space-1 content-space-t-lg-0 content-space-b-lg-2 mt-lg-n10">
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
									<li class="nav-item"><a class="nav-link active"> 
									<i class="bi-person-badge nav-icon"></i> 회원정보
									</a></li>
									<li class="nav-item"><a class="nav-link "
										href="<%=path%>/views/user/myPage/updatePwd.jsp"> <i
											class="bi-shield-shaded nav-icon"></i> 비밀번호 변경
									</a></li>
								</ul>
								<!-- End List -->
						
								<h6>예약</h6>

								<!-- List -->
								<ul class="nav nav-sm nav-tabs nav-vertical mb-4">
									<li class="nav-item"><a class="nav-link "
										href="<%=path%>/myPage/resList"> <i
											class="bi-basket nav-icon"></i> 예약 목록
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
				<div class="d-grid gap-3 gap-lg-5">
					<!-- Card -->
					<div class="card">
						<div class="card-header border-bottom">
							<h4 class="card-header-title">기본 정보</h4>
						</div>

						<!-- Body -->
						<div class="card-body">
							<form id="frm" method="post" action="<%=path%>/user/update" >
							<!-- ID LABEL -->
							<div class="row mb-4">
									<label 
										class="col-sm-3 col-form-label form-label">아이디</label>

									<div class="col-sm-9">
										<div class="input-group">
											<input type="text" class="form-control" name="userId"
												id="userId" aria-label="Clarice" readonly value="<%=loginUser.getUserId()%>">
										</div>
									</div>
								</div>
								<!-- End ID LABEL -->
							
								<div class="row mb-4">
									<label for="firstNameLabel"
										class="col-sm-3 col-form-label form-label">이름</label>

									<div class="col-sm-9">
										<div class="input-group">
											<input type="text" class="form-control" name="userName"
												id="firstNameLabel" aria-label="Clarice" value="<%=loginUser.getUserName()%>">
										</div>
									</div>
								</div>
								<!-- End Form -->

								<!-- Form -->
								<div class="row mb-4">
									<label for="emailLabel"
										class="col-sm-3 col-form-label form-label">이메일</label>

									<div class="col-sm-9">
										<input type="email" class="form-control" name="email"
											id="emailLabel" aria-label="clarice@example.com" value="<%=loginUser.getEmail()%>">
									</div>
								</div>
								<!-- End Form -->

								<!-- Form -->
								<div class="js-add-field row mb-4"
									data-hs-add-field-options='{
                      "template": "#addPhoneFieldTemplate",
                      "container": "#addPhoneFieldContainer",
                      "defaultCreated": 0
                    }'>
									<label for="phoneLabel"
										class="col-sm-3 col-form-label form-label">연락처</label>

									<div class="col-sm-9">
										<div class="input-group">
											<input type="text" class="js-input-mask form-control"
												name="phone" id="phoneLabel" aria-label="+x(xxx)xxx-xx-xx" value="<%=loginUser.getPhone()%>">
										</div>
										<!-- End Select -->
									</div>
								</div>
								<!-- End Form -->
								<!-- Form -->
								<div class="row mb-4">
									<label class="col-sm-3 col-form-label form-label">성별</label>

									<div class="col-sm-9">
										<div class="input-group input-group-md-down-break">
											<!-- Radio Check -->
											<label class="form-control" for="genderTypeRadio1"> <span
												class="form-check"> <input type="radio"
													class="form-check-input" name="gender" value="남"
													id="genderTypeRadio1" <%=loginUser.getGender().equals("남") ? "checked" : ""%>> <span
													class="form-check-label">남성</span>
											</span>
											</label>
											<!-- End Radio Check -->

											<!-- Radio Check -->
											<label class="form-control" for="genderTypeRadio2"> <span
												class="form-check"> <input type="radio"
													class="form-check-input" name="gender" value="여"
													id="genderTypeRadio2" <%=loginUser.getGender().equals("여") ? "checked" : ""%>> <span
													class="form-check-label">여성</span>
											</span>
											</label>
											<!-- End Radio Check -->

											<!-- Radio Check -->
											<label class="form-control" for="genderTypeRadio3"> <span
												class="form-check"> <input type="radio"
													class="form-check-input" name="gender" value="무"
													id="genderTypeRadio3" <%=loginUser.getGender().equals("무") ? "checked" : ""%>> <span
													class="form-check-label">선택 안함</span>
											</span>
											</label>
											<!-- End Radio Check -->
										</div>
									</div>
								</div>
								<!-- End Form -->

								<!-- Form -->
								<div class="row mb-4">
									<label for="emailLabel"
										class="col-sm-3 col-form-label form-label">관심 지역</label>

									<div class="col-sm-9">

										<select id="area" name="address" class="js-select form-select"
											aria-label="area">
											<option value="서울" <%=loginUser.getAddress().contains("서울") ? "selected" : ""%>>서울</option>
											<option value="경기" <%=loginUser.getAddress().contains("경기") ? "selected" : ""%>>경기</option>
											<option value="인천" <%=loginUser.getAddress().contains("인천") ? "selected" : ""%>>인천</option>
											<option value="강원도" <%=loginUser.getAddress().contains("강원도") ? "selected" : ""%>>강원도</option>
											<option value="충청북도" <%=loginUser.getAddress().contains("충청북도") ? "selected" : ""%>>충청북도</option>
											<option value="충청남도" <%=loginUser.getAddress().contains("충청남도") ? "selected" : ""%>>충청남도</option>
											<option value="경상북도" <%=loginUser.getAddress().contains("경상북도") ? "selected" : ""%>>경상북도</option>
											<option value="경상남도" <%=loginUser.getAddress().contains("경상남도") ? "selected" : ""%>>경상남도</option>
											<option value="전라북도" <%=loginUser.getAddress().contains("전라북도") ? "selected" : ""%>>전라북도</option>
											<option value="전라남도" <%=loginUser.getAddress().contains("전라남도") ? "selected" : ""%>>전라남도</option>
											<option value="기타" <%=loginUser.getAddress().contains("기타") ? "selected" : ""%>>기타</option>
										</select>
									</div>
								</div>
								<!-- End Form -->

							</form>
						</div>
						<!-- End Body -->

						<!-- Footer -->
						<div class="card-footer pt-0">
							<div class="d-flex justify-content-end gap-2">
								<a class="btn btn-white" href="javascript:;">취소</a> <a
									class="btn btn-primary" href="#" onclick="frm_submit()">변경사항 저장</a>
							</div>
						</div>
						<!-- End Footer -->
					</div>
					<!-- End Card -->
				</div>
				<!-- End Card -->
				<br>
				<!-- Card -->
				<div class="card">
					<div class="card-header border-bottom">
						<h4 class="card-header-title">회원 탈퇴</h4>
					</div>

					<!-- Body -->
					<div class="card-body">
						<p class="card-text">탈퇴 시 개인 데이터가 영구적으로 삭제되며 사이트 이용이 제한됩니다.</p>

						<form action="<%=path %>/myPage/delete" method="post">
						<div class="d-flex justify-content-end">
							<button type="submit" class="btn btn-danger">탈퇴하기</button>
						</div>
						</form>
					</div>
					<!-- End Body -->
				</div>
				<!-- End Card -->
			</div>
		</div>
		<!-- End Col -->
	</div>
	<!-- End Content -->
</main>
<!-- ========== END MAIN CONTENT ========== -->


<script>
	function frm_submit(){
		document.getElementById('frm').submit();
	}

</script>



<%@ include file="/views/footer.jsp" %>