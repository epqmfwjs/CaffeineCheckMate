package coffeeList.handler;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import coffeeList.service.CoffeeDeleteService;
import controller.CommandHandler;

public class CoffeeDeleteHandler implements CommandHandler{

	@Override
    public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		try {
			int coffeeNo = Integer.parseInt(request.getParameter("coffeeNo"));
			
			CoffeeDeleteService coffeeDeleteService = new CoffeeDeleteService();
			
			return "삭제";
		} catch (Exception e) {
			System.out.println("Coffee delete handler 에러 메시지: " + e.getMessage());
            return "에러";
		}
	}				
}
