package coffeeList.service;

import java.sql.Connection;

import coffeeList.dao.CoffeeListDao;
import connection.ConnectionProvider;

public class CoffeeDeleteService {

	public void deleteCoffee(int coffeeNo) {
		Connection conn = null;
		try {
			conn = ConnectionProvider.getConnection();
			
			CoffeeListDao coffeelistdao = new CoffeeListDao();
			coffeeListDao.deleteCoffee(conn, coffeeNo);
		}
		
		CoffeeListDao coffeeListDao = new CoffeeListDao();
		
	}
}
