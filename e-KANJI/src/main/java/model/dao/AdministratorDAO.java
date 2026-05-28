package model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class AdministratorDAO {
	public boolean loginCheck(String admId, String admPass) throws ClassNotFoundException, SQLException {

		String sql = "SELECT * FROM m_administrator WHERE adm_id = ? AND adm_pass = ?";

		try (Connection con = ConnectionManager.getConnection();
				PreparedStatement pstmt = con.prepareStatement(sql)) {

			pstmt.setString(1, admId);
			pstmt.setString(2, admPass);

			ResultSet res = pstmt.executeQuery();

			if (res.next()) {
				return true;
			}
		}
		return false;
	}
}
