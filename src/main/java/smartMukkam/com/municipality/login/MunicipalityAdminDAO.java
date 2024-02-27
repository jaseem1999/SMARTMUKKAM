package smartMukkam.com.municipality.login;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import smartMukkam.connection.Conn;

public class MunicipalityAdminDAO {
	
	//Get municipality admin is active or not 
	public static String getActive() {
		Conn  con = new Conn();
		Connection connection = con.connection;
		String active = null;
		try {
			String sql = "select active from municipalityLogin where munId=1;";
			PreparedStatement pstmt = connection.prepareStatement(sql);
          

            ResultSet rs = pstmt.executeQuery();
            while(rs.next()) {
            	active = rs.getString(1);
            }
		} catch (Exception e) {
			System.out.println(e);
		}
		
		return active;
	}
	
	//Update inactive municipality admin
	public static int updateInactiveMunicipalityAdmin() {
		int i = 0;
		Conn con = new Conn();
		Connection connection = con.connection;
		String update = "UPDATE municipalityLogin SET active = 'inactive' WHERE munId = 1;";
    	
    	try {
    		java.sql.Statement statement = connection.createStatement();
	        int rowsAffected = statement.executeUpdate(update);
	        if(rowsAffected > 0) {
	        	i = 1;
	        	return i;
	        }
	        statement.close();
		} catch (Exception e) {
			System.out.println(e);
		}
		return i;
	}
}
