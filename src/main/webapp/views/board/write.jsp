<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/views/header.jsp" %>
<div class="bg-img-start" style="background-image: url(<%=path%>/views/css/img/card-11.svg);">
    <!-- Post a Comment -->
    <div class="container content-space-2">
        <!-- Heading -->
        <div class="w-md-75 w-lg-50 text-center mx-md-auto mb-md-5">
            <h2>글쓰기</h2>
        </div>
        <!-- End Heading -->

        <div class="row justify-content-lg-center">
            <div class="col-lg-8">
                <!-- Card -->
                <div class="card card-lg border shadow-none">
                    <div class="card-body">
                        <form action="<%= request.getContextPath()%>/board/write" method="POST" enctype="multipart/form-data" onsubmit="return check()">
                            <div class="d-grid gap-4">
                                <!-- Form -->
                                <span class="d-block">
                                <input type="text" class="form-control form-control-lg" name="title" id="title" placeholder="제목을 입력해주세요...">
                            </span>
                                <!-- End Form -->
                                
                                <textarea name="content" id="content" class="form-control" cols="30" rows="12" placeholder="내용을 입력해주세요..."></textarea>
                                <!-- Form -->
                                <span class="d-block">
                  <input type="file" class="form-control form-control-lg" name="upfile" id="upfile">
                </span>
                                <!-- End Form -->

                                <div class="d-flex justify-content-center gap-3">
                                    <a class="btn btn-white" href="<%=path%>/board/list">취소</a>
                                    <input type="submit" value="작성완료" class="btn btn-primary">
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
                <!-- End Card -->
            </div>
            <!-- End Col -->
        </div>
        <!-- End Row -->
    </div>
    <!-- End Post a Comment -->
    </div>
    
    <script>
    function check()
    {
    	if($("#title").val() == "") {
    		alert("제목을 입력해주세요!");
    		return false;
    	}
    	
        if($('#content').val() == "") {
    		alert("내용을 입력해주세요!");
    		return false;
        }
    }
    </script>
<%@ include file="/views/footer.jsp" %>