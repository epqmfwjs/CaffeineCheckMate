package customRecipeReply.service;

import static jdbc.JdbcUtil.rollback;

import java.sql.Connection;
import java.sql.SQLException;

import connection.ConnectionProvider;
import customRecipeReply.dao.CusReplyDao;
import customRecipeReply.dto.CusReplyDto;
import jdbc.JdbcUtil;

public class CusReplyInsertService {
	
	/*댓글 삽입*/
	public int insertReply(CusReplyDto reply) throws SQLException {
		Connection conn = null;
		conn = ConnectionProvider.getConnection();
		
		int result = new CusReplyDao().insertReply(conn, reply);
		
		if(result>0) {
		}else {
			rollback(conn);
		}
		
		JdbcUtil.close(conn);
		
		return result;
		
	}
}
