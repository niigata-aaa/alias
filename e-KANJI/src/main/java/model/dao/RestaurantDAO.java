package model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import model.entity.RestBean;

public class RestaurantDAO {
	// 管理者用全表示
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

	// ユーザー用全表示 訪問履歴表示対応
	public List<RestBean> selectAll(String userId) throws ClassNotFoundException, SQLException {
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
				+ "A.rest_smokeroom, "
				+ "COUNT(E.log_rest) AS visit_count "
				+ "FROM m_restaurant A "
				+ "LEFT JOIN m_genre B "
				+ "ON A.rest_genre = B.genre_id "
				+ "LEFT JOIN m_category C "
				+ "ON A.rest_category = C.category_id "
				+ "LEFT JOIN m_beer D "
				+ "ON A.rest_beer = D.beer_id "
				+ "LEFT JOIN t_log E "
				+ "ON A.rest_id = E.log_rest "
				+ "AND E.log_user = ? "
				+ "GROUP BY "
				+ "A.rest_id";

		// データベースへの接続の取得、Statementの取得、SQLステートメントの実行
		try (Connection con = ConnectionManager.getConnection();
				PreparedStatement pstmt = con.prepareStatement(sql)) {

			pstmt.setString(1, userId);

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
				rest.setVisitCount(res.getInt("visit_count"));

				list.add(rest);
			}
		}

