package mypage.service;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.Map;
import java.time.LocalDate;

import connection.ConnectionProvider;
import jdbc.JdbcUtil;
import mypage.dao.FavoriteListDAO;
import mypage.dao.HealthLightDAO;
import mypage.dao.MyRecipeDAO;
import mypage.dao.UserProfileDAO;
import mypage.dto.FavoriteListDTO;
import mypage.dto.HealthLightDTO;
import mypage.dto.MyRecipeDTO;
import mypage.dto.MypagesDTO;
import mypage.dto.UserProfileDTO;

public class MypageService {
	
	UserProfileDAO userprofiledao = new UserProfileDAO(); //유저 프로필
	MyRecipeDAO myrecipedao = new MyRecipeDAO(); //내가 작성한 레시피
	FavoriteListDAO favoritelistdao = new FavoriteListDAO(); //즐겨찾기목록
	HealthLightDAO healthlightdao = new HealthLightDAO(); //카페인 섭취량에 따른 캘린더
	
	//내 프로필 보여주기
	public MypagesDTO showMyProfile(String memberId) {
		Connection conn = null;
		MypagesDTO mypagedto = null;
		//오늘 날짜 받아오기
		String dateString = LocalDate.now().toString();
		
		Map<String,UserProfileDTO> upMap = null;
		Map<String, MyRecipeDTO> mrecipeMap = null;
		Map<String,FavoriteListDTO> favlistMap = null;
		Map<String, HealthLightDTO> hlightdtoMap = null;
		try {
			conn = ConnectionProvider.getConnection();
			
			//프로필 정보 불러오기
			upMap = userprofiledao.ShowMyPF(memberId, conn);
			//내가 작성한 레시피 불러오기(회원ID,제품넘버,게시글 제목,이미지,제품넘버,게시글 제목) -> 두개 dao 합치기~!!!!!!
			mrecipeMap = myrecipedao.getRecipe(memberId, conn);
			//즐겨찾기한 목록 불러오기
			favlistMap = favoritelistdao.getFavList(memberId, conn);
			//캘린더 - 오늘 하루 섭취량에 따른 달력 색상 보여주기 (일단 먼저 오늘 색상 보여주기)
			hlightdtoMap = healthlightdao.getHealthLight(memberId, dateString, conn);
			
			//회원ID로 회원ID, 프로필 이미지 사본 이름(나중에 이미지 보여줄것) 가져오기
			
			return mypagedto;
		}catch (SQLException e) {
			
			return null;
		} finally {
			JdbcUtil.close(conn);
		}
	}
	
	//내가 쓴 레시피 불러오기
	public MypagesDTO showMyRecipe(String memberId) {
		Connection conn = null;
		MypagesDTO mypagedto = null;
		//오늘 날짜 받아오기
		String dateString = LocalDate.now().toString();
		
		Map<String,UserProfileDTO> upMap = null;
		Map<String, MyRecipeDTO> mrecipeMap = null;
		Map<String,FavoriteListDTO> favlistMap = null;
		Map<String, HealthLightDTO> hlightdtoMap = null;
		try {
			conn = ConnectionProvider.getConnection();
			
			//프로필 정보 불러오기
			upMap = userprofiledao.ShowMyPF(memberId, conn);
			//내가 작성한 레시피 불러오기(회원ID,제품넘버,게시글 제목,이미지,제품넘버,게시글 제목) -> 두개 dao 합치기~!!!!!!
			mrecipeMap = myrecipedao.getRecipe(memberId, conn);
			//즐겨찾기한 목록 불러오기
			favlistMap = favoritelistdao.getFavList(memberId, conn);
			//캘린더 - 오늘 하루 섭취량에 따른 달력 색상 보여주기 (일단 먼저 오늘 색상 보여주기)
			hlightdtoMap = healthlightdao.getHealthLight(memberId, dateString, conn);
			return mypagedto;
		}catch (SQLException e) {
			
			return null;
		} finally {
			JdbcUtil.close(conn);
		}
	}
	
	
	//내가 즐겨찾기 한 항목 보여주기
	public MypagesDTO showMyFavoriteList(String memberId) {
		Connection conn = null;
		MypagesDTO mypagedto = null;
		//오늘 날짜 받아오기
		String dateString = LocalDate.now().toString();
		
		Map<String,UserProfileDTO> upMap = null;
		Map<String, MyRecipeDTO> mrecipeMap = null;
		Map<String,FavoriteListDTO> favlistMap = null;
		Map<String, HealthLightDTO> hlightdtoMap = null;
		try {
			conn = ConnectionProvider.getConnection();
			
			//프로필 정보 불러오기
			upMap = userprofiledao.ShowMyPF(memberId, conn);
			//내가 작성한 레시피 불러오기(회원ID,제품넘버,게시글 제목,이미지,제품넘버,게시글 제목) -> 두개 dao 합치기~!!!!!!
			mrecipeMap = myrecipedao.getRecipe(memberId, conn);
			//즐겨찾기한 목록 불러오기
			favlistMap = favoritelistdao.getFavList(memberId, conn);
			//캘린더 - 오늘 하루 섭취량에 따른 달력 색상 보여주기 (일단 먼저 오늘 색상 보여주기)
			hlightdtoMap = healthlightdao.getHealthLight(memberId, dateString, conn);
			return mypagedto;
		}catch (SQLException e) {
			
			return null;
		} finally {
			JdbcUtil.close(conn);
		}
	}
	
	//오늘 섭취한 칼로리 양에 따른 달력 보여주기
	//実力不足で今日摂取したカフェイン量だけみせる★
	public MypagesDTO showMyHealthLight(String memberId) {
		Connection conn = null;
		MypagesDTO mypagedto = null;
		//오늘 날짜 받아오기
		String dateString = LocalDate.now().toString();
		
		Map<String,UserProfileDTO> upMap = null;
		Map<String, MyRecipeDTO> mrecipeMap = null;
		Map<String,FavoriteListDTO> favlistMap = null;
		Map<String, HealthLightDTO> hlightdtoMap = null;
		try {
			conn = ConnectionProvider.getConnection();
			
			//프로필 정보 불러오기
			upMap = userprofiledao.ShowMyPF(memberId, conn);
			//내가 작성한 레시피 불러오기(회원ID,제품넘버,게시글 제목,이미지,제품넘버,게시글 제목) -> 두개 dao 합치기~!!!!!!
			mrecipeMap = myrecipedao.getRecipe(memberId, conn);
			//즐겨찾기한 목록 불러오기
			favlistMap = favoritelistdao.getFavList(memberId, conn);
			//캘린더 - 오늘 하루 섭취량에 따른 달력 색상 보여주기 (일단 먼저 오늘 색상 보여주기)
			hlightdtoMap = healthlightdao.getHealthLight(memberId, dateString, conn);
			
			return mypagedto;
		}catch (SQLException e) {
			
			return null;
		} finally {
			JdbcUtil.close(conn);
		}
	}
	
	
	public MypagesDTO showMain() {
		Connection conn = null;
		MypagesDTO mypagedto = null;
		
		try {
			conn = ConnectionProvider.getConnection();
			
			return mypagedto;
		}catch(SQLException e) {
			
			return null;
		} finally {
			JdbcUtil.close(conn);
		}
		
		
	}
	
	
}
