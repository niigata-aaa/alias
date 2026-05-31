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
	public List<PartBean> selectAll(String partUserID) throws SQLException, ClassNotFoundException{

		List<PartBean> partList=new ArrayList<PartBean>();
		String url="SELECT * FROM m_participant WHERE part_user=?";
		//DB接続の取得、
		try(Connection con =ConnectionManager.getConnection();

				//PreparedStatement pstmt=con.prerareStatement("SELECT * FROM m_participant WHERE user_id=?")
				PreparedStatement pstmt=con.prepareStatement(url)){
<<<<<<< HEAD
				
				//String userID=pstmt.getParameter();
				pstmt.setString(1, partUserID);
				
			
=======
>>>>>>> branch 'master' of https://github.com/niigata-aaa/alias.git

			//String userID=pstmt.getParameter();
			pstmt.setString(1, partUserID);

			//Statement stmt=con.createStatement();
			//ResultSet res=stmt.executeQuery("SELECT * FROM m_participant")){
			ResultSet res=pstmt.executeQuery();

			//結果の操作
			while(res.next()) {
				//会員ID
				String userID=res.getString("part_user");

				//参加者ID
				String partID=res.getString("part_id");

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

<<<<<<< HEAD
					partList.add(part);
				}
	}return partList;
	}
	


public List<PartBean> select(String partPartName) throws SQLException, ClassNotFoundException{

	ArrayList<PartBean> narrowList=new ArrayList<PartBean>();
	String sql="SELECT * FROM m_participant WHERE part_name LIKE ?";
	//DB接続の取得、
	try(Connection con =ConnectionManager.getConnection();

			//PreparedStatement pstmt=con.prerareStatement("SELECT * FROM m_participant WHERE user_id=?")
			PreparedStatement pstmt=con.prepareStatement(sql)){
			
			//String userID=pstmt.getParameter();
		pstmt.setString(1, "%" + partPartName + "%");
			
		

			//Statement stmt=con.createStatement();
			//ResultSet res=stmt.executeQuery("SELECT * FROM m_participant")){
			ResultSet res=pstmt.executeQuery();

			//結果の操作
			while(res.next()) {

				//会員ID
				String userID=res.getString("part_user");

				//参加者ID
				String partID=res.getString("part_id");

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

				PartBean part=new PartBean();
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
}return narrowList;

}
}
=======
				PartBean part=new PartBean();
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
		}return partList;
	}
>>>>>>> branch 'master' of https://github.com/niigata-aaa/alias.git



