package customRecipeReply.handler;

import java.sql.Connection;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import connection.ConnectionProvider;
import controller.CommandHandler;
import customRecipeReply.dto.CusReplyDto;
import customRecipeReply.service.CusReplyListService;
import jdbc.JdbcUtil;

public class CusReplyListHandler implements CommandHandler{
	
	@Override
	public String process(HttpServletRequest req, HttpServletResponse res) throws Exception {
		
		Connection conn = null;
		conn = ConnectionProvider.getConnection();
		
	    int cus_no = Integer.parseInt(req.getParameter("cus_no"));
	    ArrayList<CusReplyDto> selectReplyList = new CusReplyListService().selectReplyList(cus_no);
	    
	    JdbcUtil.close(conn);
	    
	    return "/CusReplyPage.jsp";

			
		}
}
