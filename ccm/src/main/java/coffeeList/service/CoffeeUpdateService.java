package coffeeList.service;

import java.io.File;
import java.sql.Connection;
import java.sql.SQLException;

import coffeeList.dao.CoffeeListDao;
import coffeeList.dto.Coffee;
import connection.ConnectionProvider;
import jdbc.JdbcUtil;

public class CoffeeUpdateService {
	
	CoffeeListDao coffeeListDao = new CoffeeListDao();
	
	//업데이트를 처리하는 메서드
	public void updateCoffee(Coffee coffee) {
		Connection conn = null;
		
		try {
			conn = ConnectionProvider.getConnection();
			conn.setAutoCommit(false);
			
			//Detail을 재활용하여 existingCoffee에 변수 저장 
			Coffee existingCoffee = coffeeListDao.getCoffeeDetail(conn, coffee.getC_NO());
			//이전값과 비교 : !null, C_IMG_REAL이 새로운 파일과 경로가 다른 경우에 삭제 진행 로직
			if (existingCoffee != null && 
				!existingCoffee.getC_IMG_REAL().equals(coffee.getC_IMG_REAL())) {
				//파일 객체 생성하여 기존 이미지 삭제
				new File(existingCoffee.getC_IMG_REAL()).delete();
			}
			coffeeListDao.updateCoffee(coffee, conn);
			
			conn.commit();
		}catch (SQLException e) {
			System.out.println(e.getMessage() + "SQLException");
			JdbcUtil.rollback(conn);
		}finally {
			JdbcUtil.close(conn);
		}
	}
}