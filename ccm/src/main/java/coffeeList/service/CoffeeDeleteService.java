package coffeeList.service;

import java.sql.Connection;
import java.sql.SQLException;

import coffeeList.dao.CoffeeListDao;
import connection.ConnectionProvider;
import jdbc.JdbcUtil;

public class CoffeeDeleteService {

	public void deleteCoffee(int coffeeNo) {
		Connection conn = null;
		
		CoffeeListDao coffeeListDao = new CoffeeListDao();
		
		try {
			conn = ConnectionProvider.getConnection();
			//auto commit false : 호출된 메서드가 끝나면 다시 auto로 돌아감
			conn.setAutoCommit(false);
			
			coffeeListDao.deleteCoffee(coffeeNo, conn);
			
			conn.commit();
		} catch(SQLException e) {
			System.out.println(e.getMessage()+"SQLException");
			JdbcUtil.rollback(conn);
		} finally {
			JdbcUtil.close(conn);
		}
	}
}