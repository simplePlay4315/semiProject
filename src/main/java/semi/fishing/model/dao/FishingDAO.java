package semi.fishing.model.dao;

import static common.jdbc.JDBCConnect.*;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import common.util.KeywordInfo;
import common.util.PageInfo;
import semi.fish.model.vo.Fish;
import semi.fishing.model.vo.Fishing;
import semi.fishing.model.vo.Review;

public class FishingDAO {
	
	public int getCountByKeyword(Connection conn, KeywordInfo info){
		int result = 0;
		PreparedStatement pstmt = null; 
		ResultSet rs = null; 
		String sql = "SELECT COUNT(*) "
				+ "FROM (SELECT ROWNUM RNUM, FISHING_NO, FISHING_NAME, FISHING_TYPE , FISHING_ADDR1 , READCOUNT, FISHABLE "
				+ "      FROM (SELECT F.FISHING_NO, F.FISHING_NAME, F.FISHING_TYPE, F.FISHING_ADDR1, F.READCOUNT, F.FISHABLE "
				+ "            FROM FISHING_TBL F "
				+ "            WHERE FISHING_ADDR1 LIKE ? "
				+ "            AND FISHING_TYPE LIKE ? "
				+ "            AND (FISHABLE LIKE ? OR FISHABLE LIKE ?)"
				+ "            AND FISHING_NAME LIKE ? "
				+ "            ORDER BY FISHING_NAME ASC)) ";
			
		try {
			pstmt = conn.prepareStatement(sql); 
			pstmt.setString(1,"%" + info.getArea() + "%");
			pstmt.setString(2, "%" + info.getType() + "%");
			pstmt.setString(3, info.getFish() + "|%");
			pstmt.setString(4,"%|" + info.getFish() + "%");
			pstmt.setString(5,"%" + info.getTitle() + "%");
			rs = pstmt.executeQuery(); 
			
			if(rs.next() == true) {
				result = rs.getInt(1);
			}
			return result;
		} catch (Exception e) {
			return result;
		}finally {
			close(rs);
			close(pstmt);
		}
	} 
	
	public List<Fishing> findAllByKeyword(Connection conn, PageInfo pageInfo, KeywordInfo info){
		List<Fishing> fishingList = new ArrayList<>(); 
		PreparedStatement pstmt = null; 
		ResultSet rs = null; 
		String sql = "SELECT * "
				+ "FROM (SELECT ROWNUM RNUM, FISHING_NO, FISHING_NAME, FISHING_TYPE , FISHING_ADDR1 , READCOUNT, FISHABLE "
				+ "      FROM (SELECT F.FISHING_NO, F.FISHING_NAME, F.FISHING_TYPE, F.FISHING_ADDR1, F.READCOUNT, F.FISHABLE "
				+ "            FROM FISHING_TBL F "
				+ "            WHERE FISHING_ADDR1 LIKE ? "
				+ "            AND FISHING_TYPE LIKE ? "
				+ "            AND (FISHABLE LIKE ? OR FISHABLE LIKE ?)"
				+ "            AND FISHING_NAME LIKE ? "
				+ "            ORDER BY FISHING_NAME ASC)) "
				+ "WHERE RNUM BETWEEN ? AND ? ";
		
		try {
			pstmt = conn.prepareStatement(sql); 
			pstmt.setString(1,"%" + info.getArea() + "%");
			pstmt.setString(2, "%" + info.getType() + "%");
			pstmt.setString(3, info.getFish() + "|%");
			pstmt.setString(4,"%|" + info.getFish() + "%");
			pstmt.setString(5,"%" + info.getTitle() + "%");
			pstmt.setInt(6, pageInfo.getStartList());
			pstmt.setInt(7, pageInfo.getEndList());
			rs = pstmt.executeQuery(); 
			
			while(rs.next() == true) {
				Fishing fishing = new Fishing();
				fishing.setNo(rs.getInt("FISHING_NO"));
				fishing.setName(rs.getString("FISHING_NAME"));
				fishing.setType(rs.getString("FISHING_TYPE"));
				fishing.setAddr1(rs.getString("FISHING_ADDR1"));
				fishing.setReadCount(rs.getInt("READCOUNT"));
				String fishable[] = rs.getString("FISHABLE").split("\\|"); 
				List<Fish> fishList = new ArrayList<>(); 
				for(int i = 0; i < fishable.length; i++) {
					Fish fish = new Fish(); 
					fish.setName(fishable[i]);
					fishList.add(fish); 
				}
				fishing.setFishes(fishList);
				fishingList.add(fishing); 
			}
			return fishingList;
		} catch (Exception e) {
			return null;
		}finally {
			close(rs);
			close(pstmt);
		}
	}
	
