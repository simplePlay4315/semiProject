<%@page import="semi.fishing.model.vo.Fishing"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/views/header.jsp" %>

<%
	Fishing fishing = (Fishing)request.getAttribute("fishing");
%>

<div class="bg-img-start" style="background-image: url(css/img/card11.svg);">
        <div class="container content-space-t-2 content-space-t-lg-3 content-space-b-3">
            <div class="w-md-80 w-lg-100 text-center">
                <h1>예약</h1>
                <p>reservation</p>
                <span class="divider-start mt-10">낚시터</span>
                <br><br>
                <!-- Nav -->
                <img class="img-fluid rounded-2" src="<%=path %>/views/css/img/PLACE_<%=fishing.getNo() % 18 %>.jpg" alt="Image Description" style="width: 400px; height: 250px;">
                <h3 style="margin-top: 20px; margin-bottom: -15px;"><%=fishing.getName() %></h3>              
                <h4 style="margin-top: 25px; margin-bottom: -30px;"><%=fishing.getAddr1() %></h4>              
                <!-- End Nav -->
                <br><br>
                <span class="divider-start">몇명이서 가시나요?</span>
                <br><br>
                <button style="float: left;" type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#exampleModal" >인원 수 선택</button>
                

                <!-- Modal -->
                <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h5 class="modal-title" id="exampleModalLabel">인원 수 선택</h5>
                                
                                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                            </div>

                            <div class="modal-body">
                                <form>
                                    <!-- Quantity -->
                                    <div class="quantity-counter">
                                        <div class="js-quantity-counter row align-items-center">
                                            <div class="col">
                                                <span class="d-block small">인원 수</span>
                                                <input class="js-result form-control form-control-quantity-counter" id="peopleNum" type="text" value="0">
                                            </div>
                                            <!-- End Col -->

                                            <div class="col-auto">
                                                <a class="js-minus btn btn-outline-secondary btn-xs btn-icon rounded-circle" href="javascript:;">
                                                    <svg width="8" height="2" viewbox="0 0 8 2" fill="none" xmlns="http://www.w3.org/2000/svg">
            <path d="M0 1C0 0.723858 0.223858 0.5 0.5 0.5H7.5C7.77614 0.5 8 0.723858 8 1C8 1.27614 7.77614 1.5 7.5 1.5H0.5C0.223858 1.5 0 1.27614 0 1Z" fill="currentColor"/>
          </svg>
                                                </a>
                                                <a class="js-plus btn btn-outline-secondary btn-xs btn-icon rounded-circle" href="javascript:;">
                                                    <svg width="8" height="8" viewBox="0 0 8 8" fill="none" xmlns="http://www.w3.org/2000/svg">
            <path d="M4 0C4.27614 0 4.5 0.223858 4.5 0.5V3.5H7.5C7.77614 3.5 8 3.72386 8 4C8 4.27614 7.77614 4.5 7.5 4.5H4.5V7.5C4.5 7.77614 4.27614 8 4 8C3.72386 8 3.5 7.77614 3.5 7.5V4.5H0.5C0.223858 4.5 0 4.27614 0 4C0 3.72386 0.223858 3.5 0.5 3.5H3.5V0.5C3.5 0.223858 3.72386 0 4 0Z" fill="currentColor"/>
          </svg>
                                                </a>
                                            </div>
                                            <!-- End Col -->
                                        </div>
                                        <!-- End Row -->
                                    </div>
                                    <!-- End Quantity -->
                                </form>
                            </div>

                            <div class="modal-footer">
                                <button type="button" class="btn btn-white" data-bs-dismiss="modal">닫기</button>
                                <button type="button" class="btn btn-primary" data-bs-dismiss="modal" id="save">저장하기</button>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- End Modal -->
                <br><br>
                <br><br>
                <span class="divider-start">언제 가시나요?</span>
                <br><br>
                <!-- Dropdown -->
                <div style="float: left;" class="dropdown">
                    <button class="btn btn-primary dropdown-toggle" type="button" id="year" data-bs-toggle="dropdown" aria-expanded="false"> 년 </button>
                    <div class="dropdown-menu" aria-labelledby="dropdownMenuButton" style="height: 250px; overflow-y: scroll;">
                        <a class="dropdown-item" onclick="choose(this)">2021</a>
                        <a class="dropdown-item" onclick="choose(this)">2022</a>
                        <a class="dropdown-item" onclick="choose(this)">2023</a>
                        <a class="dropdown-item" onclick="choose(this)">2024</a>
                        <a class="dropdown-item" onclick="choose(this)">2025</a>
                        <a class="dropdown-item" onclick="choose(this)">2026</a>
                        <a class="dropdown-item" onclick="choose(this)">2027</a>
                        <a class="dropdown-item" onclick="choose(this)">2028</a>
                        <a class="dropdown-item" onclick="choose(this)">2029</a>

                    </div>
                </div>
                <!-- End Dropdown -->

                

                <!-- Dropdown -->
                <div style="float: left;" class="dropdown ms-1">
                    <button class="btn btn-primary dropdown-toggle" type="button" id="month" data-bs-toggle="dropdown" aria-expanded="false">
     월
    </button>
                    <div class="dropdown-menu" aria-labelledby="dropdownMenuButton" style="height: 250px; overflow-y: scroll;">
                        <a class="dropdown-item" onclick="choose(this)">1</a>
                        <a class="dropdown-item" onclick="choose(this)">2</a>
                        <a class="dropdown-item" onclick="choose(this)">3</a>
                        <a class="dropdown-item" onclick="choose(this)">4</a>
                        <a class="dropdown-item" onclick="choose(this)">5</a>
                        <a class="dropdown-item" onclick="choose(this)">6</a>
                        <a class="dropdown-item" onclick="choose(this)">7</a>
                        <a class="dropdown-item" onclick="choose(this)">8</a>
                        <a class="dropdown-item" onclick="choose(this)">9</a>
                        <a class="dropdown-item" onclick="choose(this)">10</a>
                        <a class="dropdown-item" onclick="choose(this)">11</a>
                        <a class="dropdown-item" onclick="choose(this)">12</a>

                    </div>
                </div>
                <!-- End Dropdown -->

                <!-- Dropdown -->
                <div style="float: left;" class="dropdown ms-1">
                    <button class="btn btn-primary dropdown-toggle" type="button" id="day" data-bs-toggle="dropdown" aria-expanded="false">
     일
    </button>
                    <div class="dropdown-menu" aria-labelledby="dropdownMenuButton" style="height: 250px; overflow-y: scroll;">
                        <a class="dropdown-item" onclick="choose(this)">1</a>
                        <a class="dropdown-item" onclick="choose(this)">2</a>
                        <a class="dropdown-item" onclick="choose(this)">3</a>
                        <a class="dropdown-item" onclick="choose(this)">4</a>
                        <a class="dropdown-item" onclick="choose(this)">5</a>
                        <a class="dropdown-item" onclick="choose(this)">6</a>
                        <a class="dropdown-item" onclick="choose(this)">7</a>
                        <a class="dropdown-item" onclick="choose(this)">8</a>
                        <a class="dropdown-item" onclick="choose(this)">9</a>
                        <a class="dropdown-item" onclick="choose(this)">10</a>
                        <a class="dropdown-item" onclick="choose(this)">11</a>
                        <a class="dropdown-item" onclick="choose(this)">12</a>
                        <a class="dropdown-item" onclick="choose(this)">13</a>
                        <a class="dropdown-item" onclick="choose(this)">14</a>
                        <a class="dropdown-item" onclick="choose(this)">15</a>
                        <a class="dropdown-item" onclick="choose(this)">16</a>
                        <a class="dropdown-item" onclick="choose(this)">17</a>
                        <a class="dropdown-item" onclick="choose(this)">18</a>
                        <a class="dropdown-item" onclick="choose(this)">19</a>
                        <a class="dropdown-item" onclick="choose(this)">20</a>
                        <a class="dropdown-item" onclick="choose(this)">21</a>
                        <a class="dropdown-item" onclick="choose(this)">22</a>
                        <a class="dropdown-item" onclick="choose(this)">23</a>
                        <a class="dropdown-item" onclick="choose(this)">24</a>
                        <a class="dropdown-item" onclick="choose(this)">25</a>
                        <a class="dropdown-item" onclick="choose(this)">26</a>
                        <a class="dropdown-item" onclick="choose(this)">27</a>
                        <a class="dropdown-item" onclick="choose(this)">28</a>
                        <a class="dropdown-item" onclick="choose(this)">29</a>
                        <a class="dropdown-item" onclick="choose(this)">30</a>
                        <a class="dropdown-item" onclick="choose(this)">31</a>
                    </div>
                </div>
                <!-- End Dropdown -->
                <div class="h1 text-center content-space-t-xl-1 content-space-b-lg-0">
                    <a class="btn btn-soft-secondary btn-lg btn-icon" onclick="reservate()" style="width: 120px;">
                        예약하기<i class="reservation"></i>
                      </a>
                </div>
            </div>
        </div>
    </div>
    
	<script src="<%=path %>/views/css/hs-quantity-counter.min.js"></script>
    <script>
        (function() {
            // INITIALIZATION OF  QUANTITY COUNTER
            // =======================================================
            new HSQuantityCounter('.js-quantity-counter')
        })()
    </script>
    <script>
   	       function choose(item){
               var text = $(item).text(); 
               console.log(text);
               $(item).parent().siblings().text(text);
           };

           function reservate(){
        	   var year = $("#year").text();
               var month = $("#month").text();
               var day = $("#day").text();
               var result = year + '-' + month + '-' +  day;
               var peopleNum = $('#peopleNum').val();
               var url = '<%=path%>/fishing/reserve/result?fishingNo=<%=fishing.getNo()%>&date=' + result + '&peopleNum=' + peopleNum;
               location.replace(url);
           }
             
   </script>

<%@ include file="/views/footer.jsp" %>