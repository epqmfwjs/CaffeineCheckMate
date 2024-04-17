package mypage.dto;

public class UserProfileDTO {
	private int P_NO;
	private String M_ID;
	private int P_WEIGHT;
	private String P_IMG_COPY;
	
	public UserProfileDTO(int p_NO, String m_ID, int p_WEIGHT, String p_IMG_COPY) {
		P_NO = p_NO;
		M_ID = m_ID; 
		P_WEIGHT= p_WEIGHT;
		P_IMG_COPY= p_IMG_COPY;
	}
	public int getP_NO() {
		return P_NO;
	}
	public void setP_NO(int p_NO) {
		P_NO = p_NO;
	}
	public String getM_ID() {
		return M_ID;
	}
	public void setM_ID(String m_ID) {
		M_ID = m_ID;
	}
	public int getP_WEIGHT() {
		return P_WEIGHT;
	}
	public void setP_WEIGHT(int p_WEIGHT) {
		P_WEIGHT = p_WEIGHT;
	}
	public String getP_IMG_COPY() {
		return P_IMG_COPY;
	}
	public void setP_IMG_COPY(String p_IMG_COPY) {
		P_IMG_COPY = p_IMG_COPY;
	}
	
	
}
