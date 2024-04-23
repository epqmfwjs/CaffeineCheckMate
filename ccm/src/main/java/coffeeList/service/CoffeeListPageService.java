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
	
	public CoffeeListPage getCoffeeList(String memberId, int page) throws SQLException {
		Connection conn = null;
		try {
			System.out.println("커피서비스 멤버 OK 도달");
			
			conn = ConnectionProvider.getConnection();
			// 한 페이지에 표시할 게시물 수
			int size = 10; 
			
			ArrayList<Coffee> coffeeList = coffeeListDao.CoffeeListView(conn, page, size);
			HashMap<Integer, Favorite> favMap = favoriteDao.getFavList(memberId, conn);
			int total = coffeeListDao.CoffeeListCount(conn);
			
			CoffeeListPage coffeeListPage = new CoffeeListPage(coffeeList, favMap, total, page, size);
			
			return coffeeListPage;
		}finally {
			JdbcUtil.close(conn);
		}
	}
	
	public CoffeeListPage notAuthCoffeeList(int page) throws SQLException {
		Connection conn = null;
		try {
			System.out.println("커피서비스 비로그인");
			conn = ConnectionProvider.getConnection();
			
			// 한 페이지에 표시할 게시물 수
			int size = 10; 
			
			ArrayList<Coffee> coffeeList = coffeeListDao.CoffeeListView(conn, page, size);
			int total = coffeeListDao.CoffeeListCount(conn);
			
			CoffeeListPage coffeeListPage = new CoffeeListPage(coffeeList,total,page,size);
			
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