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
//	 ArrayList<CustomBoardHashDto> list2= service.hashview(request, response);
	 
//	 request.setAttribute("list", list);
//	 request.setAttribute("list2", list2);
	 
	  return "/views/screens/CustomBoardView.jsp";
}
}
