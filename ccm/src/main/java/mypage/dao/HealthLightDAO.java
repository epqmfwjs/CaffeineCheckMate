package mypage.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Map;

import jdbc.JdbcUtil;
import mypage.dto.HealthLightDTO;

public class HealthLightDAO {
	
	Map<String, HealthLightDTO> hlightdtoMap = null;
	//카페인 섭취량에 따라 색을 결정하고 데이터베이스에 -> 
	
	public Map<String, HealthLightDTO> getHealthLight(String memberid ,String caldate, Connection conn) throws SQLException { 
		PreparedStatement pstmt =null;
		ResultSet rs = null;
		
		try {
			pstmt = conn.prepareStatement("select * from CALENDER where M_NO = ? AND CAL_DATE=?");
			pstmt.setString(1, memberid);
			pstmt.setString(1, caldate);
			rs = pstmt.executeQuery();
			HealthLightDTO hldto = null;
			if(rs.next()) {
				hldto = new HealthLightDTO(
					rs.getString("M_ID"),
				    rs.getString("CAL_DATE"),
				    rs.getString("CAL_COLOR"),
				    rs.getInt("CAL_DALYCF")
				);
				hlightdtoMap.put(hldto.getM_ID(), hldto);
			}
			return hlightdtoMap;
			
		}finally {
			JdbcUtil.close(rs);
			JdbcUtil.close(pstmt);
		}
	}
	// 캘린더 색 업데이트
//	public void updateCalColor(HealthLightDTO healthLightDTO, Connection conn) throws SQLException {
//        PreparedStatement pstmt = null;
//        
//        try {
//            pstmt = conn.prepareStatement("UPDATE CALANDER SET CAL_COLOR = ? WHERE M_NO = ? AND CAL_DATE = ?");
//            pstmt.setString(1, healthLightDTO.getCalColor());
//            pstmt.setInt(2, healthLightDTO.getMno());
//            pstmt.setString(3, healthLightDTO.getCalDate());
//            pstmt.executeUpdate();
//        } finally {
//            JdbcUtil.close(pstmt);
//        }
//    }
	
	
	
}
	
