package semi.board.controller;

import java.io.File;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import semi.board.model.service.BoardService;
import semi.board.model.vo.Board;


@WebServlet("/board/delete2")
public class NoticeDeleteServlet extends HttpServlet{
	private static final long serialVersionUID = 1L;
	
	private BoardService service = new BoardService();

	// http://localhost/06_HelloMVC2/board/delete ? boardNo=68
	// 1. 파라메터를 읽어온다.
	// 2. DB 삭제하기 요청 
	// 3. 결과에 따라 메시지 성공 실패 사용자에게 알려주기.
	
	// 권한 생략했다.
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			int boardNo = Integer.parseInt(req.getParameter("boardNo"));
			Board board = service.findBoardByNo(boardNo, false);
			int result = service.ndelete(boardNo);
			
			if(result > 0) {
				// 삭제가 성공한 경우 -> 첨부파일 삭제 필요.
				deleteFile(board);
				req.setAttribute("msg", "게시글을 삭제하였습니다.");
			}else {
				req.setAttribute("msg", "게시글 삭제를 실패하였습니다.");
			}
		} catch (Exception e) {
			req.setAttribute("msg", "게시글 삭제를 실패하였습니다.");
		}
		
		req.setAttribute("location", "/board/notice");
		req.getRequestDispatcher("/views/msg.jsp").forward(req, resp);
	}

	private void deleteFile(Board board) {
		try {
			String path = getServletContext().getRealPath("/resources/upload/board");
			File deleteFile = new File(path, board.getRenamedFileName());
			deleteFile.delete();
		} catch (Exception e) {}
	}
}
