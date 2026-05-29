package model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import model.entity.PartBean;

public class ParticipantDAOd {
	public PartBean select(int part_ID) throws SQLException, ClassNotFoundException {

		PartBean bean = new PartBean();

		try (Connection con = ConnectionManager.getConnection();
				PreparedStatement pstmt = con.prepareStatement("SELECT * FROM m_participant WHERE part_id = ?")) {

			pstmt.setInt(1, part_ID);

			ResultSet res = pstmt.executeQuery();

			//結果の操作

			//会員ID
			int partID=res.getInt("part_id");
			
			//参加者ID
			String userID=res.getString("part_user");
			
			//参加者名（漢字）
			String partName=res.getString("part_name");
			
			//参加者名（かな）
			String partRuby=res.getString("part_ruby");
			
			//性別
			String gender=res.getString("part_gender");
			
			//年齢
			int age=res.getInt("part_age");
			
			//入社年度
			int empyear=res.getInt("part_empyear");
			
			//役職
			String post=res.getString("part_post");
			
			//予算
			int partBudget=res.getInt("part_budget");
			
			//アレルギー
			String allergy=res.getString("part_allergy");
			
			//食べ物の好み
			String genre=res.getString("part_genre");
			
			//好きな料理カテゴリ
			String category=res.getString("part_category");
			
			//ビールの好み
			String beer=res.getString("part_beer");
			
			//喫煙するか
			int smoke=res.getInt("part_smoke");

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
		return bean;
	}

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

}
