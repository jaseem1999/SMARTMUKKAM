package smartMukkam.com.admin;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import smartMukkam.connection.Conn;

public class AdminDAO {
	public static int login(String email, String pass) {
		int i = 0;
		Conn con = new Conn();
		Connection connection = con.connection;
		try {
			String sql = "select adminId, email, pass, active, status from admin where email = ? and pass = ?;";
			PreparedStatement stm = connection.prepareStatement(sql);
			stm.setString(1, email);
			stm.setString(2, pass);
			ResultSet rs = stm.executeQuery();
			while(rs.next()) {
				int id = rs.getInt(1);
				int j = AdminDAO.loginActive(id);
				if(j>0) {
					i =1;
					return i;
				}else {
					return i;
				}
			}
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println(e);
		}
		
		return i;
	}
	
	public static int loginActive(int id) {
		int i = 0;
		Conn con = new Conn();
		Connection connection = con.connection;
		String update = "UPDATE admin SET active = 'active' WHERE adminId="+id+";";				    	
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
	public static List<AdminDTO> AdminDetails(String email) {
		ArrayList<AdminDTO> li = new ArrayList<AdminDTO>();
		Conn con = new Conn();
		Connection connection = con.connection;
		try {
			String sql = "select adminId, email, pass, active, status from admin where email = ?;";
			PreparedStatement stm = connection.prepareStatement(sql);
			stm.setString(1, email);
			
			ResultSet rs = stm.executeQuery();
			while(rs.next()) {
				AdminDTO ad = new AdminDTO();
				ad.setAdminId(rs.getInt(1));
				ad.setEmail(rs.getString(2));
				ad.setPass(rs.getString(3));
				ad.setActive(rs.getString(4));
				ad.setStatus(rs.getString(5));
				li.add(ad);
			}
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println(e);
		}
		return li;
		
	}
	
	public static AdminDetailsDTO getAdminDetails(int id) {
		AdminDetailsDTO ad = new AdminDetailsDTO();
		Conn con = new Conn();
		Connection connection = con.connection;
		try {
			String sql = "select name, staff from adminDetails where adminId ="+id+";";
			PreparedStatement stm = connection.prepareStatement(sql);
			ResultSet rs = stm.executeQuery();
			while (rs.next()) {
				ad.setName(rs.getString(1));
				ad.setStaff(rs.getString(2));
			}
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println(e);
		}
		
		return ad;
	}
	
	public static String getActiveAdmin() {
		String active = null;
		Conn con = new Conn();
		Connection connection = con.connection;
		try {
			String sql = "select active from admin where adminId =1;";
			PreparedStatement stm = connection.prepareStatement(sql);
			ResultSet rs = stm.executeQuery();
			while (rs.next()) {
				active = rs.getString(1);
			}
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println(e);
		}
		
		return active;
	}
	public static int logoutActive(int id) {
		int i = 0;
		Conn con = new Conn();
		Connection connection = con.connection;
		String update = "UPDATE admin SET active ='inactive' WHERE adminId="+id+";";				    	
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
