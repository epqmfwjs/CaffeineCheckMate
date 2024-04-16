package customRecipe.handler;


import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controller.CommandHandler;
import customRecipe.dto.CustomBoardListDto;
import customRecipe.service.CustomBoardViewService;

public class CustomBoardViewHandler  implements CommandHandler {
 
	@Override
public String process(HttpServletRequest request, HttpServletResponse response) {
	 
	 CustomBoardViewService service = new CustomBoardViewService();
		
	  
	 ArrayList<CustomBoardListDto> list= service.boardview(request, response);
	 request.setAttribute("list", list);
	
	  return "CustomBoardView.jsp";
}
}
