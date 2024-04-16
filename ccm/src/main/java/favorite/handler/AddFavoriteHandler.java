package favorite.handler;

import controller.CommandHandler;
import favorite.service.AddFavoriteService;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


public class AddFavoriteHandler extends HttpServlet implements CommandHandler {
	private static final long serialVersionUID = 1L;
	public static final String FORM_VIEW = "/index.jsp";
	private AddFavoriteService addFavoriteService = new AddFavoriteService();
	

    public String process(HttpServletRequest req, HttpServletResponse res) throws Exception {
    	Integer memberNo = (Integer) req.getSession().getAttribute("M_NO");
    	Integer coffeeNo = Integer.parseInt(req.getParameter("C_NO"));
    	
    	System.out.println("addfavorite.do");
    	
    	if (memberNo != null && coffeeNo != null) {
    		try {
    			boolean success =  addFavoriteService.addFavorite(memberNo, coffeeNo);
    			if(!success) {
    				req.setAttribute("addFavAttempt", false);
    			} else {
    				req.setAttribute("addFavAttempt", true);
    			}
    			return "/views/screens/test.jsp";
    		} catch (Exception e) {
    			System.out.println("AddFavoriteHandler process에서 오류발생");
    		} return FORM_VIEW;    		
    	} else {
    		return FORM_VIEW;
    	}
    }
    
}