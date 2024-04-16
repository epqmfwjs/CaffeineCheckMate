package calendar.service;

import java.sql.Connection;
import java.sql.Date;
import java.sql.SQLException;

import calendar.dao.CalendarDao;
import connection.ConnectionProvider;
import jdbc.JdbcUtil;

public class ResetCalculationService {
	CalendarDao calendarDao = new CalendarDao();
	
	public void Reset(String memberId) {
		Connection conn = null;
		java.sql.Date date = new java.sql.Date(System.currentTimeMillis());
		System.out.println("sql date : "+date);
		try {
			conn = ConnectionProvider.getConnection();
			conn.setAutoCommit(false);
			calendarDao.resetCaffeine(date, memberId, conn);
			
			conn.commit();
		}catch (SQLException e) {
			e.printStackTrace();
			JdbcUtil.rollback(conn);
		} finally {
			JdbcUtil.close(conn);
		}
	}
}
