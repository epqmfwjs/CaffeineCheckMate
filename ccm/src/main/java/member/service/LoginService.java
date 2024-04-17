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

public class LoginService {

	String returnPage = null;
	String result = null;
	Connection conn = null;
	public String loginTest(MemberDTO memberDTO,
			HttpServletRequest request, HttpServletResponse response) throws IOException, SQLException{
		conn = ConnectionProvider.getConnection();
		conn.setAutoCommit(false);
		MemberDAO memberDAO = new MemberDAO();
		PrintWriter out = response.getWriter();
		MemberDTO result = null;
		String loginValue = request.getParameter("loginValue");
		
		HttpSession session = request.getSession(false); // 기존 세션 가져오기 시도
		if(session == null) {
		    session = request.getSession(true); // 기존 세션 없으면 새로운 세션 생성
		}
			result = memberDAO.selectID(memberDTO,conn); // 1차 로그인 아이디 셀렉 없으면 false
			
			if(result.getDtoPRO().equals("false")) {
	// member 테이블에 아이디가 없다면 false를 받고 if 문들어옴 2차셀렉 member_backup 테이블조회
				MemberDTO backupresult = memberDAO.backupSelectID(memberDTO,conn);
				
				if(backupresult.getDtoID().equals(request.getParameter("loginId")) &&
						backupresult.getDtoPW().equals(request.getParameter("loginPw"))) {
					session.setAttribute("AUTH_USER_ID", backupresult.getDtoID());
					 out.println("<script>alert('탈퇴신청상태입니다.'); location.href="
						 		+ "'/views/screens/okDelete.jsp';"
						 		+ "</script>");
						 out.flush();
				}else {
				session.setAttribute("errMSG", "아이디나 비밀번호가 일치하지않습니다.");
				 out.println("<script>alert('로그인실패'); location.href="
				 		+ "'/views/screens/login.jsp';"
				 		+ "</script>");
				 out.flush();
				}
			}
			if(result.getDtoID().equals(request.getParameter("loginId")) &&
					result.getDtoPW().equals(request.getParameter("loginPw"))) {
				session.setAttribute("AUTH_USER_ID", result.getDtoID());
				session.setAttribute("AUTH_USER_NAME", result.getDtoNAME());
				session.setAttribute("AUTH_USER_SSN", result.getDtoSSN());
				session.setAttribute("AUTH_USER_EMAIL", result.getDtoEMAIL());
				session.setAttribute("AUTH_USER_NICKNAME", result.getDtoNICKNAME());
				session.setAttribute("AUTH_USER_TEL", result.getDtoTEL());
				session.setAttribute("AUTH_USER_GENDER", result.getDtoGENDER());
				session.setAttribute("AUTH_USER_SNS", result.getDtoSNS());
				returnPage = "/views/screens/testView.jsp";
			}else{
				if(result.getDtoPRO().equals("delete")) {
				 session.setAttribute("errMSG", "아이디나 비밀번호가 일치하지않습니다.");
				 out.println("<script>alert('정보확인실패'); location.href='/views/screens/updateRequest.jsp';</script>");
				 out.flush();
				}
				if(result.getDtoPRO().equals("edit")) {
					session.setAttribute("errMSG", "아이디나 비밀번호가 일치하지않습니다.");
					 out.println("<script>alert('로그인실패'); location.href='/views/screens/login.jsp';</script>");
					 out.flush();
				}
				if(loginValue.equals("loginValue")) {
					System.out.println("loginValue 로 들어옴");
					session.setAttribute("errMSG", "아이디나 비밀번호가 일치하지않습니다.");
					 out.println("<script>alert('로그인실패'); location.href='/views/screens/login.jsp';</script>");
					 out.flush();
				}
					}
		return returnPage;
	}
}


