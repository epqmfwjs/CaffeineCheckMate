package coffeeList.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.HashMap;

import coffeeList.dto.Coffee;
import jdbc.JdbcUtil;

public class CoffeeListDao {

	public Coffee selectByCoffeeNo(int coffeeNo, Connection conn) throws SQLException {
		System.out.println("coffeelistdao1");
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			pstmt = conn.prepareStatement(
					"select * from COFFEELIST where C_NO=?;");
			pstmt.setInt(1, coffeeNo);
			rs = pstmt.executeQuery();
			Coffee coffee = null;
			if(rs.next()) {
				coffee = new Coffee(
						rs.getInt("C_NO"),
						rs.getInt("C_CAFFAINE"),
						rs.getString("C_IMG_COPY")
						);
			}
			return coffee;
		} finally {
			JdbcUtil.close(rs);
			JdbcUtil.close(pstmt);
		}
	}
	
	public void plusFav(int coffeeNo, Connection conn) throws SQLException {
		System.out.println("coffeelist dao 2");
		PreparedStatement pstmt = null;
		try {
			pstmt = conn.prepareStatement(
					"update COFFEELIST set C_FAVORITE = C_FAVORITE+1 where C_NO=?;");
			pstmt.setInt(1, coffeeNo);
			int pF = pstmt.executeUpdate();
			System.out.println("plusFav affect : "+pF+" rows");
		} finally {
			JdbcUtil.close(pstmt);
		}
	}
	public void minusFav(int coffeeNo, Connection conn) throws SQLException {
		PreparedStatement pstmt = null;
		try {
			pstmt = conn.prepareStatement(
					"update COFFEELIST set C_FAVORITE = C_FAVORITE-1 where C_NO=?;");
			pstmt.setInt(1, coffeeNo);
			int mF = pstmt.executeUpdate();
			System.out.println("minusFav affect : "+mF+" rows");
		} finally {
			JdbcUtil.close(pstmt);
		}
	}
	public HashMap<Integer, Coffee> getCoffeesByFav(Connection conn) throws SQLException{
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		HashMap<Integer,Coffee> coffeeFavMap = new HashMap<Integer, Coffee>();
		try {
			String query = "select C_NO, C_CAFFAINE, C_IMG_COPY, row_number() over (order by C_FAVORITE desc, C_NAME) as idx from COFFEELIST limit 5;";
			pstmt = conn.prepareStatement(query);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				coffeeFavMap.put(rs.getInt("idx"),new Coffee(
						rs.getInt("C_NO"),
						rs.getInt("C_CAFFAINE"),
						rs.getString("C_IMG_COPY")
						));
			}
			return coffeeFavMap;
		} finally {
			JdbcUtil.close(pstmt);
			JdbcUtil.close(rs);
		}
	}
}
