package customRecipeReply.dto;

public class CusReplyDto {
	
	public CusReplyDto() {}
	
	private String m_id;
	private int cus_no;
	private int cus_re_no;
	private String cus_re_regdate;
	private String cus_re_content;
	
	public CusReplyDto(int cus_no, String cus_re_content) {
		this.cus_no = cus_no;
		this.cus_re_content = cus_re_content;
	}
	
	public CusReplyDto(int cus_no, String cus_re_regdate, String cus_re_content) {
		this.cus_no = cus_no;
		this.cus_re_regdate = cus_re_regdate;
		this.cus_re_content = cus_re_content;
	}
	
	public CusReplyDto(String m_id, int cus_no, int cus_re_no, String cus_re_regdate, String cus_re_content) {
		this.m_id = m_id;
		this.cus_no = cus_no;
		this.cus_re_no = cus_re_no;
		this.cus_re_regdate = cus_re_regdate;
		this.cus_re_content = cus_re_content;
	}

	public String getM_id() {
		return m_id;
	}
	public void setM_id(String m_id) {
		this.m_id = m_id;
	}
	
	public int getCus_no() {
		return cus_no;
	}
	public void setCus_no(int cus_no) {
		this.cus_no = cus_no;
	}
	
	public int getCus_re_no() {
		return cus_re_no;
	}
	public void setCus_re_no(int cus_re_no) {
		this.cus_re_no = cus_re_no;
	}
	
	public String getCus_re_regdate() {
		return cus_re_regdate;
	}
	public void setCus_re_regdate(String cus_re_regdate) {
		this.cus_re_regdate = cus_re_regdate;
	}
	
	public String getCus_re_content() {
		return cus_re_content;
	}
	public void setCus_re_content(String cus_re_content) {
		this.cus_re_content = cus_re_content;
	}
	
	@Override
	public String toString() {
		return "Reply [cus_no=" + cus_no + ", cus_re_regdate=" + cus_re_regdate + ", cus_re_content=" + cus_re_content + "]";
	}

}
