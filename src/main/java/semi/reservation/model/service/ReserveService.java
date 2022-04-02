package semi.reservation.model.service;

import semi.fishing.model.dao.FishingDAO;
import semi.fishing.model.vo.Fishing;
import semi.reservation.model.dao.ReserveDAO;
import semi.reservation.model.vo.Reserve;

import static common.jdbc.JDBCConnect.*;

import java.sql.Connection;
import java.util.List;

import common.util.PageInfo; 

public class ReserveService {
	private ReserveDAO reserveDAO = new ReserveDAO();
	private FishingDAO fishingDAO = new FishingDAO();
	
	public List<Reserve> getReserveYList(PageInfo pageInfo, String userId){
		Connection conn = openConnection();
		List<Reserve> list = reserveDAO.findResYById(conn, pageInfo, userId);
		for(Reserve r : list) {
			Fishing fishing = fishingDAO.findFishingByNo(conn, r.getFishing().getNo());
			r.setFishing(fishing);
		}
		close(conn);
		return list;
	}
	
	public int getReserveCount(String type, String userId) {
		Connection conn = openConnection(); 
		int count = 0;
		if(type.equals("Y") == true) {
			count = reserveDAO.getYCount(conn, userId);
		}else {
			count = reserveDAO.getNCount(conn, userId);
		}
		close(conn);
		return count;
	}
	
	public List<Reserve> getReserveNList(PageInfo pageInfo, String userId){
		Connection conn = openConnection();
		List<Reserve> list = reserveDAO.findResNById(conn, pageInfo, userId);
		for(Reserve r : list) {
			Fishing fishing = fishingDAO.findFishingByNo(conn, r.getFishing().getNo());
			r.setFishing(fishing);
		}
		close(conn);
		return list;
	}
	
	public int saveRes(Reserve res) {
		Connection conn = openConnection();
		int result = reserveDAO.insertReservation(conn, res);
		
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		return result;
	}
	
	public int cancleRes(int resNo) {
		Connection conn = openConnection();
		int result = reserveDAO.cancleReservation(conn, resNo); 
		
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		return result;
	}
	
	public int deleteRes(int resNo) {
		Connection conn = openConnection();
		int result = reserveDAO.deleteReservation(conn, resNo); 
		
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		return result;
	}
}
