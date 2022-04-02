<%@page import="common.util.KeywordInfo"%>
<%@page import="common.util.PageInfo"%>
<%@page import="semi.fishing.model.vo.Fishing"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/views/header.jsp" %>
<style>
    .rightcolumn {
        float: right;
        width: 17%;
        margin-right: 15%;
        /* background-color: #faf9f9; */
    }
    .card-img-top{
        height: 165px;
    }
</style>


<%
	List<Fishing> list = (List<Fishing>)request.getAttribute("list");
	List<String> fishList = (List<String>) request.getAttribute("fishList"); 
	PageInfo pageInfo = (PageInfo)request.getAttribute("pageInfo");
	KeywordInfo keyInfo = (KeywordInfo) request.getAttribute("keyInfo");
	String pagePath = "&area=" + keyInfo.getArea() + "&type=" + keyInfo.getType() + "&fishName=" + keyInfo.getFish() + "&title=" + keyInfo.getTitle();
%>

	<!-- Hero -->
	<div class="container-fluid content-space-b-1 content-space-b-lg-0">
		<!-- Nav Scroller -->
		<div class="js-nav-scroller hs-nav-scroller-horizontal mb-2;">
			<span class="hs-nav-scroller-arrow-prev" style="display: none;">
				<a class="hs-nav-scroller-arrow-link" href="javascript:;"> <i
					class="bi-chevron-left"></i>
			</a>
			</span> <span class="hs-nav-scroller-arrow-next" style="display: none;">
				<a class="hs-nav-scroller-arrow-link" href="javascript:;"> <i
					class="bi-chevron-right"></i>
			</a>
			</span> <br>
			<br>
			<br>
			<br>
			<br>
			<div>
				<h1 class="text-muted text-center">낚시터</h1>
			</div>

			<!-- Search -->
            <form action="<%=path %>/fishing/list" method="get">
            <div class="container py-4">
                <div class="w-lg-75 mx-lg-auto">
                    
                        <!-- Input Card -->
                        <div class="input-card">
                            <div class="input-card-form">
                                <div class="input-group input-group-merge">
                                    <label for="searchAnswersForm" class="form-label visually-hidden">Search for answers</label>
                                    <span class="input-group-prepend input-group-text">
                <i class="bi-search"></i>
              </span>
                                    <input type="text" class="form-control" id="searchAnswersForm" name="title" placeholder="낚시터 이름 혹은 키워드로 검색해주세요." aria-label="Search for answers">
                                </div>
                            </div>
                            <button type="submit" class="btn btn-primary">검색</button>
                        </div>
                        <!-- End Input Card -->
                </div>
            </div>
        </form>
        </div>
        <!-- End Search -->


	<div class="rightcolumn"
		style="margin-right: 8%; margin-left: 3%; margin-top: 70px; padding-left: 40px; border-left: rgb(210, 227, 253) solid 1px; height: 1000px;">
		<form action="<%=path%>/fishing/list" method="get">
			<div class="card1" style="height: 100%;">
				<div class="mb-3">
					<h4 style="color: rgb(38, 88, 196); margin-top: 10px;">유형</h4>
					<select id="type" name="type" class="js-select form-select">
						<option value="" selected>전체</option>
						<option value="바다" <%=keyInfo.getType().equals("바다") ? "selected" : "" %>>바다</option>
						<option value="평지" <%=keyInfo.getType().equals("평지") ? "selected" : "" %>>평지</option>
						<option value="저수지" <%=keyInfo.getType().equals("저수지") ? "selected" : "" %>>저수지</option>
						<option value="실내" <%=keyInfo.getType().equals("실내") ? "selected" : "" %>>실내</option>
					</select>
				</div>
			</div>

			<div class="card2" style="height: 100%;">
				<div class="mb-3">
					<h4 style="color: rgb(38, 88, 196); margin-top: 30px;">지역</h4>
					<select id="area" name="area" class="js-select form-select">
						<option value="" selected>전체</option>
						<option value="서울" <%=keyInfo.getArea().equals("서울") ? "selected" : "" %> >서울</option>
						<option value="경기" <%=keyInfo.getArea().equals("경기") ? "selected" : "" %>>경기</option>
						<option value="인천" <%=keyInfo.getArea().equals("인천") ? "selected" : "" %>>인천</option>
						<option value="대구" <%=keyInfo.getArea().equals("대구") ? "selected" : "" %>>대구</option>
						<option value="울산" <%=keyInfo.getArea().equals("울산") ? "selected" : "" %>>울산</option>
						<option value="부산" <%=keyInfo.getArea().equals("부산") ? "selected" : "" %>>부산</option>
						<option value="광주" <%=keyInfo.getArea().equals("광주") ? "selected" : "" %>>광주</option>
						<option value="강원도" <%=keyInfo.getArea().equals("강원도") ? "selected" : "" %>>강원도</option>
						<option value="충청북도" <%=keyInfo.getArea().equals("충청북도") ? "selected" : "" %>>충청북도</option>
						<option value="충청남도" <%=keyInfo.getArea().equals("충청남도") ? "selected" : "" %>>충청남도</option>
						<option value="경상북도" <%=keyInfo.getArea().equals("경상북도") ? "selected" : "" %>>경상북도</option>
						<option value="경상남도" <%=keyInfo.getArea().equals("경상남도") ? "selected" : "" %>>경상남도</option>
						<option value="전라북도" <%=keyInfo.getArea().equals("전라북도") ? "selected" : "" %>>전라북도</option>
						<option value="전라남도" <%=keyInfo.getArea().equals("전라남도") ? "selected" : "" %>>전라남도</option>
					</select>
				</div>
			</div>
			<br>
			<br>

			<div class="card3" style="height: 100%;">
				<!-- Dropdown -->
				<div class="mb-3">
					<h4 style="color: rgb(38, 88, 196); margin-top: -30px;">주요 어종</h4>
					<select id="fishName" name="fishName" class="js-select form-select">
						<option value="" selected>전체</option>
						<%for(String name : fishList) {%>
						<option value="<%=name%>" <%=keyInfo.getFish().equals(name) ? "selected" : "" %>><%=name %></option>
						<%} %>
					</select>
				</div>
				<!-- End Dropdown -->
			</div>
			<button type="submit" class="btn btn-primary"
				style="width: 310px; margin-top: 20px;">적용</button>
		</form>
	</div>
