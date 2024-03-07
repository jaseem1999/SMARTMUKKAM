package smartMukkam.com.tourist;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import smartMukkam.connection.Conn;

public class TouristDAO {
	public static int emailValidate(String email) {
		int i = 0;
		Conn conn = new Conn();
		Connection connection = conn.connection;
		try {
			String sql = "select email from tourist where email='"+email+"';";
			PreparedStatement stm = connection.prepareStatement(sql);
			ResultSet rs = stm.executeQuery();
			while(rs.next()) {
				i = 1;
			}
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println(e);
		}
		
		return i;
	}
	
	public static List<TouristDTO> getAllTouristDetails() {
		ArrayList<TouristDTO> li = new ArrayList<TouristDTO>();
		
		Conn con = new Conn();
		Connection connection = con.connection;
		
		try {
			String sql = "SELECT t.touristId, t.name, t.email, t.password, t.phone, t.status, t.active, td.touristPlace, td.addressOne, td.addressTwo, td.city, td.state, td.pin FROM tourist t LEFT JOIN tourist_details td ON t.touristId = td.toid;";
			PreparedStatement stm = connection.prepareStatement(sql);
			ResultSet rs = stm.executeQuery();
			while(rs.next()) {
				TouristDTO t = new TouristDTO();
				t.setTouristId(rs.getInt(1));
				t.setName(rs.getString(2));
				t.setEmail(rs.getString(3));
				t.setPass(rs.getString(4));
				t.setPhone(rs.getLong(5));
				t.setStatus(rs.getString(6));
				t.setActive(rs.getString(7));
				t.setTouristPlace(rs.getString(8));
				t.setAddressOne(rs.getString(9));
				t.setAddressTwo(rs.getString(10));
				t.setCity(rs.getString(11));
				t.setState(rs.getString(12));
				t.setPin(rs.getInt(13));
				li.add(t);
			}
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println(e);
		}
		
		return li;
		
	}
	
	public static int updateAcceptTourist(int tid) {
		int i = 0;
		Conn con = new Conn();
		Connection connection = con.connection;
		String update = "UPDATE tourist SET status='accept' WHERE touristId=?";
    	
    	try {
    		PreparedStatement preparedStatement = connection.prepareStatement(update);
    		
    		preparedStatement.setInt(1, tid);
    		int rowsAffected = preparedStatement.executeUpdate();
	        if(rowsAffected > 0) {
	        	i = 1;
	        	return i;
	        }
	        
		} catch (Exception e) {
			System.out.println(e+"Jaseem");
			
		}
		return i;
	}
	
	public static int updateRejectTourist(int tid) {
		int i = 0;
		Conn con = new Conn();
		Connection connection = con.connection;
		String update = "UPDATE tourist SET status='reject' WHERE touristId=?";
    	
    	try {
    		PreparedStatement preparedStatement = connection.prepareStatement(update);
    		
    		preparedStatement.setInt(1, tid);
    		int rowsAffected = preparedStatement.executeUpdate();
	        if(rowsAffected > 0) {
	        	i = 1;
	        	return i;
	        }
	        
		} catch (Exception e) {
			System.out.println(e+"Jaseem");
			
		}
		return i;
	}
	
	public static int touristLogin(String email, String pass) {
		int i = 0;
		Conn con = new Conn();
		Connection connection = con.connection;
		try {
			String sql = "select email,password from tourist where email= ? and password = ? ;";
			PreparedStatement stm = connection.prepareStatement(sql);
			stm.setString(1, email);
			stm.setString(2, pass);
			
			ResultSet rs = stm.executeQuery();
			while(rs.next()) {
				i = 1;
				return i;
			}
			
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println(e);
		}
		
		return i;
	}
	public static int getTouristStatus(String email) {
		int i = 0;
		Conn conn = new Conn();
		Connection connection = conn.connection;
		try {
			String sql = "select status from tourist where email= ?;";
			PreparedStatement stm = connection.prepareStatement(sql);
			stm.setString(1, email);
			ResultSet rs = stm.executeQuery();
			while(rs.next()) {
				String status = rs.getString(1);
				if(status.equals("reject") || status == null) {
					i = 0;
				}else {
					i = 1;
				}
			}
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println(e);
		}
		
		return i;
	}
	public static List<TouristDTO> getAllTouristDetailsBasedTouristId(String email) {
		ArrayList<TouristDTO> li = new ArrayList<TouristDTO>();
		
		Conn con = new Conn();
		Connection connection = con.connection;
		
		try {
			String sql = "SELECT t.touristId, t.name, t.email, t.password, t.phone, t.status, t.active, td.touristPlace, td.addressOne, td.addressTwo, td.city, td.state, td.pin FROM tourist t LEFT JOIN tourist_details td ON t.touristId = td.toid where t.email = '"+email+"';";
			PreparedStatement stm = connection.prepareStatement(sql);
			ResultSet rs = stm.executeQuery();
			while(rs.next()) {
				TouristDTO t = new TouristDTO();
				t.setTouristId(rs.getInt(1));
				t.setName(rs.getString(2));
				t.setEmail(rs.getString(3));
				t.setPass(rs.getString(4));
				t.setPhone(rs.getLong(5));
				t.setStatus(rs.getString(6));
				t.setActive(rs.getString(7));
				t.setTouristPlace(rs.getString(8));
				t.setAddressOne(rs.getString(9));
				t.setAddressTwo(rs.getString(10));
				t.setCity(rs.getString(11));
				t.setState(rs.getString(12));
				t.setPin(rs.getInt(13));
				li.add(t);
			}
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println(e);
		}
		return li;
	}
	
	public static int logoutTourist(String email) {
		int i = 0;
		Conn con = new Conn();
		Connection connection = con.connection;
		String update = "UPDATE tourist SET active='inactive' WHERE email=?";
    	
    	try {
    		PreparedStatement preparedStatement = connection.prepareStatement(update);
    		
    		preparedStatement.setString(1, email);
    		int rowsAffected = preparedStatement.executeUpdate();
	        if(rowsAffected > 0) {
	        	i = 1;
	        	return i;
	        }
	        
		} catch (Exception e) {
			System.out.println(e+"Jaseem");
			
		}
		return i;
	}
	public static int loginTourist(String email) {
		int i = 0;
		Conn con = new Conn();
		Connection connection = con.connection;
		String update = "UPDATE tourist SET active='active' WHERE email=?";
    	
    	try {
    		PreparedStatement preparedStatement = connection.prepareStatement(update);
    		
    		preparedStatement.setString(1, email);
    		int rowsAffected = preparedStatement.executeUpdate();
	        if(rowsAffected > 0) {
	        	i = 1;
	        	return i;
	        }
	        
		} catch (Exception e) {
			System.out.println(e+"Jaseem");
			
		}
		return i;
	}
}
