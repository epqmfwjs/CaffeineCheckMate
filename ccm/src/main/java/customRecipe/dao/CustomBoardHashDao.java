package customRecipe.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import customRecipe.dto.CustomBoardHashDto;
import jdbc.JdbcUtil;

public class CustomBoardHashDao {
	
	//해쉬넘버조회
	public ArrayList<CustomBoardHashDto> hashnum(Connection con, CustomBoardHashDto hashdto) throws SQLException {
		String sql = "select cus_no from custom_hash where CUS_HASH_SHOT=? and CUS_HASH_MILK=? and CUS_HASH_SYRUP=? and CUS_HASH_TOP=? and CUS_HASH_DECAF=?";
		
		PreparedStatement pstm = con.prepareStatement(sql);
		pstm.setString(1,hashdto.getshot());
		pstm.setString(2,hashdto.getmilkType());
		pstm.setString(3,hashdto.getsyrupType());
		pstm.setString(4,hashdto.gettoppingType());
		pstm.setString(5,hashdto.getdecaffeinated());
		ArrayList<CustomBoardHashDto> list = new ArrayList<>();
		
		ResultSet rs = pstm.executeQuery();
		while(rs.next()) {
			CustomBoardHashDto cus_no = new CustomBoardHashDto();
			cus_no.setcus_no(rs.getString(1));
			list.add(cus_no);
			
		}
		
		JdbcUtil.close(pstm);
		JdbcUtil.close(rs);
		return list;
	}
}
