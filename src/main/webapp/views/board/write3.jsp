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
                        <form action="<%= request.getContextPath()%>/board/write" method="POST" enctype="multipart/form-data">
                            <div class="d-grid gap-4">
                                <!-- Form -->
                                <span class="d-block">
                                <input type="text" class="form-control form-control-lg" name="title" id="title" placeholder="제목을 입력해주세요...">
                            </span>
                                <!-- End Form -->
                                <!-- Quill -->
                                <div class="quill-custom">
                                    <div class="js-quill" style="height: 15rem;" data-hs-quill-options='{
                         "placeholder": "내용을 입력해주세요...",
                          "modules": {
                            "toolbar": [
                              ["bold", "italic", "underline", "strike", "link", "image", "blockquote", "code", {"list": "bullet"}]
                            ]
                          }
                         }'>
                                    </div>
                                </div>
                                <!-- End Quill -->
                                <!-- Form -->
                                <span class="d-block">
                  <input type="file" class="form-control form-control-lg" name="upfile" id="upfile">
                </span>
                                <!-- End Form -->
                                <!-- End Form -->

                                <div class="d-flex justify-content-center gap-3">
                                    <a class="btn btn-white" href="<%=path%>/board/notice">취소</a>
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
    
    <script src="<%=path %>/views/css/theme.min.js"></script>
    <script src="<%=path %>/views/css/quill.min.js"></script>

    <script>
        (function() {
            // INITIALIZATION OF QUILLJS EDITOR
            // =======================================================
            HSCore.components.HSQuill.init('.js-quill')
        })()
    </script>

<%@ include file="/views/footer.jsp" %>