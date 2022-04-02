package semi.fish.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import static common.jdbc.JDBCConnect.*;
import semi.fish.model.vo.Fish;

public class FishDAO {
	
	public List<String> getFishNameList(Connection conn){
		List<String> list = new ArrayList<>();
		PreparedStatement pstmt = null; 
		ResultSet rs = null; 
		String sql = "SELECT FISH_NAME FROM FISH_TBL ORDER BY FISH_NAME ASC"; 
		
		try {
			pstmt = conn.prepareStatement(sql); 
			rs = pstmt.executeQuery(); 
			
			while(rs.next() == true) {
				list.add(rs.getString("FISH_NAME")); 
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}
		return list; 
	}
	
	public List<Fish> findAll(Connection conn){
		List<Fish> list = new ArrayList<>();
		PreparedStatement pstmt = null; 
		ResultSet rs = null; 
		String sql = "SELECT FISH_NO, FISH_NAME, FISH_TYPE, INTRO, DETAIL, RANGE FROM FISH_TBL";
		
		try {
			pstmt = conn.prepareStatement(sql); 
			rs = pstmt.executeQuery(); 
			
			while(rs.next() == true) {
				Fish fish = new Fish(); 
				fish.setNo(rs.getInt("FISH_NO"));
				fish.setName(rs.getString("FISH_NAME"));
				fish.setType(rs.getString("FISH_TYPE"));
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
	
	public List<Fish> findFishByType(Connection conn, String type){
		List<Fish> list = new ArrayList<>();
		PreparedStatement pstmt = null; 
		ResultSet rs = null; 
		String sql = "SELECT FISH_NO, FISH_NAME, FISH_TYPE FROM FISH_TBL WHERE FISH_TYPE = ?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, type);
			rs = pstmt.executeQuery();
			
			while(rs.next() == true) {
				Fish fish = new Fish(); 
				fish.setNo(rs.getInt("FISH_NO"));
				fish.setName(rs.getString("FISH_NAME"));
				fish.setType(rs.getString("FISH_TYPE"));
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
	
	public List<Fish> findFishByName(Connection conn, String name) {
		List<Fish> list = new ArrayList<Fish>();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "SELECT FISH_NO, FISH_NAME, FISH_TYPE FROM FISH_TBL WHERE FISH_NAME LIKE ?"; 
		try {
			pstmt = conn.prepareStatement(sql); 
			pstmt.setString(1, "%" + name + "%");
			rs = pstmt.executeQuery(); 
			
			while(rs.next() == true) { 
				Fish fish = new Fish(); 
				fish.setNo(rs.getInt("FISH_NO"));
				fish.setName(rs.getString("FISH_NAME"));
				fish.setType(rs.getString("FISH_TYPE"));
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
	
	public Fish findFishByNo(Connection conn, int fishNo){
		Fish fish = null;
		PreparedStatement pstmt = null; 
		ResultSet rs = null; 
		String sql = "SELECT FISH_NO, FISH_NAME, FISH_TYPE, INTRO, DETAIL, RANGE FROM FISH_TBL WHERE FISH_NO = ?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, fishNo);
			rs = pstmt.executeQuery();
			
			if(rs.next() == true) {
				fish = new Fish();
				fish.setNo(rs.getInt("FISH_NO"));
				fish.setName(rs.getString("FISH_NAME"));
				fish.setType(rs.getString("FISH_TYPE"));
				fish.setIntro(rs.getString("INTRO").strip());
				fish.setDetail(rs.getString("DETAIL").strip());
				fish.setRange(rs.getString("RANGE").strip());
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}
		return fish;
	}
	
	// 물고기 잡히는 낚시터번호 가져오기 
	public List<Integer> findFishingByFishNo(Connection conn, int fishNo) {
		List<Integer> list = new ArrayList<Integer>(); 
		PreparedStatement pstmt = null; 
		ResultSet rs = null; 
		String sql = "SELECT FISHING_NO FROM FISHABLE_TBL WHERE FISH_NO = ?";
		try {
			pstmt = conn.prepareStatement(sql); 
			pstmt.setInt(1, fishNo); 
			rs = pstmt.executeQuery(); 
			
			while(rs.next() == true) {
				list.add(rs.getInt("FISHING_NO"));
			}
		} catch (Exception e) {
			
		}finally {
			close(rs);
			close(pstmt); 
		}
		return list; 
	}
	
	public List<Fish> getFishes(Connection conn, List<Fish> fishes) { 
		List<Fish> list = fishes; 
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String sql = "SELECT FISH_NO, FISH_NAME, FISH_TYPE, INTRO, DETAIL FROM FISH_TBL WHERE FISH_NO = ?"; 
		try {
				for(int i = 0; i <fishes.size(); i++) {
					pstmt = conn.prepareStatement(sql); 
					pstmt.setInt(1, fishes.get(i).getNo());
					rs = pstmt.executeQuery();
					
					if(rs.next() == true) { 
						list.get(i).setName(rs.getString("FISH_NAME"));
						list.get(i).setType(rs.getString("FISH_TYPE"));
						list.get(i).setIntro(rs.getString("INTRO"));
						list.get(i).setDetail(rs.getString("DETAIL"));
					}
					close(pstmt);
				}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}
		return list; 
	}
	
	public static void main(String[] args) {
		FishDAO f = new FishDAO(); 
		for(Integer i : f.findFishingByFishNo(openConnection(), 2)) {
			System.out.println(i);
		}
	}
}
