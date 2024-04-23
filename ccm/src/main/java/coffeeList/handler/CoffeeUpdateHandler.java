package coffeeList.handler;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import coffeeList.dto.Coffee;
import coffeeList.service.CoffeeUpdateService;
import controller.CommandHandler;

public class CoffeeUpdateHandler implements CommandHandler {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("UTF-8");
		
		try {
			//coffeeNo를 파라미터로 받아 WHERE절에 사용
			int coffeeNo = Integer.parseInt(request.getParameter("coffeeNo"));
			//수정에 필요한 파라미터는 모두 소문자
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
					(cname,cbrand,ccaffeine,csaccharide,ccalorie,ccontent,ctype,cstage,cimgreal,coffeeNo);
			
			CoffeeUpdateService coffeeUpdateService = new CoffeeUpdateService();
			coffeeUpdateService.updateCoffee(coffee);
			return "/coffeeList.do";
		}catch(Exception e) {
			System.out.println("coffee update handler 에러 메시지: " + e.getMessage());
			return "에러";
		}
	}
}
