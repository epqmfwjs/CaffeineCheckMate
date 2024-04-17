package coffeeList.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import coffeeList.dto.Coffee;
import jdbc.JdbcUtil;

public class CoffeeAddDelDao {
	
	public void AddCoffee(Coffee coffee,Connection conn) throws SQLException {
		String listAddSQL = "INSERT INTO COFFEELIST ("
						  + "C_NAME, C_BRAND, C_CAFFAINE, C_SACCHARIDE, "
						  + "C_CALORIE, C_CONTENT, C_TYPE, C_STAGE, C_IMG_REAL) "
						  + "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)";
		//ㅋㅋㅋ... 아 쿼리문에 세미콜론 제발
		PreparedStatement pstmt = null;
		
		try {
			pstmt = conn.prepareStatement(listAddSQL);
			pstmt.setString(1, coffee.getC_NAME());
			pstmt.setString(2, coffee.getC_BRAND());
			pstmt.setInt(3, coffee.getC_CAFFAINE());
			pstmt.setInt(4, coffee.getC_SACCHARIDE());
			pstmt.setInt(5, coffee.getC_CALORIE());
			pstmt.setString(6, coffee.getC_CONTENT());
			pstmt.setString(7, coffee.getC_TYPE());
			pstmt.setString(8, coffee.getC_STAGE());
			pstmt.setString(9, coffee.getC_IMG_REAL());
			
			pstmt.executeUpdate();
		} finally {
			JdbcUtil.close(pstmt);
		}
	}
	
	
	public void deleteCoffee(int coffeeNo,Connection conn) throws SQLException {
		//커피넘버를 매개변수로 받아서 SQL문 WHERE 절에 대입함
		String listDeleteSQL = "DELETE FROM COFFEELIST "+
							   "WHERE C_NO = ?";
		PreparedStatement pstmt = null;
		
		try {
			pstmt = conn.prepareStatement(listDeleteSQL);
			pstmt.setInt(1, coffeeNo);
			pstmt.executeUpdate();
		} finally {
			JdbcUtil.close(pstmt);
		}
	}
}