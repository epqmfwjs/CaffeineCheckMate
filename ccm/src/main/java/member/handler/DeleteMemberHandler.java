package member.handler;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controller.CommandHandler;
import member.dto.MemberDTO;
import member.service.DeleteService;

public class DeleteMemberHandler implements CommandHandler {
	
	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws ServletException,IOException, SQLException{
		MemberDTO memberDTO = new MemberDTO();
		PrintWriter out = response.getWriter();
		String resultPage = null;	
		String deleteId = request.getParameter("identgyId");
		String requestValue = request.getParameter("Value");
		// 정보수정을위한 아이디/비밀번호확인 
		if(deleteId!=null && requestValue.equals("delete") ) {
			DeleteService deleteService = new DeleteService();
			memberDTO.setDtoID(request.getParameter("identgyId"));
			memberDTO.setDtoPW(request.getParameter("identgyPw"));
			memberDTO.setDtoPRO("delete");
			
			resultPage = deleteService.deleteAction(memberDTO, request, response);
				
		}else if(deleteId!=null && requestValue.equals("deleteCancel") ){
			DeleteService deleteService = new DeleteService();
			memberDTO.setDtoID(request.getParameter("identgyId"));
			memberDTO.setDtoPW(request.getParameter("identgyPw"));
			memberDTO.setDtoPRO("deleteCancel");
			
			resultPage = deleteService.deleteCancelAction(memberDTO, request, response);
			if(resultPage.equals("false")) {
				 out.println("<script>alert('정보확인실패.'); location.href='/views/screens/okDelete.jsp';</script>");
				 out.flush();
			}
		}
         return resultPage;
	}

	
}