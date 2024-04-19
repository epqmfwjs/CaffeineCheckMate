package coffeeList.dto;

public class Coffee {
	int C_NO;
	String C_NAME;
	String C_BRAND;
	int C_CAFFEINE;
	int C_SACCHARIDE;
	int C_CALORIE;
	String C_CONTENT;
	String C_TYPE;
	String C_STAGE;
	String C_IMG_REAL;
	String C_IMG_COPY;
	int C_FAVORITE;
	String C_IMAGE;
	
	//list 조회
	public Coffee(int C_NO,String C_NAME,String C_BRAND,int C_CAFFEINE,String C_IMG_COPY) {
		this.C_NO = C_NO;
		this.C_NAME = C_NAME;
		this.C_BRAND = C_BRAND;
		this.C_CAFFEINE = C_CAFFEINE;
		this.C_IMG_COPY = C_IMG_COPY;
	}
	
	//list Detail 조회
	public Coffee
		(int C_NO,String C_NAME,String C_BRAND,int C_CAFFEINE,int C_SACCHARIDE,int C_CALORIE,String C_CONTENT,String C_IMG_COPY) {
		this.C_NO = C_NO;
		this.C_NAME = C_NAME;
		this.C_BRAND = C_BRAND;
		this.C_CAFFEINE = C_CAFFEINE;
		this.C_SACCHARIDE = C_SACCHARIDE;
		this.C_CALORIE = C_CALORIE;
		this.C_CONTENT = C_CONTENT;
		this.C_IMG_COPY = C_IMG_COPY;
	}
	//list Add 추가
	public Coffee
		(String C_NAME,String C_BRAND,int C_CAFFEINE,int C_SACCHARIDE,int C_CALORIE,String C_CONTENT, String C_TYPE, String C_STAGE, String C_IMG_REAL) {
	this.C_NAME = C_NAME;
	this.C_BRAND = C_BRAND;
	this.C_CAFFEINE = C_CAFFEINE;
	this.C_SACCHARIDE = C_SACCHARIDE;
	this.C_CALORIE = C_CALORIE;
	this.C_CONTENT = C_CONTENT;
	this.C_TYPE = C_TYPE;
	this.C_STAGE = C_STAGE;
	this.C_IMG_REAL = C_IMG_REAL;
	}

	public Coffee(int C_NO, String C_NAME, int C_CAFFEINE, String C_IMAGE) {
		this.C_NO=C_NO;
		this.C_NAME = C_NAME;
		this.C_CAFFEINE=C_CAFFEINE;
		this.C_IMAGE=C_IMAGE;
	}
		
	public String getC_IMAGE() {
		return C_IMAGE;
	}

	public void setC_IMAGE(String c_IMAGE) {
		C_IMAGE = c_IMAGE;
	}

	public void setC_CAFFEINE(int c_CAFFEINE) {
		C_CAFFEINE = c_CAFFEINE;
	}

	public int getC_NO() {
		return C_NO;
	}
	public void setC_NO(int c_NO) {
		C_NO = c_NO;
	}
	public String getC_NAME() {
		return C_NAME;
	}
	public void setC_NAME(String c_NAME) {
		C_NAME = c_NAME;
	}
	public String getC_BRAND() {
		return C_BRAND;
	}
	public void setC_BRAND(String c_BRAND) {
		C_BRAND = c_BRAND;
	}
	public int getC_SACCHARIDE() {
		return C_SACCHARIDE;
	}
	public void setC_SACCHARIDE(int c_SACCHARIDE) {
		C_SACCHARIDE = c_SACCHARIDE;
	}
	public int getC_CALORIE() {
		return C_CALORIE;
	}
	public void setC_CALORIE(int c_CALORIE) {
		C_CALORIE = c_CALORIE;
	}
	public String getC_CONTENT() {
		return C_CONTENT;
	}
	public void setC_CONTENT(String c_CONTENT) {
		C_CONTENT = c_CONTENT;
	}
	public String getC_TYPE() {
		return C_TYPE;
	}
	public void setC_TYPE(String c_TYPE) {
		C_TYPE = c_TYPE;
	}
	public String getC_STAGE() {
		return C_STAGE;
	}
	public void setC_STAGE(String c_STAGE) {
		C_STAGE = c_STAGE;
	}
	public int getC_FAVORITE() {
		return C_FAVORITE;
	}
	public void setC_FAVORITE(int c_FAVORITE) {
		C_FAVORITE = c_FAVORITE;
	}
	public String getC_IMG_REAL() {
		return C_IMG_REAL;
	}
	public void setC_IMG_REAL(String c_IMG_REAL) {
		C_IMG_REAL = c_IMG_REAL;
	}
	public String getC_IMG_COPY() {
		return C_IMG_COPY;
	}
	public void setC_IMG_COPY(String c_IMG_COPY) {
		C_IMG_COPY = c_IMG_COPY;
	}
	
	public int getC_CAFFEINE() {
		return C_CAFFEINE;
	}
	public void setC_CAFFAINE(int c_CAFFAINE) {
		C_CAFFEINE = c_CAFFAINE;
	}
	
}	

