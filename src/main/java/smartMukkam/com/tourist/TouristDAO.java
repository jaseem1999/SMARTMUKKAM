package smartMukkam.com.tourist;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import com.mysql.cj.x.protobuf.MysqlxDatatypes.Array;

import smartMukkam.com.shop.ReviewDTO;
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
	
	public static List<TouristGalleryDTO> getGalleryBasedToidforUser(int toid){
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
		
		public static List<TicketDTO> getAllTicketBasedOnToidForUserForReview(int tid){
			ArrayList<TicketDTO> li = new ArrayList<TicketDTO>();
			Conn con = new Conn();
			Connection connection = con.connection;
			try {
				String sql = "select tid,toid,ticket,slot,price,status from tickSlot where tid="+tid+";";
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
		
		public static String ticketName(int tid) {
			String ticket = null;
			Conn conn = new Conn();
			Connection connection = conn.connection;
			try {
				String sql = "SELECT ticket FROM tickSlot WHERE tid = ?;";
				PreparedStatement stm = connection.prepareStatement(sql);
				stm.setInt(1, tid);
				ResultSet rs = stm.executeQuery();
				while (rs.next()) {
					ticket = rs.getString(1);
				}
			} catch (Exception e) {
				// TODO: handle exception
				System.out.println(e);
			}
			
			
			return ticket;
		}
	
		public static List<TicketBookedDTO> getAllTicketBookedBasedOnToidAndUIDForUser(int toid, int uid){
			ArrayList<TicketBookedDTO> li = new ArrayList<TicketBookedDTO>();
			Conn con = new Conn();
			Connection connection = con.connection;
			try {
				String sql = "select tid,toid,uid,ticketId,slot,status,booking_timestamp from ticketBooking where toid="+toid+" and uid="+uid+";";
				PreparedStatement stmt = connection.prepareStatement(sql);
				ResultSet rs = stmt.executeQuery();
				while(rs.next()) {
					TicketBookedDTO t = new TicketBookedDTO();
					t.setTid(rs.getInt(1));
					t.setToid(rs.getInt(2));
					t.setUid(rs.getInt(3));
					t.setTicketId(rs.getInt(4));
					t.setSlot(rs.getInt(5));
					t.setStatus(rs.getString(6));
					t.setDate(rs.getString(7));
					li.add(t);
				}
			} catch (Exception e) {
				// TODO: handle exception
				System.out.println(e);
			}
			
			return li;
		}
		public static double ticketPrice(int tid) {
			double price = 0;
			Conn conn = new Conn();
			Connection connection = conn.connection;
			try {
				String sql = "SELECT price FROM tickSlot WHERE tid = ?;";
				PreparedStatement stm = connection.prepareStatement(sql);
				stm.setInt(1, tid);
				ResultSet rs = stm.executeQuery();
				while (rs.next()) {
					price = rs.getDouble(1);
				}
			} catch (Exception e) {
				// TODO: handle exception
				System.out.println(e);
			}
			
			
			return price;
		}
		
		public static List<TicketBookedDTO> getAllTicketBookedBasedOnToidAndUIDForTourist(int toid){
			ArrayList<TicketBookedDTO> li = new ArrayList<TicketBookedDTO>();
			Conn con = new Conn();
			Connection connection = con.connection;
			try {
				String sql = "select tid,toid,uid,ticketId,slot,status,booking_timestamp from ticketBooking where toid="+toid+";";
				PreparedStatement stmt = connection.prepareStatement(sql);
				ResultSet rs = stmt.executeQuery();
				while(rs.next()) {
					TicketBookedDTO t = new TicketBookedDTO();
					t.setTid(rs.getInt(1));
					t.setToid(rs.getInt(2));
					t.setUid(rs.getInt(3));
					t.setTicketId(rs.getInt(4));
					t.setSlot(rs.getInt(5));
					t.setStatus(rs.getString(6));
					t.setDate(rs.getString(7));
					li.add(t);
				}
			} catch (Exception e) {
				// TODO: handle exception
				System.out.println(e);
			}
			
			return li;
		}
		
		
		public static int updateTicketActive(int tid) { // Change method name to match
		    int i = 0;
		    Conn con = new Conn();
		    Connection connection = con.connection;
		    String update = "UPDATE tickSlot SET status=null WHERE tid=?";

		    try {
		        PreparedStatement preparedStatement = connection.prepareStatement(update);
		        preparedStatement.setInt(1, tid);
		        int rowsAffected = preparedStatement.executeUpdate();
		        if (rowsAffected > 0) {
		            i = 1;
		        }
		    } catch (Exception e) {
		        System.out.println(e);
		    } finally {
		         // Ensure to close the connection properly
		    }
		    return i;
		}

		
		
		public static int updateTicketDelete(int tid) {
			int i = 0;
		    Conn con = new Conn();
		    Connection connection = con.connection;
		    String update = "UPDATE tickSlot SET status='delete' WHERE tid=?";

		    try {
		        PreparedStatement preparedStatement = connection.prepareStatement(update);
		        preparedStatement.setInt(1, tid);
		        int rowsAffected = preparedStatement.executeUpdate();
		        if (rowsAffected > 0) {
		            i = 1;
		        }
		    } catch (Exception e) {
		        System.out.println(e);
		    } finally {
		         // Ensure to close the connection properly
		    }
		    return i;
		}
		public static int updateBookTicketAcept(int tid) {
			int i = 0;
		    Conn con = new Conn();
		    Connection connection = con.connection;
		    String update = "UPDATE ticketBooking SET status='Accept' WHERE tid=?";

		    try {
		        PreparedStatement preparedStatement = connection.prepareStatement(update);
		        preparedStatement.setInt(1, tid);
		        int rowsAffected = preparedStatement.executeUpdate();
		        if (rowsAffected > 0) {
		            i = 1;
		        }
		    } catch (Exception e) {
		        System.out.println(e);
		    } finally {
		         // Ensure to close the connection properly
		    }
		    return i;
		}
		public static int updateBookTicketReject(int tid) {
			int i = 0;
		    Conn con = new Conn();
		    Connection connection = con.connection;
		    String update = "UPDATE ticketBooking SET status='Reject' WHERE tid=?";

		    try {
		        PreparedStatement preparedStatement = connection.prepareStatement(update);
		        preparedStatement.setInt(1, tid);
		        int rowsAffected = preparedStatement.executeUpdate();
		        if (rowsAffected > 0) {
		            i = 1;
		        }
		    } catch (Exception e) {
		        System.out.println(e);
		    } finally {
		         // Ensure to close the connection properly
		    }
		    return i;
		}
		
		public static int deleteGallery(int tid) {
			int i = 0;
		    Conn con = new Conn();
		    Connection connection = con.connection;
		    String update = "UPDATE tGallery SET status='Delete' WHERE tid=?";

		    try {
		        PreparedStatement preparedStatement = connection.prepareStatement(update);
		        preparedStatement.setInt(1, tid);
		        int rowsAffected = preparedStatement.executeUpdate();
		        if (rowsAffected > 0) {
		            i = 1;
		        }
		    } catch (Exception e) {
		        System.out.println(e);
		    } finally {
		         // Ensure to close the connection properly
		    }
		    return i;
		}
		
		public static int deleteWallpaper(int tid) {
			int i = 0;
		    Conn con = new Conn();
		    Connection connection = con.connection;
		    String update = "UPDATE tWallpaper SET status='Delete' WHERE tid=?";

		    try {
		        PreparedStatement preparedStatement = connection.prepareStatement(update);
		        preparedStatement.setInt(1, tid);
		        int rowsAffected = preparedStatement.executeUpdate();
		        if (rowsAffected > 0) {
		            i = 1;
		        }
		    } catch (Exception e) {
		        System.out.println(e);
		    } finally {
		         // Ensure to close the connection properly
		    }
		    return i;
		}
		
		public static int postReviewFromUser(int toid, int uid, int ticketId, String review) {
		    int i = 0;
		    Conn con = new Conn();
		    Connection connection = con.connection;
		    PreparedStatement preparedStatement = null;
		    try {
		        // The SQL query to insert a review
		        String insertQuery = "INSERT INTO reviewTouristTable (uid, toid, ticketId, review) VALUES (?, ?, ?, ?)";

		        preparedStatement = connection.prepareStatement(insertQuery);

		        // Set values for the parameters
		        preparedStatement.setInt(1, uid);
		        preparedStatement.setInt(2, toid);
		        preparedStatement.setInt(3, ticketId);
		        preparedStatement.setString(4, review);

		        // Execute the update
		        i = preparedStatement.executeUpdate();
		    } catch (Exception e) {
		        // Handle exceptions appropriately (e.g., log or rethrow)
		        System.out.println(e);
		    } finally {
		        // Close resources in the finally block to ensure they are released
		        try {
		            if (preparedStatement != null) {
		                preparedStatement.close();
		            }
		        } catch (SQLException e) {
		            e.printStackTrace();
		        }
		    }
		    return i;
		}
		public static List<smartMukkam.com.tourist.ReviewDTO> getReviewBasedToid(int ticketId){
			ArrayList<smartMukkam.com.tourist.ReviewDTO> li = new ArrayList<smartMukkam.com.tourist.ReviewDTO>();
			Conn con = new Conn();
			Connection connection = con.connection;
			
			try {
				String sql = "SELECT tid, uid, toid, ticketId, review, comment, status " +"FROM reviewTouristTable " +"WHERE ticketId = " + ticketId + " ORDER BY tid DESC;";

		        PreparedStatement stm = connection.prepareStatement(sql);
		        ResultSet rs = stm.executeQuery();
		        while(rs.next()) {
		        	smartMukkam.com.tourist.ReviewDTO re = new smartMukkam.com.tourist.ReviewDTO();
		        	re.setTid(rs.getInt(1));
		        	re.setUid(rs.getInt(2));
		        	re.setToid(rs.getInt(3));
		        	re.setTicketId(rs.getInt(4));
		        	re.setReview(rs.getString(5));
		        	re.setComment(rs.getString(6));
		        	re.setStatus(rs.getString(7));
		        	li.add(re);
		        	
		        }
			} catch (Exception e) {
				// TODO: handle exception
				System.out.println(e);
			}
			
			return li;
		}
		public static List<smartMukkam.com.tourist.ReviewDTO> getReviewBasedToidForTourist(int toid){
			ArrayList<smartMukkam.com.tourist.ReviewDTO> li = new ArrayList<smartMukkam.com.tourist.ReviewDTO>();
			Conn con = new Conn();
			Connection connection = con.connection;
			
			try {
				String sql = "SELECT tid, uid, toid, ticketId, review, comment, status " +"FROM reviewTouristTable " +"WHERE toid = " + toid + " ORDER BY tid DESC;";

		        PreparedStatement stm = connection.prepareStatement(sql);
		        ResultSet rs = stm.executeQuery();
		        while(rs.next()) {
		        	smartMukkam.com.tourist.ReviewDTO re = new smartMukkam.com.tourist.ReviewDTO();
		        	re.setTid(rs.getInt(1));
		        	re.setUid(rs.getInt(2));
		        	re.setToid(rs.getInt(3));
		        	re.setTicketId(rs.getInt(4));
		        	re.setReview(rs.getString(5));
		        	re.setComment(rs.getString(6));
		        	re.setStatus(rs.getString(7));
		        	li.add(re);
		        	
		        }
			} catch (Exception e) {
				// TODO: handle exception
				System.out.println(e);
			}
			
			return li;
		}

		public static int updateReviewComment(int tid,String comment) {
			int i = 0;
			Conn con = new Conn();
			Connection connection = con.connection;
			String update = "UPDATE reviewTouristTable SET comment=? WHERE tid=?";
			    	
	    	try {
	    		PreparedStatement preparedStatement = connection.prepareStatement(update);
	    		
	    		preparedStatement.setString(1, comment);
	    		preparedStatement.setInt(2, tid);
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
