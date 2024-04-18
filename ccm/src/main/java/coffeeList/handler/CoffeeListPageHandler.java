package coffeeList.handler;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.catalina.connector.Response;

import coffeeList.dto.Coffee;
import coffeeList.dto.CoffeeListPage;
import coffeeList.service.CoffeeListPageService;
import controller.CommandHandler;

public class CoffeeListPageHandler implements CommandHandler{
	
	CoffeeListPageService coffeeListService = new CoffeeListPageService();
	
	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception{
		try {
			System.out.println("리스트 뷰 핸들러 왔당");
			//반환되는 ArrayList<Coffee> coffeeList를 setAttribute에 저장
			
			Object mId =  request.getSession().getAttribute("AUTH_USER_ID");
	    	String memberId = mId != null? mId.toString() : null;
	    	if(memberId != null ) {
	    		request.setAttribute("CoffeeListPage", coffeeListService.getCoffeeList(memberId));
	    	} else { // 비로그인상태    		
	    		request.setAttribute("CoffeeListPage", coffeeListService.notAuthCoffeeList());	    		
	    	}
				
			System.out.println("리스트 뷰 핸들러 리턴 전");
			
			return "/views/screens/coffeeList_index.jsp";
		}catch (Exception e){
			System.out.println("coffeelist handler 에러 메시지: " + e.getMessage());
			return "에러";
		}
	}
}

//커멘드핸들러 임플리먼트
//전체적인 순서 핸들러 > 서비스 호출 > dao dto 처리 리턴
//핸들러 : 서비스에서 반환되는 coffeeList를 setAttribute에 저장됨