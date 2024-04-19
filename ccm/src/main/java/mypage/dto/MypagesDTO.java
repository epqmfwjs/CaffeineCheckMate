package mypage.dto;

import java.util.Map;

public class MypagesDTO {
	private UserProfileDTO userProfileDTO; //유저 프로필 
	private MyRecipeDTO myRecipeDTO; // 내가 작성한 레시피 (+이미지)
	//Favoritelist c_no 부분 수정 필요
	private FavoriteListDTO favoriteListDTO; //즐겨찾기 목록 (+이미지)
	private HealthLightDTO healthLightDTO; // 카페인 캘린더 
	
	public MypagesDTO(UserProfileDTO userProfileDTO, MyRecipeDTO myRecipeDTO, FavoriteListDTO favoriteListDTO, HealthLightDTO healthLightDTO ) {
		this.userProfileDTO = userProfileDTO;
		this.myRecipeDTO = myRecipeDTO;
		this.favoriteListDTO = favoriteListDTO;
		this.healthLightDTO = healthLightDTO;
	}

	public UserProfileDTO getUserProfileDTO() {
		return userProfileDTO;
	}

	public void setUserProfileDTO(UserProfileDTO userProfileDTO) {
		this.userProfileDTO = userProfileDTO;
	}

	public MyRecipeDTO getMyRecipeDTO() {
		return myRecipeDTO;
	}

	public void setMyRecipeDTO(MyRecipeDTO myRecipeDTO) {
		this.myRecipeDTO = myRecipeDTO;
	}

	public FavoriteListDTO getFavoriteListDTO() {
		return favoriteListDTO;
	}

	public void setFavoriteListDTO(FavoriteListDTO favoriteListDTO) {
		this.favoriteListDTO = favoriteListDTO;
	}

	public HealthLightDTO getHealthLightDTO() {
		return healthLightDTO;
	}

	public void setHealthLightDTO(HealthLightDTO healthLightDTO) {
		this.healthLightDTO = healthLightDTO;
	}

	@Override
	public String toString() {
		return "MypagesDTO [userProfileDTO=" + userProfileDTO + ", myRecipeDTO=" + myRecipeDTO + ", favoriteListDTO="
				+ favoriteListDTO + ", healthLightDTO=" + healthLightDTO + "]";
	}
	
}
