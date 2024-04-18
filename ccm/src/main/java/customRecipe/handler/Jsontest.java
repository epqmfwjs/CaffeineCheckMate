package customRecipe.handler;

import java.io.BufferedReader;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;

@WebServlet("/Jsontest.do")
public class Jsontest extends HttpServlet {
	
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String a = request.getParameter("searchTerm");
		System.out.println(a);
		
		
	    // 검색어(searchTerm)를 사용하여 필요한 작업 수행
	}
}
