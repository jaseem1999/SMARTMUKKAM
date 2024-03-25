package smartMukkam.com.admin;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import smartMukkam.com.hotel.RoomDTO;
import smartMukkam.connection.Conn;
import smartMukkam.main.user.userData.UserCompleteDTO;

public class ServicesDAO {
	public static List<UserCompleteDTO> getAllUserForAdmin() {
	    ArrayList<UserCompleteDTO> userList = new ArrayList<UserCompleteDTO>();
	    Conn con = new Conn();
	    Connection connection = con.connection;
	    try {
	        String sql = "SELECT u.userId, u.name, u.email, u.password, u.number, u.country, u.status, u.active, ud.surname, ud.addressOne, ud.addressTwo, ud.city, ud.state, ud.PIN FROM user u JOIN userAddress ud ON u.userId = ud.uid;";
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
	            user.setPin(rs.getInt("PIN"));
	           
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
	
	public static int userBlock(int id) {
		int i = 0;
		Conn con = new Conn();
		Connection connection = con.connection;
		String update = "UPDATE User SET status = 'block' WHERE userId="+id+";";				    	
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
	public static int userUnBlock(int id) {
		int i = 0;
		Conn con = new Conn();
		Connection connection = con.connection;
		String update = "UPDATE User SET status=NULL WHERE userId="+id+";";				    	
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
	
	public static List<RoomDTO> getAllRoomsforAdmin(){
		ArrayList<RoomDTO> li = new ArrayList<RoomDTO>();
		Conn con = new Conn();
		Connection connection = con.connection;
		try {
		    String sql = "SELECT tid, hoid, room, noRoom, description, price, discount, status, active FROM room;";
		    PreparedStatement stm = connection.prepareStatement(sql);
		    ResultSet rs = stm.executeQuery();
		    while (rs.next()) {
		        RoomDTO r = new RoomDTO();
		        r.setTid(rs.getInt(1));
		        r.setHoid(rs.getInt(2));
		        r.setRoom(rs.getString(3));
		        r.setNoRoom(rs.getInt(4));
		        r.setDescription(rs.getString(5)); // Adjusted index for description
		        r.setPrice(rs.getDouble(6)); // Adjusted index for price
		        r.setDiscount(rs.getDouble(7)); // Adjusted index for discount
		        r.setStatus(rs.getString(8));
		        r.setActive(rs.getString(9)); // Adjusted index for active
		        li.add(r);
		    }
		} catch (Exception e) {
		    // Handle exception properly, don't just print
		    e.printStackTrace();
		}

		
		return li;
	}

}
