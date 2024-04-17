package member.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import member.dto.MemberDTO;

public class MemberDAO {
	
// ------------------------insert-----------------------------------------	
	public String insert(MemberDTO memberDTO, Connection conn) {
	    String returnPage = null;
	    String query = "INSERT INTO ccm.member(M_ID, M_PASSWORD, M_NAME, M_NICKNAME, M_BIRTH, M_CREATEDATE, M_PHONENUMBER, M_MAIL, M_GENDER, M_ROLE, M_CANCEL, M_SNSYN) VALUES(?,?,?,?,?,DEFAULT,?,?,?,?,?,?)";
	    try (PreparedStatement pstmt = conn.prepareStatement(query)) {
	        pstmt.setString(1, memberDTO.getDtoID());
	        pstmt.setString(2, memberDTO.getDtoPW());
	        pstmt.setString(3, memberDTO.getDtoNAME());
	        pstmt.setString(4, memberDTO.getDtoNICKNAME());
	        pstmt.setString(5, memberDTO.getDtoSSN());
	        pstmt.setString(6, memberDTO.getDtoTEL());
	        pstmt.setString(7, memberDTO.getDtoEMAIL());
	        pstmt.setString(8, memberDTO.getDtoGENDER());
	        pstmt.setString(9, memberDTO.getDtoROLE());
	        pstmt.setString(10, memberDTO.getDtoCANCEL());
	        pstmt.setString(11, memberDTO.getDtoSNS());

	        int result = pstmt.executeUpdate();
	        if (result == 1) {
	            returnPage = "/views/screens/testView.jsp";
	            System.out.println("데이터 입력 완료!");
	            conn.commit();
	        } else {
	            returnPage = "/views/screens/joinRequest.jsp";
	            System.out.println("데이터 입력 실패!");
	            conn.rollback();
	        }
	    } catch (SQLException e) {
	        e.printStackTrace();
	        try {
	            if (conn != null) conn.rollback();
	        } catch (SQLException ex) {
	            ex.printStackTrace();
	        }
	    } finally {
	        try {
	            if (conn != null) conn.close();
	        } catch (SQLException e) {
	            e.printStackTrace();
	        }
	    }
	    return returnPage;
	}   

	//------------------------------------select-------------------------------------------
	//기본 아이디(Primary Key) select method
	public MemberDTO selectID(MemberDTO memberDTO, Connection conn) {
	    String query = "SELECT * FROM ccm.member WHERE M_ID = ?";
	    try (PreparedStatement pstmt = conn.prepareStatement(query)) {
	        pstmt.setString(1, memberDTO.getDtoID());
	        try (ResultSet rs = pstmt.executeQuery()) {
	            if (rs.next()) {
	                memberDTO.setDtoID(rs.getString("M_ID"));
	                memberDTO.setDtoPW(rs.getString("M_PASSWORD"));
	                memberDTO.setDtoNAME(rs.getString("M_NAME"));
	                memberDTO.setDtoSSN(rs.getString("M_BIRTH"));
	                memberDTO.setDtoEMAIL(rs.getString("M_MAIL"));
	                memberDTO.setDtoNICKNAME(rs.getString("M_NICKNAME"));
	                memberDTO.setDtoTEL(rs.getString("M_PHONENUMBER"));
	                memberDTO.setDtoGENDER(rs.getString("M_GENDER"));
	                memberDTO.setDtoSNS(rs.getString("M_SNSYN").equals("Y") ? "동의" : "거절");
	            } else {
	                memberDTO.setDtoPRO("false");
	            }
	        }
	    } catch (SQLException e) {
	        e.printStackTrace();
	    } 
	    return memberDTO;
	}
	// member_backup 조회
	public MemberDTO backupSelectID(MemberDTO memberDTO, Connection conn) {
	    System.out.println("백업셀렉들어옴");
		String query = "SELECT * FROM ccm.member_backup WHERE M_ID = ?";
	    try (PreparedStatement pstmt = conn.prepareStatement(query)) {
	        pstmt.setString(1, memberDTO.getDtoID());
	        try (ResultSet rs = pstmt.executeQuery()) {
	            if (rs.next()) {
	                memberDTO.setDtoID(rs.getString("M_ID"));
	                memberDTO.setDtoPW(rs.getString("M_PASSWORD"));
	                memberDTO.setDtoNAME(rs.getString("M_NAME"));
	                memberDTO.setDtoSSN(rs.getString("M_BIRTH"));
	                memberDTO.setDtoEMAIL(rs.getString("M_MAIL"));
	                memberDTO.setDtoNICKNAME(rs.getString("M_NICKNAME"));
	                memberDTO.setDtoTEL(rs.getString("M_PHONENUMBER"));
	                memberDTO.setDtoGENDER(rs.getString("M_GENDER"));
	                memberDTO.setDtoSNS(rs.getString("M_SNSYN").equals("Y") ? "동의" : "거절");
	            } else {
	                memberDTO.setDtoPRO("false");
	            }
	        }
	    } catch (SQLException e) {
	        e.printStackTrace();
	    } finally {
	        try {
	            if (conn != null) conn.close();
	        } catch (SQLException e) {
	            e.printStackTrace();
	        }
	    }
	    return memberDTO;
	}
	//중복체크 select method
	public int checkSystem(String value, String query, Connection conn) {
	    System.out.println(value);
	    int result = 0;
	    try (PreparedStatement pstmt = conn.prepareStatement(query)) {
	        pstmt.setString(1, value);
	        pstmt.setString(2, value);
	        try (ResultSet rs = pstmt.executeQuery()) {
	            result = rs.next() ? 1 : 0;
	        }
	    } catch (SQLException e) {
	        e.printStackTrace();
	    } 
//	    finally {
//	        try {
//	            if (conn != null) conn.close();
//	        } catch (SQLException e) {
//	            e.printStackTrace();
//	        }
//	    }
	    return result;
	}
	// 수정요청메소드
	//변경될 값 : value / pk조건 : id / 셀렉문 : select 
	public String update(String value, String id, String query, Connection conn) {
	    String returnPage = null;
	    int result = -1;
	    PreparedStatement pstmt = null;
	    try {
	        pstmt = conn.prepareStatement(query);
	        pstmt.setString(1, value);
	        pstmt.setString(2, id);
	        result = pstmt.executeUpdate();
	        if (result == 1) {
	            returnPage = "true";
	            conn.commit();
	        } else {
	            returnPage = "false";
	            conn.rollback();
	        }
	    } catch (SQLException e) {
	        e.printStackTrace();
	    } finally {
	        try {
	            if (pstmt != null) pstmt.close();
	            if (conn != null) conn.close();
	        } catch (SQLException e) {
	            e.printStackTrace();
	        }
	    }
	    return returnPage;
	}
	
