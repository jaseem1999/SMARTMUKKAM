package smartMukkam.main.user.userData;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import smartMukkam.connection.Conn;

public class UserDAO {
	public static String getUserName(int id) {
		String name = null;
		Conn con = new Conn();
		Connection connection = con.connection;
		try {
			String sql = "select name from User where userId="+id;
			PreparedStatement stm =connection.prepareStatement(sql);
			ResultSet rs = stm.executeQuery();
			while(rs.next()) {
				name = rs.getString(1);
			}
		}catch (Exception e) {
			// TODO: handle exception
			System.out.println(e);
		}
		
		return name;
	}
	public static String getUserEmail(int id) {
		String email = null;
		Conn con = new Conn();
		Connection connection = con.connection;
		try {
			String sql = "select email from User where userId="+id;
			PreparedStatement stm =connection.prepareStatement(sql);
			ResultSet rs = stm.executeQuery();
			while(rs.next()) {
				email = rs.getString(1);
			}
		}catch (Exception e) {
			// TODO: handle exception
			System.out.println(e);
		}
		
		return email;
	}
	
	public static String getUserStatus(String email) {
		String status = null;
		Conn con = new Conn();
		Connection connection = con.connection;
		try {
			String sql = "select status from User where email= ?;";
			PreparedStatement stm =connection.prepareStatement(sql);
			stm.setString(1, email);
			ResultSet rs = stm.executeQuery();
			while(rs.next()) {
				status = rs.getString(1);
			}
		}catch (Exception e) {
			// TODO: handle exception
			System.out.println(e);
		}
		
		return status;
	}
	
	public static long getUserPhone(int id) {
		long phone = 0;
		Conn con = new Conn();
		Connection connection = con.connection;
		try {
			String sql = "select number from User where userId="+id;
			PreparedStatement stm =connection.prepareStatement(sql);
			ResultSet rs = stm.executeQuery();
			while(rs.next()) {
				phone = rs.getLong(1);
			}
		}catch (Exception e) {
			// TODO: handle exception
			System.out.println(e);
		}
		
		return phone;
	}
	
	
	
	//get country
	public static String getUserCountry(int id) {
		String country = null;
		Conn con = new Conn();
		Connection connection = con.connection;
		try {
			String sql = "select country from User where userId="+id;
			PreparedStatement stm =connection.prepareStatement(sql);
			ResultSet rs = stm.executeQuery();
			while(rs.next()) {
				country = rs.getString(1);
			}
		}catch (Exception e) {
			// TODO: handle exception
			System.out.println(e);
		}
		
		return country;
	}
	
	//get address one
	public static String getUserAddressOne(int id) {
		String addressOne = null;
		Conn con = new Conn();
		Connection connection = con.connection;
		try {
			String sql = "select addressOne from userAddress where uid="+id;
			PreparedStatement stm =connection.prepareStatement(sql);
			ResultSet rs = stm.executeQuery();
			while(rs.next()) {
				addressOne = rs.getString(1);
			}
		}catch (Exception e) {
			// TODO: handle exception
			System.out.println(e);
		}
		
		return addressOne;
	}
	//get address two
	public static String getUserAddressTWO(int id) {
		String addressTwo = null;
		Conn con = new Conn();
		Connection connection = con.connection;
		try {
			String sql = "select addressTwo from userAddress where uid="+id;
			PreparedStatement stm =connection.prepareStatement(sql);
			ResultSet rs = stm.executeQuery();
			while(rs.next()) {
				addressTwo = rs.getString(1);
			}
		}catch (Exception e) {
			// TODO: handle exception
			System.out.println(e);
		}
		
		return addressTwo;
	}
	public static String getUserCity(int id) {
		String r = null;
		Conn con = new Conn();
		Connection connection = con.connection;
		try {
			String sql = "select city from userAddress where uid="+id;
			PreparedStatement stm =connection.prepareStatement(sql);
			ResultSet rs = stm.executeQuery();
			while(rs.next()) {
				r = rs.getString(1);
			}
		}catch (Exception e) {
			// TODO: handle exception
			System.out.println(e);
		}
		
		return r;
	}
	public static String getUserState(int id) {
		String r = null;
		Conn con = new Conn();
		Connection connection = con.connection;
		try {
			String sql = "select state from userAddress where uid="+id;
			PreparedStatement stm =connection.prepareStatement(sql);
			ResultSet rs = stm.executeQuery();
			while(rs.next()) {
				r = rs.getString(1);
			}
		}catch (Exception e) {
			// TODO: handle exception
			System.out.println(e);
		}
		
		return r;
	}
	
	
	public static String getUserPIN(int id) {
		String r = null;
		Conn con = new Conn();
		Connection connection = con.connection;
		try {
			String sql = "select PIN from userAddress where uid="+id;
			PreparedStatement stm =connection.prepareStatement(sql);
			ResultSet rs = stm.executeQuery();
			while(rs.next()) {
				r = rs.getString(1);
			}
		}catch (Exception e) {
			// TODO: handle exception
			System.out.println(e);
		}
		
		return r;
	}
	
	
	public static int logoutActive(int id) {
		int i = 0;
		Conn con = new Conn();
		Connection connection = con.connection;
		String update = "UPDATE user SET active ='inactive' WHERE userId="+id+";";				    	
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
	public static int loginActive(int id) {
		int i = 0;
		Conn con = new Conn();
		Connection connection = con.connection;
		String update = "UPDATE user SET active ='active' WHERE userId="+id+";";				    	
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
