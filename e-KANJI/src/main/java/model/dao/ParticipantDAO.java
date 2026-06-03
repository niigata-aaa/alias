/*package model.dao;

public class ParticipantDAO {

}*/
package model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import model.entity.PartBean;
//import model.entity.PartBean;

public class ParticipantDAO {
	/**
	 * 参加者全表示
	 * @return
	 * @throws SQLException
	 * @throws ClassNotFoundException
	 */
	public List<PartBean> selectAll(String partUserID) throws SQLException, ClassNotFoundException {

		List<PartBean> partList = new ArrayList<PartBean>();

		String url = "SELECT "
				+ "B.user_id, "
				+ "A.part_id, "
				+ "A.part_name, "
				+ "A.part_ruby, "
				+ "A.part_gender, "
				+ "A.part_age, "
				+ "A.part_empyear, "
				+ "C.post_name, "
				+ "A.part_budget,"
				+ "A.part_allergy, "
				+ "D.genre_name, "
				+ "E.category_name, "
				+ "F.beer_name, "
				+ "A.part_smoke "
				+ "FROM "
				+ "m_participant A "
				+ "LEFT JOIN "
				+ "m_user B "
				+ "ON "
				+ "A.part_user = B.user_id "
				+ "LEFT JOIN "
				+ "m_post C "
				+ "ON "
				+ "A.part_post = C.post_id "
				+ "LEFT JOIN "
				+ "m_genre D "
				+ "ON "
				+ "A.part_genre = D.genre_id "
				+ "LEFT JOIN "
				+ "m_category E "
				+ "ON "
				+ "A.part_category = E.category_id "
				+ "LEFT JOIN "
				+ "m_beer F "
				+ "ON "
				+ "A.part_beer = F.beer_id "
				+ "WHERE part_user = ?";
		
		//DB接続の取得、
		try (Connection con = ConnectionManager.getConnection();

				//PreparedStatement pstmt=con.prerareStatement("SELECT * FROM m_participant WHERE user_id=?")
				PreparedStatement pstmt = con.prepareStatement(url)) {

			//String userID=pstmt.getParameter();
			pstmt.setString(1, partUserID);

			//Statement stmt=con.createStatement();
			//ResultSet res=stmt.executeQuery("SELECT * FROM m_participant")){
			ResultSet res = pstmt.executeQuery();

			//結果の操作
			while (res.next()) {
				//会員ID
				String userID = res.getString("user_id");

				//参加者ID
				int partID = res.getInt("part_id");

				//参加者名（漢字）
				String partName = res.getString("part_name");

				//参加者名（かな）
				String partRuby = res.getString("part_ruby");

				//性別
				String gender = res.getString("part_gender");

				//年齢
				int age = res.getInt("part_age");

				//入社年度
				int empyear = res.getInt("part_empyear");

				//役職
				String post = res.getString("post_name");

				//予算
				int partBudget = res.getInt("part_budget");

				//アレルギー
				String allergy = res.getString("part_allergy");

				//食べ物の好み
				String genre = res.getString("genre_name");

				//好きな料理カテゴリ
				String category = res.getString("category_name");

				//ビールの好み
				String beer = res.getString("beer_name");

				//喫煙するか
				int smoke = res.getInt("part_smoke");

				PartBean part = new PartBean();
				part.setUserID(userID);
				part.setPartID(partID);
				part.setPartName(partName);
				part.setPartRuby(partRuby);
				part.setPartGender(gender);
				part.setPartAge(age);
				part.setPartEmpyear(empyear);
				part.setPartPost(post);
				part.setPartBudget(partBudget);
				part.setPartAllergy(allergy);
				part.setPartGenre(genre);
				part.setPartCategory(category);
				part.setPartBeer(beer);
				part.setPartSmoke(smoke);

				partList.add(part);

			}
		}
		return partList;
	}

