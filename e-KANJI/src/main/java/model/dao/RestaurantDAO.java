import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import model.entity.RestBean;

public List<RestBean> selectAll() throws ClassNotFoundException, SQLException {
		List<RestBean> list = new ArrayList<RestBean>();

		String sql = "SELECT * FROM m_restaurant";

		// データベースへの接続の取得、Statementの取得、SQLステートメントの実行
		try(Connection con = ConnectionManager.getConnection();
				PreparedStatement pstmt = con.prepareStatement(sql)){
			
			
			ResultSet res = pstmt.executeQuery();

			// 結果の操作
			while(res.next()) {
				RestBean rest = new RestBean();
				rest.setUserId(res.getString("user_id"));
				rest.setName(res.getString("name"));
				rest.setAge(res.getInt("age"));
				list.add(rest);
			}
		}

		return list;
	}