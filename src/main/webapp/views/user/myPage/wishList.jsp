<%@page import="semi.wish.model.vo.Wish"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="/views/header.jsp"%>

<%
	List<Wish> list = (List<Wish>) request.getAttribute("list");
%>

 <!-- ========== MAIN CONTENT ========== -->
    <main id="content" role="main" class="bg-light">
        <!-- Breadcrumb -->
        <div class="navbar-dark bg-dark" style="background-image: url(css/img/wave-pattern-light.svg);">
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
									href="<%=path%>/views/user/myPage/main.jsp"> 
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
									<li class="nav-item"><a class="nav-link active"
										> <i
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
                        <div class="card-header d-sm-flex justify-content-sm-between align-items-sm-center border-bottom">
                            <h5 class="card-header-title">최근에 찜한 목록</h5>
                        </div>

                        <!-- Body -->
                        <div class="card-body">
                            <!-- Form -->
                            <form>
                                <!-- List Group -->
                                <ul class="list-group list-group-flush list-group-no-gutters">
                                    						<%for(int i = 0; i < list.size(); i++) {%>
							                        <!-- Item -->
                                    <li class="list-group-item">
                                        <div class="d-flex">
                                            <a class="card card-transition text-center" href="<%=path%>/fishing/view?fishingNo=<%=list.get(i).getFishing().getNo()%>">
                                                <img style="max-width: 300px;" src="<%=path %>/views/css/img/PLACE_<%=list.get(i).getFishing().getNo() % 18 %>.jpg" alt="Image Description">
                                            </a>

                                            <div class="flex-grow-1 ms-3">
                                                <div class="row">
                                                    <div class="col-sm-7 mb-3 mb-sm-0">
                                                        <h3><a class="text-dark" href="<%=path%>/fishing/view?fishingNo=<%=list.get(i).getFishing().getNo()%>"><%=list.get(i).getFishing().getName() %></a></h3>

                                                        <div class="d-grid gap-1">
                                                            <div class="text-body">
                                                                <span class="small">유형:</span>
                                                                <span class="fw-semi-bold small"><%=list.get(i).getFishing().getType() %></span>
                                                            </div>

                                                            <div class="text-body">
                                                                <span class="small">주소:</span>
                                                                <span class="fw-semi-bold small"><%=list.get(i).getFishing().getAddr1() %></span>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <!-- End Col -->
                                                    <div class="col-4 col-sm-3 d-none d-sm-inline-block text-right">
                                                        <a class="link-sm link-secondary small" onclick="deleteWish(<%=list.get(i).getFishing().getNo()%>)">
                                                            <i class="bi-trash me-1"></i> 지우기
                                                        </a>
                                                    </div>
                                                    <!-- End Col -->
                                                </div>
                                                <!-- End Row -->
                                            </div>
                                        </div>
                                    </li>
                                    <!-- End Item -->
						<%} %>
                                </ul>
                                <!-- End List Group -->
                            </form>
                            <!-- End Form -->
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

	function deleteWish(no){
		const xhr = new XMLHttpRequest();
        xhr.open("get", "${pageContext.request.contextPath}/fishing/wish?fishingNo=" + no);

        xhr.onreadystatechange = () => {
            if (xhr.readyState == 4 && xhr.status == 200) {
                if (xhr.responseText == 'unLike') {
                    window.alert("위시리스트에서 제거 하였습니다.");
                    location.reload();
                }else{
                	window.alert("오류가 발생했습니다 지속적으로 발생시 문의부탁드립니다.");
                }
            }
        };
        xhr.send();
	}
	


/* 	$('#deleteBtn').click((e) =>{
		const xhr = new XMLHttpRequest();
        xhr.open("get", "${pageContext.request.contextPath}/fishing/wish?fishingNo=" + e);

        xhr.onreadystatechange = () => {
            if (xhr.readyState == 4 && xhr.status == 200) {
                if (xhr.responseText == 'unLike') {
                    window.alert("위시리스트에서 제거 하였습니다.");
                }else{
                	window.alert("오류가 발생했습니다 지속적으로 발생시 문의부탁드립니다.");
                }
            }
        };
        xhr.send();
	});
 */	
</script>


<%@ include file="/views/footer.jsp"%>