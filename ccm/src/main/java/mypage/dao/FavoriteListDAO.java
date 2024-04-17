package mypage.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Map;

import jdbc.JdbcUtil;
import mypage.dto.FavoriteListDTO;


public class FavoriteListDAO {
	
	Map<String,FavoriteListDTO> favlistMap = null;

	public Map<String,FavoriteListDTO> getFavList(String memberId, Connection conn) throws SQLException { 
		PreparedStatement pstmt =null;
		ResultSet rs = null;
		// COFFEE_FAVORITE+COFFEELIST 조인해서 검색하기 
		// COFFEE_FAVORITE.C_NO UQ 오류
		try {
			pstmt = conn.prepareStatement("select * from COFFEE_FAVORITE where M_NO = ?");
			pstmt.setString(1, memberId);
			rs = pstmt.executeQuery();
			FavoriteListDTO favlist = null;
			while(rs.next()) {
				favlist = new FavoriteListDTO(
						rs.getString("M_ID"),
						rs.getInt("C_NO"),
						rs.getString("C_NAME"),
						rs.getInt("C_CAFFAINE"),
						rs.getString("C_IMG_COPY")
						);
				favlistMap.put(favlist.getM_ID(), favlist);
			}
			return favlistMap;
		} finally {
			JdbcUtil.close(rs);
			JdbcUtil.close(pstmt);
		}
	}
	
}
