package model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import model.entity.LogBean;

public class LogDAO {
	public List<LogBean> select(String userId, int restId) throws SQLException, ClassNotFoundException {
		List<LogBean> logList = new ArrayList<LogBean>();
		String sql = "SELECT * FROM t_log WHERE log_user = ? AND log_rest = ? ORDER BY log_time DESC;";

		// データベースへの接続の取得、Statementの取得、SQLステートメントの実行
		try (Connection con = ConnectionManager.getConnection();
				PreparedStatement pstmt = con.prepareStatement(sql)) {

			pstmt.setString(1, userId);
			pstmt.setInt(2, restId);

			ResultSet res = pstmt.executeQuery();

			// 結果の操作
			while (res.next()) {
				LogBean log = new LogBean();
				log.setLogUserId(res.getString("log_user"));
				log.setLogRestId(res.getInt("log_rest"));
				log.setLogTime(res.getString("log_time"));

				logList.add(log);
			}
		}
		return logList;
	}

	public int insert(String log_user, int log_rest) throws SQLException, ClassNotFoundException {
		int count = 0; //処理件数
		String sql = "INSERT INTO t_log(log_user, log_rest) VALUES(?, ?)";

		// データベースへの接続の取得、PreparedStatementの取得
		try (Connection con = ConnectionManager.getConnection();
				PreparedStatement pstmt = con.prepareStatement(sql)) {

			// プレースホルダへの値の設定
			pstmt.setString(1, log_user);
			pstmt.setInt(2, log_rest);

			// SQLステートメントの実行
			count = pstmt.executeUpdate();
		}

		return count;

	}

	public int delete(String logUser) throws SQLException, ClassNotFoundException {
		int count = 0; //処理件数
		String sql = "DELETE FROM t_log WHERE log_user = ?";

		// データベースへの接続の取得、PreparedStatementの取得
		try (Connection con = ConnectionManager.getConnection();
				PreparedStatement pstmt = con.prepareStatement(sql)) {

			// プレースホルダへの値の設定
			pstmt.setString(1, logUser);

			// SQLステートメントの実行
			count = pstmt.executeUpdate();
		}

		return count;

	}
}
