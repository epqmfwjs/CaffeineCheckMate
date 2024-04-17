package mypage.dto;

import java.util.Map;

public class MypagesDTO {
	private Map<String,UserProfileDTO> updtoMap; //유저 프로필 map
	private Map<String, MyRecipeDTO> mRecipedto; // 내가 작성한 레시피 map(+이미지)
	//Favoritelist c_no 부분 수정 필요
	private Map<String,FavoriteListDTO> favlistMap; //즐겨찾기 목록 map(+이미지)
	private Map<String, HealthLightDTO> hlightdtoMap; // 카페인 캘린더 map
	
	
	public Map<String, UserProfileDTO> getUpdtoMap() {
		return updtoMap;
	}
	public void setUpdtoMap(Map<String, UserProfileDTO> updtoMap) {
		this.updtoMap = updtoMap;
	}
	public Map<String, MyRecipeDTO> getmRecipedto() {
		return mRecipedto;
	}
	public void setmRecipedto(Map<String, MyRecipeDTO> mRecipedto) {
		this.mRecipedto = mRecipedto;
	}
	public Map<String, FavoriteListDTO> getFavlistMap() {
		return favlistMap;
	}
	public void setFavlistMap(Map<String, FavoriteListDTO> favlistMap) {
		this.favlistMap = favlistMap;
	}
	public Map<String, HealthLightDTO> getHlightdtoMap() {
		return hlightdtoMap;
	}
	public void setHlightdtoMap(Map<String, HealthLightDTO> hlightdtoMap) {
		this.hlightdtoMap = hlightdtoMap;
	}
	

}
