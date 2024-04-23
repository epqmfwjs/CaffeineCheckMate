package coffeeList.handler;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import coffeeList.dto.Coffee;
import coffeeList.service.CoffeeAddService;
import controller.CommandHandler;

public class CoffeeAddHandler implements CommandHandler{
	
	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("UTF-8");
		
		System.out.println("여기는 오니..?");
		
		try {//파라미터 받은 값과 변수는 _없이 모두 소문자
			String cname = request.getParameter("cname");
			String cbrand = request.getParameter("cbrand");
			int ccaffeine = Integer.parseInt(request.getParameter("ccaffeine"));
			int csaccharide = Integer.parseInt(request.getParameter("csaccharide"));
			int ccalorie = Integer.parseInt(request.getParameter("ccalorie"));
			String ccontent = request.getParameter("ccontent");
			String ctype = request.getParameter("ctype");
			String cstage = request.getParameter("cstage");
			String cimgreal = request.getParameter("cimgreal");
			
			Coffee coffee = new Coffee
					(cname,cbrand,ccaffeine,csaccharide,ccalorie,ccontent,ctype,cstage,cimgreal);
			
			CoffeeAddService coffeeAddService = new CoffeeAddService();
			coffeeAddService.addCoffee(coffee);
			System.out.println("여기까진..? 오니..?");
			
			return "/coffeeList.do";
		} catch (Exception e) {
			System.out.println("Coffee delete handler 에러 메시지: " + e.getMessage());
            return "에러";
		}
	}
}
