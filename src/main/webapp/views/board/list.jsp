<%@page import="java.util.Calendar"%>
<%@page import="common.util.PageInfo"%>
<%@page import="java.util.List"%>
<%@page import="semi.board.model.vo.Board"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>

<%@ include file ="/views/header.jsp"%>

<%
	List<Board> list = (List<Board>)request.getAttribute("list");
	PageInfo pageInfo = (PageInfo)request.getAttribute("pageInfo");
%>
<style>
	div#pageBar{margin-top:10px; text-align:center; background-color:rgba(0, 188, 212, 0.3);}
	#tdWidth1 {width: 10%;}#tdWidth2 {max-width: 10px;}#tdWidth3 {width: 15%;}#tdWidth4 {width: 15%;}#tdWidth5 {width: 10%;}
</style>

    <!-- Hero -->
    <div class="bg-img-start" style="background-image: url(<%=path%>/views/css/img/card-11.svg);">
        <div class="container content-space-t-3 content-space-t-lg-3 content-space-b-2 text-center">
                <h1>자유게시판</h1>
			<!-- Table -->
			<table class="table table-thead-bordered mt-5">
		  <thead class="thead-light">
		<tr>
		    <th id="tdWidth1">번호</th>
            <th>제목</th>
            <th id="tdWidth3">글쓴이</th>
            <th id="tdWidth4">날짜</th>
            <th id="tdWidth5">조회</th>
		</tr>
		</thead>
		<tbody>
	<% if(list == null || list.isEmpty()){ %>
	<%-- 게시 글이 없을때 시작--%>
		<tr>
			<td colspan="6">
				조회된 게시글이 없습니다.
			</td>
		</tr>
	<%-- 게시 글이 없을때 끝 --%>
	<%} else { %>
	<%-- 게시 글이 있는 경우 시작 --%>
		<%for(Board b : list){ %>
			<tr>
				<td><%= b.getNo() %></td>
				<td id="tdWidth2" class="text-truncate">
					<%path = request.getContextPath() + "/board/view?boardNo=" + b.getNo(); %>
					<a href="<%=path%>"><%=b.getTitle()%></a>
					<%if (b.getModifyTime().equals(b.getCreateTime())){
				out.append("");}else{out.append("(수정됨)");}%>
				</td>
				<%-- <td><a href="#"><%= b.getWriterId() %></a></td> 기능 추가 예정 --%>
				<td><%= b.getWriterId() %></td>
				<td><%= b.getCreateTime() %></td>
				<td><%= b.getReadCount() %></td>
			</tr>
		<%}%>
	<%-- 게시 글이 있는 경우 끝 --%>
	<%}%>
	</table>
		<div class="mt-4 mb-2 text-end">
					<button type="submit" class="btn btn-primary fw-bold" onclick="location.href='<%=request.getContextPath()%>/board/write'">글쓰기</button>
				</div>
                <!-- End Table -->
    <!-- Pagination -->
		<nav aria-label="Page navigation example">
        <ul class="pagination justify-content-center">
            <li class="page-item">
                <a class="page-link" href="<%=request.getContextPath()%>/board/list?page=1">≪</a>
            </li>
            <li class="page-item">
                <a class="page-link" href="<%=request.getContextPath()%>/board/list?page=<%=pageInfo.getPrvePage()%>">＜</a>
            </li>
            <!-- 10개 목록 출력하기 -->
		<%for(int i = pageInfo.getStartPage(); i <= pageInfo.getEndPage(); i++) {%>
            <%if(i == pageInfo.getCurrentPage()) {%>
				<li class="page-item disabled"><a class="page-link"><%=i%></a></li>
			<%}else {%>
            <li class="page-item">
            <a class="page-link" href="<%=request.getContextPath()%>/board/list?page=<%=i%>"><%=i%></a>
            </li>
			<%} %>
        <%} %>
				<li class="page-item">
				<a class="page-link" href="<%=request.getContextPath()%>/board/list?page=<%=pageInfo.getNextPage()%>">＞</a>
				</li>
				<li class="page-item">
				<a class="page-link" href="<%=request.getContextPath()%>/board/list?page=<%=pageInfo.getMaxPage()%>">≫</a>
				</li>
        </ul>
    </nav><br>
    <!-- End Pagination -->
            </div>
        </div>
    <!-- End Hero -->
    
    
    <%@ include file ="/views/footer.jsp"%>