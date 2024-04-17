package favorite.service;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.HashMap;

import coffeeList.dao.CoffeeListDao;
import connection.ConnectionProvider;
import favorite.dao.FavoriteDao;
import favorite.dto.Favorite;
import jdbc.JdbcUtil;

public class DeleteFavService {
	
	FavoriteDao favoriteDao = new FavoriteDao();
	CoffeeListDao coffeeListDao = new CoffeeListDao();
	
	public void deleteFav(String memberId, int coffeeNo) {
		Connection conn = null;
		try {
			conn = ConnectionProvider.getConnection();
			conn.setAutoCommit(false);
			if (favoriteDao.delete(memberId, coffeeNo, conn)) {				
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
	public HashMap asyncDeleteFav(String memberId, int coffeeNo) {
		Connection conn = null;
		HashMap<Integer, Favorite> favMap = null;
		try {
			conn = ConnectionProvider.getConnection();
			conn.setAutoCommit(false);
			if (favoriteDao.delete(memberId, coffeeNo, conn)) {				
				coffeeListDao.minusFav(coffeeNo, conn);
			}
			favMap = favoriteDao.getFavList(memberId, conn);
			conn.commit();
		}catch (SQLException e) {
			e.printStackTrace();
			JdbcUtil.rollback(conn);
		} finally {
			JdbcUtil.close(conn);
		}
		return favMap;
	}
}
