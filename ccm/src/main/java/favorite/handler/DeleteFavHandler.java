package favorite.handler;

import controller.CommandHandler;
import favorite.service.DeleteFavService;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


public class DeleteFavHandler extends HttpServlet implements CommandHandler {
	private static final long serialVersionUID = 1L;
	public static final String FORM_VIEW = "/index.jsp";
	private DeleteFavService deleteFavService = new DeleteFavService();
	
    public String process(HttpServletRequest req, HttpServletResponse res) throws Exception { 
    	Object mno =  req.getSession().getAttribute("AUTH_USER_ID");
    	String memberId = null;
    	if (mno != null) {
    		memberId = mno.toString();
    	}
    	Integer coffeeNo = Integer.parseInt(req.getParameter("C_NO"));

    	try {
    		deleteFavService.deleteFav(memberId, coffeeNo);
    		return "/views/screens/test.jsp";
    	} catch (Exception e) {
    		System.out.println("AddFavoriteHandler process에서 오류발생");
    	} return FORM_VIEW;
    }

}
