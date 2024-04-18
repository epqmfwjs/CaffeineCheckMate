package global.dto;
import java.util.HashMap;
/*
 * 로그인 페이지에 들어갈 요소 정리
 */
import java.util.Map;

import favorite.dto.Favorite;

public class Main {
	HashMap<Integer, Favorite> favorties;
	int calculationResult=0;
	double recommendedIntake =400;
	String color = "#BFFE01";
//	추천레시피 관련필드
	
	public Main(HashMap favMap, int  calculatedResult) { //수정필요
		this.favorties = favMap;
		this.calculationResult = calculatedResult;
	}
	
	public HashMap<Integer, Favorite> getFavorties() {
		return favorties;
	}
	public void setFavorties(HashMap<Integer, Favorite> favorties) {
		this.favorties = favorties;
	}
	public int getCalculationResult() {
		return calculationResult;
	}
	public void setCalculationResult(int calculationResult) {
		this.calculationResult = calculationResult;
	}
	public String getColor() {
		return color;
	}
	public void setColor(String color) {
		this.color = color;
	}
	public double getRecommendedIntake() {
		return recommendedIntake;
	}
	public void setRecommendedIntake(double weight) {
		this.recommendedIntake = weight*6.4;
	}
}
