package model.dao;

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
				rest.setRestGenre(res.getString("genre_name"));
				rest.setRestCategory(res.getString("category_name"));
				rest.setRestOpen(res.getString("rest_open"));
				rest.setRestClose(res.getString("rest_close"));
				rest.setRestNextday(res.getInt("rest_nextday"));
				rest.setRestDistance(res.getInt("rest_distance"));
				rest.setRestBudget(res.getInt("rest_budget"));
				rest.setRestCapacity(res.getInt("rest_capacity"));
				rest.setRestTel(res.getString("rest_tel"));
				rest.setRestAddress(res.getString("rest_address"));
				rest.setRestUrl(res.getString("rest_url"));
				rest.setRestReview(res.getDouble("rest_review"));
				rest.setRestBeer(res.getString("beer_name"));
				rest.setRestSmoke(res.getInt("rest_smoke"));
				rest.setRestSmokeroom(res.getInt("rest_smokeroom"));

				list.add(rest);
			}
		}

		return list;

	}
	
	public RestBean select(int restID)
			throws SQLException, ClassNotFoundException {
		
		RestBean rest = new RestBean();


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
				+ "A.rest_beer = D.beer_id WHERE rest_id = ?";

		// データベースへの接続の取得、PreparedStatementの取得
		try (Connection con = ConnectionManager.getConnection();
				PreparedStatement pstmt = con.prepareStatement(sql)) {

			// プレースホルダへの値の設定
			pstmt.setInt(1, restID);

			// SQLステートメントの実行
			ResultSet res = pstmt.executeQuery();

			
			if (res.next()) {
				
				rest.setRestId(res.getInt("rest_id"));
				rest.setRestName(res.getString("rest_name"));
				rest.setRestGenre(res.getString("genre_name"));
				rest.setRestCategory(res.getString("category_name"));
				rest.setRestOpen(res.getString("rest_open"));
				rest.setRestClose(res.getString("rest_close"));
				rest.setRestNextday(res.getInt("rest_nextday"));
				rest.setRestDistance(res.getInt("rest_distance"));
				rest.setRestBudget(res.getInt("rest_budget"));
				rest.setRestCapacity(res.getInt("rest_capacity"));
				rest.setRestTel(res.getString("rest_tel"));
				rest.setRestAddress(res.getString("rest_address"));
				rest.setRestUrl(res.getString("rest_url"));
				rest.setRestReview(res.getDouble("rest_review"));
				rest.setRestBeer(res.getString("beer_name"));
				rest.setRestSmoke(res.getInt("rest_smoke"));
				rest.setRestSmokeroom(res.getInt("rest_smokeroom"));

			}
			return rest;
		}
	}

}