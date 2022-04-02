<%@page import="semi.board.model.vo.Board"%>
<%@page import="semi.board.model.vo.Reply"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="/views/header.jsp" %>

<%
	Board board = (Board)request.getAttribute("board");
%>

<style>
	.line {border-left: 1px solid #21325b;}
	#bg{background:rgba(113, 134, 157, .1);}
	#font{color:navy;}
    /*댓글테이블*/
    table#tbl-comment{width:830px; margin:0 auto; border-collapse:collapse; clear:both; } 
    table#tbl-comment tr td{border-bottom:1px solid; border-top:1px solid; padding:5px; text-align:left; line-height:120%;}
    table#tbl-comment tr td:first-of-type{padding: 5px 5px 5px 50px;}
    table#tbl-comment tr td:last-of-type {text-align:right; width: 100px;}
    table#tbl-comment button.btn-delete{display:none;}
    #btnSubmit{height: 78px; margin-left:-5.7px; margin-bottom: 70px;}
    /* #replyContent{border-radius: .3125rem!important;overflow-y: scroll;} */
    #replyContent{overflow-y: scroll;}
    table#tbl-comment tr:hover {background:rgba(113, 134, 157, .1);}
    table#tbl-comment tr:hover button.btn-delete{display:inline;}
    table#tbl-comment sub.comment-writer {color:navy; font-size:16px}
    table#tbl-comment sub.comment-date {color:tomato; font-size:12px}
</style>

<section>
    <!-- Content -->
    <div class="bg-img-start" style="background-image: url(<%=path%>/views/css/img/card-11.svg);">
        <div class="container content-space-t-3 content-space-t-lg-3 content-space-b-2 w-lg-75 mx-auto min-vh-md-100">
        <h1 class="text-center mb-5">공지사항</h1>
            <!-- Card -->
            <div class="card card-lg">
                <div class="card-body">
                    <!-- Title -->
                    <div class="row justify-content-sm-between align-items-sm-center mb-3">
                                       <div class="col-sm mb-3 mb-sm-0">
                        <h1><%= board.getTitle()%></h1>
                        <div id="bg" class="border border-dark border-1 border-start-0 border-end-0 text-dark">
                      　글쓴이 <span id="font"><%= board.getWriterId()%></span>　<span class="line"></span>　조회 <span id="font"><%= board.getReadCount()%></span>　<span class="line"></span>　날짜 <span id="font"><%= board.getCreateDT()%></span>
                        </div>
                        </div>
                    </div>
                    <!-- End Title -->
					<div class="text-end">
					<% if(loginUser != null){
							if(loginUser.getUserId().equals(board.getWriterId()) || loginUser.getGrade()==2){
					%>
					<button type="button" class="btn btn-sm btn-primary" onclick="location.href='<%= request.getContextPath() %>/board/update2?boardNo=<%=board.getNo()%>'">수정</button>
					<button type="button" class="btn btn-sm btn-primary" id="btnDelete">삭제</button>
					<%}}%>
					<button type="button" class="btn btn-sm btn-primary" onclick="location.href='<%= request.getContextPath() %>/board/notice'">목록</button>
            </div>
                    <div class="mb-5 ms-2 text-dark">
					<%= board.getContent()%>
                    </div>
                        <%
						String name = board.getOriginalFileName();
						String reName = board.getRenamedFileName();
						if(name != null && name.length() > 0 ){
						%>
							<a href="javascript:fileDownload('<%=name%>', '<%=reName%>');">
								<img src="<%= request.getContextPath() %>/views/css/img/file.png" width="20" height="20"/>
								<%=name%></a><%}%>
	<div class="mb-2"></div>
	<!-- 리플리스트 출력 시작-->
	<table id="tbl-comment">
		<%for(Reply reply : board.getReplies()){ %>
			<tr>
				<td>
					<sub class="comment-writer"><%=reply.getWriterId() %></sub>
					<sub class="comment-date">
					<%=reply.getModifyDate() %>
					<%=reply.getModifyTime() %>
					<%if (!reply.getModifyTime().equals(reply.getCreateTime())){out.append("(수정됨)");}%></sub>
					<br>
					<span class="text-dark"><%= reply.getContent() %></span>
				</td>
				<td>
				<%-- form 방식 = 이게 좀더 정석적인 코드 = 익스플로러에서 돌아간다. 
					<%if(loginUser != null && loginUser.getId().equals(reply.getWriterId())){ %>
					<form action="<%=request.getContextPath()%>/board/replydel" method="get">
						<input type="hidden" name="replyNo" value="<%=reply.getNo()%>">			
						<button type="submit" class="btn-delete" >삭제</button>
					</form>
					<%} %>
				--%>
					<%if(loginUser != null && loginUser.getUserId().equals(reply.getWriterId())){ %>
						<%-- <button class="btn btn-sm btn-primary" id="rbtnUpdate">수정</button>
						<button class="btn btn-sm btn-primary" onclick="location.href='<%= request.getContextPath() %>/board/update?boardNo=<%=reply.getNo()%>'">수정</button> --%>
						<!-- <button class="btn btn-sm btn-primary" id="rbtnDelete">삭제</button> -->
						<button class="btn btn-sm btn-primary" onclick="deleteReply('<%=reply.getNo() %>');" >삭제</button>
						<%-- <script>
						$("#rbtnDelete").on("click", (e) => {
						if(confirm("정말로 삭제하시겠습니까?")) {
						location.replace("<%=request.getContextPath()%>/board/replydel?replyNo=<%= reply.getNo()%>");
						}});
						</script> --%>
					<%} %>
				</td>
			</tr>
		<%} %>
	</table>
	<!-- 리플리스트 출력 종료 -->
                </div>
            <!-- 리플 등록 form 시작 -->
		<div id="comment-container">
	    	<div class="comment-editor text-center">
	 			<form action="<%=request.getContextPath()%>/board/reply2" method="post">
					<input type="hidden" name="boardNo" value="<%=board.getNo()%>" />
				<%-- <input type="hidden" name="writer" value="<%=loginUser != null ? loginUser.getUserId() : "" %>" />--%>
					<textarea name="content" id="replyContent" cols="95" rows="3"></textarea>
                    <button type="submit" id="btnSubmit" class="btn btn-primary btn-lg rounded-0">댓글등록</button>
	 			</form>
	    	</div>
	   	</div>
	<!-- 리플 등록 form 종료 -->
            </div>
            <!-- End Card -->
        </div>
    </div>
    <!-- End Content -->
</section>

<%@ include file="/views/footer.jsp" %>


<script type="text/javascript">
    // get 방식으로 페이지 요청하는 코드
    
	function fileDownload(originName, reName){
		var url = "<%= request.getContextPath()%>/board/fileDown";
		var oName = encodeURIComponent(originName);
		var rName = encodeURIComponent(reName);
		var resquestURL = url + "?originName=" + oName + "&reName=" + rName;
		location.assign(resquestURL);
//		alert("파일을 요청하였습니다.");
	}
    
 	function deleteReply(replyNo){
		var url = "<%=request.getContextPath()%>/board/replydel2?replyNo=";
		var requestURL = url + replyNo;
		location.replace(requestURL);
	}
	
	// ES6 (e)=> = function(e)
	$(document).ready(() => {
		$("#btnDelete").on("click", (e) => {
			if(confirm("정말로 삭제하시겠습니까?")) {
				location.replace("<%= request.getContextPath() %>/board/delete2?boardNo=<%= board.getNo()%>");
			}
		});
	<%--	$("#replyContent").on("focus", (e) => {
			if(<%= loginUser == null %>) {
				alert("로그인 후 이용 가능합니다.");
				$("#userId").focus();
			}
		});--%>
	});
</script>