package semi.board.model.service;

import static common.jdbc.JDBCConnect.*;

import java.sql.Connection;
import java.util.List;

import common.util.PageInfo;
import semi.board.model.dao.BoardDAO;
import semi.board.model.dao.NoticeDAO;
import semi.board.model.vo.Board;
import semi.board.model.vo.Reply;

public class BoardService {
	private BoardDAO dao = new BoardDAO();
	private NoticeDAO ndao = new NoticeDAO();
	
	public int getBoardCount() {
		Connection conn = openConnection();
		int result = dao.getBoardCount(conn);
		close(conn);
		return result;
	}
	
	public int getNoticeCount() {
		Connection conn = openConnection();
		int result = ndao.getNoticeCount(conn);
		close(conn);
		return result;
	}

	public List<Board> getBoardList(PageInfo pageinfo) {
		Connection conn = openConnection();
		List<Board> list = dao.findAll(conn, pageinfo);
		close(conn);
		return list;
	}
	
	public List<Board> getNoticeList(PageInfo pageinfo) {
		Connection conn = openConnection();
		List<Board> list = ndao.nfindAll(conn, pageinfo);
		close(conn);
		return list;
	}
	
	public int save(Board board) {
		Connection conn = openConnection();
		int result = 0;
		
		if(board.getNo() != 0) {
			result = dao.updateBoard(conn, board);
		}else {
			result = dao.insertBoard(conn, board);
		}
		
		if(result > 0 ) {
			commit(conn);
		}else {
			rollback(conn);
		}
		
		close(conn);
		return result;
	}
	
	public int nsave(Board board) {
		Connection conn = openConnection();
		int result = 0;
		
		if(board.getNo() != 0) {
			result = ndao.updateNotice(conn, board);
		}else {
			result = ndao.insertNotice(conn, board);
		}
		
		if(result > 0 ) {
			commit(conn);
		}else {
			rollback(conn);
		}
		
		close(conn);
		return result;
	}
	
	public Board findBoardByNo(int no, boolean hasRead) {
		Connection conn = openConnection();
		Board board = dao.findBoardByNo(conn, no);
		
		// 조회수 증가 로직
		if(hasRead == true && board != null) {
			int result = dao.updateReadCount(conn, board);
			if(result > 0 ) {
				commit(conn);
			}else {
				rollback(conn);
			}
		}
		
		close(conn);
		return board;
	}
	
	public Board findNoticeByNo(int no, boolean hasRead) {
		Connection conn = openConnection();
		Board board = ndao.findNoticeByNo(conn, no);
		
		// 조회수 증가 로직
		if(hasRead == true && board != null) {
			int result = ndao.updatenReadCount(conn, board);
			if(result > 0 ) {
				commit(conn);
			}else {
				rollback(conn);
			}
		}
		
		close(conn);
		return board;
	}
	
	public int delete(int no) {
		Connection conn = openConnection();
		int result = dao.updateStatus(conn, no, "N");
		
		if(result > 0 ) {
			commit(conn);
		}else {
			rollback(conn);
		}
		
		close(conn);
		return result;
	}
	
	public int ndelete(int no) {
		Connection conn = openConnection();
		int result = ndao.nupdateStatus(conn, no, "N");
		
		if(result > 0 ) {
			commit(conn);
		}else {
			rollback(conn);
		}
		
		close(conn);
		return result;
	}

	public int saveReply(Reply reply) {
		Connection conn = openConnection();
		int result = dao.insertReply(conn, reply);
		
		if(result > 0 ) {
			commit(conn);
		}else {
			rollback(conn);
		}
		
		close(conn);
		return result;
	}
	
	public int nsaveReply(Reply reply) {
		Connection conn = openConnection();
		int result = ndao.insertnReply(conn, reply);
		
		if(result > 0 ) {
			commit(conn);
		}else {
			rollback(conn);
		}
		
		close(conn);
		return result;
	}
	
	public int updateReply(Reply reply) {
		Connection conn = openConnection();
		int result = dao.updateReply(conn, reply);
		
		if(result > 0 ) {
			commit(conn);
		}else {
			rollback(conn);
		}
		
		close(conn);
		return result;
	}

	public int deleteReply(int replyNo) {
		Connection conn = openConnection();
		
		int result = dao.deleteReply(conn, replyNo);
		
		if(result > 0 ) {
			commit(conn);
		}else {
			rollback(conn);
		}
		
		close(conn);
		return result;
	}
}