package coffeeList.dto;


public class Coffee {
	int C_NO;
	int C_CAFFEINE;
	String C_IMAGE;
	
	public Coffee(int C_NO, int C_CAFFEINE, String C_IMAGE) {
		this.C_NO=C_NO;
		this.C_CAFFEINE=C_CAFFEINE;
		this.C_IMAGE=C_IMAGE;
	}
	
	public int getC_NO() {
		return C_NO;
	}
	public void setC_NO(int c_NO) {
		C_NO = c_NO;
	}
	public int getC_CAFFEINE() {
		return C_CAFFEINE;
	}
	public void setC_CAFFEINE(int c_CAFFEINE) {
		C_CAFFEINE = c_CAFFEINE;
	}
	
	public String getC_IMAGE() {
		return C_IMAGE;
	}
	public void setC_IMAGE(String c_IMAGE) {
		C_IMAGE = c_IMAGE;
	}
}
