package coffeeList.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.ArrayList;

import coffeeList.dto.Coffee;
import jdbc.JdbcUtil;

public class CoffeeListDao {
	//커피 목록 뷰 DAO + 페이징
	public ArrayList<Coffee> CoffeeListView(Connection conn, int page, int size) throws SQLException {
		String listViewSQL = "SELECT C_NO, C_NAME, C_BRAND, C_CAFFEINE, C_IMG_COPY "
				 		   + "FROM COFFEELIST "
				 		   + "ORDER BY C_NO DESC "
				 		   + "LIMIT ?, ?";
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ArrayList<Coffee> coffeeList = new ArrayList<Coffee>();
		//System.out.println("뷰 DAO");
		
		//현재 페이지에서 필요한 시작 행을 연산하는 식
		//페이지블럭이 2일 때 연산하면 10이므로 시작하는 행은 10으로 시작
		int startRow = (page-1)*size; 
		
		try {
			pstmt = conn.prepareStatement(listViewSQL);
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, size);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				Coffee rsCoffeeView = new Coffee(
					rs.getInt("C_NO"),
					rs.getString("C_NAME"),
					rs.getString("C_BRAND"),
					rs.getInt("C_CAFFEINE"),
					rs.getString("C_IMG_COPY")
				); coffeeList.add(rsCoffeeView);
			}
		}finally {
			JdbcUtil.close(rs);
			JdbcUtil.close(pstmt);
		}
		return coffeeList;	
	}
	//커피리스트의 게시물의 총 수를 세는 DAO
	public int CoffeeListCount(Connection conn) throws SQLException {
		String listCountSQL = "SELECT COUNT(*) as cnt "
							+ "FROM COFFEELIST";
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int count = 0;
		
		try {
			pstmt = conn.prepareStatement(listCountSQL);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				count = rs.getInt("cnt");
			}
		} finally {
            JdbcUtil.close(rs);
            JdbcUtil.close(pstmt);
        }
		return count;
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
                        rs.getInt("C_CAFFEINE"), 
                        rs.getInt("C_SACCHARIDE"),
                        rs.getInt("C_CALORIE"),
                        rs.getString("C_CONTENT"),
                        rs.getString("C_TYPE"),
                        rs.getString("C_STAGE"),
                        rs.getString("C_IMG_REAL"),
                        rs.getString("C_IMG_COPY")
                        );
            }
        } finally {
            JdbcUtil.close(rs);
            JdbcUtil.close(pstmt);
        }
        return coffeeDetail;
    }


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
						rs.getInt("C_CAFFEINE"),
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
			String query = "select C_NO, C_CAFFEINE, C_IMG_COPY, row_number() over (order by C_FAVORITE desc, C_NAME) as idx from COFFEELIST limit 5;";
			pstmt = conn.prepareStatement(query);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				coffeeFavMap.put(rs.getInt("idx"),new Coffee(
						rs.getInt("C_NO"),
						rs.getInt("C_CAFFEINE"),
						rs.getString("C_IMG_COPY")
						));
			}
			return coffeeFavMap;
		} finally {
			JdbcUtil.close(pstmt);
			JdbcUtil.close(rs);
		}
	}
	
	public void AddCoffee(Coffee coffee,Connection conn) throws SQLException {
		String listAddSQL = "INSERT INTO COFFEELIST ("
						  + "C_NAME, C_BRAND, C_CAFFEINE, C_SACCHARIDE, "
						  + "C_CALORIE, C_CONTENT, C_TYPE, C_STAGE, C_IMG_REAL) "
						  + "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)";
		//ㅋㅋㅋ... 아 쿼리문에 세미콜론 제발
		PreparedStatement pstmt = null;
		
		try {
			pstmt = conn.prepareStatement(listAddSQL);
			pstmt.setString(1, coffee.getC_NAME());
			pstmt.setString(2, coffee.getC_BRAND());
			pstmt.setInt(3, coffee.getC_CAFFEINE());
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
	
	public void updateCoffee(Coffee coffee, Connection conn) throws SQLException {
		//커피넘버를 매개변수로 받아서 SQL문 WHERE 절에 대입함
		String listUpdateSQL = "UPDATE COFFEELIST "
				+ "SET C_NAME = ?,  C_BRAND = ?, C_CAFFEINE = ?, C_SACCHARIDE = ?, "
				+ "C_CALORIE = ?, C_CONTENT = ?, C_TYPE = ?, C_STAGE = ?, C_IMG_REAL = ? "
				+ "WHERE C_NO = ?";
		PreparedStatement pstmt = null;
		
		try {
			pstmt = conn.prepareStatement(listUpdateSQL);
			pstmt.setString(1, coffee.getC_NAME());
			pstmt.setString(2, coffee.getC_BRAND());
			pstmt.setInt(3, coffee.getC_CAFFEINE());
			pstmt.setInt(4, coffee.getC_SACCHARIDE());
			pstmt.setInt(5, coffee.getC_CALORIE());
			pstmt.setString(6, coffee.getC_CONTENT());
			pstmt.setString(7, coffee.getC_TYPE());
			pstmt.setString(8, coffee.getC_STAGE());
			pstmt.setString(9, coffee.getC_IMG_REAL());
			pstmt.setInt(10, coffee.getC_NO());
			System.out.println("다오 왔뎅");
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