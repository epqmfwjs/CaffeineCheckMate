package mypage.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Map;

import jdbc.JdbcUtil;
import mypage.dto.MyRecipeDTO;

public class MyRecipeDAO {
	
	Map<String, MyRecipeDTO> mRecipedto = null;
	//내가 작성한 레시피 ,custom 레시피
	//아이디 받아서 검색하기
	public Map<String,MyRecipeDTO> getRecipe(String memberid ,Connection conn) throws SQLException{
		PreparedStatement pstmt =null;
		ResultSet rs = null;
		
		//조인하기 (DTO-1개, DAO-1개)
		
		try {
			pstmt = conn.prepareStatement("SELECT custom.CUS_NO, custom.M_ID, custom.CUS_TITLE, custom_img.CUS_IMG_COPY"
					+ "FROM custom join custom_img"
					+ "on custom.CUS_NO = custom_img.CUS_NO"
					+ "where custom.M_ID=?");
			pstmt.setString(1, memberid);
			rs = pstmt.executeQuery();
			MyRecipeDTO myrecipe = null;
			
			while(rs.next()) {
				myrecipe = new MyRecipeDTO(
						rs.getInt("CUS_NO"),
						rs.getString("M_ID"),
						rs.getString("CUS_TITLE"),
						rs.getString("CUS_IMG_COPY")
						);
				mRecipedto.put(myrecipe.getM_ID(), myrecipe);
			}
			return mRecipedto;
			
		} finally {
			JdbcUtil.close(rs);
			JdbcUtil.close(pstmt);
		}
	}
	
		
	
}