	//---------------------------delete---------------------------------------
	    //회원탈퇴 메소드(삭제하면 db백업테이블로 이동되고 7일후 자동 삭제된다	
		public boolean delete(String deleteID,String query,Connection conn) {
		    boolean result = false;
		    int num = -1;
		    try {
		        PreparedStatement pstmt = conn.prepareStatement(query);
		        pstmt.setString(1, deleteID);
		        num = pstmt.executeUpdate();
		        if (num > 0) { // 삭제된 행이 있으면 true, 없으면 false
		            result = true;
		            conn.commit();
		        } else {
		            result = false;
		        }
		        pstmt.close();
		    } catch (SQLException e) {
		        e.printStackTrace();
		    }
		    return result;
		}
		public boolean deleteCancelSelect(String cancelID,String cancelPW,Connection conn) {
			boolean result = false;
		    try (PreparedStatement pstmt = conn.prepareStatement
		    		("select * from ccm.member_backup where M_ID = ?")) {
		        	pstmt.setString(1,cancelID);
		        try (ResultSet rs = pstmt.executeQuery()) {	        	
		        	if (rs.next()) {
		        		String dbid = rs.getString("M_ID");
		        		String dbpw = rs.getString("M_PASSWORD");
		        		if(cancelID.equals(dbid) && cancelPW.equals(dbpw) ) {		        			
		        			result = true;
		        		}else {
		        			result = false;
		        		}
		        	}else {
		        		result = false;
		        	}
		        }
		        pstmt.close();
		        conn.close();
		    }catch(SQLException e) {
		        e.printStackTrace();
		    }
			return result;
		}
		public String deleteCancel (String cancelID, Connection conn) throws SQLException {
			String returnPage = null;
			int result = -1;
			PreparedStatement pstmt = null;
			String sql = "insert into member (M_NO, M_ID, M_PASSWORD, M_NAME, M_NICKNAME, M_BIRTH, M_CREATEDATE, M_PHONENUMBER, M_MAIL, M_GENDER, M_ROLE, M_CANCEL, M_SNSYN) SELECT M_NO, M_ID, M_PASSWORD, M_NAME, M_NICKNAME, M_BIRTH, M_CREATEDATE, M_PHONENUMBER, M_MAIL, M_GENDER, M_ROLE, M_CANCEL, M_SNSYN FROM member_backup where member_backup.M_ID=?";
			    pstmt = conn.prepareStatement((sql));
			    pstmt.setString(1, cancelID);
			    result = pstmt.executeUpdate();
			    if (result == 1) {
		        		conn.commit();
		        		String query = "delete from member_backup where M_ID = ?";
		        		delete(cancelID,query,conn);
		        		returnPage = "/views/screens/okDeleteCancel.jsp";
		        	}else {
		        		returnPage = "false";
		        	}
			    return returnPage;
		}
}