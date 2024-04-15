package calendar.service;

import java.sql.Connection;
import java.sql.Date;
import java.sql.SQLException;

import calendar.dao.CalendarDao;
import calendar.dto.Calendar;
import connection.ConnectionProvider;
import jdbc.JdbcUtil;

public class GetCalculatedResultService {
	
	CalendarDao calendarDao = new CalendarDao();
	
	public int getResult(int memberNo) {
		Connection conn = null;
		int calculatedResult = 0;
		try {
			conn = ConnectionProvider.getConnection();
			Date date = new Date(System.currentTimeMillis());
			Calendar todaysRecord = calendarDao.getTodaysRecord(memberNo, date, conn);
			if(todaysRecord == null) {
				calculatedResult = 0;
			} else {
				calculatedResult = todaysRecord.getCAL_DAILYCF();
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JdbcUtil.close(conn);
		}
		return calculatedResult;
	}
}
