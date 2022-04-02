package semi.reservation.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import common.util.PageInfo;
import semi.fishing.model.vo.Fishing;
import semi.reservation.model.vo.Reserve;
import static common.jdbc.JDBCConnect.*; 

public class ReserveDAO {
	
	public List<Reserve> findResYById(Connection conn, PageInfo pageInfo, String userId){
		List<Reserve> list = new ArrayList<>(); 
		PreparedStatement pstmt = null; 
		ResultSet rs = null; 
		String sql = "SELECT RES_NO, USER_ID, FISHING_NO, RES_DATE, USERNUM, STATUS "
				+ 	 "FROM (SELECT ROWNUM RNUM, RES_NO, USER_ID, FISHING_NO, RES_DATE, USERNUM, STATUS "
				+    "		FROM (SELECT RES_NO, USER_ID, FISHING_NO, RES_DATE, USERNUM, STATUS "
				+    "  		  FROM FISHING_RES_TBL WHERE USER_ID = ? AND STATUS = 'Y' ORDER BY RES_NO ASC)) "
				+ "WHERE RNUM BETWEEN ? AND ?"; 
		
		try {
			pstmt = conn.prepareStatement(sql); 
			pstmt.setString(1, userId);
			pstmt.setInt(2, pageInfo.getStartList());
			pstmt.setInt(3, pageInfo.getEndList());
			rs = pstmt.executeQuery();
			while(rs.next() == true) {
				Reserve res = new Reserve(); 
				res.setResNo(rs.getInt("RES_NO"));
				res.setUserId(rs.getString("USER_ID"));
				res.setFishing(new Fishing());
				res.getFishing().setNo(rs.getInt("FISHING_NO"));
				res.setResDate(rs.getDate("RES_DATE"));
				res.setUserNum(rs.getInt("USERNUM"));
				res.setStatus(rs.getString("STATUS"));
				list.add(res); 
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}
		return list; 
	}
	
	public int getYCount(Connection conn, String userId) {
		int result = 0;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "SELECT COUNT(*) FROM FISHING_RES_TBL WHERE USER_ID = ? AND STATUS = 'Y'";
		
		try {
			pstmt = conn.prepareStatement(sql); 
			pstmt.setString(1, userId);
			rs = pstmt.executeQuery();
			if(rs.next() == true) {
				result = rs.getInt(1);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}
		return result;
	}
	
	public int getNCount(Connection conn, String userId) {
		int result = 0;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "SELECT COUNT(*) FROM FISHING_RES_TBL WHERE USER_ID = ? AND STATUS = 'N'";
		
		try {
			pstmt = conn.prepareStatement(sql); 
			pstmt.setString(1, userId);
			rs = pstmt.executeQuery();
			if(rs.next() == true) {
				result = rs.getInt(1);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}
		return result;
	}
	
	public List<Reserve> findResNById(Connection conn, PageInfo pageInfo, String userId){
		List<Reserve> list = new ArrayList<>(); 
		PreparedStatement pstmt = null; 
		ResultSet rs = null; 
		String sql = "SELECT RES_NO, USER_ID, FISHING_NO, RES_DATE, USERNUM, STATUS "
				+ 	 "FROM (SELECT ROWNUM RNUM, RES_NO, USER_ID, FISHING_NO, RES_DATE, USERNUM, STATUS "
				+    "		FROM (SELECT RES_NO, USER_ID, FISHING_NO, RES_DATE, USERNUM, STATUS "
				+    "  		  FROM FISHING_RES_TBL WHERE USER_ID = ? AND STATUS = 'N' ORDER BY RES_NO ASC)) "
				+ "WHERE RNUM BETWEEN ? AND ?"; 
		
		try {
			pstmt = conn.prepareStatement(sql); 
			pstmt.setString(1, userId);
			pstmt.setInt(2, pageInfo.getStartList());
			pstmt.setInt(3, pageInfo.getEndList());
			rs = pstmt.executeQuery();
			while(rs.next() == true) {
				Reserve res = new Reserve(); 
				res.setResNo(rs.getInt("RES_NO"));
				res.setUserId(rs.getString("USER_ID"));
				res.setFishing(new Fishing());
				res.getFishing().setNo(rs.getInt("FISHING_NO"));
				res.setResDate(rs.getDate("RES_DATE"));
				res.setUserNum(rs.getInt("USERNUM"));
				res.setStatus(rs.getString("STATUS"));
				list.add(res); 
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}
		return list; 
	}
	
	
	
	public int insertReservation(Connection conn, Reserve res) {
		int result = 0;
		PreparedStatement pstmt = null; 
		String sql = "INSERT INTO FISHING_RES_TBL VALUES (RES_SEQ.NEXTVAL, ?, ?, ?, ?, DEFAULT)";
		
		try {
			pstmt = conn.prepareStatement(sql); 
			pstmt.setString(1, res.getUserId());
			pstmt.setInt(2, res.getFishing().getNo());
			pstmt.setDate(3, res.getResDate());
			pstmt.setInt(4, res.getUserNum());
			result = pstmt.executeUpdate();  
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result; 
	}
	
	public int cancleReservation(Connection conn, int resNo) {
		int result = 0;
		PreparedStatement pstmt = null; 
		String sql = "UPDATE FISHING_RES_TBL SET STATUS = 'N' WHERE RES_NO = ?";
		
		try {
			pstmt = conn.prepareStatement(sql); 
			pstmt.setInt(1, resNo);
			result = pstmt.executeUpdate();  
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result; 
	}
	
	public int deleteReservation(Connection conn, int resNo) {
		int result = 0;
		PreparedStatement pstmt = null; 
		String sql = "DELETE FROM FISHING_RES_TBL WHERE RES_NO = ?";
		
		try {
			pstmt = conn.prepareStatement(sql); 
			pstmt.setInt(1, resNo);
			result = pstmt.executeUpdate();  
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result; 
	}
	
}
