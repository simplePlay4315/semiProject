package semi.board.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.util.PageInfo;
import semi.board.model.service.BoardService;
import semi.board.model.vo.Board;

@WebServlet("/board/list")
public class BoardListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	BoardService service = new BoardService();
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int page = 1;
		int boardCount = 0;
		PageInfo pageInfo = null;
		List<Board> list = null;
		
		// get 방식에서 page 번호를 가져온다. -> 특정 페이지를 요청한 경우
		try {
			page = Integer.parseInt(req.getParameter("page"));
		} catch (Exception e) {}
		
		boardCount = service.getBoardCount();
		pageInfo = new PageInfo(page, 10, boardCount, 10);
		list = service.getBoardList(pageInfo);
		
		req.setAttribute("list", list);
		req.setAttribute("pageInfo", pageInfo);
		req.getRequestDispatcher("/views/board/list.jsp").forward(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doGet(req, resp);
	}
}