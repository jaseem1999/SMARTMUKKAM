package smartMukkam.com.hotel;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import smartMukkam.connection.Conn;

public class HotelDAO {
	public static int checkEmail(String email) {
		Conn con = new Conn();
		int i = 0;
		Connection connection = con.connection;
		try {
			String sql = "select email from hotel where email = ?;";
			PreparedStatement stm = connection.prepareStatement(sql);
			stm.setString(1, email);
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
	
	//get all hotel details
	public static List<HotelDTO> getAllHotelDetailsForMunicipality() {
	    ArrayList<HotelDTO> li = new ArrayList<>();
	    Conn con = new Conn();
	    Connection connection = con.connection;
	    try {
	        String sql = "SELECT h.hotelId, h.name, h.email, h.password, h.phone, h.status, h.active, hd.hotelName, hd.addressOne, hd.addressTwo, hd.city, hd.state, hd.pin FROM hotel h JOIN hotel_details hd ON h.hotelId = hd.hoid;";
	        PreparedStatement stm = connection.prepareStatement(sql);
	        ResultSet rs = stm.executeQuery();
	        while (rs.next()) {
	            HotelDTO h = new HotelDTO();
	            h.setHotelId(rs.getInt(1));
	            h.setOwnerName(rs.getString(2));
	            h.setEmail(rs.getString(3));
	            h.setPass(rs.getString(4));
	            h.setPhone(rs.getLong(5));
	            h.setStatus(rs.getString(6));
	            h.setActive(rs.getString(7));
	            h.setHotelName(rs.getString(8));
	            h.setAddressOne(rs.getString(9));
	            h.setAddressTwo(rs.getString(10));
	            h.setCity(rs.getString(11));
	            h.setState(rs.getString(12));
	            h.setPin(rs.getInt(13));
	            li.add(h);
	        }
	    } catch (Exception e) {
	        System.out.println(e);
	    }
	    return li;
	}

	public static int login(String email, String pass) {
		int i = 0;
		int j = 0;
		String status = null;
		Conn con= new Conn();
		Connection connection = con.connection;
		try {
			String sql = "select email from hotel where email = ? and password = ?;";
			PreparedStatement stm = connection.prepareStatement(sql);
			stm.setString(1, email);
			stm.setString(2, pass);
			
			ResultSet rs = stm.executeQuery();
			
			while (rs.next()) {
				j=1;
			}
			
			if(j>0) {
				try {
					String check = "select status from hotel where email = ? and password = ?;";
					PreparedStatement stm2 = connection.prepareStatement(check);
					stm2.setString(1, email);
					stm2.setString(2, pass);
					
					ResultSet rs2 = stm2.executeQuery();
					
					while (rs2.next()) {
						status = rs2.getString(1);
					}
					if(status != null && status.equals("accept")) {
						
						try {
							String update = "UPDATE hotel SET active='active' WHERE email = ?;";
							PreparedStatement stm3 = connection.prepareStatement(update);
							stm3.setString(1, email);
							int rowsAffected = stm3.executeUpdate();
					        if(rowsAffected > 0) {
					        	i = 2;
					        	return i;
					        }
							
						} catch (Exception e) {
							// TODO: handle exception
							System.out.println(e);
						}
						
					}else if(status != null && status.equals("reject")) {
						i = 1;
						return i;
					}else {
						return i;
					}
					
				} catch (Exception e) {
					// TODO: handle exception
					System.out.println(e);
				}
			}else {
				i = 0;
			}
			
			
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println(e);
		}
		
		return i;
	}
	
	public static List<HotelDTO> getAllHotelDetailsForLogin(String email) {
	    ArrayList<HotelDTO> li = new ArrayList<>();
	    Conn con = new Conn();
	    Connection connection = con.connection;
	    try {
	        String sql = "SELECT h.hotelId, h.name, h.email, h.password, h.phone, h.status, h.active, hd.hotelName, hd.addressOne, hd.addressTwo, hd.city, hd.state, hd.pin FROM hotel h JOIN hotel_details hd ON h.hotelId = hd.hoid where h.email = ?;";
	        PreparedStatement stm = connection.prepareStatement(sql);
	        stm.setString(1, email);
	        ResultSet rs = stm.executeQuery();
	        while (rs.next()) {
	            HotelDTO h = new HotelDTO();
	            h.setHotelId(rs.getInt(1));
	            h.setOwnerName(rs.getString(2));
	            h.setEmail(rs.getString(3));
	            h.setPass(rs.getString(4));
	            h.setPhone(rs.getLong(5));
	            h.setStatus(rs.getString(6));
	            h.setActive(rs.getString(7));
	            h.setHotelName(rs.getString(8));
	            h.setAddressOne(rs.getString(9));
	            h.setAddressTwo(rs.getString(10));
	            h.setCity(rs.getString(11));
	            h.setState(rs.getString(12));
	            h.setPin(rs.getInt(13));
	            li.add(h);
	        }
	    } catch (Exception e) {
	        System.out.println(e);
	    }
	    return li;
	}
	
	public static int logout(int hoid) {
		int i = 0;
		Conn con = new Conn();
		Connection connection = con.connection;
		try {
			String update = "UPDATE hotel SET active='inactive' WHERE hotelId = ?;";
			PreparedStatement stm3 = connection.prepareStatement(update);
			stm3.setInt(hoid, 1);
			int rowsAffected = stm3.executeUpdate();
	        if(rowsAffected > 0) {
	        	i = 1;
	        	return i;
	        }
			
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println(e);
		}
		
		return i;
	}
	
	public static String getHotelName(int hoid) {
		String name = null;
		Conn con = new Conn();
		Connection connection = con.connection;
		 try {
		        String sql = "select hotelName from hotel_details where hoid ="+hoid+";";
		        PreparedStatement stm = connection.prepareStatement(sql);
		        
		        ResultSet rs = stm.executeQuery();
		        while (rs.next()) {
		           name = rs.getString(1);
		        }
		    } catch (Exception e) {
		        System.out.println(e);
		    }
		return name;
	}
	
	public static String owner(int hoid) {
		String name = null;
		Conn con = new Conn();
		Connection connection = con.connection;
		 try {
		        String sql = "select name from hotel where hotelId ="+hoid+";";
		        PreparedStatement stm = connection.prepareStatement(sql);
		       
		        ResultSet rs = stm.executeQuery();
		        while (rs.next()) {
		           name = rs.getString(1);
		        }
		    } catch (Exception e) {
		        System.out.println(e);
		    }
		return name;
	}
	
}
