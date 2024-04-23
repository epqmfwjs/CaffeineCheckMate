package member.service;

import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import connection.ConnectionProvider;
import member.dao.MemberDAO;

public class CheckService {

	Connection conn = null;
	public int checkTest(String parameter,String query,
			HttpServletRequest request, HttpServletResponse response) throws IOException, SQLException{
		conn = ConnectionProvider.getConnection();
		conn.setAutoCommit(false);
		MemberDAO memberDAO = new MemberDAO();	
		
		int	result = memberDAO.checkSystem(parameter,query,conn);					
		if (conn != null) conn.close();
		return result;
	}
}


