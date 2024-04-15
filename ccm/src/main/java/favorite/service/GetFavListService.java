package favorite.service;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.Map;

import connection.ConnectionProvider;
import favorite.dao.FavoriteDao;
import favorite.dto.Favorite;
import jdbc.JdbcUtil;

public class GetFavListService {

	FavoriteDao favoriteDao = new FavoriteDao();
	
	public Map<Integer, Favorite> getFav(int memberNo) {
		Connection conn = null;
		Map<Integer, Favorite> favMap = null;
		try {
			conn = ConnectionProvider.getConnection();
			favMap = favoriteDao.getFavList(memberNo, conn);
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JdbcUtil.close(conn);
		}
		return favMap;
	}

}
