package customRecipe.handler;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controller.CommandHandler;



public class LoginHandler implements CommandHandler {
	
 
	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws ServletException,IOException{
        String result= "testView.jsp";
         System.out.println("LoginHandler 왔다");
return result;
	}
}
	
