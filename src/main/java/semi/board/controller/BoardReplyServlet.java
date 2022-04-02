package semi.board.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import semi.board.model.service.BoardService;
import semi.board.model.vo.Reply;
import semi.user.model.vo.User;


@WebServlet("/board/reply")
public class BoardReplyServlet extends HttpServlet{
	private static final long serialVersionUID = 1L;

	private BoardService service = new BoardService();
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			User loginUser = (User) req.getSession().getAttribute("loginUser");
			// 세션에 저장된 로그인 멤버와 실제 글쓴사람이 다른 경우 = 보안적인 요구사항
//			if(loginUser.getUserId().equals(req.getParameter("writer")) == false) {
//				sendCommonPage(req, resp, "잘못된 접근입니다. (code=100)", "/");
//				return;
//			}
			
			int boardNo = Integer.parseInt(req.getParameter("boardNo"));
//			String writer = req.getParameter("writer");
			String content = req.getParameter("content");
			
			Reply reply = new Reply();
			reply.setBoardNo(boardNo);
			reply.setWriterId(loginUser.getUserId());
			reply.setWriterNo(loginUser.getUserNo());
			reply.setContent(content);
			
			int result = service.saveReply(reply);
			
			if(result <= 0 ) {
				sendCommonPage(req, resp, "댓글을 등록할 수 없습니다. (code=101)", "/board/view?boardNo="+boardNo);
				return;
			}
			sendCommonPage(req, resp, "댓글이 등록되었습니다.", "/board/view?boardNo="+boardNo);
		} catch (Exception e) {
			e.printStackTrace();
			sendCommonPage(req, resp, "댓글을 등록할 수 없습니다. (code=102)", "/");
		}
	}
	
	private void sendCommonPage(HttpServletRequest req, HttpServletResponse resp, String msg, String location) throws ServletException, IOException {
		req.setAttribute("msg", msg);
		req.setAttribute("location", location);
		req.getRequestDispatcher("/views/msg.jsp").forward(req, resp);
	}
}
