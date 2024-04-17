package member.service;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import connection.ConnectionProvider;
import member.dao.MemberDAO;
import member.dto.MemberDTO;

public class DeleteService {
	
		Connection conn = null;
		boolean result = false;
		String returnPage = null;
	public String deleteAction(MemberDTO memberDTO,HttpServletRequest request, HttpServletResponse response) throws IOException, SQLException{
		conn = ConnectionProvider.getConnection();
		conn.setAutoCommit(false);
		MemberDAO memberDAO = new MemberDAO();
		UpdateService updateService = new UpdateService();
		PrintWriter out = response.getWriter();
		HttpSession session = request.getSession(false);
				
		returnPage = updateService.UpdateStart(memberDTO,request,response);
		
		if(returnPage.equals("ok")) {
			String query = "delete from ccm.member where M_ID = ?";
			String deleteID = memberDTO.getDtoID();
			result = memberDAO.delete(deleteID,query,conn);
			if(result == true) {
				 returnPage = "/views/screens/okDelete.jsp";
				 session.invalidate();
			}else {
				 out.println("<script>alert('알수없는 오류로인해 회원정보를 확인할수없습니다.'); location.href='/views/screens/login.jsp';</script>");
				 session.invalidate();
				 out.flush();
			}
			conn.close();
		}
	return returnPage;
	}
	public String deleteCancelAction(MemberDTO memberDTO,HttpServletRequest request, HttpServletResponse response) throws IOException, SQLException{
		conn = ConnectionProvider.getConnection();
		conn.setAutoCommit(false);
		MemberDAO memberDAO = new MemberDAO();
		String cancelID = memberDTO.getDtoID();
		String cancelPW = memberDTO.getDtoPW();
		
		result = memberDAO.deleteCancelSelect(cancelID,cancelPW, conn);
		
		if(result == true) {
			Connection conn = ConnectionProvider.getConnection();
			conn.setAutoCommit(false);
			returnPage = memberDAO.deleteCancel(cancelID, conn);
		}else{
			returnPage = "false";
		}
		return returnPage;
	}
}