</div>

	<!-- Tab Content -->
	<div class="tab-content">
		<div class="tab-pane fade show active" id="nav-one-eg1"
			role="tabpanel" aria-labelledby="nav-one-eg1-tab">

			<!-- Card Grid -->
			<div class="container content-space-2 content-space-lg-1">
				<!-- Heading -->
				<div class="w-md-75 w-lg-1 ms-10 mb-5">
					<h3>
						검색 결과 : <%=pageInfo.getListCount()%>건
					</h3>
				</div>
				<!-- End Heading -->
			<div class="row" style="margin-left: 60px;">
			<%
			for (int i = 0; i < list.size(); i++) {
			%>
				<div class="col-sm-4 mb-3 mb-sm-0">
					<!-- Card -->
					<a class="card card-transition text-center" href="<%=path%>/fishing/view?fishingNo=<%=list.get(i).getNo()%>">
						<img class="card-img-top"
						src="<%=path%>/views/css/img/PLACE_<%=list.get(i).getNo() % 18%>.jpg"
						alt="Image Description">
						<div class="card-body">
							<h2 class="card-title"><%=list.get(i).getName()%></h2>
							<p class="card-text text-body" style="margin-bottom: 1px;"><%=list.get(i).getType()%></p>
							<p class="card-text text-body"><%=list.get(i).getAddr1()%></p>
						</div>
					</a> <br> <br>
					<!-- End Card -->
				</div>
				<!-- End Col -->
				<%
				}
				%>
				<%if(list.size() == 0){ %>
				<div class="text-center content-space-1" style="height: 450px;">
					<img class="avatar avatar-xl mb-3 mt-7"
						src="<%=path%>/views/css/svg/empty-state-no-data.svg"
						alt="Image Description"  >
					<p class="card-text">해당하는 검색 결과가 없습니다.</p>
				</div>
				<%} %>
				</div>

				<!-- End Row -->
			</div>
			<!-- End Card Grid -->
		</div>
    </div>
    <!-- End Tab Content -->
    
    <!-- Pagination -->
	<%if(list.size() != 0) {%>
		<div id="page"
	style="display: inline-block; margin-bottom: 30px; margin-left: 810px; margin-top: -100px;">
	<!-- Pagination -->
	<nav aria-label="Page navigation">
		<ul class="pagination justify-content-center">
			<%if(pageInfo.getCurrentPage() != 1) {%>
			<li class="page-item"><a class="page-link"
				href="<%=path %>/fishing/list?page=<%=pageInfo.getPrvePage()%><%=pagePath%>"
				aria-label="Prev">이전</a></li>
			<%} %>

			<%for (int i = pageInfo.getStartPage(); i <= pageInfo.getEndPage(); i++) {%>
			<%if(i == pageInfo.getCurrentPage()){ %>
			<li class="page-item active"><a class="page-link"><%=i %></a></li>
			<%}else { %>
			<li class="page-item"><a class="page-link"
				href="<%=path %>/fishing/list?page=<%=i%><%=pagePath%>"><%=i %></a></li>
			<%} %>
			<%} %>
			<%if(pageInfo.getCurrentPage() != pageInfo.getMaxPage()) {%>
			<li class="page-item"><a class="page-link"
				href="<%=path %>/fishing/list?page=<%=pageInfo.getNextPage() %><%=pagePath%>"
				aria-label="Next">다음</a></li>
			<%} %>


		</ul>
	</nav>
	<!-- End Pagination -->

</div>
	<%} %>
	<!-- End Pagination -->
<%@include file="/views/footer.jsp"%>