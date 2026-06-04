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

	public UserBean select(String userId) throws SQLException, ClassNotFoundException {

		UserBean user = new UserBean();

		String sql = "SELECT * FROM m_user WHERE user_id = ?";

		// データベースへの接続の取得、Statementの取得、SQLステートメントの実行
		try (Connection con = ConnectionManager.getConnection();
				PreparedStatement pstmt = con.prepareStatement(sql)) {

			pstmt.setString(1, userId);

			ResultSet res = pstmt.executeQuery();

			// 結果の操作
			if (res.next()) {
				user.setUserId(res.getString("user_id"));
				user.setUserName(res.getString("user_name"));
				user.setUserPass(res.getString("user_pass"));
				user.setUserChoice(res.getInt("user_choice"));
				user.setUserStop(res.getInt("user_stop"));
			}
		}
		return user;
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

	public List<UserBean> search(String userId, String userName, Integer userStop)
			throws SQLException, ClassNotFoundException {

		List<UserBean> list = new ArrayList<>();
		StringBuilder sql = new StringBuilder("SELECT * FROM m_user WHERE 1=1");

		List<Object> params = new ArrayList<>();

		if (userId != null && !userId.isEmpty()) {
			sql.append(" AND user_id LIKE ?");
			params.add("%" + userId + "%");
		}

		if (userName != null && !userName.isEmpty()) {
			sql.append(" AND user_name LIKE ?");
			params.add("%" + userName + "%");
		}

		if (userStop != null) {
			sql.append(" AND user_stop = ?");
			params.add(userStop);
		}

		try (Connection con = ConnectionManager.getConnection();
				PreparedStatement pstmt = con.prepareStatement(sql.toString())) {

			for (int i = 0; i < params.size(); i++) {
				pstmt.setObject(i + 1, params.get(i));
			}

			ResultSet res = pstmt.executeQuery();

			while (res.next()) {
				UserBean user = new UserBean();

				user.setUserId(res.getString("user_id"));
				user.setUserName(res.getString("user_name"));
				user.setUserPass(res.getString("user_pass"));
				user.setUserChoice(res.getInt("user_choice"));
				user.setUserStop(res.getInt("user_stop"));

				list.add(user);
			}
		}

		return list;
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

	public boolean loginCheckForPart(String userId) throws ClassNotFoundException, SQLException {

		String sql = "SELECT * FROM m_user WHERE user_id = ? AND user_stop = 0";

		try (Connection con = ConnectionManager.getConnection();
				PreparedStatement pstmt = con.prepareStatement(sql)) {

			pstmt.setString(1, userId);

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

	public int updateChoice(int rest_id, String user_id) throws SQLException, ClassNotFoundException {
		int count = 0; //処理件数
		String sql = "UPDATE m_user SET user_choice = ? WHERE user_id = ?";

		// データベースへの接続の取得、PreparedStatementの取得
		try (Connection con = ConnectionManager.getConnection();
				PreparedStatement pstmt = con.prepareStatement(sql)) {

			// プレースホルダへの値の設定
			pstmt.setInt(1, rest_id);
			pstmt.setString(2, user_id);

			// SQLステートメントの実行
			count = pstmt.executeUpdate();
		}

		return count;

	}

	public int delete(String userId) throws SQLException, ClassNotFoundException {
		int count = 0;

		String sqlLog = "DELETE FROM t_log WHERE log_user = ?";
		String sqlPart = "DELETE FROM m_participant WHERE part_user = ?";
		String sqlUser = "DELETE FROM m_user WHERE user_id = ?";

		// データベースへの接続の取得、PreparedStatementの取得
		try (Connection con = ConnectionManager.getConnection()) {

			con.setAutoCommit(false);

			try (PreparedStatement pstmtLog = con.prepareStatement(sqlLog);
					PreparedStatement pstmtPart = con.prepareStatement(sqlPart);
					PreparedStatement pstmtUser = con.prepareStatement(sqlUser)) {

				// 訪問履歴削除
				pstmtLog.setString(1, userId);
				pstmtLog.executeUpdate();

				// 参加者履歴削除
				pstmtPart.setString(1, userId);
				pstmtPart.executeUpdate();

				// ユーザー削除
				pstmtUser.setString(1, userId);
				count = pstmtUser.executeUpdate();

				con.commit();

			} catch (Exception e) {
				con.rollback();
				throw e;
			}
		}

		return count;
	}

}
