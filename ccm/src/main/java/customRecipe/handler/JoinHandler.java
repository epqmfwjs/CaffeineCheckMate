package customRecipe.handler;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controller.CommandHandler;





public class JoinHandler implements CommandHandler {
	
	@Override 
	public String process(HttpServletRequest request, HttpServletResponse response) throws ServletException,IOException{
 
		String returnPage = null;
		System.out.println("조인 왔다");
		returnPage = "testView.jsp";
		return returnPage; 
	}
}
