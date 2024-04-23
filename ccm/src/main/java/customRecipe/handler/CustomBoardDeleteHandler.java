package customRecipe.handler;

import controller.CommandHandler;
import customRecipe.service.CustomBoardDeleteService;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class CustomBoardDeleteHandler extends HttpServlet implements CommandHandler {
	
	public static final String FORM_VIEW = "되돌아갈 게시판";
    private CustomBoardDeleteService customBoardDeleteService = new CustomBoardDeleteService();
    
    public String process(HttpServletRequest req, HttpServletResponse res) throws Exception { 
    	
    	//세션에서 유저 정보 가져옴
    	Object mno =  req.getSession().getAttribute("AUTH_USER_ID");
    	String memberId = null;
    	if (mno != null) {
    		memberId = mno.toString();
    	}
    	
    	//글에서 작성자, 글번호 가져옴
    	String writerId = req.getAttribute("M_ID") != null? req.getAttribute("M_ID").toString() : null;
    	int cusNo = req.getAttribute("CUS_NO") != null? Integer.parseInt(req.getAttribute("CUS_NO").toString()) : 0;
    	
    	//세션의 유저와 작성자가 동일인물이지 확인
    	if (!memberId.equals(writerId)) {
    		return FORM_VIEW;
    	} else {
    		customBoardDeleteService.deleteRecipe(memberId, cusNo);
    		return "/CustomBoardListHandler.do";
    	}
    	
    	
    }

}
