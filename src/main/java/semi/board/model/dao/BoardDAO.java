package semi.board.model.dao;

import static common.jdbc.JDBCConnect.close;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import common.util.PageInfo;
import semi.board.model.vo.Board;
import semi.board.model.vo.Reply;

public class BoardDAO {

	// 게시물의 갯수를 가져오는 쿼리문
	public int getBoardCount(Connection conn) {
		int result = 0;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String query =  "SELECT COUNT(*) FROM BOARD_TBL WHERE STATUS='Y'";
		try {
			pstmt = conn.prepareStatement(query);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				result = rs.getInt(1);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			close(pstmt);
			close(rs);
		}
		return result;
	}
	
	// 게시물의 갯수를 가져오는 쿼리문
	public int getReplyCount(Connection conn) {
		int result = 0;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String query =  "SELECT COUNT(*) FROM REPLY_TBL WHERE STATUS='Y'";
		try {
			pstmt = conn.prepareStatement(query);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				result = rs.getInt(1);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			close(pstmt);
			close(rs);
		}
		return result;
	}

	// 게시물의 정보를 가져오는 메소드
	public List<Board> findAll(Connection conn, PageInfo pageInfo) {
		List<Board> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String query = "SELECT RNUM, NO, TITLE, USER_ID, CREATE_DATE, MODIFY_DATE, ORIGINAL_FILENAME, READCOUNT, STATUS  "
				+ "FROM ( "
				+ "    SELECT ROWNUM AS RNUM, NO, TITLE, USER_ID, CREATE_DATE, MODIFY_DATE, ORIGINAL_FILENAME, READCOUNT, STATUS "
				+ "    FROM ( "
				+ "        SELECT  B.NO, B.TITLE, U.USER_ID, B.CREATE_DATE, B.MODIFY_DATE, B.ORIGINAL_FILENAME, B.READCOUNT, B.STATUS "
				+ "        FROM BOARD_TBL B JOIN USER_TBL U ON(B.WRITER_NO = U.USER_NO) "
				+ "        WHERE B.STATUS = 'Y'  ORDER BY B.NO DESC "
				+ "    ) "
				+ ") "
				+ "WHERE RNUM BETWEEN ? and ?";
		try {
			pstmt = conn.prepareStatement(query);
			
			pstmt.setInt(1, pageInfo.getStartList());
			pstmt.setInt(2, pageInfo.getEndList());
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				Board board = new Board();
				board.setNo(rs.getInt("NO"));
				board.setRowNum(rs.getInt("RNUM"));
				board.setWriterId(rs.getString("USER_ID"));
				board.setTitle(rs.getString("TITLE"));
//				board.setCreateDate(rs.getDate("CREATE_DATE"));
//				board.setModifyDate(rs.getDate("MODIFY_DATE"));
				board.setCreateTime(rs.getTime("CREATE_DATE"));
				board.setModifyTime(rs.getTime("MODIFY_DATE"));
				board.setOriginalFileName(rs.getString("ORIGINAL_FILENAME"));
				board.setReadCount(rs.getInt("READCOUNT"));
				board.setStatus(rs.getString("STATUS"));
				
				list.add(board);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			close(pstmt);
			close(rs);
		}
		return list;
	}
	
	// 글쓰기 기능
	public int insertBoard(Connection conn, Board board) {
		int result = 0;
		PreparedStatement pstmt = null;
		String query = "INSERT INTO BOARD_TBL VALUES(BOARD_SEQ.NEXTVAL,?,?,?,?,?,DEFAULT,DEFAULT,DEFAULT,DEFAULT)";
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, board.getWriterNo());
			pstmt.setString(2, board.getTitle());
			pstmt.setString(3, board.getContent());
			pstmt.setString(4, board.getOriginalFileName());
			pstmt.setString(5, board.getRenamedFileName());

			result = pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}
	
	// 게시글을 가져오는 객체
	public Board findBoardByNo(Connection conn, int boardNo) {
		Board board = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String query = "SELECT B.NO, B.TITLE, U.USER_ID, B.READCOUNT, B.ORIGINAL_FILENAME, B.RENAMED_FILENAME, B.CONTENT, B.CREATE_DATE, B.MODIFY_DATE "
				+ "	FROM BOARD_TBL B "
				+ "	JOIN USER_TBL U ON(B.WRITER_NO = U.USER_NO) "
				+ "	WHERE B.STATUS = 'Y' AND B.NO = ? ";
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, boardNo);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				board = new Board();
				board.setNo(rs.getInt("NO"));
				board.setTitle(rs.getString("TITLE"));
				board.setWriterId(rs.getString("USER_ID"));
				board.setReadCount(rs.getInt("READCOUNT"));
				board.setOriginalFileName(rs.getString("ORIGINAL_FILENAME"));
				board.setRenamedFileName(rs.getString("RENAMED_FILENAME"));
				board.setContent(rs.getString("CONTENT"));
