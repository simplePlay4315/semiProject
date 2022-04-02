package semi.wish.model.dao;

import static common.jdbc.JDBCConnect.*;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import semi.fishing.model.vo.Fishing;
import semi.wish.model.vo.Wish;

public class WishDAO {
	
	public List<Wish> findWishList(Connection conn,String userId){
		List<Wish> list = new ArrayList<>();
		PreparedStatement pstmt = null; 
		ResultSet rs = null;
		String sql = "SELECT WISH_NO, FISHING_NO, USER_ID FROM WISH_TBL WHERE USER_ID = ?";
		
		try {
			pstmt = conn.prepareStatement(sql); 
			pstmt.setString(1, userId);
			rs = pstmt.executeQuery();
			
			while(rs.next() == true) {
				Wish wish = new Wish();
				wish.setWishNo(rs.getInt("WISH_NO"));
				wish.setFishing(new Fishing());
				wish.getFishing().setNo(rs.getInt("FISHING_NO"));
				wish.setUserId(rs.getString("USER_ID"));
				list.add(wish);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}
		
		return list;
	}
	
	public Wish findWish(Connection conn, int fishingNo, String userId) {
		Wish wish = null;
		PreparedStatement pstmt = null; 
		ResultSet rs = null;
		String sql = "SELECT WISH_NO, FISHING_NO, USER_ID FROM WISH_TBL WHERE FISHING_NO = ? AND USER_ID = ?"; 
		try {
			pstmt = conn.prepareStatement(sql); 
			pstmt.setInt(1, fishingNo);
			pstmt.setString(2, userId);
			rs = pstmt.executeQuery(); 
			
			if(rs.next() == true) {
				wish = new Wish();
				wish.setWishNo(rs.getInt("WISH_NO"));
				Fishing fishing = new Fishing();
				fishing.setNo(rs.getInt("FISHING_NO"));
				wish.setFishing(fishing);
				wish.setUserId(rs.getString("USER_ID"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}
		
		return wish;
	}

	
	public int insertWish(Connection conn, Wish wish) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = "INSERT INTO WISH_TBL VALUES(WISH_SEQ.NEXTVAL, ?, ?)";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, wish.getFishing().getNo());
			pstmt.setString(2, wish.getUserId());
			result = pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
	}
	
	public int deleteWish(Connection conn, int wishNo) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = "DELETE WISH_TBL WHERE WISH_NO = ?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, wishNo);
			result = pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
	}
	
	public static void main(String[] args) {
		WishDAO dao = new WishDAO();
		Connection conn = openConnection(); 
		Wish wish = new Wish(); 
		Fishing fishing = new Fishing();
		fishing.setNo(52);
		wish.setUserId("testid2");
		wish.setFishing(fishing);
		int result = dao.insertWish(conn, wish);
		System.out.println(result);
		
	}
}
