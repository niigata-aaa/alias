package model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import model.entity.UserBean;

public class UserDAO {
	public List<UserBean> selectAll() throws SQLException, ClassNotFoundException {

		List<UserBean> userList = new ArrayList<UserBean>();
		String sql = "SELECT * FROM m_user";

		// データベースへの接続の取得、Statementの取得、SQLステートメントの実行
		try (Connection con = ConnectionManager.getConnection();
				Statement stmt = con.createStatement();
				ResultSet res = stmt.executeQuery(sql)) {

			// 結果の操作
			while (res.next()) {
				UserBean user = new UserBean();
				user.setUserId(res.getString("user_id"));
				user.setUserName(res.getString("user_name"));
				user.setUserPass(res.getString("user_pass"));
				user.setUserChoice(Integer.parseInt(res.getString("user_choice")));
				user.setUserStop(Integer.parseInt(res.getString("user_stop")));

				userList.add(user);
			}
		}
		return userList;
	}
	
	public List<UserBean> selectStopUser() throws SQLException, ClassNotFoundException {

		List<UserBean> userList = new ArrayList<UserBean>();
		String sql = "SELECT * FROM m_user WHERE user_stop = 1";

		// データベースへの接続の取得、Statementの取得、SQLステートメントの実行
		try (Connection con = ConnectionManager.getConnection();
				Statement stmt = con.createStatement();
				ResultSet res = stmt.executeQuery(sql)) {

			// 結果の操作
			while (res.next()) {
				UserBean user = new UserBean();
				user.setUserId(res.getString("user_id"));
				user.setUserName(res.getString("user_name"));
				user.setUserPass(res.getString("user_pass"));
				user.setUserChoice(Integer.parseInt(res.getString("user_choice")));
				user.setUserStop(Integer.parseInt(res.getString("user_stop")));

				userList.add(user);
			}
		}
		return userList;
	}

	public boolean loginCheck(String userId, String userPass) throws ClassNotFoundException, SQLException {

		String sql = "SELECT * FROM m_user WHERE user_id = ? AND user_pass = ? AND user_stop = 0";

		try (Connection con = ConnectionManager.getConnection();
				PreparedStatement pstmt = con.prepareStatement(sql)) {

			pstmt.setString(1, userId);
			pstmt.setString(2, userPass);

			ResultSet res = pstmt.executeQuery();

			if (res.next()) {
				return true;
			}
		}
		return false;
	}
	
	public int insert(UserBean user) throws SQLException, ClassNotFoundException {
		int count = 0; //処理件数
		String sql = "INSERT INTO m_user(user_id, user_name, user_pass) VALUES(?, ?, ?)";

		// データベースへの接続の取得、PreparedStatementの取得
		try (Connection con = ConnectionManager.getConnection();
				PreparedStatement pstmt = con.prepareStatement(sql)) {

			// DTOからのデータの取り出し
			String id = user.getUserId();
			String name = user.getUserName();
			String pass = user.getUserPass();

			// プレースホルダへの値の設定
			pstmt.setString(1, id);
			pstmt.setString(2, name);
			pstmt.setString(3, pass);

			// SQLステートメントの実行
			count = pstmt.executeUpdate();
		}

		return count;

	}
	
	public int updateStop(String user_id) throws SQLException, ClassNotFoundException {
		int count = 0; //処理件数
		String sql = "UPDATE m_user SET user_stop = 1 WHERE user_id = ?";

		// データベースへの接続の取得、PreparedStatementの取得
		try (Connection con = ConnectionManager.getConnection();
				PreparedStatement pstmt = con.prepareStatement(sql)) {

			// プレースホルダへの値の設定
			pstmt.setString(1, user_id);

			// SQLステートメントの実行
			count = pstmt.executeUpdate();
		}

		return count;

	}

}
