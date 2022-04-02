package semi.user.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import semi.user.model.vo.User;

import static common.jdbc.JDBCConnect.*;

public class UserDAO {

	public User findUserById(Connection conn, String userId) {
		User user = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "SELECT * FROM USER_TBL WHERE USER_ID = ? AND STATUS = 'Y'";

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userId);
			rs = pstmt.executeQuery();

			if (rs.next() == true) {
				user = new User();
				user.setUserNo(rs.getInt("USER_NO"));
				user.setUserId(rs.getString("USER_ID"));
				user.setUserPw(rs.getString("USER_PW"));
				user.setUserName(rs.getString("USER_NAME"));
				user.setGender(rs.getString("GENDER"));
				user.setEmail(rs.getString("EMAIL"));
				user.setAddress(rs.getString("ADDRESS"));
				user.setPhone(rs.getString("PHONE"));
				user.setGrade(rs.getInt("GRADE"));
				user.setStatus(rs.getString("STATUS"));
			}
			return user;
		} catch (Exception e) {
			return user;
		} finally {
			close(rs);
			close(pstmt);
		}
	}

	public int insertUser(Connection conn, User user) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = "INSERT INTO USER_TBL VALUES(USER_SEQ.NEXTVAL, ?, ?, ?, ?, ?, ?, ?, DEFAULT, DEFAULT)";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, user.getUserId());
			pstmt.setString(2, user.getUserPw());
			pstmt.setString(3, user.getUserName());
			pstmt.setString(4, user.getGender());
			pstmt.setString(5, user.getEmail());
			pstmt.setString(6, user.getAddress());
			pstmt.setString(7, user.getPhone());
			result = pstmt.executeUpdate();

			return result;
		} catch (Exception e) {
			return result;
		} finally {
			close(pstmt);
		}
	}

	public int updateUser(Connection conn, User user) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = "UPDATE USER_TBL SET USER_NAME = ?, EMAIL = ?, PHONE = ?, GENDER = ?, ADDRESS = ? WHERE USER_ID = ?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, user.getUserName());
			pstmt.setString(2, user.getEmail());
			pstmt.setString(3, user.getPhone());
			pstmt.setString(4, user.getGender());
			pstmt.setString(5, user.getAddress());
			pstmt.setString(6, user.getUserId());
			result = pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}

	public int deleteUser(Connection conn, String userId) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = "UPDATE USER_TBL SET STATUS = 'N' WHERE USER_ID = ?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userId);
			result = pstmt.executeUpdate();

			return result;
		} catch (Exception e) {
			return result;
		} finally {
			close(pstmt);
		}
	}

	public int updatePwd(Connection conn, String userId, String newPwd) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = "UPDATE USER_TBL SET USER_PW = ? WHERE USER_ID = ?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, newPwd);
			pstmt.setString(2, userId);
			result = pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}
}