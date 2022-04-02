<%@page import="semi.fishing.model.vo.Review"%>
<%@page import="java.util.List"%>
<%@page import="semi.fishing.model.vo.Fishing"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/views/header.jsp" %>
<style>
#myform fieldset {
	display: inline-block; /* 하위 별점 이미지들이 있는 영역만 자리를 차지함.*/
	direction: rtl; /* 이모지 순서 반전 */
	border: 0; /* 필드셋 테두리 제거 */
}

#myform fieldset legend {
	text-align: left;
}

#myform input[type=radio] {
	display: none; /* 라디오박스 감춤 */
}

#myform label {
	font-size: 2em; /* 이모지 크기 */
	color: transparent; /* 기존 이모지 컬러 제거 */
	text-shadow: 0 0 0 #f0f0f0; /* 새 이모지 색상 부여 */
}

#myform label:hover {
	text-shadow: 0 0 0 #a00; /* 마우스 호버 */
}

#myform label:hover ~ label {
	text-shadow: 0 0 0 #a00; /* 마우스 호버 뒤에오는 이모지들 */
}

#myform input[type=radio]:checked ~ label {
	text-shadow: 0 0 0 #a00; /* 마우스 클릭 체크 */
}
</style>

<%
Fishing fishing = (Fishing) request.getAttribute("fishing");
List<Review> reviews = fishing.getReviews();
request.setAttribute("reviews", reviews);

float sum = 0;

int[] scoreArray = new int[5];

for (Review r : reviews) {
	int score = r.getScore();
	switch (score) {
	case 1:
		scoreArray[0]++;
		break;
	case 2:
		scoreArray[1]++;
		break;
	case 3:
		scoreArray[2]++;
		break;
	case 4:
		scoreArray[3]++;
		break;
	case 5:
		scoreArray[4]++;
		break;
	}
	sum += score;
}

float avg = (float) ((int) ((sum / reviews.size()) * 10)) / 10;
%>

 <!-- Content  -->
<div class="container content-space-2 content-space-lg-3" style="height: auto;">
    <br><br><br><br>
    <div class="row" >
      <div class="col-lg-7 mb-7 mb-lg-0" style="margin-top: 80px;">
        <div class="row">
          <div class="col-11 mb-4">
            <img class="img-fluid rounded-2" src="<%=path %>/views/css/img/PLACE_<%=fishing.getNo() % 18 %>.jpg" alt="Image Description" style="width: 100%; height: 400px;">
          </div>
          <!-- End Col -->
  

        </div>
        <!-- End Row -->
      </div>
      <!-- End Col -->
  
      <div class="col-lg-5" style="padding-left: 50px;">
        <div class="ps-lg-4">
          <div class="mb-6">
            <h1><%=fishing.getName() %></h1>
          </div>
          
          <hr class="my-6">
          
          <!-- Map Start -->
				<div id="staticMap" style="width: 400px; height: 350px; margin-top:-15px; margin-bottom: 15px;"></div>

				<script type="text/javascript"
					src="//dapi.kakao.com/v2/maps/sdk.js?appkey=440926f8972b25c61cded132c75dc609"></script>
				<script>
					// 이미지 지도에 표시할 마커입니다
					// 이미지 지도에 표시할 마커를 아래와 같이 배열로 넣어주면 여러개의 마커를 표시할 수 있습니다 
					var markers = [
							{
								position : new kakao.maps.LatLng(<%=fishing.getLatitude()%>, <%=fishing.getLongitude()%>)
							},
							{
								position : new kakao.maps.LatLng(<%=fishing.getLatitude()%>, <%=fishing.getLongitude()%>),
								text : '<%=fishing.getName()%>' // text 옵션을 설정하면 마커 위에 텍스트를 함께 표시할 수 있습니다     
							} ];

					var staticMapContainer = document
							.getElementById('staticMap'), // 이미지 지도를 표시할 div  
					staticMapOption = {
						center : new kakao.maps.LatLng(<%=fishing.getLatitude()%>, <%=fishing.getLongitude()%>), // 이미지 지도의 중심좌표
						level : 3, // 이미지 지도의 확대 레벨
						marker : markers
					// 이미지 지도에 표시할 마커 
					};

					// 이미지 지도를 생성합니다
					var staticMap = new kakao.maps.StaticMap(
							staticMapContainer, staticMapOption);
				</script>
				<!-- Map End -->
			
          <dl class="row">
            <dt class="col-sm-4">낚시터유형</dt>
            <dd class="col-sm-8"><%=fishing.getType() %></dd>
          </dl><br>
          <!-- End Row -->
  
          <dl class="row">
            <dt class="col-sm-4">주소<br>(도로명,지번)</dt>
            <dd class="col-sm-8">
              <ul class="list-unstyled text-muted">
                <li class="d-block small"><%=fishing.getAddr1() %></li>
                <li class="d-block small"><%=fishing.getAddr2() %></li>
              </ul>
            </dd>
          </dl>
          <!-- End Row -->
  
          <dl class="row">
            <dt class="col-sm-4">주요 어종</dt>
            <dd class="col-sm-8">
              <ul class="list-unstyled text-muted">
              <%for(int i = 0; i < fishing.getFishes().size(); i++){ %>
                <li class="d-block small"><%=fishing.getFishes().get(i).getName()%></li>
                <%} %>
              </ul>
            </dd>
          </dl>
          <!-- End Row -->

          <hr class="my-5">

                    <dl class="row">
                        <dt class="col-sm-2"></dt>
                        <dd class="col-sm-8">
                            <!-- Socials -->
                            <ul class="list-inline mb-3">
                                <li class="list-inline-item">
                                    <a class="btn btn-soft-secondary btn-lg btn-icon" href="<%=path %>/fishing/reserve/select?fishingNo=<%=fishing.getNo() %>" style="width: 120px; margin-right: 5px">
                                    예약하기
                                    </a>

                                    <a class="btn btn-soft-secondary btn-lg btn-icon"  id="wishBtn" data-bs-toggle="modal" data-bs-target="#exampleModal" style="width: 120px;">
                                    찜
                                    </a>
                                        <!-- Modal -->
                                        <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                                            <div class="modal-dialog" role="document">
                                            <div class="modal-content">
                                                <div class="modal-header">
                                                <h5 class="modal-title" id="exampleModalLabel">찜하기</h5>
                                                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                                </div>
                                                <div class="modal-body">
                                                위시리스트에 저장이 완료되었습니다.
                                                </div>
                                                <div class="modal-footer">
                                                <a type="button" class="btn btn-white" data-bs-dismiss="modal">닫기</a>
                                                <a href="<%=path%>/myPage/wishList" type="button" id="wishList" class="btn btn-primary">찜 목록으로 이동</a>
                                                </div>
                                            </div>
                                            </div>
                                        </div>
                                        <!-- End Modal -->
                                </li>
                            </ul>
              <!-- End Socials -->
            </dd>
          </dl>
          <!-- End Row -->
        </div>
        <!-- End Sticky Block -->
      </div>
      <!-- End Col -->
    </div>
    <!-- End Row -->


    <!-- Content -->
