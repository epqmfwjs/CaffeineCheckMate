package customRecipe.dto;

public class CustomBoardHashDto {
	private String shot;
    private String milkType;
    private String syrupType;
    private String toppingType;
    private String decaffeinated;

    // 기본 생성자
    public CustomBoardHashDto() {}
    

    public CustomBoardHashDto(String shot, String milkType, String syrupType, String toppingType, String decaffeinated) {
		this.shot = shot;
		this.milkType = milkType;
		this.syrupType = syrupType;
		this.toppingType = toppingType;
		this.decaffeinated = decaffeinated;
	}


	// getter 및 setter 메서드
    public String getShot() {
        return shot;
    }

    public void setShot(String shot) {
        this.shot = shot;
    }

    public String getMilkType() {
        return milkType;
    }

    public void setMilkType(String milkType) {
        this.milkType = milkType;
    }

    public String getSyrupType() {
        return syrupType;
    }

    public void setSyrupType(String syrupType) {
        this.syrupType = syrupType;
    }

    public String getToppingType() {
        return toppingType;
    }

    public void setToppingType(String toppingType) {
        this.toppingType = toppingType;
    }

    public String getDecaffeinated() {
        return decaffeinated;
    }

    public void setDecaffeinated(String decaffeinated) {
        this.decaffeinated = decaffeinated;
    }

    // toString 메서드
    @Override
    public String toString() {
        return "Cus_HashDto{" +
                "shot=" + shot +
                ", milkType='" + milkType + '\'' +
                ", syrupType='" + syrupType + '\'' +
                ", toppingType='" + toppingType + '\'' +
                ", decaffeinated='" + decaffeinated + '\'' +
                '}';
    }
}

