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
	
	
	
//	public List<RestBean> selectAll(
//	        List<Integer> genreList,
//	        List<Integer> categoryList,
//	        Integer smoke,
//	        List<Integer> beerList)
//	        throws ClassNotFoundException, SQLException {
//
//	    List<RestBean> list = new ArrayList<>();
//
//	    StringBuilder sql = new StringBuilder();
//
//	    sql.append(
//	    	    "SELECT "
//	    	    + "A.rest_id, "
//	    	    + "A.rest_name, "
//	    	    + "B.genre_name, "
//	    	    + "C.category_name, "
//	    	    + "A.rest_open, "
//	    	    + "A.rest_close, "
//	    	    + "A.rest_nextday, "
//	    	    + "A.rest_distance, "
//	    	    + "A.rest_budget, "
//	    	    + "A.rest_capacity, "
//	    	    + "A.rest_tel, "
//	    	    + "A.rest_address, "
//	    	    + "A.rest_url, "
//	    	    + "A.rest_review, "
//	    	    + "D.beer_name, "
//	    	    + "A.rest_smoke, "
//	    	    + "A.rest_smokeroom "
//	    	    + "FROM m_restaurant A "
//	    	    + "LEFT JOIN m_genre B "
//	    	    + "ON A.rest_genre = B.genre_id "
//	    	    + "LEFT JOIN m_category C "
//	    	    + "ON A.rest_category = C.category_id "
//	    	    + "LEFT JOIN m_beer D "
//	    	    + "ON A.rest_beer = D.beer_id "
//	    	    + "WHERE 1=1 "
//	    	);
//
//	    // パラメータ保存用
//	    List<Object> params = new ArrayList<>();
//
//	    // ジャンル複数検索
//	    if (genreList != null && !genreList.isEmpty()) {
//
//	        sql.append(" AND A.rest_genre IN (");
//
//	        for (int i = 0; i < genreList.size(); i++) {
//
//	            sql.append("?");
//
//	            if (i < genreList.size() - 1) {
//	                sql.append(",");
//	            }
//
//	            params.add(genreList.get(i));
//	        }
//
//	        sql.append(")");
//	    }
//	    
//	    // カテゴリ複数検索
//	    if (categoryList != null && !categoryList.isEmpty()) {
//
//	        sql.append(" AND A.rest_category IN (");
//
//	        for (int i = 0; i < categoryList.size(); i++) {
//
//	            sql.append("?");
//
//	            if (i < categoryList.size() - 1) {
//	                sql.append(",");
//	            }
//
//	            params.add(categoryList.get(i));
//	        }
//
//	        sql.append(")");
//	    }
//
//	    // 喫煙
//	    if (smoke != null) {
//	        sql.append(" AND A.rest_smoke = ?");
//	        params.add(smoke);
//	    }
//
//	    // ビール複数検索
//	    if (beerList != null && !beerList.isEmpty()) {
//
//	        sql.append(" AND A.rest_beer IN (");
//
//	        for (int i = 0; i < beerList.size(); i++) {
//
//	            sql.append("?");
//
//	            if (i < beerList.size() - 1) {
//	                sql.append(",");
//	            }
//
//	            params.add(beerList.get(i));
//	        }
//
//	        sql.append(")");
//	    }
//
//	    try (Connection con = ConnectionManager.getConnection();
//	         PreparedStatement pstmt = con.prepareStatement(sql.toString())) {
//
//	        // ? に値セット
//	        for (int i = 0; i < params.size(); i++) {
//	            pstmt.setObject(i + 1, params.get(i));
//	        }
//
//	        ResultSet res = pstmt.executeQuery();
//
//	        while (res.next()) {
//
//	            RestBean rest = new RestBean();
//
//	            rest.setRestId(res.getInt("rest_id"));
//	            rest.setRestName(res.getString("rest_name"));
//	            rest.setRestGenre(res.getString("genre_name"));
//	            rest.setRestCategory(res.getString("category_name"));
//	            rest.setRestOpen(res.getString("rest_open"));
//	            rest.setRestClose(res.getString("rest_close"));
//	            rest.setRestNextday(res.getInt("rest_nextday"));
//	            rest.setRestDistance(res.getInt("rest_distance"));
//	            rest.setRestBudget(res.getInt("rest_budget"));
//	            rest.setRestCapacity(res.getInt("rest_capacity"));
//	            rest.setRestTel(res.getString("rest_tel"));
//	            rest.setRestAddress(res.getString("rest_address"));
//	            rest.setRestUrl(res.getString("rest_url"));
//	            rest.setRestReview(res.getDouble("rest_review"));
//	            rest.setRestBeer(res.getString("beer_name"));
//	            rest.setRestSmoke(res.getInt("rest_smoke"));
//	            rest.setRestSmokeroom(res.getInt("rest_smokeroom"));
//
//	            list.add(rest);
//	        }
//	    }
//
//	    return list;
//	}

}