package mypage.dto;

public class MyRecipeDTO {
	private int CUS_NO;
	private String M_ID;
	private String CUS_TITLE;
	private String CUS_IMG_COPY;
	
	public MyRecipeDTO(int cUS_NO, String m_ID, String cUS_TITLE, String cUS_IMG_COPY) {
		CUS_NO = cUS_NO;
		M_ID = m_ID;
		CUS_TITLE = cUS_TITLE;
		CUS_IMG_COPY = cUS_IMG_COPY;
	}
	public int getCUS_NO() {
		return CUS_NO;
	}
	public void setCUS_NO(int cUS_NO) {
		CUS_NO = cUS_NO;
	}
	public String getM_ID() {
		return M_ID;
	}
	public void setM_ID(String m_ID) {
		M_ID = m_ID;
	}
	public String getCUS_TITLE() {
		return CUS_TITLE;
	}
	public void setCUS_TITLE(String cUS_TITLE) {
		CUS_TITLE = cUS_TITLE;
	}
	public String getCUS_IMG_COPY() {
		return CUS_IMG_COPY;
	}
	public void setCUS_IMG_COPY(String cUS_IMG_COPY) {
		CUS_IMG_COPY = cUS_IMG_COPY;
	}
	
}
