package customRecipeReply.handler;

import java.sql.Connection;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import connection.ConnectionProvider;
import controller.CommandHandler;
import customRecipeReply.dto.CusReplyDto;
import customRecipeReply.service.CusReplyInsertService;
import jdbc.JdbcUtil;

public class CusReplyInsertHandler implements CommandHandler{
	
	@Override
	public String process(HttpServletRequest req, HttpServletResponse res) throws Exception {
		System.out.println("-----1-----");
		Connection conn = null;
		conn = ConnectionProvider.getConnection();
		
		System.out.println("-----2-----");
		String m_id = req.getParameter("m_id");
		int cus_no = Integer.parseInt(req.getParameter("cus_no"));
        String cus_re_content = req.getParameter("cus_re_content");

        System.out.println("-----2-----");
        CusReplyDto reply = new CusReplyDto();
        reply.setM_id(m_id);
        reply.setCus_no(cus_no);
        reply.setCus_re_content(cus_re_content);

        System.out.println("-----2-----");
        int result = new CusReplyInsertService().insertReply(reply);
        res.getWriter().print(result);
        
        JdbcUtil.close(conn);

        return "CusReplyList.do";
	}
}
