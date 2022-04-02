<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@include file="/views/header.jsp" %>
<% String backPage = request.getHeader("Referer"); 
%>
<div class="bg-img-start"
	style="background-image: url(<%=path%>/views/css/img/card-11.svg);">
	
	<!-- Form -->
	<div class="container content-space-2 content-space-lg-3">
		<div class="flex-grow-1 mx-auto" style="max-width: 28rem;">
			<!-- Heading -->
			<div class="text-center mb-5 mb-md-7">
				<h1 class="h2">로그인</h1>
			</div>
			<!-- End Heading -->

			<!-- Form -->
			<form class="js-validate needs-validation" method="post" action="<%=path %>/login" novalidate>
				<!-- Form -->
				<input type="hidden" name="backPage" value="<%=backPage%>">
				<div class="mb-2">
					<input type="text" class="form-control form-control-lg"
						name="userId" id="userId" placeholder="아이디" aria-label="id"
						required> <span class="invalid-feedback">아이디를
						입력해주세요.</span>
				</div>
				<!-- End Form -->

				<!-- Form -->
				<div class="input-group input-group-merge"
					data-hs-validation-validate-class>
					<input type="password"
						class="js-toggle-password form-control form-control-lg"
						name="userPw" id="userP" placeholder="비밀번호"
						aria-label="userPw" required
						data-hs-toggle-password-options='{
                            "target": "#changePassTarget",
                            "defaultClass": "bi-eye-slash",
                            "showClass": "bi-eye",
                            "classChangeTarget": "#changePassIcon"
                        }'>
					<a id="changePassTarget"
						class="input-group-append input-group-text" href="javascript:;">
						<i id="changePassIcon" class="bi-eye"></i>
					</a>
				</div>
				<span class="invalid-feedback">비밀번호를 입력해주세요.</span>
				<!-- End Form -->

				<!-- Checkbox Switch -->
				<!-- <div class="form-check form-switch mt-1">
					<input type="checkbox" class="form-check-input" id="formSwitch1">
					<label class="form-check-label" for="formSwitch1">아이디 저장</label>
				</div> -->
				<!-- End Checkbox Switch -->
				<!-- <label><input type="checkbox" name="saveID"> 아이디 저장(or 로그인 유지+회의)</label> -->

				<div class="d-grid mt-4 mb-2">
					<button type="submit" class="btn btn-primary btn-lg fw-bold">로그인</button>
				</div>

				<div class="text-center">
					<a
						class="form-label-link" href="<%=path%>/enroll">회원가입</a>
				</div>
			</form>
			<!-- End Form -->
			<div style="min-height: 60px;"></div>
		</div>
	</div>
</div>
<!-- End Form -->

<!-- JS Implementing Plugins -->
<script src="css/hs-toggle-password.js"></script>

 <script>
        (function() {
            // INITIALIZATION OF BOOTSTRAP VALIDATION
            // =======================================================
            HSBsValidation.init('.js-validate')

            // INITIALIZATION OF TOGGLE PASSWORD
            // =======================================================
            new HSTogglePassword('.js-toggle-password')
        })()
    </script>
    
<%@include file="/views/footer.jsp" %>