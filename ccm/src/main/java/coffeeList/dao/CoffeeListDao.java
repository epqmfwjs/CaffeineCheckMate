package coffeeList.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import coffeeList.dto.Coffee;
import jdbc.JdbcUtil;
public class CoffeeListDao {
	//커피 목록 DAO
	public ArrayList<Coffee> CoffeeListView(Connection conn) throws SQLException {
		String listViewSQL = "SELECT * "+
				 			 "FROM COFFEELIST";
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ArrayList<Coffee> coffeeList = new ArrayList<Coffee>();
		System.out.println("카트라이더 DAO");
		
		try {
			pstmt = conn.prepareStatement(listViewSQL);
			rs = pstmt.executeQuery();
			Coffee rsCoffeeView = null;
			
			while(rs.next()) {
				rsCoffeeView = new Coffee(
					rs.getInt("C_NO"),
					rs.getString("C_NAME"),
					rs.getString("C_BRAND"),
					rs.getInt("C_CAFFAINE"),
					rs.getString("C_IMG_COPY")
				); coffeeList.add(rsCoffeeView);
			}
		}finally {
			JdbcUtil.close(rs);
			JdbcUtil.close(pstmt);
		}
		return coffeeList;	
	}
	
	//커피 상세 내역 DAO
    public Coffee getCoffeeDetail(Connection conn, int coffeeNo) throws SQLException {
        String detailViewSQL = "SELECT * FROM COFFEELIST WHERE C_NO = ?";
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        Coffee coffeeDetail = null;

        try {
            pstmt = conn.prepareStatement(detailViewSQL);
            pstmt.setInt(1, coffeeNo);
            rs = pstmt.executeQuery();

            if (rs.next()) {
                coffeeDetail = new Coffee(
                		rs.getInt("C_NO"), 
                		rs.getString("C_NAME"), 
                		rs.getString("C_BRAND"),
                        rs.getInt("C_CAFFAINE"), 
                        rs.getInt("C_SACCHARIDE"),
                        rs.getInt("C_CALORIE"),
                        rs.getString("C_CONTENT"),
                        rs.getString("C_IMG_COPY")
                        );
            }
        } finally {
            JdbcUtil.close(rs);
            JdbcUtil.close(pstmt);
        }
        return coffeeDetail;
    }
}
