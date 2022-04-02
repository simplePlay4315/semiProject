<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>

<%@ include file ="/views/header.jsp"%>

    <!-- ========== MAIN CONTENT ========== -->
    <main id="content" role="main">
        <!-- Hero -->
        <div class="bg-img-start" style="background-image: url(<%=path%>/views/css/img/card-11.svg);">
            <div class="container content-space-t-1 content-space-t-lg-3 content-space-b-1">
                <div class="w-md-75 w-lg-50 text-center mx-md-auto">
                    <h1>FAQ</h1>
                </div>
            </div>
        </div>
        <!-- End Hero -->

        <!-- FAQ -->
        <div class="container content-space-1 content-space-b-lg-5">
            <div class="w-lg-75 mx-lg-auto">
                <div class="d-grid gap-10">
                    <div class="d-grid gap-3">
                        <h2>회원정보</h2>

                        <!-- Accordion -->
                        <div class="accordion accordion-flush accordion-lg" id="accordionFAQBasics">
                            <!-- Accordion Item -->
                            <div class="accordion-item">
                                <div class="accordion-header" id="headingBasicsOne">
                                    <a class="accordion-button" role="button" data-bs-toggle="collapse" data-bs-target="#collapseBasicsOne" aria-expanded="true" aria-controls="collapseBasicsOne">
                                        [회원정보]아이디, 비밀번호가 기억나지 않아요.
                  </a>
                                </div>
                                <div id="collapseBasicsOne" class="accordion-collapse collapse show" aria-labelledby="headingBasicsOne" data-bs-parent="#accordionFAQBasics">
                                    <div class="accordion-body">
                                        아이디 찾기
                                        <br>1. 카카오톡/페이스북/네이버 계정으로 가입한 회원 : 해당 계정관리 업체의 고객센터에 문의 <br>2. 이메일 주소 가입 회원 비밀번호 찾기 <br>1) 이메일로 로그인하기 ▶ 비밀번호를 잊으셨나요? 선택 <br>2) 가입한 이메일 주소(아이디) 기재 <br>3) 수신된 메일에서 새로운 비밀번호로 변경 <br><br>위 방법으로도 이용에 불편을 겪으실 경우, 1:1문의
                                        또는 고객센터(☎1599-0000)로 문의 부탁드립니다.
                                    </div>
                                </div>
                            </div>
                            <!-- End Accordion Item -->

                            <!-- Accordion Item -->
                            <div class="accordion-item">
                                <div class="accordion-header" id="headingBasicsTwo">
                                    <a class="accordion-button collapsed" role="button" data-bs-toggle="collapse" data-bs-target="#collapseBasicsTwo" aria-expanded="false" aria-controls="collapseBasicsTwo">
                                        [회원정보]회원탈퇴는 어떻게 하나요?
                  </a>
                                </div>
                                <div id="collapseBasicsTwo" class="accordion-collapse collapse" aria-labelledby="headingBasicsTwo" data-bs-parent="#accordionFAQBasics">
                                    <div class="accordion-body">
                                        현재 탈퇴 기능이 제공되고 있지않아 탈퇴를 원하시는 계정아이디로 1:1 문의를 남겨주시거나 고객센터(☎1599-0000)로 문의 부탁드립니다. <br>고객 탈퇴 시 남아있는 모든 개인 정보 및 기타 정보는 삭제 처리되며, 탈퇴 이후에 정보 복구는 불가합니다.

                                    </div>
                                </div>
                            </div>
                            <!-- End Accordion Item -->

                            <!-- Accordion Item -->
                            <div class="accordion-item">
                                <div class="accordion-header" id="headingBasicsThree">
                                    <a class="accordion-button collapsed" role="button" data-bs-toggle="collapse" data-bs-target="#collapseBasicsThree" aria-expanded="false" aria-controls="collapseBasicsThree">
                                        [회원정보]비밀번호 찾기 시 메일이 오지 않아요.
                  </a>
                                </div>
                                <div id="collapseBasicsThree" class="accordion-collapse collapse" aria-labelledby="headingBasicsThree" data-bs-parent="#accordionFAQBasics">
                                    <div class="accordion-body">
                                        이메일 주소로 회원가입 한 경우, 이메일로 비밀번호 변경 메일을 보내드립니다. 이메일이 오지 않을 경우 <br>1.고객님의 메일 용량이 초과되지 않았는지, 입력하신 메일 주소의 오ㆍ탈자 여부 등을 확인해 주시기 바랍니다. <br>2.특정 단어 스팸 처리 등을 하신 경우, 이메일이 스팸/광고 편지함으로 분류될 수 있으니 스팸편지함이나 광고 편지함을 확인해주시기 바랍니다. <br>지속적으로
                                        비밀번호 찾기에 어려움을 겪으실 경우, 1:1문의 또는 고객센터(☎1599-0000)로 문의 부탁드립니다.
                                    </div>
                                </div>
                            </div>
                            <!-- End Accordion Item -->

                            <!-- Accordion Item -->
                            <div class="accordion-item">
                                <div class="accordion-header" id="headingBasicsFour">
                                    <a class="accordion-button collapsed" role="button" data-bs-toggle="collapse" data-bs-target="#collapseBasicsFour" aria-expanded="false" aria-controls="collapseBasicsFour">
                                        [회원정보]법인으로 가입이 가능한가요?
                  </a>
                                </div>
                                <div id="collapseBasicsFour" class="accordion-collapse collapse" aria-labelledby="headingBasicsFour" data-bs-parent="#accordionFAQBasics">
                                    <div class="accordion-body">
                                        법인회원으로는 가입이 불가하며, 개인회원으로만 가입이 가능합니다.
                                    </div>
                                </div>
                            </div>
                            <!-- End Accordion Item -->

                            <!-- Accordion Item -->
                            <div class="accordion-item">
                                <div class="accordion-header" id="headingBasicsFive">
                                    <a class="accordion-button collapsed" role="button" data-bs-toggle="collapse" data-bs-target="#collapseBasicsFive" aria-expanded="false" aria-controls="collapseBasicsFive">
                                        [회원정보]회원이 되면 어떠한 혜택이 있나요?
                  </a>
                                </div>
                                <div id="collapseBasicsFive" class="accordion-collapse collapse" aria-labelledby="headingBasicsFive" data-bs-parent="#accordionFAQBasics">
                                    <div class="accordion-body">
                                        회원으로 가입할 경우 낚시터 이벤트 참여, 포인트 적립 및 쿠폰 적용 등의 혜택을 제공합니다.
                                    </div>
                                </div>
                            </div>
                            <!-- End Accordion Item -->
                        </div>
                        <!-- End Accordion -->
                    </div>

                    <div class="d-grid gap-3">
                        <h2>이용방법</h2>

                        <!-- Accordion -->
                        <div class="accordion accordion-flush accordion-lg" id="accordionFAQSupport">
                            <!-- Accordion Item -->
                            <div class="accordion-item">
                                <div class="accordion-header" id="headingSupportOne">
                                    <a class="accordion-button collapsed" role="button" data-bs-toggle="collapse" data-bs-target="#collapseSupportOne" aria-expanded="false" aria-controls="collapseSupportOne">
                                        [이용방법]Fishing Partner으로 어떤 낚시를 할 수 있나요?
                  </a>
                                </div>
                                <div id="collapseSupportOne" class="accordion-collapse collapse" aria-labelledby="headingSupportOne" data-bs-parent="#accordionFAQSupport">
                                    <div class="accordion-body">
                                        Fishing Partner는 전국 어느 지역이든 낚시터에 관한 정보 및 어종정보를 검색 할 수 있으며, 또한 카테고리 별로 정보를 찾을수 있습니다.
                                    </div>
                                </div>
                            </div>
                            <!-- End Accordion Item -->

                            <!-- Accordion Item -->
                            <div class="accordion-item">
                                <div class="accordion-header" id="headingSupportTwo">
                                    <a class="accordion-button collapsed" role="button" data-bs-toggle="collapse" data-bs-target="#collapseSupportTwo" aria-expanded="false" aria-controls="collapseSupportTwo">
                                        [이용방법]내가 작성한 게시글은 어떻게 확인하나요?
                  </a>
                                </div>
                                <div id="collapseSupportTwo" class="accordion-collapse collapse" aria-labelledby="headingSupportTwo" data-bs-parent="#accordionFAQSupport">
                                    <div class="accordion-body">
                                        내글관리 에서 게시글, 사진, 댓글, 스크랩, 리뷰등을 확인 할 수 있습니다.
                                    </div>
                                </div>
                            </div>
                            <!-- End Accordion Item -->

                            <!-- Accordion Item -->
                            <div class="accordion-item">
                                <div class="accordion-header" id="headingSupportThree">
                                    <a class="accordion-button collapsed" role="button" data-bs-toggle="collapse" data-bs-target="#collapseSupportThree" aria-expanded="false" aria-controls="collapseSupportThree">
                                        [이용방법]찜하기 기능은 어떻게 사용하나요?
                  </a>
                                </div>
                                <div id="collapseSupportThree" class="accordion-collapse collapse" aria-labelledby="headingSupportThree" data-bs-parent="#accordionFAQSupport">
                                    <div class="accordion-body">
                                        해당 업체 상세페이지 상단 오른쪽에 하트를 눌러주시면 찜하기가 완료됩니다.
                                        <br><br>찜해둔 업체는 앱 하단 마이메뉴 ▶ 찜한업체에서 확인 하실 수 있으며, 찜한업체 중 원하는 업체를 쉽게 찾아 예약하실 수 있습니다.
                                    </div>
                                </div>
                            </div>
                            <!-- End Accordion Item -->

                            <!-- Accordion Item -->
                            <div class="accordion-item">
                                <div class="accordion-header" id="headingSupportFour">
                                    <a class="accordion-button collapsed" role="button" data-bs-toggle="collapse" data-bs-target="#collapseSupportFour" aria-expanded="false" aria-controls="collapseSupportFour">
                                        [이용방법]고객센터의 운영시간을 알고 싶어요.
                  </a>
                                </div>
                                <div id="collapseSupportFour" class="accordion-collapse collapse" aria-labelledby="headingSupportFour" data-bs-parent="#accordionFAQSupport">
                                    <div class="accordion-body">
                                        Fishing Partner 고객센터는 평일(공휴일 제외) 10시~18시까지 운영합니다. (점심시간 12시 ~ 13시 30분) 고객센터 연락처 ☎1599-0000
                                    </div>
                                </div>
                            </div>
                            <!-- End Accordion Item -->
                        </div>
                        <!-- End Accordion -->
                    </div>

                    <div class="d-grid gap-3">
                        <h2>취소/환불</h2>

                        <!-- Accordion -->
                        <div class="accordion accordion-flush accordion-lg" id="accordionFAQPayments">
                            <!-- Accordion Item -->
                            <div class="accordion-item">
                                <div class="accordion-header" id="headingPaymentsOne">
                                    <a class="accordion-button collapsed" role="button" data-bs-toggle="collapse" data-bs-target="#collapsePaymentsOne" aria-expanded="false" aria-controls="collapsePaymentsOne">
                                        [취소/환불]예약대기 건 예약취소하고 싶어요
                  </a>
                                </div>
                                <div id="collapsePaymentsOne" class="accordion-collapse collapse" aria-labelledby="headingPaymentsOne" data-bs-parent="#accordionFAQPayments">
                                    <div class="accordion-body">
                                        나의 예약내역 바로가기 ▶ 예약 건 클릭 후 하단 취소하기 버튼을 통해 신청이 가능합니다. <br>단, 환불 규정에 따라 수수료가 발생하거나 예약취소가 불가할 수 있습니다.
                                    </div>
                                </div>
                            </div>
                            <!-- End Accordion Item -->

                            <!-- Accordion Item -->
                            <div class="accordion-item">
                                <div class="accordion-header" id="headingPaymentsTwo">
                                    <a class="accordion-button collapsed" role="button" data-bs-toggle="collapse" data-bs-target="#collapsePaymentsTwo" aria-expanded="false" aria-controls="collapsePaymentsTwo">
                                        [취소/환불]이용날짜를 바꾸고 싶어요.
                  </a>
                                </div>
                                <div id="collapsePaymentsTwo" class="accordion-collapse collapse" aria-labelledby="headingPaymentsTwo" data-bs-parent="#accordionFAQPayments">
                                    <div class="accordion-body">
                                        날짜 변경 또한 취소와 동일하게 처리되며 <br>취소가 가능한 기간에는 기존 예약을 취소하신 후 재예약을 해주시면 됩니다. <br>다만, 취소 환불 수수료 규정이 적용되며, 진행이 어려우실 경우에는 고객센터(☎1599-0000)로 문의 부탁드립니다.
                                    </div>
                                </div>
                            </div>
                            <!-- End Accordion Item -->

                            <!-- Accordion Item -->
                            <div class="accordion-item">
                                <div class="accordion-header" id="headingPaymentsThree">
                                    <a class="accordion-button collapsed" role="button" data-bs-toggle="collapse" data-bs-target="#collapsePaymentsThree" aria-expanded="false" aria-controls="collapsePaymentsThree">
                                        취소/환불]예약을 취소/환불하고 싶어요.
                  </a>
                                </div>
                                <div id="collapsePaymentsThree" class="accordion-collapse collapse" aria-labelledby="headingPaymentsThree" data-bs-parent="#accordionFAQPayments">
                                    <div class="accordion-body">
                                        취소 시 <br>환불불가 시점 업체 측 사정에 의한 취소 시 100%환불이 가능하며, 고객센터(☎1599-6975) 또는 1:1로 문의하기를 통해 내용을 남겨주시면 도움 드리겠습니다.환불규정은 다음과 같습니다. <br>1) 이용일 기준 3일 전 : 100% 환불 <br>2) 이용일 기준 2일 전~당일, No-show : 환불불가 <br> <br>환불불가 시점 업체 측 사정에
                                        의한 취소 시 100%환불이 가능하며, 고객센터(☎1599-0000) 또는 1:1로 문의하기를 통해 내용을 남겨주시면 도움 드리겠습니다. <br>* 휴대폰 결제 시 결제월과 환불월이 다를 경우 원결제수단으로 환불이 불가능하므로 고객센터(☎1599-6975)로 문의 부탁드립니다.<br><br>환불 시 <br>신용카드 : 카드 승인 취소 후 3~5일(휴일제외) 이내 카드사 확인
                                        가능합니다. (체크카드의 경우 최대 7일 소요)<br> * 휴대폰 결제 시 결제월과 환불월이 다를 경우 원결제수단으로 환불이 불가능하므로 고객센터(☎1599-0000)로 문의 부탁드립니다.
                                    </div>
                                </div>
                            </div>
                            <!-- End Accordion Item -->
                        </div>
                        <!-- End Accordion -->
                    </div>
                </div>
            </div>
        </div>
        <!-- End FAQ -->
    </main>
    <!-- ========== END MAIN CONTENT ========== -->

<%@ include file ="/views/footer.jsp"%>