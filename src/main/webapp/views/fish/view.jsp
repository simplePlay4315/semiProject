<%@page import="semi.fish.model.vo.Fish"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@include file="/views/header.jsp" %>

<%Fish fish = (Fish)request.getAttribute("fish"); %>

 <!-- Content  -->
<div class="container content-space-2 content-space-lg-3" style="height: 1100px;">
    <br><br><br>
    <div class="row">
      <div class="col-lg-7 mb-7 mb-lg-0" style="margin-top: 70px;">
        <div class="row">
          <div class="col-11 mb-4">
            <img class="img-fluid rounded-2" src="<%=path %>/views/css/fish/FISH_<%=fish.getNo() %>.png" alt="Image Description" style="width: 100%; height: 400px;">
          </div>
          <!-- End Col -->


        </div>
        <!-- End Row -->
      </div>
      <!-- End Col -->
  
      <div class="col-lg-5" style="padding-left: 50px;">
        <div class="ps-lg-4">
          <div class="mb-6">
            <h1><%=fish.getName() %></h1>
          </div>
          
          <hr class="my-6">

          <dl class="row">
            <dt class="col-sm-4">유형</dt>
            <dd class="col-sm-8"><%=fish.getType() %></dd>
          </dl><br>
          <!-- End Row -->
  
          <dl class="row">
            <dt class="col-sm-4">개요</dt>
            <dd class="col-sm-8">
              <ul class="list-unstyled text-muted">
                <li class="d-block small"><%=fish.getIntro() %></li>
              </ul>
            </dd>
          </dl>
          <!-- End Row -->
  
          <dl class="row">
            <dt class="col-sm-4">설명</dt>
            <dd class="col-sm-8">
              <ul class="list-unstyled text-muted">
                <li class="d-block small"><%=fish.getDetail() %></li>
              </ul>
            </dd>
          </dl>
          <!-- End Row -->

          <dl class="row">
            <dt class="col-sm-4">분포</dt>
            <dd class="col-sm-8">
              <ul class="list-unstyled text-muted">
                <li class="d-block small"><%=fish.getRange() %></li>
              </ul>
            </dd>
          </dl>
          <!-- End Row -->
         <br><br><br><br>
        </div>
        <!-- End Sticky Block -->
      </div>
      <!-- End Col -->
    </div>
    <!-- End Row -->





<%@include file="/views/footer.jsp" %>