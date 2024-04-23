package member.handler;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import member.dto.MemberDTO;
import member.service.JoinService;
import controller.CommandHandler;

public class JoinMemberHandler implements CommandHandler {
	
	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws ServletException,IOException, SQLException{
		MemberDTO memberDTO = new MemberDTO();
		JoinService joinService = new JoinService();
		String returnPage = null;
		String joinPW = null;
		String allSSN = request.getParameter("birth-year") +"-"+ request.getParameter("birth-month") +"-"+request.getParameter("birth-day");
		String allEMAIL = request.getParameter("joinEmail1") + "@" +request.getParameter("joinEmail2");
		String allTEL = request.getParameter("joinTel1") +"-"+ request.getParameter("joinTel2") + "-"+ request.getParameter("joinTel3");
		String alert = "'/views/screens/joinRequest.jsp';";
		String formValue = request.getParameter("passwordvalue");
		
			if(formValue != null) {
				System.out.println("널아님");
				joinPW = joinService.password(request.getParameter("joinPw1"),request.getParameter("joinPw2"), alert,formValue,request, response);
			}else {
				System.out.println("널임");
				joinPW = joinService.password(request.getParameter("joinPw1"),request.getParameter("joinPw2"), alert,request, response);
			}
				memberDTO.setDtoID(request.getParameter("joinId"));
				memberDTO.setDtoPW(joinPW);
				memberDTO.setDtoNAME(request.getParameter("joinName"));
				memberDTO.setDtoSSN(allSSN);
				memberDTO.setDtoEMAIL(allEMAIL);
				memberDTO.setDtoNICKNAME(request.getParameter("joinNick"));
				memberDTO.setDtoTEL(allTEL);
				memberDTO.setDtoGENDER(request.getParameter("joinMW"));
				memberDTO.setDtoSNS(request.getParameter("joinSnsYN"));
				memberDTO.setDtoROLE("0");
				memberDTO.setDtoCANCEL("0");
		try {
			returnPage = joinService.joinInsert(memberDTO);
		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		}
		return returnPage; 
	}
}
