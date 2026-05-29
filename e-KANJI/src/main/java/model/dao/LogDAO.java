package model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class LogDAO {
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
}
