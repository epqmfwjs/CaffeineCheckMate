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
		
		try {
			conn = ConnectionProvider.getConnection();
			
			//프로필 정보 불러오기
			//내가 작성한 레시피 불러오기(회원ID,제품넘버,게시글 제목,이미지,제품넘버,게시글 제목) -> 두개 dao 합치기~!!!!!!
			//즐겨찾기한 목록 불러오기
			//캘린더 - 오늘 하루 섭취량에 따른 달력 색상 보여주기 (일단 먼저 오늘 색상 보여주기)
			//実力不足で今日摂取したカフェイン量だけみせる★
			/* 레시피, 즐겨찾기, 캘린더 완성시 주석 해제
			mypagedto = new MypagesDTO(
					userprofiledao.ShowMyPF(memberId, conn),
					myrecipedao.getRecipe(memberId,conn),
					favoritelistdao.getFavList(memberId,conn),
					healthlightdao.getHealthLight(memberId,dateString, conn)
					);
			*/
			mypagedto = new MypagesDTO(
					userprofiledao.ShowMyPF(memberId, conn),
					null,
					null,
					null
					);
			
			
			//회원ID로 회원ID, 프로필 이미지 사본 이름(나중에 이미지 보여줄것) 가져오기
			return mypagedto;
		}catch (SQLException e) {
			e.printStackTrace();
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
	
	public UserProfileDTO getUserProfiles(String memberID) {
		Connection conn = null;
		UserProfileDTO updto = null;
		
		try {
			conn = ConnectionProvider.getConnection();
			updto = userprofiledao.ShowMyPF(memberID, conn);
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JdbcUtil.close(conn);
		}
		return updto;
	}
	//프로필 업데이트
	public boolean updateProfile(String memberId, String profileImage, int weight) {
		boolean isSuccess = false;
		Connection conn = null;
		
		try {
			conn = ConnectionProvider.getConnection();
			conn.setAutoCommit(false);
			
			//프로필 업데이트 수행
			userprofiledao.updateProfile(memberId, profileImage, weight, conn);
			
			conn.commit();
			isSuccess = true;
		} catch (Exception e) {
			JdbcUtil.rollback(conn);
			e.printStackTrace();
		} finally {
			JdbcUtil.close(conn);
		}
		return isSuccess;
	}
	
}


























