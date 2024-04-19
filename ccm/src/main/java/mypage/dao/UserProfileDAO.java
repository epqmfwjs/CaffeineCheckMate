package mypage.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import mypage.dto.UserProfileDTO;
import jdbc.JdbcUtil;

public class UserProfileDAO {
	
	//Map<String,UserProfileDTO> updtoMap = null;
	//Map -> 지우기 
	public UserProfileDTO ShowMyPF(String memberId, Connection conn) throws SQLException { 
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
				System.out.println("updto : "+updto.toString());
				return updto;
			}
			
		}finally {
			JdbcUtil.close(rs);
			JdbcUtil.close(pstmt);
		}
		return null;
	}
	
	public void updateProfile(String memberId, String profileImnages, int weight, Connection conn)throws SQLException { 
		PreparedStatement pstmt =null;
		
		try {
			String sql = "update profile set p_weight=?, p_img_copy=? where M_ID=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, weight);
			pstmt.setString(2, profileImnages);
			pstmt.setString(3, memberId);
			
			pstmt.executeUpdate();
		} finally {
			if(pstmt !=null) pstmt.close();
		}
		
	}
	
}