package smartMukkam.com.admin;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import smartMukkam.connection.Conn;
import smartMukkam.main.user.userData.UserCompleteDTO;

public class ServicesDAO {
	public static List<UserCompleteDTO> getAllUserForAdmin() {
	    ArrayList<UserCompleteDTO> userList = new ArrayList<UserCompleteDTO>();
	    Conn con = new Conn();
	    Connection connection = con.connection;
	    try {
	        String sql = "SELECT u.userId, u.name, u.email, u.password, u.number, u.country, u.status, u.active, ud.surname, ud.addressOne, ud.addressTwo, ud.city, ud.state FROM user u JOIN userAddress ud ON u.userId = ud.uid;";
	        PreparedStatement stm = connection.prepareStatement(sql);
	        ResultSet rs = stm.executeQuery();
	        while (rs.next()) {
	            UserCompleteDTO user = new UserCompleteDTO();
	            user.setUid(rs.getInt("userId"));
	            user.setName(rs.getString("name"));
	            user.setEmail(rs.getString("email"));
	            user.setPass(rs.getString("password"));
	            user.setPhone(rs.getLong("number"));
	            user.setCountry(rs.getString("country"));
	            user.setStatus(rs.getString("status"));
	            user.setActive(rs.getString("active"));
	            user.setSurname(rs.getString("surname"));
	            user.setAddressOne(rs.getString("addressOne"));
	            user.setAddressTwo(rs.getString("addressTwo"));
	            user.setCity(rs.getString("city"));
	            user.setState(rs.getString("state"));
	           
	            userList.add(user);
	        }
	        rs.close();
	        stm.close();
	    } catch (Exception e) {
	        e.printStackTrace();
	    } finally {
	        try {
	            if (connection != null) {
	                connection.close();
	            }
	        } catch (SQLException ex) {
	            ex.printStackTrace();
	        }
	    }
	    return userList;
	}

}
