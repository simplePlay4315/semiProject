package semi.fishing.model.service;

import java.sql.Connection;
import java.util.List;

import common.util.KeywordInfo;
import common.util.PageInfo;
import semi.fish.model.dao.FishDAO;
import semi.fishing.model.dao.FishingDAO;
import semi.fishing.model.vo.Fishing;
import semi.fishing.model.vo.Review;

import static common.jdbc.JDBCConnect.*;

public class FishingService {
	private FishingDAO fishingDAO = new FishingDAO();  
	private FishDAO fishDAO = new FishDAO(); 
	
	public int getFishingCount(KeywordInfo info) {
		Connection conn = openConnection(); 
		int result = fishingDAO.getCountByKeyword(conn, info); 
		close(conn);
		return result;
	}
	
	public List<Fishing> getFishingList(PageInfo pageInfo, KeywordInfo info){
		Connection conn = openConnection(); 
		List<Fishing> fishingList = fishingDAO.findAllByKeyword(conn, pageInfo, info); 
		close(conn);
		return fishingList; 
	}
	
	public List<Fishing> getRecommendList(String type){
		Connection conn = openConnection(); 
		List<Fishing> fishingList = fishingDAO.recommendList(conn, type);  
		close(conn);
		return fishingList; 
	}
	
	
	public Fishing findFishingByNo(int fishingNo, boolean hasRead) {
		Connection conn = openConnection();
		Fishing fishing = fishingDAO.findFishingByNo(conn, fishingNo);
		fishing.setFishes(fishDAO.getFishes(conn, fishing.getFishes()));
		
		if(hasRead == true && fishing != null) {
			int result = fishingDAO.updateReadCount(conn, fishing);
			if(result > 0) {
				commit(conn);
			} else {
				rollback(conn);
			}
		} 
		
		close(conn);
		return fishing;
	}
	
	public int saveReview(Review review) {
		Connection conn = openConnection();
		int result = fishingDAO.insertReview(conn, review); 
		
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		return result;
	}
	
	public int deleteReview(int reviewNo) {
		Connection conn = openConnection();
		int result = fishingDAO.deleteReview(conn, reviewNo); 
		
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		return result;
	}
	
} // class 