	public List<PartBean> select(String partPartName, String userId) throws SQLException, ClassNotFoundException {

		ArrayList<PartBean> narrowList = new ArrayList<PartBean>();
		String sql = "SELECT * FROM m_participant WHERE part_name LIKE ? AND part_user = ?";
		//DB接続の取得、
		try (Connection con = ConnectionManager.getConnection();

				//PreparedStatement pstmt=con.prerareStatement("SELECT * FROM m_participant WHERE user_id=?")
				PreparedStatement pstmt = con.prepareStatement(sql)) {

			//String userID=pstmt.getParameter();
			pstmt.setString(1, "%" + partPartName + "%");
			pstmt.setString(2, userId);

			//Statement stmt=con.createStatement();
			//ResultSet res=stmt.executeQuery("SELECT * FROM m_participant")){
			ResultSet res = pstmt.executeQuery();

			//結果の操作
			while (res.next()) {

				//会員ID
				String userID = res.getString("part_user");

				//参加者ID
				int partID = res.getInt("part_id");

				//参加者名（漢字）
				String partName = res.getString("part_name");

				//参加者名（かな）
				String partRuby = res.getString("part_ruby");

				//性別
				String gender = res.getString("part_gender");

				//年齢
				int age = res.getInt("part_age");

				//入社年度
				int empyear = res.getInt("part_empyear");

				//役職
				String post = res.getString("part_post");

				//予算
				int partBudget = res.getInt("part_budget");

				//アレルギー
				String allergy = res.getString("part_allergy");

				//食べ物の好み
				String genre = res.getString("part_genre");

				//好きな料理カテゴリ
				String category = res.getString("part_category");

				//ビールの好み
				String beer = res.getString("part_beer");

				//喫煙するか
				int smoke = res.getInt("part_smoke");

				PartBean part = new PartBean();
				part.setUserID(userID);
				part.setPartID(partID);
				part.setPartName(partName);
				part.setPartRuby(partRuby);
				part.setPartGender(gender);
				part.setPartAge(age);
				part.setPartEmpyear(empyear);
				part.setPartPost(post);
				part.setPartBudget(partBudget);
				part.setPartAllergy(allergy);
				part.setPartGenre(genre);
				part.setPartCategory(category);
				part.setPartBeer(beer);
				part.setPartSmoke(smoke);

				narrowList.add(part);

			}
		}

		return narrowList;

	}

	public PartBean select(int part_ID) throws SQLException, ClassNotFoundException {

		PartBean bean = new PartBean();

		try (Connection con = ConnectionManager.getConnection();
				PreparedStatement pstmt = con.prepareStatement("SELECT * FROM m_participant WHERE part_id = ?")) {

			pstmt.setInt(1, part_ID);

			ResultSet res = pstmt.executeQuery();

			//結果の操作
			while (res.next()) {
				//参加者ID
				int partID = res.getInt("part_id");

				//会員ID
				String userID = res.getString("part_user");

				//参加者名（漢字）
				String partName = res.getString("part_name");

				//参加者名（かな）
				String partRuby = res.getString("part_ruby");

				//性別
				String gender = res.getString("part_gender");

				//年齢
				int age = res.getInt("part_age");

				//入社年度
				int empyear = res.getInt("part_empyear");

				//役職
				String post = res.getString("part_post");

				//予算
				int partBudget = res.getInt("part_budget");

				//アレルギー
				String allergy = res.getString("part_allergy");

				//食べ物の好み
				String genre = res.getString("part_genre");

				//好きな料理カテゴリ
				String category = res.getString("part_category");

				//ビールの好み
				String beer = res.getString("part_beer");

				//喫煙するか
				int smoke = res.getInt("part_smoke");

				bean.setUserID(userID);
				bean.setPartID(partID);
				bean.setPartName(partName);
				bean.setPartRuby(partRuby);
				bean.setPartGender(gender);
				bean.setPartAge(age);
				bean.setPartEmpyear(empyear);
				bean.setPartPost(post);
				bean.setPartBudget(partBudget);
				bean.setPartAllergy(allergy);
				bean.setPartGenre(genre);
				bean.setPartCategory(category);
				bean.setPartBeer(beer);
				bean.setPartSmoke(smoke);
			}
		}
		return bean;
	}

	public List<PartBean> selectForSC(String partUserID) throws SQLException, ClassNotFoundException {

		List<PartBean> partList = new ArrayList<PartBean>();
		String sql = "SELECT "
				+ "A.part_name, "
				+ "A.part_ruby, "
				+ "A.part_gender, "
				+ "A.part_age, "
				+ "A.part_empyear, "
				+ "B.post_id, "
				+ "B.post_name, "
				+ "A.part_smoke "
				+ "FROM "
				+ "m_participant A "
				+ "LEFT JOIN "
				+ "m_post B "
				+ "ON "
				+ "A.part_post = B.post_id "
				+ "WHERE "
				+ "A.part_user = ?";

		//DB接続の取得、
		try (Connection con = ConnectionManager.getConnection();
				PreparedStatement pstmt = con.prepareStatement(sql)) {

			pstmt.setString(1, partUserID);

			ResultSet res = pstmt.executeQuery();

			//結果の操作
			while (res.next()) {
				PartBean part = new PartBean();
				part.setPartName(res.getString("part_name"));
				part.setPartRuby(res.getString("part_ruby"));
				part.setPartGender(res.getString("part_gender"));
				part.setPartAge(res.getInt("part_age"));
				part.setPartEmpyear(res.getInt("part_empyear"));
				part.setPartPostId(res.getInt("post_id"));
				part.setPartPost(res.getString("post_name"));
				part.setPartSmoke(res.getInt("part_smoke"));

				partList.add(part);
			}
		}

		return partList;
	}

	//削除
	public int delete(PartBean bean) throws SQLException, ClassNotFoundException {
		int processingNumber = 0;

		String sql = "DELETE FROM m_participant WHERE part_id = ? and part_user = ?";

		try (Connection con = ConnectionManager.getConnection();
				PreparedStatement pstmt = con.prepareStatement(sql)) {

			pstmt.setInt(1, bean.getPartID());
			pstmt.setString(2, bean.getUserID());

			processingNumber = pstmt.executeUpdate();
		}
		return processingNumber;
	}

