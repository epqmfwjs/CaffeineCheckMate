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

import connection.ConnectionProvider;
import customRecipeReply.dao.CusReplyDao;
import customRecipeReply.dto.CusReplyDto;
import jdbc.JdbcUtil;

@WebServlet("/CusReplyJsonInsertHandler.do")
public class CusReplyJsonInsertHandler extends HttpServlet {
	
	 protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 
		 	// 요청에서 JSON 데이터를 읽어옴
		   BufferedReader br = new BufferedReader(new InputStreamReader(request.getInputStream(), "utf-8"));
	        String json = "";
	        if (br != null) {
	            json = br.readLine();
	        }

	        // JSON 데이터를 자바 객체로 변환
	        Gson gson = new Gson();
	        CusReplyDto reply = gson.fromJson(json, CusReplyDto.class);

	        Connection conn = null;
	        
	        try {
	            conn = ConnectionProvider.getConnection();
	            CusReplyDao replyDao = new CusReplyDao();
	            replyDao.insertReply(conn, reply);
	            response.getWriter().write("Success");
	            
	        } catch (Exception e) {
	            e.printStackTrace();
	            response.getWriter().write("Error");
	            
	        } finally {
	            JdbcUtil.close(conn);
	            
	        }
	    }


		protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			doGet(request, response);
		}


}
