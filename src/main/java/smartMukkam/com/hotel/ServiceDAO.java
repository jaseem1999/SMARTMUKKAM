package smartMukkam.com.hotel;

import java.sql.Connection;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import smartMukkam.connection.Conn;

public class ServiceDAO {
	public static int updateAcceptRegistration(int hoid) {
		int i = 0;
		Conn con = new Conn();
		Connection connection = con.connection;
		String update = "UPDATE hotel SET status='accept' WHERE hotelId=?";
    	
    	try {
    		PreparedStatement preparedStatement = connection.prepareStatement(update);
    		preparedStatement.setInt(1, hoid);
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
	public static int updateRejectRegistration(int hoid) {
		int i = 0;
		Conn con = new Conn();
		Connection connection = con.connection;
		String update = "UPDATE hotel SET status='reject' WHERE hotelId=?";
    	
    	try {
    		PreparedStatement preparedStatement = connection.prepareStatement(update);
    		preparedStatement.setInt(1, hoid);
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
	
	
	public static List<RoomDTO> getAllRoomsUSEDHoidForHotel(int hoid){
		ArrayList<RoomDTO> li = new ArrayList<RoomDTO>();
		Conn con = new Conn();
		Connection connection = con.connection;
		try {
		    String sql = "SELECT tid, hoid, room, noRoom, description, price, discount, status, active FROM room WHERE hoid=?";
		    PreparedStatement stm = connection.prepareStatement(sql);
		    stm.setInt(1, hoid); // Set the parameter index to 1
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
	
	public static String limitDescription(String description) {
	    // Split the description into lines
		 if (description.length() > 100) {
		        return description.substring(0, 100) + "..."; // Truncate to 100 characters
		    } else {
		        return description; // Return original description if less than or equal to 100 characters
		    }
	}
	
	public static int updateAcceptRoom(int tid) {
		int i = 0;
		Conn con = new Conn();
		Connection connection = con.connection;
		String update = "UPDATE room SET status='accept' WHERE tid=?";
    	
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
	
	public static int updateRejectRoom(int tid) {
		int i = 0;
		Conn con = new Conn();
		Connection connection = con.connection;
		String update = "UPDATE room SET status='reject' WHERE tid=?";
    	
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
	
	
	public static List<FoodDTO> getAllFoodUSEDHoidForHotel(int hoid){
		ArrayList<FoodDTO> li = new ArrayList<FoodDTO>();
		Conn con = new Conn();
		Connection connection = con.connection;
		try {
		    String sql = "SELECT tid, hoid, food, quandity, description, price, discount, status, active FROM food WHERE hoid=?";
		    PreparedStatement stm = connection.prepareStatement(sql);
		    stm.setInt(1, hoid); // Set the parameter index to 1
		    ResultSet rs = stm.executeQuery();
		    while (rs.next()) {
		    	FoodDTO r = new FoodDTO();
		        r.setTid(rs.getInt(1));
		        r.setHoid(rs.getInt(2));
		        r.setFood(rs.getString(3));
		        r.setQuandity(rs.getInt(4));
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


	public static int updateAcceptFood(int tid) {
		int i = 0;
		Conn con = new Conn();
		Connection connection = con.connection;
		String update = "UPDATE food SET status='accept' WHERE tid=?";
    	
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
	
	public static int updateRejectFood(int tid) {
		int i = 0;
		Conn con = new Conn();
		Connection connection = con.connection;
		String update = "UPDATE food SET status='reject' WHERE tid=?";
    	
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
	
	
	 public static List<TaxiDTO> getAllTaxiForHotel(int hoid) {
	        ArrayList<TaxiDTO> taxiList = new ArrayList<>();
	        Conn con = new Conn();
	        try (Connection connection = con.connection) {
	            String sql = "SELECT * FROM taxi WHERE hoid = ?";
	            try (PreparedStatement statement = connection.prepareStatement(sql)) {
	                statement.setInt(1, hoid);
	                try (ResultSet rs = statement.executeQuery()) {
	                    while (rs.next()) {
	                        TaxiDTO taxi = new TaxiDTO();
	                        taxi.setTid(rs.getInt("tid"));
	                        taxi.setHoid(rs.getInt("hoid"));
	                        taxi.setDriver(rs.getString("driver"));
	                        taxi.setVehicle(rs.getString("vehicle"));
	                        taxi.setPlate(rs.getString("plate"));
	                        taxi.setPrice(rs.getDouble("price"));
	                        taxi.setStatus(rs.getString("status"));
	                        taxi.setActive(rs.getString("active"));
	                        taxiList.add(taxi);
	                    }
	                }
	            }
	        } catch (SQLException e) {
	            e.printStackTrace();
	        }
	        return taxiList;
	    }
	 
	 public static int updateAcceptTaxi(int tid) {
			int i = 0;
			Conn con = new Conn();
			Connection connection = con.connection;
			String update = "UPDATE taxi SET status='accept' WHERE tid=?";
	    	
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
		
		public static int updateRejectTaxi(int tid) {
			int i = 0;
			Conn con = new Conn();
			Connection connection = con.connection;
			String update = "UPDATE taxi SET status='reject' WHERE tid=?";
	    	
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
		
		public static List<GalleryDTO> getGalleryForHotel(int hoid){
			ArrayList<GalleryDTO> li = new ArrayList<GalleryDTO>();
			Conn con = new Conn();
			Connection connection = con.connection;
			try {
				String sql ="select tid,hoid,description,status from hGallery where hoid= ?;"; 
				PreparedStatement stm = connection.prepareStatement(sql);
				stm.setInt(hoid, 1);
				ResultSet rs = stm.executeQuery();
				while(rs.next()) {
					GalleryDTO g = new GalleryDTO();
					g.setTid(rs.getInt(1));
					g.setHoid(rs.getInt(2));
					g.setDescription(rs.getString(3));
					g.setStatus(rs.getString(4));
					li.add(g);
				}
				
			} catch (Exception e) {
				// TODO: handle exception
				System.out.println(e);
			}
			
			return li;
		}
		
		public static int deleteGallaryTaxi(int tid) {
			int i = 0;
			Conn con = new Conn();
			Connection connection = con.connection;
			String update = "UPDATE hGallery SET status='delete' WHERE tid=?";
	    	
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
	
	
}