//				board.setCreateDate(rs.getDate("CREATE_DATE"));
//				board.setModifyDate(rs.getDate("MODIFY_DATE"));
				board.setCreateTime(rs.getTime("CREATE_DATE"));
				board.setModifyTime(rs.getTime("MODIFY_DATE"));
				board.setReplies(getRepliesByNo(conn, boardNo));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			close(pstmt);
			close(rs);
		}
		return board;
	}

	// 게시글 조회수 올려주는 쿼리
	public int updateReadCount(Connection conn, Board board) {
		int result = 0;
		PreparedStatement pstmt = null;
		String query = "UPDATE BOARD_TBL SET READCOUNT=? WHERE NO=?";
		try {
			pstmt = conn.prepareStatement(query);
			
			// 증감하는 코드
			board.setReadCount(board.getReadCount() + 1);
			
			pstmt.setInt(1, board.getReadCount());
			pstmt.setInt(2, board.getNo());

			result = pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}

	// 게시글 삭제(실제로는 안보여주기 기능) 를 위한 쿼리
	public int updateStatus(Connection conn, int boardNo, String status) {
		int result = 0;
		PreparedStatement pstmt = null;
		String query = "UPDATE BOARD_TBL SET STATUS=? WHERE NO=?";
		try {
			pstmt = conn.prepareStatement(query);
			
			pstmt.setString(1, status);
			pstmt.setInt(2, boardNo);

			result = pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}

	// 게시글 수정
	public int updateBoard(Connection conn, Board board) {
		int result = 0;
		PreparedStatement pstmt = null;
		String query = "UPDATE BOARD_TBL SET TITLE=?,CONTENT=?,ORIGINAL_FILENAME=?,RENAMED_FILENAME=?, "
				+ " MODIFY_DATE=SYSDATE WHERE NO=?";
		try {
			pstmt = conn.prepareStatement(query);
			
			pstmt.setString(1, board.getTitle());
			pstmt.setString(2, board.getContent());
			pstmt.setString(3, board.getOriginalFileName());
			pstmt.setString(4, board.getRenamedFileName());
			pstmt.setInt(5, board.getNo());
			
			result = pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}

	// 리플을 가져오는 메소드
	public List<Reply> getRepliesByNo(Connection conn, int boardNo) {
		List<Reply> list = new ArrayList<Reply>();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String query = "SELECT R.NO, R.BOARD_NO, R.CONTENT, U.USER_ID, R.CREATE_DATE, R.MODIFY_DATE "
				+ "FROM REPLY_TBL R "
				+ "JOIN USER_TBL U ON(R.WRITER_NO = U.USER_NO) "
				+ "WHERE R.STATUS='Y' AND BOARD_NO= ? ";
				/*+ "ORDER BY R.NO DESC";*/
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, boardNo);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				Reply reply = new Reply();
				reply.setNo(rs.getInt("NO"));
				reply.setBoardNo(rs.getInt("BOARD_NO"));
				reply.setContent(rs.getString("CONTENT"));
				reply.setWriterId(rs.getString("USER_ID"));
				reply.setCreateDate(rs.getDate("CREATE_DATE"));
				reply.setModifyDate(rs.getDate("MODIFY_DATE"));
				reply.setCreateTime(rs.getTime("CREATE_DATE"));
				reply.setModifyTime(rs.getTime("MODIFY_DATE"));
				list.add(reply);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			close(pstmt);
			close(rs);
		}
		return list;
	}

	// 리플 쓰기 기능
	public int insertReply(Connection conn, Reply reply) {
		int result = 0;
		PreparedStatement pstmt = null;
		String query = "INSERT INTO REPLY_TBL VALUES(REPLY_SEQ.NEXTVAL, ?, ?, ?, DEFAULT, DEFAULT, DEFAULT)";

		try {
			pstmt = conn.prepareStatement(query);
			
			pstmt.setInt(1, reply.getBoardNo());
			pstmt.setInt(2, reply.getWriterNo());
			pstmt.setString(3, reply.getContent());

			result = pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}
	
	// 리플 수정 기능
	public int updateReply(Connection conn, Reply reply) {
		int result = 0;
		PreparedStatement pstmt = null;
		String query = "UPDATE REPLY_TBL SET CONTENT=?,MODIFY_DATE=SYSDATE WHERE NO=?";
		try {
			pstmt = conn.prepareStatement(query);
			
			pstmt.setString(1, reply.getContent());
			pstmt.setInt(2, reply.getNo());
			
			result = pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}

	public int deleteReply(Connection conn, int replyNo) {
		int result = 0;
		PreparedStatement pstmt = null;
		String query = "DELETE REPLY_TBL WHERE NO= ?";
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, replyNo);
			
			result = pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}
}