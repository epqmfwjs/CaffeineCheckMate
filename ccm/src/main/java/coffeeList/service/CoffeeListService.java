package coffeeList.service;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;

import coffeeList.dao.CoffeeListDao;
import coffeeList.dto.Coffee;
import connection.ConnectionProvider;
import jdbc.JdbcUtil;

public class CoffeeListService {
	
	public ArrayList<Coffee> getCoffeeList() throws SQLException {
		Connection conn = null;
		try {
			conn = ConnectionProvider.getConnection();
			
			CoffeeListDao coffeeListDao = new CoffeeListDao();
			ArrayList<Coffee> coffeeList = coffeeListDao.CoffeeListView(conn);
			//System.out.println("커피서비스");
			return coffeeList;
		}finally {
			JdbcUtil.close(conn);
		}
	}
}

//커넥션 null로 초기화
//예외 처리 메세지
//서비스에서 커넥션 넣기
//System.out.println("예외 메시지: " + e.getMessage());