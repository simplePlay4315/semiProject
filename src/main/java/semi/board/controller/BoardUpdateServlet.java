package semi.board.controller;

import java.io.File;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.util.MyFileRenamePolicy;
import semi.board.model.service.BoardService;
import semi.board.model.vo.Board;
import semi.user.model.vo.User;
import com.oreilly.servlet.MultipartRequest;

@WebServlet("/board/update")

public class BoardUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	private BoardService service = new BoardService();
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int boardNo = Integer.parseInt(req.getParameter("boardNo"));
		Board board = service.findBoardByNo(boardNo, false);
		
		req.setAttribute("board", board);
		req.getRequestDispatcher("/views/board/update.jsp").forward(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			User loginUser = (User) req.getSession().getAttribute("loginUser");

			String path = getServletContext().getRealPath("/resources/upload/board");
			int maxSize = 104857600; // 100MB
			String encoding = "UTF-8";
			
			System.out.println(path);
			
			MultipartRequest mr 
				= new MultipartRequest(req, path, maxSize, encoding, new MyFileRenamePolicy()); 

//			String writer = mr.getParameter("writer");
//			if(loginUser.getUserId().equals(writer) == false) {
//				sendCommonPage(req, resp, "잘못된 접근입니다. (code=100)", "/board/list");
//				return;
//			}
			
			Board board = new Board();
			board.setNo(Integer.parseInt(mr.getParameter("boardNo")));
			board.setTitle(mr.getParameter("title")); // null = 입력값 없는거 방지용도
//			board.setWriterId(writer);
			board.setWriterNo(loginUser.getUserNo());
			board.setContent(mr.getParameter("content"));
			
			String originFileName = mr.getParameter("originalFileName");
			String renamedFileName = mr.getParameter("renamedFileName");
			
			String originReloadFileName = mr.getOriginalFileName("upfile");
			String renamedReloadFileName = mr.getFilesystemName("upfile");
			
			System.out.println(originFileName);
			System.out.println(originReloadFileName);

			// 새로운 파일 업로드 된 경우
			if(originReloadFileName != null && originReloadFileName.length() > 0) {
				try {
					File deleteFile = new File(path, renamedFileName);
					deleteFile.delete();
				} catch (Exception e) {
					e.printStackTrace();
				}
				board.setOriginalFileName(originReloadFileName);
				board.setRenamedFileName(renamedReloadFileName);
			}else {
				board.setOriginalFileName(originFileName);
				board.setRenamedFileName(renamedFileName);
			}
			
			
			if(board.getOriginalFileName() == null) {
				board.setOriginalFileName("");
				board.setRenamedFileName("");
			}
			
			int result = service.save(board); // db에 게시글 저장
			
			if(result <= 0 ) {
				sendCommonPage(req, resp, "게시글을 수정할 수 없습니다. (code=101)", "/board/list");
				return;
			}
			sendCommonPage(req, resp, "게시글이 수정되었습니다.", "/board/list");
		} catch (Exception e) {
			e.printStackTrace();
			sendCommonPage(req, resp, "게시글을 수정할 수 없습니다. (code=102)", "/board/list");
		}
	}
	
	private void sendCommonPage(HttpServletRequest req, HttpServletResponse resp, String msg, String location) throws ServletException, IOException {
		req.setAttribute("msg", msg);
		req.setAttribute("location", location);
		req.getRequestDispatcher("/views/msg.jsp").forward(req, resp);
	}
}
