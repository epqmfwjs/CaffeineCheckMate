package customRecipeReply.service;

import static jdbc.JdbcUtil.close;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;

import connection.ConnectionProvider;
import customRecipeReply.dao.CusReplyDao;
import customRecipeReply.dto.CusReplyDto;
import jdbc.JdbcUtil;

public class CusReplyListService {
	
	public ArrayList<CusReplyDto> selectReplyList(int cus_no) throws SQLException{
		
		Connection conn = null;
		conn = ConnectionProvider.getConnection();
		
		ArrayList<CusReplyDto> cus_re_list = new CusReplyDao().selectReplyList(conn,cus_no);
		JdbcUtil.close(conn);
		
		return cus_re_list;
	}
}
