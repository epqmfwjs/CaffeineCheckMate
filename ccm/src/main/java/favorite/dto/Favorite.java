package favorite.dto;

import java.sql.Date;

public class Favorite {

	private String memberId;
	private int C_NO;
	private String coffeeName;
	private Date favDate;
	private String C_IMAGE;
	
	public Favorite(String m_ID, int c_NO, String c_NAME, Date c_FAV_DATE, String c_IMAGE) {
		this.memberId = m_ID;
		this.C_NO = c_NO;
		this.coffeeName = c_NAME;
		this.favDate = c_FAV_DATE;
		this.C_IMAGE = c_IMAGE;
	}

	public String getMemberId() {
		return memberId;
	}

	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}

	public int getCoffeeNo() {
		return C_NO;
	}

	public void setCoffeeNo(int coffeeNo) {
		this.C_NO = coffeeNo;
	}

	public String getCoffeeName() {
		return coffeeName;
	}

	public void setCoffeeName(String coffeeName) {
		this.coffeeName = coffeeName;
	}

	public Date getFavDate() {
		return favDate;
	}

	public void setFavDate(Date favDate) {
		this.favDate = favDate;
	}

	public String getCoffeeImage() {
		return C_IMAGE;
	}

	public void setCoffeeImage(String coffeeImage) {
		this.C_IMAGE = coffeeImage;
	}


}
