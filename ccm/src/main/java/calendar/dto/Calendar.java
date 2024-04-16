package calendar.dto;

import java.sql.Date;

public class Calendar {
	Date CAL_DATE;
	int M_NO;
	int CAL_DAILYCF = 0;
	String CAL_COLOR;
	

	public Calendar(Date cAL_DATE, int m_NO, int cAL_DAILYCF, String cAL_COLOR) {
		CAL_DATE = cAL_DATE;
		M_NO = m_NO;
		CAL_DAILYCF = cAL_DAILYCF;
		CAL_COLOR = cAL_COLOR;
	}
	public Date getCAL_DATE() {
		return CAL_DATE;
	}
	public void setCAL_DATE(Date cAL_DATE) {
		CAL_DATE = cAL_DATE;
	}
	public int getM_NO() {
		return M_NO;
	}
	public void setM_NO(int m_NO) {
		M_NO = m_NO;
	}
	public int getCAL_DAILYCF() {
		return CAL_DAILYCF;
	}
	public void setCAL_DAILYCF(int cAL_DAILYCF) {
		CAL_DAILYCF = cAL_DAILYCF;
	}	
	public String getCAL_COLOR() {
		return CAL_COLOR;
	}
	public void setCAL_COLOR(String cAL_COLOR) {
		CAL_COLOR = cAL_COLOR;
	}

}
