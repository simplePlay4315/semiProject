package semi.user.model.service;

import java.sql.Connection;


import semi.user.model.dao.UserDAO;
import semi.user.model.vo.User;
import static common.jdbc.JDBCConnect.*; 

public class UserService {
	private UserDAO userDAO = new UserDAO(); 
	
	public User findUserById(String userId) {
		Connection conn = openConnection(); 
		User user = userDAO.findUserById(conn, userId); 
		close(conn); 
		return user; 
	}
	
	public User login(String id, String pw) {
		User user = findUserById(id); 
		
		if(user != null && user.getUserPw().equals(pw) == true) {
			return user; 
		}else {
			return null; 
		}
	}
	
	public int enroll(User user) {
		int result = 0;
		Connection conn = openConnection(); 
		
		result = userDAO.insertUser(conn, user); 
		
		if(result > 0) {
			commit(conn); 
		}else {
			rollback(conn);
		}
		
		close(conn); 
		return result;
	}
	
	public int updateUser(User user) {
		Connection conn = openConnection();
		int result = 0;
		
		result = userDAO.updateUser(conn, user);
		
		if(result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		close(conn);
		return result;
	}
	
	public int deleteUser(User user) {
		int result = 0; 
		Connection conn = openConnection(); 
		
		result = userDAO.deleteUser(conn, user.getUserId()); 
		
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		
		close(conn);
		return result;
	}
	
	public boolean isDuplicated(String newId) {
		User user = findUserById(newId); 
		
		if(user == null) {
			return false;
		} else {
			return true;
		}
	}
	
	public int updatePwd(String userId, String oldPwd, String newPwd) {
		Connection conn = openConnection();
		int result = 0;
		User user = login(userId, oldPwd);
		
		if(user == null) {
			return result;
		}
		
		result = userDAO.updatePwd(conn, userId, newPwd);
		
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		return result;
	}
}