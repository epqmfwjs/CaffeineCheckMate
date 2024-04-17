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

public class UpdateService {

	
	//정보수정을위한 아이디/비번 재확인 메소드 (아이디비번체크&&처음로그인한아이디 다시한번체크)
	Connection conn = null;
	public String UpdateStart(MemberDTO memberDTO,
			HttpServletRequest request, HttpServletResponse response) throws IOException, SQLException{
		conn = ConnectionProvider.getConnection();
		conn.setAutoCommit(false);
		MemberDAO memberDAO = new MemberDAO();
		PrintWriter out = response.getWriter();
		HttpSession session = request.getSession(false);
		MemberDTO result = null;
		String returnPage = null;
		
			result = memberDAO.selectID(memberDTO,conn);
			
			if(result.getDtoPRO().equals("false")) {
				String returnAlert = "'/views/screens/testView.jsp';"; 
				session.setAttribute("errMSG", "아이디나 비밀번호가 일치하지않습니다.");
				 out.println("<script>alert('로그인실패'); location.href="
				 		+ returnAlert
				 		+ "</script>");
				 out.flush();
			}
			if(result.getDtoID().equals(request.getParameter("identgyId")) &&
					result.getDtoPW().equals(request.getParameter("identgyPw")) && 
					result.getDtoID().equals(session.getAttribute("AUTH_USER_ID"))) {

					session.setAttribute("AUTH_USER_UPDATENICKNAME", result.getDtoNICKNAME());
					session.setAttribute("AUTH_USER_UPDATETEL", result.getDtoTEL());
					session.setAttribute("AUTH_USER_UPDATESNS", result.getDtoSNS());
					System.out.println("일단  ok 반환전까지옴");
				returnPage = "ok";
			}else{
				if(result.getDtoPRO().equals("delete")) {
						 session.setAttribute("errMSG", "아이디나 비밀번호가 일치하지않습니다.");
						 out.println("<script>alert('입력정보오류'); location.href='/views/screens/updateRequest.jsp';</script>");
						 out.flush();
						 returnPage = "err";
				}else {
						 session.setAttribute("errMSG", "아이디나 비밀번호가 일치하지않습니다.");
						 out.println("<script>alert('입력정보오류'); location.href='/views/screens/testView.jsp';</script>");
						 out.flush();
						 returnPage = "err";
						}
					}
		return returnPage;
	}
	// sns수신여부 수정 메소드
	public String UpdateSNS(MemberDTO memberDTO , HttpServletRequest request, HttpServletResponse response) throws IOException, SQLException {
		conn = ConnectionProvider.getConnection();
		conn.setAutoCommit(false);
		HttpSession session = request.getSession(false);
		MemberDAO memberDAO = new MemberDAO();
		String result = null;
		String SNS1 = memberDTO.getDtoSNS();
		String SNS2 = (String)session.getAttribute("AUTH_USER_SNS");
		
			if(SNS2.equals(SNS1)) {
				System.out.println("수정사항없음");
			}else {
				System.out.println("수정사항발생");
				String selectId = (String)session.getAttribute("AUTH_USER_ID");
				String query = "update ccm.member set M_SNSYN = ? where M_ID=?";
				memberDTO.setDtoID(selectId);
				result = memberDAO.update(memberDTO.getDtoSNS(),selectId,query,conn);			
			}
			if(result=="true") {
				if(memberDTO.getDtoSNS().equals("Y")) {
					session.setAttribute("AUTH_USER_SNS","동의");
				}else {
					session.setAttribute("AUTH_USER_SNS","거절");
				}
				result = "/views/screens/updateRequest.jsp";
			}else {
				result = "/views/screens/testView.jsp";
			}
			return result;
		}
		//전화번호 수정 메소드
		public String UpdateTEL(MemberDTO memberDTO , HttpServletRequest request, HttpServletResponse response) throws IOException, SQLException {
			conn = ConnectionProvider.getConnection();
			conn.setAutoCommit(false);HttpSession session = request.getSession(false);
			PrintWriter out = response.getWriter();
			MemberDAO memberDAO = new MemberDAO();
			String result = null;
			String resultPage = null;
			String TEL1 = memberDTO.getDtoTEL();
			String TEL2 = (String)session.getAttribute("AUTH_USER_UPDATETEL");
	
				if(TEL2.equals(TEL1)) {
					System.out.println("수정사항없음");
					 out.println("<script>alert('기존 전화번호와 동일한 번호입니다.'); location.href='/views/screens/updateTEL.jsp';</script>");
					 out.flush();
				}else{
					String selectId = (String)session.getAttribute("AUTH_USER_ID");
					String query = "update member set M_PHONENUMBER = ? where M_ID=?";
					memberDTO.setDtoID(selectId);
					result = memberDAO.update(memberDTO.getDtoTEL(),selectId,query,conn);
				}
					if(result=="true") {
						System.out.println("서비스 트루");
						session.setAttribute("editOK", "editOK");
						resultPage = "/views/screens/updateTEL.jsp";
					}else {
						session.setAttribute("editCANCEL", "editCANCEL");
						resultPage = "/views/screens/testView.jsp";
				}
				return resultPage;
		}
		// 비밀번호변경 메소드
		public String updateOldPassword(String identgyId) throws SQLException {
			conn = ConnectionProvider.getConnection();
			conn.setAutoCommit(false);
			MemberDAO memberDAO =  new MemberDAO();
			MemberDTO memberDTO =  new MemberDTO();
			memberDTO.setDtoID(identgyId);
			MemberDTO result = memberDAO.selectID(memberDTO,conn);
			identgyId = result.getDtoPW();
			return identgyId;
		}
		
		public String updatePassword(String pw1, String pw2,String formValue,HttpServletRequest request, HttpServletResponse response) throws IOException, SQLException {
			conn = ConnectionProvider.getConnection();
			conn.setAutoCommit(false);
			HttpSession session = request.getSession(false);
			PrintWriter out = response.getWriter();
			String result = null;
			MemberDAO memberDAO = new MemberDAO();
			JoinService joinService = new JoinService();
			String alert = "'/views/screens/passwordChange.jsp';";
			String query = "update ccm.member set M_PASSWORD = ? where M_ID=?";
			String selectId = (String)session.getAttribute("AUTH_USER_ID");
			
			result = joinService.password(pw1, pw2, alert,formValue,request, response);
			String returnPage = memberDAO.update(result,selectId,query,conn);
			if(returnPage == "true") {
				System.out.println("true로들어옴");
				 out.println("<script>alert('Password 변경완료.');"
					 		+ "location.href="
					 		+ "'/views/screens/testView.jsp';"
					 		+ "</script>");
				 	session.invalidate();
					 out.flush();
			}else {
				 out.println("<script>alert('변경실패오류.');"
					 		+ "location.href="
					 		+ "'/views/screens/passwordChange.jsp';"
					 		+ "</script>");
					 out.flush();
			}
			return returnPage;
		}
}


