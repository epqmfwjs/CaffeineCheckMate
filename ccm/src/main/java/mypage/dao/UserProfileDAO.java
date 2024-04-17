package mypage.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Map;

import mypage.dto.UserProfileDTO;
import jdbc.JdbcUtil;

public class UserProfileDAO {
	
	Map<String,UserProfileDTO> updtoMap = null;
	
	public Map<String,UserProfileDTO> ShowMyPF(String memberId, Connection conn) throws SQLException { 
		PreparedStatement pstmt =null;
		ResultSet rs = null;
		
		try {
			pstmt = conn.prepareStatement("select * from PROFILE where M_ID = ?");
			pstmt.setString(1, memberId);
			rs = pstmt.executeQuery();
			UserProfileDTO updto = null;
			if(rs.next()) {
				updto = new UserProfileDTO(
				    rs.getInt("P_NO"),
				    rs.getString("M_ID"),
				    rs.getInt("P_WEIGHT"),
				    rs.getString("P_IMG_COPY")
				);
				updtoMap.put(updto.getM_ID(), updto);
			}
			return updtoMap;
			
		}finally {
			JdbcUtil.close(rs);
			JdbcUtil.close(pstmt);
		}
	}
	
	}
