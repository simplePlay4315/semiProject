package semi.wish.model.service;

import java.sql.Connection;
import java.util.List;

import semi.fishing.model.dao.FishingDAO;
import semi.fishing.model.vo.Fishing;
import semi.wish.model.dao.WishDAO;
import semi.wish.model.vo.Wish;
import static common.jdbc.JDBCConnect.*;

public class WishService {
	private WishDAO wishDAO = new WishDAO();
	private FishingDAO fishingDAO = new FishingDAO(); 
	
	public int wishToggle(Wish wish) {
		Connection conn = openConnection(); 
		int result = 0;
		if(wish.getWishNo() == 0) {
			result = wishDAO.insertWish(conn, wish);
		}else {
			result = wishDAO.deleteWish(conn, wish.getWishNo());
		}
		
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		
		close(conn);
		return result;
	}
	
	public List<Wish> getWishList(String userId){
		Connection conn = openConnection(); 
		List<Wish> list = wishDAO.findWishList(conn, userId);
		for(Wish w : list) {
			Fishing fishing = fishingDAO.findFishingByNo(conn, w.getFishing().getNo()); 
			w.setFishing(fishing);
		}
		close(conn);
		return list;
	}
	
	public Wish wishCheck(int fishingNo, String userId) {
		Connection conn = openConnection(); 
		Wish wish = wishDAO.findWish(conn, fishingNo, userId);
		close(conn);
		
		return wish;
	}

}
