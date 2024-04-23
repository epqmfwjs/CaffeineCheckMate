package customRecipe.handler;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controller.CommandHandler;
import customRecipe.service.CustomBoardAddService;


public class CustomBoardAddHandler implements CommandHandler {
	
	@Override
	public String process(HttpServletRequest request, HttpServletResponse response)
	{
		
		CustomBoardAddService service = new CustomBoardAddService();
		service.addList(request, response);
		
		
		
		return "/CustomBoardListHandler.do";
		}
}

