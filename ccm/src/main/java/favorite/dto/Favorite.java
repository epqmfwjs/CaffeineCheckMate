package favorite.dto;

import java.sql.Date;

public class Favorite {

	private String memberId;
	private int coffeeNo;
	private String coffeeName;
	private Date favDate;
	private String coffeeImage;
	
	public Favorite(String m_ID, int c_NO, String C_NAME, Date C_FAV_DATE, String c_IMAGE) {
		this.memberId = m_ID;
		this.coffeeNo = c_NO;
		this.coffeeName = C_NAME;
		this.favDate = C_FAV_DATE;
		this.coffeeImage = c_IMAGE;
	}

	public String getMemberId() {
		return memberId;
	}

	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}

	public int getCoffeeNo() {
		return coffeeNo;
	}

	public void setCoffeeNo(int coffeeNo) {
		this.coffeeNo = coffeeNo;
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
		return coffeeImage;
	}

	public void setCoffeeImage(String coffeeImage) {
		this.coffeeImage = coffeeImage;
	}


}
