package member.handler;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import member.dto.MemberDTO;
import member.service.UpdateService;
import controller.CommandHandler;


public class UpdateMemberHandler implements CommandHandler {
	

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws ServletException,IOException, SQLException{
		MemberDTO memberDTO = new MemberDTO();
		UpdateService updateService = new UpdateService();
		HttpSession session = request.getSession(false);
		PrintWriter out = response.getWriter();
		
		String resultPage = "/views/screens/updateRequest.jsp";	
		String updateId = request.getParameter("identgyId");
		
		// 정보수정을위한 아이디/비밀번호확인 
		if(updateId!=null) {
			memberDTO.setDtoID(request.getParameter("identgyId"));
			memberDTO.setDtoPW(request.getParameter("identgyPw"));
			memberDTO.setDtoPRO("edit");
			updateService.UpdateStart(memberDTO, request, response);
		}else {
			System.out.println("정보확인완료상태");
		}
		//sns 수신여부수정
		String sns = request.getParameter("updateSnsYN");
		System.out.println(sns);
		    if (sns != null) {
		        System.out.println("sns 수정 요청 들어옴");
		        memberDTO.setDtoSNS(sns);
		        resultPage = updateService.UpdateSNS(memberDTO, request, response);
		    } else {
		        System.out.println("sns 수정 요청 없음");
		    }
		//전화번호수정

		    String tel1 = request.getParameter("updateTel1");
		    String tel2 = request.getParameter("updateTel2");
		    String tel3 = request.getParameter("updateTel3");
		    String tel = (tel1 != null ? tel1 : "null") + "-" + (tel2 != null ? tel2 : "null") + "-" + (tel3 != null ? tel3 : "null");
		    System.out.println("넘어온 tel: " + tel);
		    
		    if (!"null-null-null".equals(tel)) {
		        System.out.println("tel 수정 요청 들어옴");
		        memberDTO.setDtoTEL(tel);
		        resultPage = updateService.UpdateTEL(memberDTO, request, response);
		    } else {
		        System.out.println("입력이 없어서 요청이 없는 것 null-null-null");
		    }
		
		//패스워드 변경
		 
		String password = request.getParameter("updatePw0");
		String oldPasword = updateService.updateOldPassword((String)session.getAttribute("AUTH_USER_ID"));
				//(String)session.getAttribute("AUTH_USER_PWD");
		System.out.println("identgyId= "+ request.getParameter("identgyId"));
		System.out.println("oldPasword= "+ oldPasword);
/*		if(oldPasword==null) {
			 out.println("<script>alert('변경실패오류 로그인을 다시시도해주세요1');"
				 		+ "location.href="
				 		+ "'/views/screens/login.jsp';"
				 		+ "</script>");
				 out.flush();
			//resultPage = "updateRequest.jsp";*/
		 if(oldPasword.equals(password)){
			String pw1 = request.getParameter("updatePw1");
			String pw2 = request.getParameter("updatePw2");
			String formValue = request.getParameter("passwordvalue");
			resultPage = updateService.updatePassword(pw1,pw2,formValue,request, response);					
		}
         return resultPage;
	}
}