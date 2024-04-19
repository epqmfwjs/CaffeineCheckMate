package coffeeList.service;

import java.sql.Connection;
import java.sql.SQLException;

import coffeeList.dao.CoffeeListDao;
import coffeeList.dto.Coffee;
import connection.ConnectionProvider;
import jdbc.JdbcUtil;

public class CoffeeUpdateService {
	
	CoffeeListDao coffeeListDao = new CoffeeListDao();
	
	public void updateCoffee(Coffee coffee) {
		Connection conn = null;
		
		try {
			conn = ConnectionProvider.getConnection();
			conn.setAutoCommit(false);
			
			CoffeeListDao coffeeListDao = new CoffeeListDao();
			coffeeListDao.updateCoffee(coffee, conn);
			System.out.println("서비스");
			conn.commit();
		}catch (SQLException e) {
			System.out.println(e.getMessage() + "SQLException");
			JdbcUtil.rollback(conn);
		}finally {
			JdbcUtil.close(conn);
		}
	}
}