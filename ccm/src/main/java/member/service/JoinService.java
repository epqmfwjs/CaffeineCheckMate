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

public class JoinService {

		String returnPage;
	public String joinInsert(MemberDTO memberDTO) 
			throws IOException, ClassNotFoundException, SQLException {
		Connection conn = null;
		conn = ConnectionProvider.getConnection();
		conn.setAutoCommit(false);
		MemberDAO memberDAO = new MemberDAO();	
		//DAO메소드호출 : DTO에저장한값을들고 가서 DB에 정보저장
		returnPage = memberDAO.insert(memberDTO,conn); 
		return returnPage;  
	}
	//비번병경 메소드
	public String password(String pw1,String pw2,String alert,String formValue,HttpServletRequest request, HttpServletResponse response) throws IOException {
		PrintWriter out = response.getWriter();
		HttpSession session = request.getSession(false);
		String pw3 = (String)session.getAttribute("AUTH_USER_PWD");
		String result = null;
		
		if(formValue.equals("passwordChange")) {
			if(pw1.equals(pw2) && !pw1.equals(pw3)) {
				System.out.println("변경비번 같고 변경비번과 원래 비번은 틀리고");
				result = pw1;
			}else {
				 out.println("<script>alert('비밀번호가 일치하지 않거나 기존비밀번호와 같습니다.');"
					 		+ "location.href=" + alert + "</script>");
					 out.flush();
			}
		}
		return result;
	}
	public String password(String pw1,String pw2,String alert,HttpServletRequest request, HttpServletResponse response) throws IOException {
		PrintWriter out = response.getWriter();
		String result = null;
		
			if(pw1.equals(pw2)){
				result = pw1;
		}else{
			 out.println("<script>alert('비밀번호가 일치하지 않습니다.');"
			 		+ "location.href=" + alert + "</script>");
			 out.flush();
		}
		return result;
	}
}