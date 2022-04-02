package semi.board.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import common.util.MyFileRenamePolicy;
import semi.board.model.service.BoardService;
import semi.board.model.vo.Board;
import semi.user.model.vo.User;
import com.oreilly.servlet.MultipartRequest;

/**
 * 파일첨부 기능이 동작되게끔 수정
 */

@WebServlet("/board/memo")
public class MemoWriteServlet extends HttpServlet{
	private static final long serialVersionUID = 1L;

	private BoardService service = new BoardService();
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			HttpSession session = req.getSession();
			User loginUser = (User) session.getAttribute("loginUser");
			if(loginUser != null) { // 정상적인 흐름
				req.getRequestDispatcher("/views/board/write.jsp").forward(req, resp);
				return;
			}
		} catch (Exception e) {}
		
		// 비정상인 경우
//		req.setAttribute("msg", "로그인 후 사용할 수 있습니다.");
//		req.setAttribute("location", "/");
//		req.getRequestDispatcher("/views/common/msg.jsp").forward(req, resp);
		sendCommonPage(req,resp,"로그인 후 이용 가능합니다.", "/login");
	}
	
/**
  * 1. req 객체로부터 인자(Parameter)를 읽어 온다. -> multi form 값을 읽어오기
       - 저장받은 파일을 DB에 매칭시키기.
  * 2. 사용자의 글쓴내용을 DB 로 저장 
  * 3. DB에서 정상적으로 저장 되었음 사용자게 알림 -> 완료 메세지 ->view
 */
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			User loginUser = (User) req.getSession().getAttribute("loginUser");
			
			// 멀티 파라메터를 읽어오는 법 추가
			// 1. 저장경로 지정
			String path = getServletContext().getRealPath("/resources/upload/board");
			// 2. 파일사이즈 지정
			int maxSize = 104857600; // 100MB
			// 3. 문자열 인코딩 설정
			String encoding = "UTF-8";
			// 4. 멀티파라메터 처리 객체 생성
			// DefaultFileRenamePolicy : 파일 이름중에 중복된 파일이 있는 경우 파일 이름을 0~9999번 붙여준다.
//			MultipartRequest mr 
//					= new MultipartRequest(req, path, maxSize, encoding, new DefaultFileRenamePolicy()); 
			MultipartRequest mr 
			= new MultipartRequest(req, path, maxSize, encoding, new MyFileRenamePolicy());
			// 멀티 파라메터 끝
			
			// 세션에 저장된 로그인 멤버와 실제 글쓴사람이 다른 경우 = 보안적인 요구사항
//			String writer = mr.getParameter("writer");
			
//			System.out.println(path);
//			System.out.println(writer);
//			if(loginUser.getUserId().equals(writer) == false) { // 
//				sendCommonPage(req, resp, "잘못된 접근입니다. (code=100)", "/board/list");
//				return;
//			}
			
			Board board = new Board();
			board.setTitle(mr.getParameter("title")); // null=입력값 없는거 방지용도
//			board.setWriterId(writer);
			board.setWriterNo(loginUser.getUserNo());
			board.setContent(mr.getParameter("content"));
			board.setOriginalFileName(mr.getOriginalFileName("upfile"));
			board.setRenamedFileName(mr.getFilesystemName("upfile")); // 변경된거
			
			System.out.println(board);
			
			int result = service.save(board); // db에 게시글 저장
			
			if(result <= 0 ) {
				sendCommonPage(req, resp, "게시글을 등록할 수 없습니다. (code=101)", "/board/list");
				return;
			}
			sendCommonPage(req, resp, "게시글이 등록되었습니다.", "/board/list");
		} catch (Exception e) {
			e.printStackTrace();
			sendCommonPage(req, resp, "게시글을 등록할 수 없습니다. (code=102)", "/board/list");
		}
	}
	
	private void sendCommonPage(HttpServletRequest req, HttpServletResponse resp, String msg, String location) throws ServletException, IOException {
		req.setAttribute("msg", msg);
		req.setAttribute("location", location);
		req.getRequestDispatcher("/views/msg.jsp").forward(req, resp);
	}
}