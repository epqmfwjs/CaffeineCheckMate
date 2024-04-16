package customRecipe.dto;

public class CustomBoardListDto {
	private int CUS_NO;
	private String M_NO;
	private String C_NO;
	private String cus_title;
	private String CUS_CONTENT; 
	private String CUS_REGDATE;
	private String CUS_SUMGOOD;
	private int CUS_IMG_NO;
	private String cus_img_realname;
	private int CUS_NUM;
	
	
	
	
	public int getcus_num() {
		return CUS_NUM;
	}
	public void setCUS_NUM(int CUS_NUM) {
		this.CUS_NUM = CUS_NUM;
	}
	public String getcus_img_realname() {
		return cus_img_realname;
	}
	public void setcus_img_realname(String cus_img_realname) {
		this.cus_img_realname = cus_img_realname;
	}
	public int getcus_img_no() {
		return CUS_IMG_NO;
	}
	public void setCUS_IMG_NO(int cUS_IMG_NO) {
		this.CUS_IMG_NO = cUS_IMG_NO;
	}
	public String getcus_img_path() {
		return CUS_IMG_PATH;
	}
	public void setcus_img_path(String CUS_IMG_PATH) {
		this.CUS_IMG_PATH = CUS_IMG_PATH;
	}
	private String CUS_IMG_PATH;
	
	
	public CustomBoardListDto(int cus_no2, String m_no2, String c_no2, String cus_title2, String cus_content2,
			String cus_regdate2, String cus_sumgood2, int cus_img_no2, String cus_img_path2) {
		this.CUS_NO=cus_no2;
		this.M_NO=m_no2;
		this.C_NO=c_no2;
		this.cus_title=cus_title2;
		this.CUS_CONTENT=cus_content2;
		this.CUS_REGDATE=cus_regdate2;
		this.CUS_SUMGOOD=cus_sumgood2;
		this.CUS_IMG_NO=cus_img_no2;
		this.CUS_IMG_PATH=cus_img_path2;
		
	}
	public CustomBoardListDto(int cUS_NO2, String M_NO2, String c_NO2, String cus_title2, String cUS_CONTENT2,
			String cUS_REGDATE2, String cUS_SUMGOOD2) {
		this.CUS_NO=cUS_NO2;
		this.M_NO=M_NO2;
		this.C_NO=c_NO2;
		this.cus_title=cus_title2;
		this.CUS_CONTENT=cUS_CONTENT2;
		this.CUS_REGDATE=cUS_REGDATE2;
		this.CUS_SUMGOOD=cUS_SUMGOOD2;
		
	}
	public CustomBoardListDto() {
	}
	
	public int getcus_no() {
		return CUS_NO;
	}
	public void setCUS_NO(int cUS_NO) {
		this.CUS_NO = cUS_NO;
	}
	public String getm_no() {
		return M_NO; 
	}
	public void setM_NO(String M_NO) {
		this.M_NO = M_NO;
	}
	public String getc_no() {
		return C_NO;
	}
	public void setC_NO(String c_NO) {
		this.C_NO = c_NO;
	}
	public String getcus_title() {
		return cus_title;
	}
	public void setcus_title(String cus_title) {
		this.cus_title = cus_title;
	}
	public String getcus_content() {
		return CUS_CONTENT;
	}
	public void setCUS_CONTENT(String cUS_CONTENT) {
		this.CUS_CONTENT = cUS_CONTENT;
	}
	public String getcus_regdate() {
		return CUS_REGDATE;
	}
	public void setCUS_REGDATE(String cUS_REGDATE) {
		this.CUS_REGDATE = cUS_REGDATE;
	}
	public String getcus_sumgood() {
		return CUS_SUMGOOD;
	}
	public void setCUS_SUMGOOD(String cUS_SUMGOOD) {
		this.CUS_SUMGOOD = cUS_SUMGOOD;
	}
	
	
}
