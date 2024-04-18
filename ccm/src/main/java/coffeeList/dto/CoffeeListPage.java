package coffeeList.dto;

import java.util.ArrayList;
import java.util.HashMap;

import favorite.dto.Favorite;
/*
 *  커피리스트 페이지(jsp)에 보여줄 데이터를 가지고 있는 dto
 * 
 */
public class CoffeeListPage {
	ArrayList<Coffee> coffeeList;
	HashMap<Integer,Favorite> coffeeFavMap = null;
	
	
	public CoffeeListPage(
			ArrayList<Coffee> coffeeList, 
			HashMap<Integer, Favorite> coffeeFavMap) {
		this.coffeeList = coffeeList;
		this.coffeeFavMap = coffeeFavMap;
	}
	public CoffeeListPage(ArrayList<Coffee> coffeeList) {
		this.coffeeList = coffeeList;
	}
	
	
	public ArrayList<Coffee> getCoffeeList() {
		return coffeeList;
	}
	public void setCoffeeList(ArrayList<Coffee> coffeeList) {
		this.coffeeList = coffeeList;
	}
	public HashMap<Integer, Favorite> getCoffeeFavMap() {
		return coffeeFavMap;
	}
	public void setCoffeeFavMap(HashMap<Integer, Favorite> coffeeFavMap) {
		this.coffeeFavMap = coffeeFavMap;
	}
	
	
}