<div class="container content-space-1" >
  <div class="mb-5">
    <h3>리뷰</h3>
  </div>

  <div class="row mb-5">
    <div class="col-lg-4">
      <!-- Card -->
      <div class="card card-sm bg-primary text-center mb-3">
        <div class="card-body">
         <h2 class="text-light">사용자 리뷰</h2>
          <span class="display-4 text-white"><%=avg %></span>
        </div>
      </div>
      <!-- End Card -->
    </div>
    <!-- End Col -->

    <div class="col-lg-8">
      <!-- Ratings -->
      <div class="d-grid gap-2">
        <a class="row align-items-center" href="#">
          <div class="col-2 text-end">
            <div class="d-flex">
              <div class="d-flex gap-1 me-2">
                <img src="<%=path %>/views/css/svg/star.svg" alt="Review rating" width="25">
                <img src="<%=path %>/views/css/svg/star.svg" alt="Review rating" width="25">
                <img src="<%=path %>/views/css/svg/star.svg" alt="Review rating" width="25">
                <img src="<%=path %>/views/css/svg/star.svg" alt="Review rating" width="25">
                <img src="<%=path %>/views/css/svg/star.svg" alt="Review rating" width="25">
              </div>
              <span><%=scoreArray[4] %></span>
            </div>
          </div>
          <!-- End Col -->
        </a>
        <!-- End Row -->

        <a class="row align-items-center" href="#">
          <div class="col-2 text-end">
            <div class="d-flex">
              <div class="d-flex gap-1 me-2">
                <img src="<%=path %>/views/css/svg/star.svg" alt="Review rating" width="25">
                <img src="<%=path %>/views/css/svg/star.svg" alt="Review rating" width="25">
                <img src="<%=path %>/views/css/svg/star.svg" alt="Review rating" width="25">
                <img src="<%=path %>/views/css/svg/star.svg" alt="Review rating" width="25">
                <img src="<%=path %>/views/css/svg/star-muted.svg" alt="Review rating" width="25">
              </div>
              <span><%=scoreArray[3] %></span>
            </div>
          </div>
          <!-- End Col -->
        </a>
        <!-- End Row -->

        <a class="row align-items-center" href="#">
          <div class="col-2 text-end">
            <div class="d-flex">
              <div class="d-flex gap-1 me-2">
                <img src="<%=path %>/views/css/svg/star.svg" alt="Review rating" width="25">
                <img src="<%=path %>/views/css/svg/star.svg" alt="Review rating" width="25">
                <img src="<%=path %>/views/css/svg/star.svg" alt="Review rating" width="25">
                <img src="<%=path %>/views/css/svg/star-muted.svg" alt="Review rating" width="25">
                <img src="<%=path %>/views/css/svg/star-muted.svg" alt="Review rating" width="25">
              </div>
              <span><%=scoreArray[2] %></span>
            </div>
          </div>
          <!-- End Col -->
        </a>
        <!-- End Row -->

        <a class="row align-items-center" href="#">
          <div class="col-2 text-end">
            <div class="d-flex">
              <div class="d-flex gap-1 me-2">
                <img src="<%=path %>/views/css/svg/star.svg" alt="Review rating" width="25">
                <img src="<%=path %>/views/css/svg/star.svg" alt="Review rating" width="25">
                <img src="<%=path %>/views/css/svg/star-muted.svg" alt="Review rating" width="25">
                <img src="<%=path %>/views/css/svg/star-muted.svg" alt="Review rating" width="25">
                <img src="<%=path %>/views/css/svg/star-muted.svg" alt="Review rating" width="25">
              </div>
              <span><%=scoreArray[1] %></span>
            </div>
          </div>
          <!-- End Col -->
        </a>
        <!-- End Row -->

        <a class="row align-items-center" href="#">
          <div class="col-2 text-end">
            <div class="d-flex">
              <div class="d-flex gap-1 me-2">
                <img src="<%=path %>/views/css/svg/star.svg" alt="Review rating" width="25">
                <img src="<%=path %>/views/css/svg/star-muted.svg" alt="Review rating" width="25">
                <img src="<%=path %>/views/css/svg/star-muted.svg" alt="Review rating" width="25">
                <img src="<%=path %>/views/css/svg/star-muted.svg" alt="Review rating" width="25">
                <img src="<%=path %>/views/css/svg/star-muted.svg" alt="Review rating" width="25">
              </div>
              <span><%=scoreArray[0] %></span>
            </div>
          </div>
          <!-- End Col -->
        </a>
        <!-- End Row -->
      </div>
      <!-- End Ratings -->
    </div>
    <!-- End Col -->
  </div><br>
  <!-- End Row -->
  	<%if(loginUser != null) {%>
	<form name="myform" id="myform" method="post" action="<%=path%>/fishing/review">
    	<fieldset>
        <legend>댓글 등록</legend>
        <input type="radio" name="rating" value="5" id="rate1"><label for="rate1">⭐</label>
        <input type="radio" name="rating" value="4" id="rate2"><label for="rate2">⭐</label>
        <input type="radio" name="rating" value="3" id="rate3"><label for="rate3">⭐</label>
        <input type="radio" name="rating" value="2" id="rate4"><label for="rate4">⭐</label>
        <input type="radio" name="rating" value="1" id="rate5"><label for="rate5">⭐</label>
    	</fieldset>
    	<br>
    	<textarea name="content" id="replyContent" cols="110" rows="3"></textarea>
    	<input type="hidden" name="fishingNo" value="<%=fishing.getNo()%>">
    	<input type="hidden" name="userId" value="<%=loginUser.getUserId()%>">
    	<button type="submit" id="btn-insert" class="btn btn-white">등록</button>
    </form>
    <%} %>
    
    
    
    
    
  
    
    
    
   
	
  <!-- Comment -->
 <ul class="list-comment list-comment-divider mb-10">
    <!-- Item -->
      <%for(Review r : fishing.getReviews()) {%>
    	<li class="list-comment-item">
      <div class="d-flex gap-1 mb-3">
      <%for(int i = 0; i < r.getScore(); i++) {%>
      	<img src="<%=path %>/views/css/svg/star.svg" alt="Review rating" width="16">
      <%} %>
      <%for(int i = 0; i < 5 - r.getScore(); i++){ %>
      	<img src="<%=path %>/views/css/svg/star-muted.svg" alt="Review rating" width="16">
      <%} %>
        
      </div>
      <!-- Media -->
      <div class="d-flex align-items-center mb-4">
        <div class="flex-grow-1 ms-1">
          <div class="d-flex justify-content-between align-items-center">
            <h5 class="mb-0"><%=r.getUserId() %></h5>
            <span class="d-block small text-muted"><%=r.getCreatedDate() %></span>
          </div>
        </div>
      </div>
      <!-- End Media -->
      <div style="margin-bottom: -15px;">
        <p><%=r.getContent() %></p>
      </div>
      <!-- <div style="margin-bottom: -100px;margin-top: -15px; margin-left: 1050px; display: inline-block; height: 25px; border: 1px solid black;"><a href="#">삭제</a></div> -->
    </li>
    <!-- End Item -->
    <%} %>
  </ul>
  <!-- End Comment -->
  </div>
</div>


 

<script>
	$('#wishBtn').click(() =>{
		const xhr = new XMLHttpRequest();
        xhr.open("get", "${pageContext.request.contextPath}/fishing/wish?fishingNo=" + <%=fishing.getNo()%>);

        xhr.onreadystatechange = () => {
            if (xhr.readyState == 4 && xhr.status == 200) {
                if (xhr.responseText == 'like') {
                    $('.modal-body').text("위시리스트에 저장이 완료되었습니다.");
                } else if(xhr.responseText == 'unLike') {
                    $('.modal-body').text("위시리스트에서 제거 하였습니다.");
                }else{
                    $('.modal-body').text("로그인이 필요합니다.");
                }
            }
        };
        xhr.send();
	});
	
</script>

<%@ include file="/views/footer.jsp" %>


