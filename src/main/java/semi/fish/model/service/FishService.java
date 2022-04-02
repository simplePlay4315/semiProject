package semi.fish.model.service;

import java.sql.Connection;
import java.util.ArrayList;
import java.util.List;
import static common.jdbc.JDBCConnect.*;
import semi.fish.model.dao.FishDAO;
import semi.fish.model.vo.Fish;
import semi.fishing.model.dao.FishingDAO;
import semi.fishing.model.vo.Fishing;

public class FishService {
	private FishDAO fishDAO = new FishDAO(); 
	private FishingDAO fishingDAO = new FishingDAO(); 
	
	public List<Fish> getFishList(){
		Connection conn = openConnection(); 
		List<Fish> list = fishDAO.findAll(conn); 
		close(conn); 
		return list; 
	}
	
	public List<Fish> getFishListByType(String type){
		Connection conn = openConnection(); 
		List<Fish> list = fishDAO.findFishByType(conn, type); 
		close(conn); 
		return list; 
	}
	
	public  List<Fish> getFishListByName(String name){
		Connection conn = openConnection(); 
		List<Fish> list = fishDAO.findFishByName(conn, name);  
		close(conn); 
		return list; 
	}
	
	public Fish findFishByNo(int fishNo) {
		Connection conn = openConnection(); 
		Fish fish = fishDAO.findFishByNo(conn, fishNo); 
		close(conn); 
		return fish;
	}
	
	public List<Fishing> getFishingListByFishNo(int fishNo){
		Connection conn = openConnection(); 
		List<Integer> fishNoList = fishDAO.findFishingByFishNo(conn, fishNo);
		List<Fishing> fishingList = new ArrayList<>();
		for(Integer i : fishNoList) {
			Fishing fishing = fishingDAO.findFishingByNo(conn, i);
			fishingList.add(fishing); 
		}
		close(conn);
		return fishingList; 
	}
	
	public List<String> getFishNameList(){
		Connection conn = openConnection(); 
		List<String> list = fishDAO.getFishNameList(conn); 
		close(conn); 
		return list; 
	}
}
