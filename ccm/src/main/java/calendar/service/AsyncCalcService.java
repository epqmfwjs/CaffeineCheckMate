package calendar.service;

import java.sql.Connection;
import java.sql.Date;
import java.util.HashMap;

import calendar.dao.CalendarDao;
import calendar.dto.Calendar;
import coffeeList.dao.CoffeeListDao;
import coffeeList.dto.Coffee;
import connection.ConnectionProvider;
import global.function.CCMFunctions;
import jdbc.JdbcUtil;
import mypage.dao.ProfileDao;

public class AsyncCalcService {
	
	CoffeeListDao coffeeListDao = new CoffeeListDao();
	CalendarDao calendarDao = new CalendarDao();
	ProfileDao profileDao = new ProfileDao();
	
	public HashMap calc(String memberId, int coffeeNo) {
		Connection conn = null;
		Coffee coffee = null;
		Calendar todaysCaffeine = null;
		Date date = new Date(System.currentTimeMillis());
		int caffeine = 0;
		int calculatedResult = 0;
		String color;
		HashMap<String, Object> calcMap = new HashMap();
		try {
			conn = ConnectionProvider.getConnection();
			conn.setAutoCommit(false);
			
			double weight = profileDao.getWeight(memberId, conn);
			
			coffee = coffeeListDao.selectByCoffeeNo(coffeeNo, conn);
			caffeine = coffee.getC_CAFFEINE();
			todaysCaffeine = calendarDao.getTodaysRecord(memberId, date, conn);
			
			if (todaysCaffeine != null) {
				caffeine +=  todaysCaffeine.getCAL_DAILYCF();
				color = CCMFunctions.ColorFn(caffeine, weight);
				calendarDao.recordCaffeine(todaysCaffeine.getCAL_DATE(), memberId, caffeine,color, conn);

			} else {
				color = CCMFunctions.ColorFn(caffeine, weight);
				calendarDao.createTodaysRecord(date, memberId, caffeine, color, conn);
			}
			//========================================
			Calendar todaysRecord = calendarDao.getTodaysRecord(memberId, date, conn);
			if(todaysRecord == null) {
				calculatedResult = 0;
			} else {
				calculatedResult = todaysRecord.getCAL_DAILYCF();
			}
			calcMap.put("caffeine", calculatedResult);
			calcMap.put("rda", weight*6.4);
			calcMap.put("color", color);
			conn.commit();
			
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			JdbcUtil.close(conn);
		}
		return calcMap;
	}
	
	public HashMap<String, Object> reset(String memberId)  {
		Connection conn = null;
		Date date = new Date(System.currentTimeMillis());
		String color;
		HashMap<String, Object> calcMap = new HashMap();
		
		try {
			conn = ConnectionProvider.getConnection();
			conn.setAutoCommit(false);
			
			double weight = profileDao.getWeight(memberId, conn);
			calendarDao.resetCaffeine(date, memberId, conn);
			
			color = CCMFunctions.ColorFn(0, 1);
			calcMap.put("caffeine", 0);
			calcMap.put("rda", weight*6.4);
			calcMap.put("color", color);
			conn.commit();
			
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			JdbcUtil.close(conn);
		}
		return calcMap;
	}
	
	public HashMap<String, Object> getCalc(String memberId)  {
		Connection conn = null;
		Date date = new Date(System.currentTimeMillis());
		String color;
		HashMap<String, Object> calcMap = new HashMap();
		int calculatedResult = 0;
		try {
			conn = ConnectionProvider.getConnection();
			conn.setAutoCommit(false);
			
			double weight = profileDao.getWeight(memberId, conn);
			
			Calendar todaysRecord = calendarDao.getTodaysRecord(memberId, date, conn);
			if(todaysRecord == null) {
				calculatedResult = 0;
			} else {
				calculatedResult = todaysRecord.getCAL_DAILYCF();
			}
			
			color = CCMFunctions.ColorFn(calculatedResult, weight);
			calcMap.put("caffeine", calculatedResult);
			calcMap.put("rda", weight*6.4);
			calcMap.put("color", color);
			conn.commit();
			
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			JdbcUtil.close(conn);
		}
		return calcMap;
	}
	
	
}
