package coffeeList.service;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import coffeeList.dao.CoffeeListDao;
import coffeeList.dto.Coffee;
import coffeeList.dto.CoffeeListPage;
import connection.ConnectionProvider;
import favorite.dao.FavoriteDao;
import favorite.dto.Favorite;
import jdbc.JdbcUtil;

public class CoffeeListPageService {
	
	CoffeeListDao coffeeListDao = new CoffeeListDao();
	FavoriteDao favoriteDao = new FavoriteDao();
	
	public CoffeeListPage getCoffeeList(String memberId) throws SQLException {
		Connection conn = null;
		try {
			conn = ConnectionProvider.getConnection();
			
			ArrayList<Coffee> coffeeList = coffeeListDao.CoffeeListView(conn);
			HashMap<Integer, Favorite> favMap = favoriteDao.getFavList(memberId, conn);
			
			CoffeeListPage coffeeListPage = new CoffeeListPage(coffeeList,favMap);
			//System.out.println("커피서비스");
			return coffeeListPage;
		}finally {
			JdbcUtil.close(conn);
		}
	}
	
	public CoffeeListPage notAuthCoffeeList() throws SQLException {
		Connection conn = null;
		try {
			conn = ConnectionProvider.getConnection();
			
			ArrayList<Coffee> coffeeList = coffeeListDao.CoffeeListView(conn);

			CoffeeListPage coffeeListPage = new CoffeeListPage(coffeeList);
			//System.out.println("커피서비스");
			return coffeeListPage;
		}finally {
			JdbcUtil.close(conn);
		}
	}
}

//커넥션 null로 초기화
//예외 처리 메세지
//서비스에서 커넥션 넣기
//System.out.println("예외 메시지: " + e.getMessage());