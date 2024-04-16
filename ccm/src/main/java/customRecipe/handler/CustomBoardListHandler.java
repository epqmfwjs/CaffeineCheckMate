package customRecipe.handler;


import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import connection.ConnectionProvider;
import controller.CommandHandler;
import customRecipe.dao.CustomBoardListDao;
import customRecipe.dto.CustomBoardListDto;
import customRecipe.service.CustomBoardListService;
import customRecipe.service.CustomBoardViewService;
import jdbc.JdbcUtil;


public class CustomBoardListHandler  implements CommandHandler {
 
@Override
public String process(HttpServletRequest request, HttpServletResponse response) throws IOException, SQLException {
     CustomBoardListDao dao = new CustomBoardListDao();
     Connection con = null;
     con = ConnectionProvider.getConnection();
	 int allcount = dao.allCount(con);
	 request.setAttribute("allcount", allcount);
	 JdbcUtil.close(con);
	 
	  
	 return "CustomBoardList.jsp";
}
}
