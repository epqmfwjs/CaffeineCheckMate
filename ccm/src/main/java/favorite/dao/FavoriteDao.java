package favorite.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.Map;

import connection.ConnectionProvider;
import favorite.dto.Favorite;
import jdbc.JdbcUtil;

public class FavoriteDao {
	
	Map<Integer ,Favorite> favMap = new HashMap();

	public Map<Integer, Favorite> getFavList(int memberNo, Connection conn) throws SQLException { 
		PreparedStatement pstmt =null;
		ResultSet rs = null;
		try {
			pstmt = conn.prepareStatement(
					"select a.M_NO, a.C_NO, b.C_NAME, a.C_FAV_DATE, b.C_IMG_COPY "
					+ "from COFFEE_FAVORITE a join COFFEELIST b "
					+ "on a.C_NO = b.C_NO "
					+ "where a.M_NO=?;");
			pstmt.setInt(1, memberNo);
			rs = pstmt.executeQuery();
			Favorite favorite = null;
			while(rs.next()) {
				favorite = new Favorite(
						rs.getInt("M_NO"),
						rs.getInt("C_NO"),
						rs.getString("C_NAME"),
						rs.getDate("C_FAV_DATE"),
						rs.getString("C_IMG_COPY")
						);
				favMap.put(favorite.getC_NO(), favorite);
			}
			return favMap;
		} finally {
			JdbcUtil.close(rs);
			JdbcUtil.close(pstmt);
		}
	}
	
	/*
	 * 유저의 즐겨찾기 목록에 특정 커피가 존재하는지 확인하는 메서드
	 * 존재하면 true
	 * 없으면 false
	 */
	public boolean checkFav(int memberNum, int coffeeNo, Connection conn) throws SQLException {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			pstmt = conn.prepareStatement(
					"select M_NO from COFFEE_FAVORITE where C_NO=?;");
			pstmt.setInt(1, coffeeNo);
			rs = pstmt.executeQuery();
			return rs.next();
		} finally {
			JdbcUtil.close(pstmt);
			JdbcUtil.close(rs);
		}
	}
	
	public void AddFav(int memberNo, int coffeeNo, Connection conn) throws SQLException { //커넥션을 변수로 받음
		System.out.println("favoirtedao");
		PreparedStatement pstmt = null; //pstmt 초기화
		try {
			pstmt = conn.prepareStatement("insert into COFFEE_FAVORITE (M_NO, C_NO) values(?,?)");
			pstmt.setInt(1, memberNo);
			pstmt.setInt(2, coffeeNo);
			int AFn = pstmt.executeUpdate(); //쿼리 실행
			System.out.println("AddFav affect "+AFn+" rows");
		} finally {
			JdbcUtil.close(pstmt); //pstmt 종료
		}
	}
	
	public boolean delete(int memberNo, int coffeeNo, Connection conn) throws SQLException {
		PreparedStatement pstmt =null;
		try {
			pstmt = conn.prepareStatement(
					"delete from COFFEE_FAVORITE where M_NO = ? and C_NO=?");
			pstmt.setInt(1, memberNo);
			pstmt.setInt(2, coffeeNo);
			int rows = pstmt.executeUpdate();
			System.out.println("delete favorite : "+rows+" rows deleted");
			return rows>0? true : false;
		} finally {
			JdbcUtil.close(pstmt);
		}
	}
}
