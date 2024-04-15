package calendar.dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import calendar.dto.Calendar;
import jdbc.JdbcUtil;
/*
 * 색상 및 단계관련 구현 필요
 */
public class CalendarDao {
	
	public Calendar createTodaysRecord(Date date, int memberNo, int caffeine, Connection conn) throws SQLException {
		PreparedStatement pstmt = null;
		
		try {
			pstmt =conn.prepareStatement(
					"insert into CALENDAR (CAL_DATE, M_NO, CAL_DAILYCF) values(?,?,?)");
			pstmt.setDate(1, date);
			pstmt.setInt(2, memberNo);
			pstmt.setInt(3, caffeine);
			int rows = pstmt.executeUpdate();
			System.out.println("create todays record  : "+rows+" rows updated");
		} finally {
			JdbcUtil.close(pstmt);
		}
		return null;
	}
	
	public Calendar getTodaysRecord(int memberNo, Date date, Connection conn) throws SQLException {
		PreparedStatement pstmt =null;
		ResultSet rs = null;
		Calendar todaysCaffeine = null;
		try {
			pstmt = conn.prepareStatement(
					"select CAL_DAILYCF from CALENDAR where M_NO = ? and CAL_DATE=?");
			pstmt.setInt(1,memberNo);
			pstmt.setDate(2, date);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				todaysCaffeine = new Calendar(
						date,
						memberNo,
						rs.getInt("CAL_DAILYCF")
						);
				return todaysCaffeine;
			} else {
				return null;
			}
		} finally {
			JdbcUtil.close(rs);
			JdbcUtil.close(pstmt);
		}
	}
	
	public void recordCaffeine(Date date, int memberNo, int caffeine, Connection conn) throws SQLException {
		PreparedStatement pstmt =null;
		String caffeineStr = caffeine+"";
		try {
			pstmt=conn.prepareStatement(
					"update CALENDAR set CAL_DAILYCF=?  where M_NO = ? and CAL_DATE=?");
			pstmt.setString(1, caffeineStr);
			pstmt.setInt(2, memberNo);
			pstmt.setDate(3, date);
			
			int rows = pstmt.executeUpdate();
			System.out.println("recordCaffeine reuslt:"+rows+" rows updated");
		}finally {
			JdbcUtil.close(pstmt);
		}
	}
	
	public void resetCaffeine(Date date, int memberNo, Connection conn) throws SQLException {
		PreparedStatement pstmt =null;
		try {
			pstmt = conn.prepareStatement(
					"update CALENDAR set CAL_DAILYCF=0 where M_NO = ? and CAL_DATE=?");
			pstmt.setInt(1, memberNo);
			pstmt.setDate(2, date);	
			int rows = pstmt.executeUpdate();
			System.out.println("resetcaffeine : "+rows+" rows updated");
		} finally {
			JdbcUtil.close(pstmt);
		}
	}

}
