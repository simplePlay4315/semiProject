package semi.board.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import semi.board.model.service.BoardService;
import semi.board.model.vo.Board;

@WebServlet("/board/view2")
public class NoticeViewServlet extends HttpServlet{
	private static final long serialVersionUID = 1L;
	
	private BoardService service = new BoardService();
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int boardNo = Integer.parseInt(req.getParameter("boardNo"));
		Board board = service.findNoticeByNo(boardNo, true);
		
		if(board == null) {
			req.getRequestDispatcher(req.getContextPath()).forward(req, resp);
			return;
		}
		
		req.setAttribute("board", board);
		req.getRequestDispatcher("/views/board/view2.jsp").forward(req, resp);
	}

}
