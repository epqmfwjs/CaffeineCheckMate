package mypage.handler;

import controller.CommandHandler;
import mypage.dto.MypagesDTO;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import mypage.service.MypageService;

public class MypageHandler extends HttpServlet implements CommandHandler {
	private static final long serialVersionUID = 1L;
	public static final String FORM_INDEX = "/index.jsp";
	public static final String FORM_MYPAGE = "/Mypage.jsp";
	public static final String M_ID = "CCM001";
	MypagesDTO mypages;
	
	private MypageService mypageService = new MypageService();

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		//response.getWriter().append("Served at: ").append(request.getContextPath());
		try {
			process(request, response);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
	}
	
//	public String process(HttpServletRequest req, HttpServletResponse res) throws Exception { 
//		HttpSession session = req.getSession(false); //세션이 없으면 null반환
//		
//		// 세션이 null이 아니고 세션에 "userId"속성이 있다면 해당 값을 가져온다. userId=세션 속성 이름
//		if (session != null && session.getAttribute("userId") != null) {
//			String userId = (String)session.getAttribute("userId");
//			// 로그인된 경우: mypage.jsp로 리다이렉트
//			return FORM_MYPAGE;
//		} else {
//			// 로그인되지 않은 경우: index.jsp로 리다이렉트
//			return FORM_INDEX;
//		}
//	}
	
	public String process(HttpServletRequest req, HttpServletResponse res) throws Exception { 
		String m_id = (String) req.getSession().getAttribute(M_ID);
		
		if(m_id != null) {
			mypages = mypageService.showMyProfile(m_id);
		}else {
			mypages = mypageService.showMain();
			
		}
		
		req.setAttribute("mypages", mypages);
		
		return FORM_MYPAGE;
	
	}
	
	

}
