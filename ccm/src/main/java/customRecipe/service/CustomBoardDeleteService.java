package customRecipe.service;

import java.sql.Connection;

import connection.ConnectionProvider;
import customRecipe.dao.CustomBoardDelDao;
import jdbc.JdbcUtil;

/*
 *  삭제해야 되는것
 *  - 게시글
 *  - 이미지
 *  - 댓글
 *  - 해시태그
 * 
 * delete from ? where CUS_NO = ?
 * 
 */

public class CustomBoardDeleteService {
	
	CustomBoardDelDao customBoardDelDao = new CustomBoardDelDao();
	
	public void deleteRecipe(String memberId, String cusNo) {
		Connection conn = null;
		
		try {
			conn = ConnectionProvider.getConnection();
			conn.setAutoCommit(false);
			
			//삭제 서비스
			customBoardDelDao.deleteCus(memberId, cusNo, conn);
		
			conn.commit();
		}catch (Exception e) {
			System.out.println("deleteRecipe 에서 오류발생");
		}finally {
			JdbcUtil.close(conn);
		}
		
	}
}
