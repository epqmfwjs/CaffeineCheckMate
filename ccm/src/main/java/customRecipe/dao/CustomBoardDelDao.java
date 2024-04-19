package customRecipe.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import jdbc.JdbcUtil;

public class CustomBoardDelDao {

	public void deleteCus(String memberId, int cusNo, Connection conn) throws SQLException {
		PreparedStatement pstmt = null;
		String[] tables = {"CUSTOM_HASH","CUSTOM_IMG", "CUSTOM_REPLY"};
		String sql = "delete from ? where CUS_NO = ?;";
		try {
			// 기타 잡 커스텀레시피 관련 게시물에서 삭제
			for (int i=0; i<3; i++) {
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, tables[i]);
				pstmt.setInt(2, cusNo);
				pstmt.executeUpdate();
				pstmt = null;
			}
			
			// CUSTOM 테이블에서 레시피 삭제 - M_ID가 필요해서 따로 했음
			pstmt = conn.prepareStatement(
					"delete from CUSTOM where M_ID=? and CUS_NO=?';");
			pstmt.setString(1, memberId);
			pstmt.setInt(2, cusNo);
			pstmt.executeUpdate();
		}finally {
			JdbcUtil.close(pstmt);
		}
	}
}
