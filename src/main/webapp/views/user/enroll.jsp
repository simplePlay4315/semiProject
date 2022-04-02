<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file ="/views/header.jsp"%>

<!-- Form -->
    <div class="bg-img-start" style="background-image: url(<%=path%>/views/css/img/card-11.svg);">
        <div class="container content-space-2 content-space-lg-3">
            <div class="flex-grow-1 mx-auto" style="max-width: 28rem;">
                <!-- Heading -->
                <div class="text-center mb-5 mb-md-7">
                    <h1 class="h2">회원가입</h1>
                </div>
                <!-- End Heading -->

                <!-- Form -->
                <form class="js-validate needs-validation" method="post" action="<%=path%>/enroll">
                    <!-- Form -->
                    <div class="mb-3" id="idDiv">
                        <label class="form-label" for="userId">아이디</label>
                        <input type="text" class="form-control form-control-lg" name="userId" id="userId" placeholder="아이디" aria-label="id" required>
                        <div id="id-check"></div>
                    </div>
                    <!-- End Form -->

                    <!-- Form -->
                    <div class="mb-3">
                        <label class="form-label" for="userPw">비밀번호</label>

                        <div class="input-group input-group-merge" data-hs-validation-validate-class>
                            <input type="password" class="js-toggle-password form-control form-control-lg" name="userPw" id="userPw" placeholder="비밀번호" aria-label="password" required data-hs-toggle-password-options='{
                       "target": [".js-toggle-password-target-1"],
                       "defaultClass": "bi-eye-slash",
                       "showClass": "bi-eye",
                       "classChangeTarget": ".js-toggle-passowrd-show-icon-1"
                     }'>
                            <a class="js-toggle-password-target-1 input-group-append input-group-text" href="javascript:;">
                                <i class="js-toggle-passowrd-show-icon-1 bi-eye"></i>

                            </a>
                        </div>
                        <div id="pw-check"></div>
                    </div>
                    <!-- End Form -->

                    <!-- Form -->
                    <div class="mb-3">
                        <label class="form-label" for="userPw2">비밀번호 확인</label>

                        <div class="input-group input-group-merge" data-hs-validation-validate-class>
                            <input type="password" class="js-toggle-password form-control form-control-lg" name="userPw2" id="userPw2" placeholder="비밀번호 확인" aria-label="password" required data-hs-toggle-password-options='{
                     "target": [".js-toggle-password-target-2"],
                     "defaultClass": "bi-eye-slash",
                     "showClass": "bi-eye",
                     "classChangeTarget": ".js-toggle-passowrd-show-icon-2"
                   }'>
                            <a class="js-toggle-password-target-2 input-group-append input-group-text" href="javascript:;">
                                <i class="js-toggle-passowrd-show-icon-2 bi-eye"></i>
                            </a>
                        </div>
                        <div id="pw2-check"></div>
                    </div>
                    <!-- End Form -->

                    <!-- Form -->
                    <div class="mb-3">
                        <label class="form-label" for="userName">이름</label>
                        <input type="text" class="form-control form-control-lg" name="userName" id="userName" placeholder="이름" aria-label="name" required>
                        <div id="name-check"></div>
                    </div>
                    <!-- End Form -->

                    <!-- Form -->
                    <div class="mb-3">
                        <label class="form-label" for="gender">성별</label>
                        <select id="gender" name="gender" class="js-select form-select" aria-label="gender" required>
                        <option id="" value="" selected>선택</option>
                        <option id="genderMan" value="남">남자</option>
                        <option id="genderWomen" value="여">여자</option>
                        <option id="genderNone" value="무">선택 안함</option>
                    </select>
                    <div id="gender-check"></div>
                    </div>
                    <!-- End Form -->

                    <!-- Form -->
                    <div class="mb-3">
                        <label class="form-label" for="area">관심 지역</label>
                        <select id="area" name="area" class="js-select form-select" aria-label="area" required>
                        <option value="" selected>선택</option>
                        <option value="서울">서울</option>
                        <option value="경기">경기</option>
                        <option value="인천">인천</option>
                        <option value="강원도">강원도</option>
                        <option value="충청북도">충청북도</option>
                        <option value="충청남도">충청남도</option>
                        <option value="경상북도">경상북도</option>
                        <option value="경상남도">경상남도</option>
                        <option value="전라북도">전라북도</option>
                        <option value="전라남도">전라남도</option>
                        <option value="기타">기타</option>
                    </select>
                    <div id="area-check"></div>
                    </div>
                    <!-- End Form -->
                    
                    <!-- Form -->
                    <div class="mb-3">
                        <label class="form-label" for="email">이메일</label>
                        <input type="email" class="form-control form-control-lg" name="email" id="email" placeholder="email@address.com" aria-label="email" required>
                    <div id="email-check"></div>
                    </div>
                    <!-- End Form -->

                    <!-- Form -->
                    <div class="mb-3">
                        <label class="form-label" for="phone">연락처</label>
                        <input type="text" class="form-control form-control-lg" name="phone" id="phone" placeholder="010-xxxx-xxxx" aria-label="phone" required>
                    <div id="phone-check"></div>
                    </div>
                    <!-- End Form -->

                    <div class="d-grid mb-3">
                        <button type="submit" class="btn btn-primary btn-lg fw-bold" id="enroll-btn">가입하기</button>
                    </div>
                </form>
                <!-- End Form -->
            </div>
        </div>
    </div>
    <!-- End Form -->
    
    <!-- JS Implementing Plugins -->
  <script src="<%=path %>/views/css/hs-toggle-password.js"></script>
	<script>
        (function() {
            // INITIALIZATION OF TOGGLE PASSWORD
            // =======================================================
            new HSTogglePassword('.js-toggle-password')
        })()
    </script>
    
    <script>
    $('#userId').focusout(function() {
        let id = $('#userId').val();
        var regExp = /^[a-z]+[a-z0-9]{3,19}$/g;
    	if(id == null || id.length == 0){
    		$('#id-check').html("필수 입력 정보입니다.");
            $('#id-check').css("color", "red");
            return false;
    	}else{
        if (id.length < 4) {
            $('#id-check').text("아이디는 최소 4자 이상 입력해야 합니다.");
            $('#id-check').css("color", "red");
            return false;
        }
        if(regExp.test(id) == false){
            $('#id-check').text("아이디는 영문 소문자, 숫자만 사용 가능합니다.");
            $('#id-check').css("color", "red");
            return false;	
        }
        const xhr = new XMLHttpRequest();
        xhr.open("get", "${pageContext.request.contextPath}/user/checkId?userId=" + id);

        xhr.onreadystatechange = () => {
            if (xhr.readyState == 4 && xhr.status == 200) {
                if (xhr.responseText == 'used') {
                    $('#id-check').text("이미 존재하는 아이디입니다.");
                    $('#id-check').css("color", "red");
                } else {
                    $('#id-check').text("사용 가능한 아이디입니다.");
                    $('#id-check').css("color", "green");
                }
            }
        };
        xhr.send();
    }});
    
    $('#userPw').focusout(function() {
    	let pw = $('#userPw').val();
    	var regExp = /^(?=.*\d)(?=.*[a-zA-Z])[0-9a-zA-Z]{8,16}$/;
    	if(pw == null || pw.length == 0){
    		$('#pw-check').html("필수 입력 정보입니다.");
            $('#pw-check').css("color", "red");
    	}else{
    	if(regExp.test(pw) == false){
    		$('#pw-check').text("비밀번호는 8~16자 영문 대/소문자, 숫자를 조합해야 합니다.");
            $('#pw-check').css("color", "red");
    	}else {
    		$('#pw-check').text("사용 가능한 비밀번호입니다.");
            $('#pw-check').css("color", "green");
    	}
    }});
    
    $('#userPw2').focusout(function() {
    	if($(this).val() == null || $(this).val().length == 0){
    		$('#pw2-check').html("필수 입력 정보입니다.");
            $('#pw2-check').css("color", "red");
    	}else{
    	if(userPw2.value != userPw.value){
    		$('#pw2-check').text("비밀번호가 일치하지 않습니다.");
            $('#pw2-check').css("color", "red");
        }else{
        	$('#pw2-check').text("비밀번호가 일치합니다.");
            $('#pw2-check').css("color", "green");
        }
    }});
    
    $('#userName').focusout(function() {
    	let name = $('#userName').val();
    	var regExp = /^[가-힣a-zA-Z]+$/;
    	if(name == null || name.length == 0){
    		$('#name-check').html("필수 입력 정보입니다.");
            $('#name-check').css("color", "red");
    	}else{
    	if(regExp.test(name) == false){
    		$('#name-check').text("한글과 영문 대/소문자만 입력 가능합니다.");
            $('#name-check').css("color", "red");
    	}else {
    		$('#name-check').text("");
    	}
    }});
    
    $('#gender').focusout(function() {
    	if($(this).val() == ''){
            $('#gender-check').html("필수 입력 정보입니다.");
            $('#gender-check').css("color", "red");
        } else {
			$('#gender-check').html("");
        }
    });

    $('#area').focusout(function() {
    	if($(this).val() == ''){
            $('#area-check').html("필수 입력 정보입니다.");
            $('#area-check').css("color", "red");
        } else {
			$('#area-check').html("");
        }
    });
    
    $('#email').focusout(function() {
    	let email = $('#email').val();
    	var regExp = /[a-z0-9]{2,}@[a-z0-9-]{2,}.[a-z0-9]{2,}/i;
    	if($(this).val() == null || $(this).val().length == 0){
    		$('#email-check').text("필수 입력 정보입니다.");
            $('#email-check').css("color", "red");
    	}else{
    	if(regExp.test(email) == false){
    		$('#email-check').text("이메일 주소를 다시 확인해주세요.");
            $('#email-check').css("color", "red");
    	}else {
    		$('#email-check').text("사용 가능한 이메일 주소입니다.");
            $('#email-check').css("color", "green");
    	}
    }});
    
    $('#phone').focusout(function() {
    	let phone = $('#phone').val();
    	var regExp = /^01([0|1|6|7|8|9]?)-?([0-9]{3,4})-?([0-9]{4})$/;
    	if($(this).val() == null || $(this).val().length == 0){
    		$('#phone-check').text("필수 입력 정보입니다.");
            $('#phone-check').css("color", "red");
    	}else{
    	if(regExp.test(phone) == false){
    		$('#phone-check').text("형식에 맞지 않는 번호입니다.");
            $('#phone-check').css("color", "red");
    	}else {
    		$('#phone-check').text("");
    	}
    }});
    /*
    function check() { // onsubmit="return check()"
        if (checkId('test')
                & checkuserPw()
                & checkuserPw2()
                & checkuserName()
                & checkarea()
                & checkgender()
                & checkemail()
                & checkphne()
        ) {
            return true;
        } else {
            return false;
        }
    }*/
    </script>
<%@ include file ="/views/footer.jsp"%>