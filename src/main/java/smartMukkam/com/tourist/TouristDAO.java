package smartMukkam.com.tourist;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import com.mysql.cj.x.protobuf.MysqlxDatatypes.Array;

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
	//get tourist details for getAllTouristDetailsBasedToId
	public static List<TouristDTO> getAllTouristDetailsBasedToId(int toid) {
		ArrayList<TouristDTO> li = new ArrayList<TouristDTO>();
		
		Conn con = new Conn();
		Connection connection = con.connection;
		
		try {
			String sql = "SELECT t.touristId, t.name, t.email, t.password, t.phone, t.status, t.active, td.touristPlace, td.addressOne, td.addressTwo, td.city, td.state, td.pin FROM tourist t LEFT JOIN tourist_details td ON t.touristId = td.toid where t.touristId ="+toid+";";
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
	
	//get all ticket based toid for tourist
	public static List<TicketDTO> getAllTicketBasedOnToid(int toid){
		ArrayList<TicketDTO> li = new ArrayList<TicketDTO>();
		Conn con = new Conn();
		Connection connection = con.connection;
		try {
			String sql = "select tid,toid,ticket,slot,price,status from tickSlot where toid="+toid+";";
			PreparedStatement stmt = connection.prepareStatement(sql);
			ResultSet rs = stmt.executeQuery();
			while(rs.next()) {
				TicketDTO to = new TicketDTO();
				to.setTid(rs.getInt(1));
				to.setToid(rs.getInt(2));
				to.setTicket(rs.getString(3));
				to.setSlot(rs.getInt(4));
				to.setPrice(rs.getDouble(5));
				to.setStatus(rs.getString(6));
				li.add(to);
			}
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println(e);
		}
		
		return li;
	}
	
	//get all gallery images base d toid
	public static List<TouristGalleryDTO> getGalleryBasedToidforTourist(int toid){
		ArrayList<TouristGalleryDTO> li = new ArrayList<TouristGalleryDTO>();
		Conn con = new Conn();
		Connection connection = con.connection;
		try {
			String sql = "select tid,toid,description,status from tGallery where toid="+toid+";";
			PreparedStatement stmt = connection.prepareStatement(sql);
			ResultSet rs = stmt.executeQuery();
			while (rs.next()) {
				TouristGalleryDTO to = new TouristGalleryDTO();
				to.setTid(rs.getInt(1));
				to.setToid(rs.getInt(2));
				to.setDescription(rs.getString(3));
				to.setStatus(rs.getString(4));
				li.add(to);
			}
			
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println(e);
		}
		return li;
	}
	//get all Wallpaper images base d toid
		public static List<WallpaperDTO> getWallpaperBasedToidforTourist(int toid){
			ArrayList<WallpaperDTO> li = new ArrayList<WallpaperDTO>();
			Conn con = new Conn();
			Connection connection = con.connection;
			try {
				String sql = "select tid,toid,description,status from tWallpaper where toid="+toid+";";
				PreparedStatement stmt = connection.prepareStatement(sql);
				ResultSet rs = stmt.executeQuery();
				while (rs.next()) {
					WallpaperDTO to = new WallpaperDTO();
					to.setTid(rs.getInt(1));
					to.setToid(rs.getInt(2));
					to.setDescription(rs.getString(3));
					to.setStatus(rs.getString(4));
					li.add(to);
				}
				
			} catch (Exception e) {
				// TODO: handle exception
				System.out.println(e);
			}
			return li;
		}
		public static List<WallpaperDTO> getWallpaperBasedToidforUser(int toid){
			ArrayList<WallpaperDTO> li = new ArrayList<WallpaperDTO>();
			Conn con = new Conn();
			Connection connection = con.connection;
			try {
				String sql = "select tid,toid,description,status from tWallpaper where toid="+toid+";";
				PreparedStatement stmt = connection.prepareStatement(sql);
				ResultSet rs = stmt.executeQuery();
				while (rs.next()) {
					WallpaperDTO to = new WallpaperDTO();
					to.setTid(rs.getInt(1));
					to.setToid(rs.getInt(2));
					to.setDescription(rs.getString(3));
					to.setStatus(rs.getString(4));
					if(to.getStatus() == null) {
						li.add(to);
					}
					
				}
				
			} catch (Exception e) {
				// TODO: handle exception
				System.out.println(e);
			}
			return li;
		}
		public static List<TicketDTO> getAllTicketBasedOnToidForUser(int toid){
			ArrayList<TicketDTO> li = new ArrayList<TicketDTO>();
			Conn con = new Conn();
			Connection connection = con.connection;
			try {
				String sql = "select tid,toid,ticket,slot,price,status from tickSlot where toid="+toid+";";
				PreparedStatement stmt = connection.prepareStatement(sql);
				ResultSet rs = stmt.executeQuery();
				while(rs.next()) {
					TicketDTO to = new TicketDTO();
					to.setTid(rs.getInt(1));
					to.setToid(rs.getInt(2));
					to.setTicket(rs.getString(3));
					to.setSlot(rs.getInt(4));
					to.setPrice(rs.getDouble(5));
					to.setStatus(rs.getString(6));
					li.add(to);
				}
			} catch (Exception e) {
				// TODO: handle exception
				System.out.println(e);
			}
			
			return li;
		}
		
		public static int getSlot(int tid) {
			int i = 0;
			Conn conn = new Conn();
			Connection connection = conn.connection;
			try {
				String sql = "select slot from tickSlot where tid= ?;";
				PreparedStatement stm = connection.prepareStatement(sql);
				stm.setInt(1, tid);
				ResultSet rs = stm.executeQuery();
				while(rs.next()) {
					i = rs.getInt(1);
					
				}
			} catch (Exception e) {
				// TODO: handle exception
				System.out.println(e);
			}
			return i;
		}
		
		public static int getSlotOnBooked(int tid) {
			int i = 0;
			Conn conn = new Conn();
			Connection connection = conn.connection;
			try {
				String sql = "SELECT SUM(slot) AS total_slots FROM ticketBooking WHERE ticketId = ?;";
				PreparedStatement stm = connection.prepareStatement(sql);
				stm.setInt(1, tid);
				ResultSet rs = stm.executeQuery();
				while(rs.next()) {
					i = rs.getInt(1);
					
				}
			} catch (Exception e) {
				// TODO: handle exception
				System.out.println(e);
			}
			return i;
		}
	
}
