package customRecipeReply.handler;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.sql.Connection;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.google.gson.JsonObject;

import connection.ConnectionProvider;
import customRecipeReply.dao.CusReplyDao;
import customRecipeReply.dto.CusReplyDto;
import jdbc.JdbcUtil;

@WebServlet("/CusReplyUpdateHandler.do")
public class CusReplyUpdateHandler extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	
        BufferedReader br = new BufferedReader(new InputStreamReader(request.getInputStream(), "utf-8"));
        StringBuilder sb = new StringBuilder();
        String line;
        
        while ((line = br.readLine()) != null) {
            sb.append(line).append('\n');
        }
        br.close();
        
        String json = sb.toString().trim();
        Gson gson = new Gson();
        
        JsonObject jsonObject = gson.fromJson(json, JsonObject.class);
        
        // JSON 객체에서 수정된 댓글 내용과 댓글 번호 추출
        String editedContent = jsonObject.get("cus_re_content").getAsString();
        int cus_re_no = jsonObject.get("cus_re_no").getAsInt();

        Connection conn = null;

        try {
            conn = ConnectionProvider.getConnection();
            CusReplyDao replyDao = new CusReplyDao();
            CusReplyDto reply = new CusReplyDto(editedContent, cus_re_no);
            int result = replyDao.updateReply(conn, reply);
            
            if (result > 0) {
                response.getWriter().write("성공");
            } else {
                response.getWriter().write("실패");
            }

        } catch (Exception e) {
            e.printStackTrace();
            response.getWriter().write("실패");

        } finally {
            JdbcUtil.close(conn);

        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	doGet(request, response);
    }
}