	public int insert(PartBean bean) throws ClassNotFoundException, SQLException {
		int count = 0; // 処理件数
		String sql = "INSERT INTO m_participant(" + "part_user," +
				"part_name," + "part_ruby," + "part_gender," + "part_age," + "part_empyear," +
				"part_post," + "part_budget," + "part_allergy," + "part_genre," + "part_category," +
				"part_beer," + "part_smoke" + ") VALUES(?,?,?,?,?,?,?,?,?,?,?,?,?)";

		try (Connection con = ConnectionManager.getConnection();
				PreparedStatement pstmt = con.prepareStatement(sql)) {
			pstmt.setString(1, bean.getUserID());
			pstmt.setString(2, bean.getPartName());
			pstmt.setString(3, bean.getPartRuby());
			pstmt.setString(4, bean.getPartGender());
			pstmt.setInt(5, bean.getPartAge());
			pstmt.setInt(6, bean.getPartEmpyear());
			pstmt.setString(7, bean.getPartPost());
			pstmt.setInt(8, bean.getPartBudget());
			pstmt.setString(9, bean.getPartAllergy());
			pstmt.setString(10, bean.getPartGenre());
			pstmt.setString(11, bean.getPartCategory());
			pstmt.setString(12, bean.getPartBeer());
			pstmt.setInt(13, bean.getPartSmoke());

			count = pstmt.executeUpdate();

		}

		return count; // part_id

	}

	public int insert(String userId, PartBean part) throws ClassNotFoundException, SQLException {

		int count = 0; // 処理件数
		String sql = "INSERT INTO "
				+ "m_participant("
				+ "part_user,"
				+ "part_name, "
				+ "part_ruby,"
				+ "part_gender,"
				+ "part_age,"
				+ "part_empyear,"
				+ "part_post,"
				+ "part_budget,"
				+ "part_allergy,"
				+ "part_genre,"
				+ "part_category,"
				+ "part_beer,"
				+ "part_smoke"
				+ ") "
				+ "VALUES"
				+ "(?,?,?,?,?,?,?,?,?,?,?,?,?)";

		//DB接続の取得、
		try (Connection con = ConnectionManager.getConnection();
				PreparedStatement pstmt = con.prepareStatement(sql)) {

			pstmt.setString(1, userId);
			pstmt.setString(2, part.getPartName());
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

			count = pstmt.executeUpdate();

		}

		return count;
	}

	//一括削除
	public int deleteALL(String userID) throws SQLException, ClassNotFoundException {
		int processingNumber = 0;

		String sql = "DELETE FROM m_participant WHERE part_user = ?";

		try (Connection con = ConnectionManager.getConnection();
				PreparedStatement pstmt = con.prepareStatement(sql)) {

			pstmt.setString(1, userID);

			processingNumber = pstmt.executeUpdate();
		}
		return processingNumber;
	}

	//更新
	public int update(PartBean bean) throws SQLException, ClassNotFoundException {
		int processingNumber = 0;

		String sql = "UPDATE m_participant SET part_name = ?, part_ruby = ?, part_gender = ?, part_age = ?,"
				+ "part_empyear = ?, part_post = ?, part_budget = ?, part_allergy = ?, part_genre = ?,"
				+ "part_category = ?, part_beer = ?, part_smoke = ? WHERE  = part_id = ? and part_user = ?";

		// データベースへの接続の取得、PreparedStatementの取得
		try (Connection con = ConnectionManager.getConnection();
				PreparedStatement pstmt = con.prepareStatement(sql)) {

			// DTOからのデータの取り出し
			String partName = bean.getPartName();
			String partRuby = bean.getPartRuby();
			String partGender = bean.getPartGender();
			int partAge = bean.getPartAge();
			int partEmpyear = bean.getPartEmpyear();
			String partPost = bean.getPartPost();
			int partBudget = bean.getPartBudget();
			String partAllergy = bean.getPartAllergy();
			String partGenre = bean.getPartGenre();
			String partCategory = bean.getPartCategory();
			String partBeer = bean.getPartBeer();
			int partSmoke = bean.getPartSmoke();
			int partID = bean.getPartID();
			String userID = bean.getUserID();

			// プレースホルダへの値の設定
			pstmt.setString(1, partName);
			pstmt.setString(2, partRuby);
			pstmt.setString(3, partGender);
			pstmt.setInt(4, partAge);
			pstmt.setInt(5, partEmpyear);
			pstmt.setString(6, partPost);
			pstmt.setInt(7, partBudget);
			pstmt.setString(8, partAllergy);
			pstmt.setString(9, partGenre);
			pstmt.setString(10, partCategory);
			pstmt.setString(11, partBeer);
			pstmt.setInt(12, partSmoke);
			pstmt.setInt(13, partID);
			pstmt.setString(14, userID);

			// SQLステートメントの実行
			processingNumber = pstmt.executeUpdate();
		}
		return processingNumber;

	}

}
