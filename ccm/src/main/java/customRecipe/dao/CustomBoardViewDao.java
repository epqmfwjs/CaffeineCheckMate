package customRecipe.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import customRecipe.dto.CustomBoardListDto;
import jdbc.JdbcUtil;
import member.dto.MemberDTO;

public class CustomBoardViewDao {
 
	
	//게시글 상세보기
	public ArrayList<CustomBoardListDto> boardview(Connection con, String num) throws SQLException {
		String sql = "select * from custom_view where num=?";
		PreparedStatement pstm = con.prepareStatement(sql);
		CustomBoardListDto dto = new CustomBoardListDto();
		CustomBoardListDao dao = new CustomBoardListDao();
		
		ArrayList<CustomBoardListDto> list = new ArrayList<>();
		
		
		pstm.setString(1, num);
		ResultSet rs = pstm.executeQuery();
		while(rs.next()) {
			
				
				dto.setCUS_NUM(1);
				
				dto.setCUS_NO(rs.getInt(2));
				dto.setm_id(rs.getString(3));
				dto.setc_no(rs.getString(4));
				dto.setcus_title(rs.getString(5));
				dto.setCUS_CONTENT(rs.getString(6));
				dto.setCUS_REGDATE(rs.getString(7));
				dto.setCUS_SUMGOOD(rs.getString(8));
				dao.getimg(dto,con);
				dao.viewhash(dto,con);
				
				
				list.add(dto);
				
				
		}
		JdbcUtil.close(rs);
		return list;
	}
	
	public String memid(String a, Connection con) throws SQLException {
		
		String sql = "select m_id from custom_view where num=?";
		PreparedStatement pstm = con.prepareStatement(sql);
		pstm.setString(1, a);
		
		ResultSet rs = pstm.executeQuery();
		MemberDTO dto = new MemberDTO();
		while(rs.next()) {
			dto.setDtoID(rs.getString(1));
		}
		return dto.getDtoID();
	}

}
