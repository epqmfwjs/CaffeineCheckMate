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
	    
	    res.setContentType("application/json;charset=utf-8");
	    String json = new Gson().toJson(selectReplyList);
	    res.getWriter().write(json);
	    
	    JdbcUtil.close(conn);
	    
	    return "/CusReplyPage.jsp"; //null값으로 인해 오류난다. 응답 핸들러를 만들자 현재 뷰페이지 코드가 마지막에 들어감
	}

}
