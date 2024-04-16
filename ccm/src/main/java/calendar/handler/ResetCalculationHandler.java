package calendar.handler;

import controller.CommandHandler;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import calendar.service.ResetCalculationService;


public class ResetCalculationHandler extends HttpServlet implements CommandHandler {
	private static final long serialVersionUID = 1L;
	public static final String FORM_VIEW = "/index.jsp";
	private ResetCalculationService resetCalculationService = new ResetCalculationService();
	

    public String process(HttpServletRequest req, HttpServletResponse res) throws Exception { 
    	Integer memberNo = (Integer) req.getSession().getAttribute("M_NO");
    	
    	if (memberNo != null) {
    		try {
    			resetCalculationService.Reset(memberNo);
    			return "/views/screens/test.jsp";
    		} catch (Exception e) {
    			System.out.println("ResetCalculationHandler process에서 예외발생");
    		}return FORM_VIEW;    		
    	} else {
    		return FORM_VIEW;
    	}
    }

}
