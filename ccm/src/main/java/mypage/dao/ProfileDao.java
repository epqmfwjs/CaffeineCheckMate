package mypage.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import jdbc.JdbcUtil;


public class ProfileDao {
	
	public int getWeight(int memberNo, Connection conn) throws SQLException {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int weight = 0;
		try  {
			pstmt = conn.prepareStatement(
					"select P_WEIGHT from PROFILE where M_NO=?");
			pstmt.setInt(1, memberNo);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				weight = rs.getInt(1);
			}
			return weight;
		} finally {
			JdbcUtil.close(pstmt);
			JdbcUtil.close(rs);
		}
	}
}
