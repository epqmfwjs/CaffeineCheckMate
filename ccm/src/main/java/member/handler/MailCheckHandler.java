package member.handler;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import controller.CommandHandler;
import member.dto.MemberDTO;
import member.service.EmailService;

public class MailCheckHandler implements CommandHandler {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws ServletException,IOException{
		String returnPage = "/views/screens/joinEmail.jsp";
		MemberDTO memberDTO = new MemberDTO();
		HttpSession session = request.getSession(false);
		EmailService emailService = new EmailService();
		String inputEmail1 = request.getParameter("joinEmail1")+"@"+request.getParameter("joinEmail2");
		System.out.println("첫번째 메일보낼때"+inputEmail1);
		System.out.println("두번째 모달창 " + request.getAttribute("inputCode"));
		System.out.println("두번째 모달창 히든 " + request.getAttribute("inputEmail"));
		String hidden = request.getParameter("hidden");
		System.out.println("히든값 "+hidden);
		switch (hidden) {
		case "emailCheck" :
			System.out.println(session.getAttribute("codeMail"));
			System.out.println(request.getParameter("input"));
			String pushCode = (String)session.getAttribute("codeMail");
			String iputCode = request.getParameter("input");
			boolean result = emailService.checkedMail(iputCode,pushCode);
			returnPage = result==true ? emailTrue(request,response) : emailFalse(request,response);
			break;
		case "emailinput" :
			memberDTO = emailService.emailSend(inputEmail1,request,response);
			session.setAttribute("code", memberDTO.getDtoEMAIL());
			System.out.println(session.getAttribute("code"));
			returnPage = "/views/screens/joinEmail.jsp";
		}
		return returnPage;
	}
	public String emailTrue(HttpServletRequest request,HttpServletResponse response) throws IOException {
		PrintWriter out = response.getWriter();
		out.println("<script>alert('인증성공!.'); location.href="
				+ "'/views/screens/joinRequest.jsp';"
				+ "self.close(); </script>");
		out.flush();
		return null;
	}
	public String emailFalse(HttpServletRequest request,HttpServletResponse response) throws IOException {
		PrintWriter out = response.getWriter();
		out.println("<script>alert('인증실패.'); location.href="
				+ "'/views/screens/joinRequest.jsp';"
				+ "self.close(); </script>");
		out.flush();
		return null;
	}
}