package customRecipe.service;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import connection.ConnectionProvider;
import customRecipe.dao.CustomBoardViewDao;
import customRecipe.dto.CustomBoardListDto;
import jdbc.JdbcUtil;

public class CustomBoardViewService {
	
	public ArrayList<CustomBoardListDto> boardview(HttpServletRequest request, HttpServletResponse response) {
		Connection con = null;
		CustomBoardViewDao dao = new CustomBoardViewDao();
		try {
			
			String num = request.getParameter("CUS_NUM");
			con = ConnectionProvider.getConnection();
			
			ArrayList<CustomBoardListDto> list = dao.boardview(con,num);
			
			
			
			request.setAttribute("list", list);
			return list;
			
			 
		} catch (SQLException e) {
			e.printStackTrace();
			JdbcUtil.rollback(con);
		}
		finally {
			JdbcUtil.close(con);
		}
		return null;
}
}

