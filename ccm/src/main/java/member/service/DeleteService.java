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
			
			
//			SET AUTOCOMMIT = 0;
//			SET FOREIGN_KEY_CHECKS = 0;
//			delete from ccm.member where M_ID = ?;
//			SET FOREIGN_KEY_CHECKS = 1;
//			COMMIT;
			
//			String query = "DELETE FROM ccm.member WHERE M_ID = ?";		
					//"delete from ccm.member where M_ID = ?";
			String deleteID = memberDTO.getDtoID();
			result = memberDAO.deleteMember(deleteID,conn);
			if(result == true) {
				System.out.println("딜리트메소드 다녀와서 if문 트루로 들어옴");
				 returnPage = "/views/screens/okDelete.jsp";
				 session.invalidate();
			}else {
				System.out.println("딜리트메소드 다녀와서 else로 들어옴");
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
