import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import model.entity.RestBean;

public class RestaurantDAO {
	public List<RestBean> selectAll() throws ClassNotFoundException, SQLException {
		List<RestBean> list = new ArrayList<RestBean>();

		String sql = "SELECT "
				+ "A.rest_id, "
				+ "A.rest_name, "
				+ "B.genre_name, "
				+ "C.category_name, "
				+ "A.rest_open, "
				+ "A.rest_close, "
				+ "A.rest_nextday, "
				+ "A.rest_distance, "
				+ "A.rest_budget, "
				+ "A.rest_capacity, "
				+ "A.rest_tel, "
				+ "A.rest_address, "
				+ "A.rest_url, "
				+ "A.rest_review, "
				+ "D.beer_name, "
				+ "A.rest_smoke, "
				+ "A.rest_smokeroom "
				+ "FROM "
				+ "m_restaurant A "
				+ "LEFT JOIN "
				+ "m_genre B "
				+ "ON "
				+ "A.rest_genre = B.genre_id "
				+ "LEFT JOIN "
				+ "m_category C "
				+ "ON "
				+ "A.rest_category = C.category_id "
				+ "LEFT JOIN "
				+ "m_beer D "
				+ "ON "
				+ "A.rest_beer = D.beer_id;";

		// データベースへの接続の取得、Statementの取得、SQLステートメントの実行
		try (Connection con = ConnectionManager.getConnection();
				PreparedStatement pstmt = con.prepareStatement(sql)) {

			ResultSet res = pstmt.executeQuery();

			// 結果の操作
			while (res.next()) {
				RestBean rest = new RestBean();
				rest.setRestId(res.getInt("rest_id"));
				rest.setRestName(res.getString("rest_name"));
				rest.setGenre

				list.add(rest);
			}
		}

		return list;

	}

}