		return list;

	}

	// 管理者用詳細画面
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
				+ "A.rest_beer = D.beer_id "
				+ "WHERE "
				+ "A.rest_id = ?";

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

	// ユーザー用詳細画面 訪問履歴表示対応
	public RestBean select(String userId, int restId)
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
				+ "A.rest_smokeroom, "
				+ "COUNT(E.log_rest) AS visit_count "
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
				+ "A.rest_beer = D.beer_id "
				+ "LEFT JOIN t_log E "
				+ "ON A.rest_id = E.log_rest "
				+ "AND E.log_user = ? "
				+ "WHERE "
				+ "A.rest_id = ? "
				+ "GROUP BY "
				+ "A.rest_id";

		// データベースへの接続の取得、PreparedStatementの取得
		try (Connection con = ConnectionManager.getConnection();
				PreparedStatement pstmt = con.prepareStatement(sql)) {

			// プレースホルダへの値の設定
			pstmt.setString(1, userId);
			pstmt.setInt(2, restId);

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
				rest.setVisitCount(res.getInt("visit_count"));

			}
			return rest;
		}
	}

	// 管理者用絞り込み検索
	public List<RestBean> narrowselect(
			String keyword, int genre, int category, int beer,
			double review, int capacity, int distance, int budget, int smoke)
			throws ClassNotFoundException, SQLException {

		List<RestBean> narrowList = new ArrayList<>();

		StringBuilder sql = new StringBuilder();
		sql.append("SELECT ");
		sql.append("A.rest_id, A.rest_name, B.genre_name, C.category_name, ");
		sql.append("A.rest_open, A.rest_close, A.rest_nextday, ");
		sql.append("A.rest_distance, A.rest_budget, A.rest_capacity, ");
		sql.append("A.rest_tel, A.rest_address, A.rest_url, A.rest_review, ");
		sql.append("D.beer_name, A.rest_smoke, A.rest_smokeroom ");
		sql.append("FROM m_restaurant A ");
		sql.append("LEFT JOIN m_genre B ON A.rest_genre = B.genre_id ");
		sql.append("LEFT JOIN m_category C ON A.rest_category = C.category_id ");
		sql.append("LEFT JOIN m_beer D ON A.rest_beer = D.beer_id ");
		sql.append("WHERE 1=1 ");
		List<Object> params = new ArrayList<>();

		// ⭐ 条件はすべて AND で追加する（ここが重要）

		if (keyword != null && !keyword.trim().isEmpty()) {
			sql.append(" AND A.rest_name LIKE ? ");
			params.add("%" + keyword.trim() + "%");
		}

		if (genre > 0) {
			sql.append(" AND A.rest_genre = ? ");
			params.add(genre);
		}

		if (category > 0) {
			sql.append(" AND A.rest_category = ? ");
			params.add(category);
		}

		if (beer > 0) {
			sql.append(" AND A.rest_beer = ? ");
			params.add(beer);
		}

		if (review > 0) {
			sql.append(" AND A.rest_review <= ? ");
			params.add(review);
		}

		if (capacity > 0) {
			sql.append(" AND A.rest_capacity <= ? ");
			params.add(capacity);
		}

		/*if (log > 0) {
			sql.append(" AND A.rest_log = ? ");
			params.add(log);
		}*/

		if (distance > 0) {
			sql.append(" AND A.rest_distance <= ? ");
			params.add(distance);
		}

		if (budget > 0) {
			sql.append(" AND A.rest_budget <= ? ");
			params.add(budget);
		}

		if (smoke > 0) {
			sql.append(" AND A.rest_smoke = ? ");
			params.add(smoke);
		}

		try (Connection con = ConnectionManager.getConnection();
				PreparedStatement pstmt = con.prepareStatement(sql.toString())) {

			for (int i = 0; i < params.size(); i++) {
				pstmt.setObject(i + 1, params.get(i));
			}

			ResultSet res = pstmt.executeQuery();

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
				/*
								System.out.println("SQL=");
								System.out.println(sql.toString());
				
								System.out.println("PARAMS=");
								System.out.println(params);
				*/
				System.out.println(sql.toString());
				System.out.println(params);

				narrowList.add(rest);
			}

			return narrowList;
		}

	}

	// ユーザー用絞り込み検索 訪問履歴表示対応
	public List<RestBean> narrowselect(
			String userId, String keyword, int genre, int category, int beer,
			double review, int capacity,int log,
			int distance, int budget, int smoke)
			throws ClassNotFoundException, SQLException {

		List<RestBean> narrowList = new ArrayList<>();

		StringBuilder sql = new StringBuilder();
		sql.append("SELECT ");
		sql.append("A.rest_id, A.rest_name, B.genre_name, C.category_name, ");
		sql.append("A.rest_open, A.rest_close, A.rest_nextday, ");
		sql.append("A.rest_distance, A.rest_budget, A.rest_capacity, ");
		sql.append("A.rest_tel, A.rest_address, A.rest_url, A.rest_review, ");
		sql.append("D.beer_name, A.rest_smoke, A.rest_smokeroom, ");
		sql.append("COUNT(E.log_rest) AS visit_count ");
		sql.append("FROM m_restaurant A ");
		sql.append("LEFT JOIN t_log E ");
		sql.append("ON A.rest_id = E.log_rest ");
		sql.append("AND E.log_user = ? ");
		sql.append("LEFT JOIN m_genre B ON A.rest_genre = B.genre_id ");
		sql.append("LEFT JOIN m_category C ON A.rest_category = C.category_id ");
		sql.append("LEFT JOIN m_beer D ON A.rest_beer = D.beer_id ");
		sql.append("WHERE 1=1 ");

		List<Object> params = new ArrayList<>();
		params.add(userId);

		// ⭐ 条件はすべて AND で追加する（ここが重要）

		if (keyword != null && !keyword.trim().isEmpty()) {
			sql.append(" AND A.rest_name LIKE ? ");
			params.add("%" + keyword.trim() + "%");
		}

		if (genre > 0) {
			sql.append(" AND A.rest_genre = ? ");
			params.add(genre);
		}

		if (category > 0) {
			sql.append(" AND A.rest_category = ? ");
			params.add(category);
		}

		if (beer > 0) {
			sql.append(" AND A.rest_beer = ? ");
			params.add(beer);
		}

		if (review > 0) {
			sql.append(" AND A.rest_review <= ? ");
			params.add(review);
		}

		if (capacity > 0) {
			sql.append(" AND A.rest_capacity <= ? ");
			params.add(capacity);
		}

		//		if (log > 0) {
		//			sql.append(" AND A.rest_log = ? ");
		//			params.add(log);
		//		}

		if (distance > 0) {
			sql.append(" AND A.rest_distance <= ? ");
			params.add(distance);
		}

		if (budget > 0) {
			sql.append(" AND A.rest_budget <= ? ");
			params.add(budget);
		}

		if (smoke > 0) {
			sql.append(" AND A.rest_smoke = ? ");
			params.add(smoke);
		}

		if (log == 1) {
			sql.append(" AND E.log_rest IS NOT NULL ");
		}

		if (log == 2) {
			sql.append(" AND E.log_rest IS NULL ");
		}
		

		sql.append(" GROUP BY A.rest_id ");

		try (Connection con = ConnectionManager.getConnection();
				PreparedStatement pstmt = con.prepareStatement(sql.toString())) {

			for (int i = 0; i < params.size(); i++) {
				pstmt.setObject(i + 1, params.get(i));
			}

			ResultSet res = pstmt.executeQuery();

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
				rest.setVisitCount(res.getInt("visit_count"));
				/*
								System.out.println("SQL=");
								System.out.println(sql.toString());
				
								System.out.println("PARAMS=");
								System.out.println(params);
				*/
				System.out.println(sql.toString());
				System.out.println(params);

				narrowList.add(rest);
			}

			return narrowList;
		}

	}

	//登録

	public int insert(RestBean rest) throws ClassNotFoundException, SQLException {

		int count = 0; // 処理件数
		String sql = "INSERT INTO "
				+ "m_restaurant("
				+ "rest_name,"
				+ "rest_genre, "
				+ "rest_category,"
				+ "rest_open,"
				+ "rest_close,"
				+ "rest_nextday,"
				+ "rest_distance,"
				+ "rest_budget,"
				+ "rest_capacity,"
				+ "rest_tel,"
				+ "rest_address,"
				+ "rest_url,"
				+ "rest_review,"
				+ "rest_beer,"
				+ "rest_smoke, "
				+ "rest_smokeroom"
				+ ") "
				+ "VALUES"
				+ "(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";

		//DB接続の取得、
		try (Connection con = ConnectionManager.getConnection();
				PreparedStatement pstmt = con.prepareStatement(sql)) {
			/*
					pstmt.setString(1, );
					pstmt.setString(2, rest.getRestName());
					pstmt.setString(3, part.getPartRuby());
					pstmt.setString(4, part.getPartGender());
					pstmt.setInt(5, part.getPartAge());
					pstmt.setInt(6, part.getPartEmpyear());
					pstmt.setInt(7, part.getPartPostId());
					pstmt.setInt(8, part.getPartBudget());
					pstmt.setString(9, part.getPartAllergy());
					pstmt.setInt(10, part.getPartGenreId());
					pstmt.setInt(11, part.getPartCategoryId());
					pstmt.setInt(12, part.getPartBeerId());
					pstmt.setInt(13, part.getPartSmoke());
			*/
			pstmt.setString(1, rest.getRestName());
			pstmt.setString(2, rest.getRestGenre());
			pstmt.setString(3, rest.getRestCategory());
			pstmt.setString(4, rest.getRestOpen());
			pstmt.setString(5, rest.getRestClose());
			pstmt.setInt(6, rest.getRestNextday());
			pstmt.setInt(7, rest.getRestDistance());
			pstmt.setInt(8, rest.getRestBudget());
			pstmt.setInt(9, rest.getRestCapacity());
			pstmt.setString(10, rest.getRestTel());
			pstmt.setString(11, rest.getRestAddress());
			pstmt.setString(12, rest.getRestUrl());
			pstmt.setDouble(13, rest.getRestReview());
			pstmt.setString(14, rest.getRestBeer());
			pstmt.setInt(15, rest.getRestSmoke());
			pstmt.setInt(16, rest.getRestSmokeroom());

			count = pstmt.executeUpdate();

		}

		return count;
	}

	//更新
	public int update(RestBean bean) throws SQLException, ClassNotFoundException {
		int processingNumber = 0;

		String sql = "UPDATE m_restaurant SET rest_name = ?, rest_genre = ?, rest_category = ?, rest_open = ?,"
				+ "rest_close = ?, rest_nextday = ?, rest_distance = ?, rest_budget = ?, rest_capacity = ?,"
				+ "rest_tel = ?, rest_address = ?, rest_url = ?, rest_review=?,"
				+ "rest_beer=?, rest_smoke=?, rest_smokeroom=? WHERE  rest_id = ? ";

		// データベースへの接続の取得、PreparedStatementの取得
		try (Connection con = ConnectionManager.getConnection();
				PreparedStatement pstmt = con.prepareStatement(sql)) {

			// DTOからのデータの取り出し
			String restName = bean.getRestName();
			String restGenre = bean.getRestGenre();
			String restCategory = bean.getRestCategory();
			String restOpen = bean.getRestOpen();
			String restClose = bean.getRestClose();
			int restNextday = bean.getRestNextday();
			int restDistance = bean.getRestDistance();
			int restBudget = bean.getRestBudget();
			int restCapacity = bean.getRestCapacity();
			String restTel = bean.getRestTel();
			String restAddress = bean.getRestAddress();
			String restUrl = bean.getRestUrl();
			double restReview = bean.getRestReview();
			String restBeer = bean.getRestBeer();
			int restSmoke = bean.getRestSmoke();
			int restSmokeroom = bean.getRestSmokeroom();

			// プレースホルダへの値の設定
			pstmt.setString(1, restName);
			pstmt.setString(2, restGenre);
			pstmt.setString(3, restCategory);
			pstmt.setString(4, restOpen);
			pstmt.setString(5, restClose);
			pstmt.setInt(6, restNextday);
			pstmt.setInt(7, restDistance);
			pstmt.setInt(8, restBudget);
			pstmt.setInt(9, restCapacity);
			pstmt.setString(10, restTel);
			pstmt.setString(11, restAddress);
			pstmt.setString(12, restUrl);
			pstmt.setDouble(13, restReview);
			pstmt.setString(14, restBeer);
			pstmt.setInt(15, restSmoke);
			pstmt.setInt(16, restSmokeroom);
			pstmt.setInt(17, bean.getRestId());
			// SQLステートメントの実行
			processingNumber = pstmt.executeUpdate();
		}
		return processingNumber;

	}

	//削除
	public int delete(int restId) throws SQLException, ClassNotFoundException {

		int processingNumber = 0;

		String sqlLog = "DELETE FROM t_log WHERE log_rest = ?";

		String sqlRest = "DELETE FROM m_restaurant WHERE rest_id = ?";

		try (Connection con = ConnectionManager.getConnection()) {

			con.setAutoCommit(false);

			try (PreparedStatement pstmtLog = con.prepareStatement(sqlLog);
					PreparedStatement pstmtRest = con.prepareStatement(sqlRest)) {

				// 訪問履歴削除
				pstmtLog.setInt(1, restId);
				pstmtLog.executeUpdate();

				// 店舗削除
				pstmtRest.setInt(1, restId);
				processingNumber = pstmtRest.executeUpdate();

				con.commit();

			} catch (Exception e) {
				con.rollback();
				throw e;
			}
		}

		return processingNumber;
	}

}