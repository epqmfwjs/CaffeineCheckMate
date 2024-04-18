package customRecipeReply.dao;

import static jdbc.JdbcUtil.close;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

import customRecipeReply.dto.CusReplyDto;

public class CusReplyDao {
	
	public CusReplyDao() {

	}
	
	
	/*댓글 삽입*/
	public int insertReply(Connection conn, CusReplyDto reply) {
		
	    int result = 0;
	    PreparedStatement pstmt = null;
	   
	    String sql = "INSERT INTO CUSTOM_REPLY(M_ID, CUS_NO, CUS_RE_CONTENT) VALUES(?, ?, ?)";
	    
	    try {
	        pstmt = conn.prepareStatement(sql);
	        pstmt.setString(1, "user2"); //임시 지정
	        pstmt.setInt(2, 2); //임시 지정
	        pstmt.setString(3, reply.getCus_re_content());
	        
	        result = pstmt.executeUpdate();
	    } catch (SQLException e) {
	        e.printStackTrace();
	    } finally {
	        close(pstmt);
	    }
	    
	    return result;
	    
	}
	
	
	
	/*댓글 목록*/
	public ArrayList <CusReplyDto> selectReplyList(Connection conn, int cus_no){
		
		ArrayList<CusReplyDto> cus_re_list = new ArrayList<>();
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = "SELECT M_ID, CUS_NO, CUS_RE_NO, CUS_RE_REGDATE, CUS_RE_CONTENT FROM CUSTOM_REPLY WHERE CUS_NO = ? ORDER BY CUS_RE_REGDATE DESC";
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, cus_no);
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				cus_re_list.add(new CusReplyDto(
						rset.getString("M_ID"),
						rset.getInt("CUS_NO"),
						rset.getInt("CUS_RE_NO"),
						rset.getString("CUS_RE_REGDATE"),
						rset.getString("CUS_RE_CONTENT")
						));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		
		return cus_re_list;
		
	}
}
