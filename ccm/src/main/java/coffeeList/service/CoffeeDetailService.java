package coffeeList.service;

import java.sql.Connection;
import java.sql.SQLException;

import coffeeList.dao.CoffeeListDao;
import coffeeList.dto.Coffee;
import connection.ConnectionProvider;
import jdbc.JdbcUtil;

public class CoffeeDetailService {
    
    public Coffee getCoffeeDetail(int coffeeListNo) throws SQLException {
        Connection conn = null;
        try {
            conn = ConnectionProvider.getConnection();
            
            CoffeeListDao coffeelistdao = new CoffeeListDao();
            Coffee coffeeDetail = coffeelistdao.getCoffeeDetail(conn, coffeeListNo);
            return coffeeDetail;
        } finally {
            JdbcUtil.close(conn);
        }
    }
}
//coffeeListNo(C_NO)