	public List<Fishing> recommendList(Connection conn, String type){
		List<Fishing> fishingList = new ArrayList<>();
		PreparedStatement pstmt = null; 
		ResultSet rs = null;
		String sql = "SELECT * "
				+ "FROM (SELECT ROWNUM RNUM, FISHING_NO, FISHING_NAME, FISHING_TYPE , FISHING_ADDR1 , FISHING_ADDR2, READCOUNT, FISHABLE "
				+ "      FROM (SELECT F.FISHING_NO, F.FISHING_NAME, F.FISHING_TYPE, F.FISHING_ADDR1, F.FISHING_ADDR2, F.READCOUNT, F.FISHABLE "
				+ "            FROM FISHING_TBL F "
				+ "            WHERE FISHING_TYPE = ? "
				+ "            ORDER BY READCOUNT DESC)) "
				+ "WHERE RNUM BETWEEN  1 AND 6"; 
		try {
			pstmt = conn.prepareStatement(sql); 
			pstmt.setString(1, type);
			rs = pstmt.executeQuery(); 
			
			while(rs.next() == true) {
				Fishing fishing = new Fishing();
				fishing.setNo(rs.getInt("FISHING_NO"));
				fishing.setName(rs.getString("FISHING_NAME"));
				fishing.setType(rs.getString("FISHING_TYPE"));
				fishing.setAddr1(rs.getString("FISHING_ADDR1"));
				fishing.setAddr2(rs.getString("FISHING_ADDR2"));
				fishing.setReadCount(rs.getInt("READCOUNT"));
				String fishable[] = rs.getString("FISHABLE").split("\\|"); 
				List<Fish> fishList = new ArrayList<>(); 
				for(int i = 0; i < fishable.length; i++) {
					Fish fish = new Fish(); 
					fish.setName(fishable[i]);
					fishList.add(fish); 
				}
				fishing.setFishes(fishList);
				fishingList.add(fishing); 
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}
		return fishingList;
	}
	
	// 조회수 올리기
	public int updateReadCount(Connection conn, Fishing fishing) {
		int result = 0;
		PreparedStatement pstmt = null; 
		String query = "UPDATE FISHING_TBL SET READCOUNT=? WHERE FISHING_NO=?";
		try {
			pstmt = conn.prepareStatement(query);
			fishing.setReadCount(fishing.getReadCount() + 1);
			pstmt.setInt(1, fishing.getReadCount());
			pstmt.setInt(2, fishing.getNo());
			result = pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result; 
	}
	
	// 수정 
	public Fishing findFishingByNo(Connection conn, int fishingNo) {
		Fishing fishing = null; 
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "SELECT * FROM FISHING_TBL WHERE FISHING_NO = ?";
		try {
			pstmt = conn.prepareStatement(sql); 
			pstmt.setInt(1, fishingNo);
			rs = pstmt.executeQuery();
			
			if(rs.next() == true) {
				fishing = new Fishing(); 
				fishing.setNo(fishingNo);
				fishing.setName(rs.getString("FISHING_NAME"));
				fishing.setType(rs.getString("FISHING_TYPE"));
				fishing.setAddr1(rs.getString("FISHING_ADDR1"));
				fishing.setAddr2(rs.getString("FISHING_ADDR2"));
				fishing.setLatitude(rs.getString("LATITUDE"));
				fishing.setLongitude(rs.getString("LONGITUDE"));
				fishing.setReadCount(rs.getInt("READCOUNT"));
				fishing.setFishes(getFishNoList(conn, fishingNo));
				fishing.setReviews(getReviews(conn, fishingNo));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}
		return fishing;
	}
	
	public List<Review> getReviews(Connection conn, int fishingNo) {
		List<Review> list = new ArrayList<>(); 
		PreparedStatement pstmt = null; 
		ResultSet rs = null;
		String sql = "SELECT REVIEW_NO, FISHING_NO, USER_ID, CONTENT, CREATE_DATE, SCORE FROM FISHING_REVIEW_TBL WHERE FISHING_NO = ?"; 
		try {
			pstmt = conn.prepareStatement(sql); 
			pstmt.setInt(1, fishingNo);
			rs = pstmt.executeQuery(); 
			
			while(rs.next() == true) {
				Review review = new Review();
				review.setNo(rs.getInt("REVIEW_NO"));
				review.setFishingNo(rs.getInt("FISHING_NO"));
				review.setUserId(rs.getString("USER_ID"));
				review.setContent(rs.getString("CONTENT"));
				review.setCreatedDate(rs.getDate("CREATE_DATE"));
				review.setScore(rs.getInt("SCORE"));
				list.add(review); 
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}
		return list;
	}
	
	public List<Fish> getFishNoList(Connection conn, int fishingNo){
		List<Fish> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "SELECT FISH_NO FROM FISHABLE_TBL WHERE FISHING_NO = ?";
		try {
			pstmt = conn.prepareStatement(sql); 
			pstmt.setInt(1, fishingNo);
			rs = pstmt.executeQuery(); 
			
			while(rs.next() == true) {
				Fish fish = new Fish(); 
				fish.setNo(rs.getInt("FISH_NO"));
				list.add(fish);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}
		
		return list;  
	}
	
	public int insertReview(Connection conn, Review review) {
		int result = 0; 
		PreparedStatement pstmt = null; 
		String sql = "INSERT INTO FISHING_REVIEW_TBL VALUES(REVIEW_SEQ.NEXTVAL, ?, ?, ?, DEFAULT, ?)";
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, review.getFishingNo());
			pstmt.setString(2, review.getUserId());
			pstmt.setString(3, review.getContent()); 
			pstmt.setFloat(4, review.getScore());
			
			result = pstmt.executeUpdate();  
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
	}
	
	public int deleteReview(Connection conn, int reviewNo) {
		int result = 0; 
		PreparedStatement pstmt = null; 
		String sql = "DELETE FISHING_REVIEW_TBL WHERE REVIEW_NO = ?";
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, reviewNo);
			
			result = pstmt.executeUpdate();  
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
	}
} // class 
