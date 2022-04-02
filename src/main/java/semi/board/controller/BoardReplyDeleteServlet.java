package semi.board.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import semi.board.model.service.BoardService;


@WebServlet("/board/replydel")
public class BoardReplyDeleteServlet extends HttpServlet{
	private static final long serialVersionUID = 1L;
	
	private BoardService service = new BoardService();

	// http://localhost/06_HelloMVC2/board/delete ? boardNo=68
	// 1. 파라메터를 읽어온다.
	// 2. DB 삭제하기 요청 
	// 3. 결과에 따라 메시지 성공 실패 사용자에게 알려주기.
	
	// 만약 글쓴곳으로 가고 싶다면, 방법 두가지중 하나로 해결 
	// 1. reply select를 구현해서 reply 객체를 가져오고, 거기에 있는 boardNo를 통해서 페이지 이동
	// 2. get으로 받아올때 board 번호까지 받아서 처리 완료시 이동 시키는 방법
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			int replyNo = Integer.parseInt(req.getParameter("replyNo"));
			System.out.println("replyNo : " + replyNo);
			
			int result = service.deleteReply(replyNo);
			
			if(result > 0) {
				// 삭제가 성공한 경우 -> 첨부파일 삭제 필요.
				req.setAttribute("msg", "댓글을 삭제하였습니다.");
			}else {
				req.setAttribute("msg", "댓글 삭제를 실패하였습니다.");
			}
		} catch (Exception e) {
			req.setAttribute("msg", "댓글 삭제를 실패하였습니다.");
		}
		
		req.setAttribute("location", "/board/list");
		req.getRequestDispatcher("/views/msg.jsp").forward(req, resp);
	}

}
