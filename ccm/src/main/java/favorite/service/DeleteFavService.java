package favorite.service;

import java.sql.Connection;
import java.sql.SQLException;

import coffeeList.dao.CoffeeListDao;
import connection.ConnectionProvider;
import favorite.dao.FavoriteDao;
import jdbc.JdbcUtil;

public class DeleteFavService {
	
	FavoriteDao favoriteDao = new FavoriteDao();
	CoffeeListDao coffeeListDao = new CoffeeListDao();
	
	public void deleteFav(int memberNo, int coffeeNo) {
		Connection conn = null;
		try {
			conn = ConnectionProvider.getConnection();
			conn.setAutoCommit(false);
			if (favoriteDao.delete(memberNo, coffeeNo, conn)) {				
				coffeeListDao.minusFav(coffeeNo, conn);
			}
			conn.commit();
		}catch (SQLException e) {
			e.printStackTrace();
			JdbcUtil.rollback(conn);
		} finally {
			JdbcUtil.close(conn);
		}
	}
}
