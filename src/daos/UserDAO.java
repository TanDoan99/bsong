package daos;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import models.Category;
import models.Song;
import models.User;
import utils.DBConnectionUtil;

public class UserDAO extends AbstractDAO {

	public List<User> findAll() {
		List<User> list = new ArrayList<>();
		con = DBConnectionUtil.getConnection();
		String sql = "SELECT * FROM users ORDER BY id DESC ";
		try {
			st = con.createStatement();
			rs = st.executeQuery(sql);
			while (rs.next()) {
				User user = new User(rs.getInt("id"), rs.getString("username"), rs.getString("password"),
						rs.getString("fullname"));
				list.add(user);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBConnectionUtil.close(rs, pst, con);
		}

		return list;
	}

	public int add(User user) {
		int result = 0;
		con = DBConnectionUtil.getConnection();
		String sql = "INSERT INTO users (username,password,fullname) VALUE (?,?,?)";
		try {
			pst = con.prepareStatement(sql);
			pst.setString(1, user.getUsername());
			pst.setString(2, user.getPassword());
			pst.setString(3, user.getFullname());
			result = pst.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBConnectionUtil.close(rs, pst, con);
		}

		return result;
	}

	public boolean hasUser(String username) {
		con = DBConnectionUtil.getConnection();
		String sql = "SELECT * FROM users WHERE username= ? ";
		try {
			pst = con.prepareStatement(sql);
			pst.setString(1, username);
			rs = pst.executeQuery();
			if (rs.next()) {
				return true;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBConnectionUtil.close(rs, pst, con);
		}

		return false;
	}

	public User getItem(int id) {
		User item = null;
		con = DBConnectionUtil.getConnection();
		String sql = "SELECT id, username, password, fullname FROM users WHERE id = ?";
		try {
			pst = con.prepareStatement(sql);
			pst.setInt(1, id);
			rs = pst.executeQuery();
			if (rs.next()) {
				String username = rs.getString("username");
				String password = rs.getString("password");
				String fullname = rs.getString("fullname");
				item = new User(username, password, fullname);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBConnectionUtil.close(rs, pst, con);
		}

		return item;
	}

	public int editItem(User users) {
		int result = 0;
		con = DBConnectionUtil.getConnection();
		String sql = "UPDATE users SET password=?, fullname=? WHERE id = ?";
		try {
			pst = con.prepareStatement(sql);
			pst.setString(1, users.getPassword());
			pst.setString(2, users.getFullname());
			pst.setInt(3, users.getId());
			
			result = pst.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBConnectionUtil.close(rs, pst, con);
		}

		return result;
	}

	public int delItem(int id) {
		int result = 0;
		con = DBConnectionUtil.getConnection();
		String sql = "DELETE FROM users WHERE id = ?";
		try {
			pst = con.prepareStatement(sql);
			
			pst.setInt(1, id);
			
			result = pst.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBConnectionUtil.close(rs, pst, con);
		}

		return result;
	}
	public User findUsernameAndPassword(String username, String password) {
		User user= null;
		con=DBConnectionUtil.getConnection();
		try {
			String sql = "SELECT * FROM users WHERE username = ? AND password = ? ";
			pst = con.prepareStatement(sql);
			pst.setString(1, username);
			pst.setString(2, password);
			rs = pst.executeQuery();
			if(rs.next()) {
				user = new User(rs.getInt("id"),
						rs.getString("username"),
						rs.getString("password"),
						rs.getString("fullname"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBConnectionUtil.close(rs, pst, con);
		}
		return user;
	}
}
