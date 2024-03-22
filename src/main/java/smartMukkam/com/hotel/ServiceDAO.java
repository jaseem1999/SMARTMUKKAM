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
		public static List<FoodDTO> getAllFoodUSEDHoidForUser(int hoid){
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
			        if(r.getStatus().equals("accept")) {
			        	li.add(r);
			        }
			        
			    }
			} catch (Exception e) {
			    // Handle exception properly, don't just print
			    e.printStackTrace();
			}

			
			return li;
		}
		
		public static String getFoodName(int tid) {
			String name = null;
			Conn con = new Conn();
			Connection connection = con.connection;
			 try {
			        String sql = "select food from food where tid ="+tid;
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
		
		public static String getFoodDescription(int tid) {
			String name = null;
			Conn con = new Conn();
			Connection connection = con.connection;
			 try {
			        String sql = "select description from food where tid = "+tid;
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
		
		public static String getFoodActive(int tid) {
			String name = null;
			Conn con = new Conn();
			Connection connection = con.connection;
			 try {
			        String sql = "select active from food where tid="+tid;
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
		
		public static int getFoodQuandity(int tid) {
			int q = 0;
			Conn con = new Conn();
			Connection connection = con.connection;
			 try {
			        String sql = "select quandity from food where tid ="+tid+";";
			        PreparedStatement stm = connection.prepareStatement(sql);
			        
			        ResultSet rs = stm.executeQuery();
			        while (rs.next()) {
			           q = rs.getInt(1);
			        }
			    } catch (Exception e) {
			        System.out.println(e+"jaseem");
			        
			    }
			return q;
		}
		
		public static double getFoodPrice(int tid) {
			double price = 0;
			Conn con = new Conn();
			Connection connection = con.connection;
			 try {
			        String sql = "select price from food where tid ="+tid;
			        PreparedStatement stm = connection.prepareStatement(sql);
			      
			        ResultSet rs = stm.executeQuery();
			        while (rs.next()) {
			        	price = rs.getDouble(1);
			        }
			    } catch (Exception e) {
			        System.out.println(e);
			    }
			return price;
		}
		
		public static double getFoodDiscount(int tid) {
			double price = 0;
			Conn con = new Conn();
			Connection connection = con.connection;
			 try {
			        String sql = "select discount from food where tid ="+tid;
			        PreparedStatement stm = connection.prepareStatement(sql);
			    
			        ResultSet rs = stm.executeQuery();
			        while (rs.next()) {
			        	price = rs.getDouble(1);
			        }
			    } catch (Exception e) {
			        System.out.println(e);
			    }
			return price;
		}
		
		public static int updatefoodCart(int uid,int hoid,int foid ,int quantity) {
			 int rowsAffected = 0;
		        Conn con = new Conn();
		        Connection connection = con.connection;
		        PreparedStatement preparedStatement = null;

		        try {
		            // Prepare the SQL statement for inserting into the cart table
		            String insertQuery = "INSERT INTO foodOrder (uid, hoid, foid, qunatity) VALUES (?, ?, ?, ?)";
		            preparedStatement = connection.prepareStatement(insertQuery);

		            // Set values for the parameters
		            preparedStatement.setInt(1, uid);
		            preparedStatement.setInt(2, hoid);
		            preparedStatement.setInt(3, foid);
		            preparedStatement.setInt(4, quantity);

		            // Execute the update
		            rowsAffected = preparedStatement.executeUpdate();

		        } catch (SQLException e) {
		            e.printStackTrace();
		            // Handle the SQL exception as needed
		        } finally {
		            // Close the PreparedStatement and Connection
		            try {
		                if (preparedStatement != null) {
		                    preparedStatement.close();
		                }
		                if (connection != null) {
		                    connection.close();
		                }
		            } catch (SQLException e) {
		                e.printStackTrace();
		            }
		        }

		        return rowsAffected;
		}
		
		public static int getCartFoodQuandity(int tid) {
			int q = 0;
			Conn con = new Conn();
			Connection connection = con.connection;
			 try {
			        String sql = "select sum(qunatity) from foodOrder where foid ="+tid+";";
			        PreparedStatement stm = connection.prepareStatement(sql);
			        ResultSet rs = stm.executeQuery();
			        while (rs.next()) {
			           q = rs.getInt(1);
			        }
			    } catch (Exception e) {
			        System.out.println(e+"jassem 2");
			    }
			return q;
		}
		
		
		public static List<FoodCartDTO> getAllOrederByUIDandHOIDforUser(int uid , int hoid){
			ArrayList<FoodCartDTO> li = new ArrayList<FoodCartDTO>();
			Conn con = new Conn();
			Connection connection = con.connection;
			try {
				String sql = "select tid,uid,hoid,foid,qunatity,booking_timestamp,status from foodOrder where uid="+uid+" and hoid="+hoid+" ORDER BY booking_timestamp DESC;";
				PreparedStatement stm = connection.prepareStatement(sql);
				ResultSet rs = stm.executeQuery();
				while(rs.next()) {
					FoodCartDTO f = new FoodCartDTO();
					f.setTid(rs.getInt(1));
					f.setUid(rs.getInt(2));
					f.setHoid(rs.getInt(3));
					f.setFoid(rs.getInt(4));
					f.setQuantity(rs.getInt(5));
					f.setDate(rs.getString(6));
					f.setStatus(rs.getString(7));
					li.add(f);
				}
			} catch (Exception e) {
				// TODO: handle exception
				System.out.println(e);
			}
			return li;
		}
		public static List<FoodCartDTO> getAllFoodOrederByHOIDforHotel(int hoid){
			ArrayList<FoodCartDTO> li = new ArrayList<FoodCartDTO>();
			Conn con = new Conn();
			Connection connection = con.connection;
			try {
				String sql = "select tid,uid,hoid,foid,qunatity,booking_timestamp,status from foodOrder where hoid="+hoid+" ORDER BY booking_timestamp DESC;";
				PreparedStatement stm = connection.prepareStatement(sql);
				ResultSet rs = stm.executeQuery();
				while(rs.next()) {
					FoodCartDTO f = new FoodCartDTO();
					f.setTid(rs.getInt(1));
					f.setUid(rs.getInt(2));
					f.setHoid(rs.getInt(3));
					f.setFoid(rs.getInt(4));
					f.setQuantity(rs.getInt(5));
					f.setDate(rs.getString(6));
					f.setStatus(rs.getString(7));
					li.add(f);
				}
			} catch (Exception e) {
				// TODO: handle exception
				System.out.println(e);
			}
			return li;
		}
		
		public static int foodOrderAccept(int tid) {
			int i = 0;
			Conn con = new Conn();
			Connection connection = con.connection;
			String update = "UPDATE foodOrder SET status = 'accept' WHERE tid="+tid+";";				    	
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
		
		public static int foodOrderReject(int tid) {
			int i = 0;
			Conn con = new Conn();
			Connection connection = con.connection;
			String update = "UPDATE foodOrder SET status = 'reject' WHERE tid="+tid+";";				    	
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
		public static int foodOrderDelivery(int tid) {
			int i = 0;
			Conn con = new Conn();
			Connection connection = con.connection;
			String update = "UPDATE foodOrder SET status = 'delivery' WHERE tid="+tid+";";				    	
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
		public static int foodOrderDelivered(int tid) {
			int i = 0;
			Conn con = new Conn();
			Connection connection = con.connection;
			String update = "UPDATE foodOrder SET status = 'delivered' WHERE tid="+tid+";";				    	
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
		
		public static List<RoomDTO> getRoomByHoidForUser(int hoid){
			ArrayList<RoomDTO> li = new ArrayList<RoomDTO>();
			Conn con = new Conn();
			Connection connection = con.connection;
			try {
				String sql ="select tid, hoid, room, noRoom, description, price, discount, status, active from room where hoid="+hoid+";";
				PreparedStatement stm = connection.prepareStatement(sql);
				ResultSet rs = stm.executeQuery();
				while(rs.next()) {
					RoomDTO room = new RoomDTO();
					room.setTid(rs.getInt(1));
					room.setHoid(rs.getInt(2));
					room.setRoom(rs.getString(3));
					room.setNoRoom(rs.getInt(4));
					room.setDescription(rs.getString(5));
					room.setPrice(rs.getDouble(6));
					room.setDiscount(rs.getDouble(7));
					room.setStatus(rs.getString(8));
					room.setActive(rs.getString(9));
					if(room.getStatus().equals("accept") && room.getStatus() != null) {
						li.add(room);
					}
				}
			} catch (Exception e) {
				// TODO: handle exception
				System.out.println(e);
			}
			
			return li;
		}
		public static int getRoomAvailable(int tid) {
			int q = 0;
			Conn con = new Conn();
			Connection connection = con.connection;
			 try {
			        String sql = "select noRoom from room where tid ="+tid+";";
			        PreparedStatement stm = connection.prepareStatement(sql);
			        ResultSet rs = stm.executeQuery();
			        while (rs.next()) {
			           q = rs.getInt(1);
			        }
			    } catch (Exception e) {
			        System.out.println(e+"jassem 2");
			    }
			return q;
		}
		public static int insertRoomCart(int uid,int hoid,int roid ,int noRooms) {
			 int rowsAffected = 0;
		        Conn con = new Conn();
		        Connection connection = con.connection;
		        PreparedStatement preparedStatement = null;

		        try {
		            // Prepare the SQL statement for inserting into the cart table
		            String insertQuery = "INSERT INTO roomBooking (uid, hoid, roid, noRooms) VALUES (?, ?, ?, ?)";
		            preparedStatement = connection.prepareStatement(insertQuery);

		            // Set values for the parameters
		            preparedStatement.setInt(1, uid);
		            preparedStatement.setInt(2, hoid);
		            preparedStatement.setInt(3, roid);
		            preparedStatement.setInt(4, noRooms);

		            // Execute the update
		            rowsAffected = preparedStatement.executeUpdate();

		        } catch (SQLException e) {
		            e.printStackTrace();
		            // Handle the SQL exception as needed
		        } finally {
		            // Close the PreparedStatement and Connection
		            try {
		                if (preparedStatement != null) {
		                    preparedStatement.close();
		                }
		                if (connection != null) {
		                    connection.close();
		                }
		            } catch (SQLException e) {
		                e.printStackTrace();
		            }
		        }

		        return rowsAffected;
		}
		public static int getCartRoomNoOfRoom(int roid) {
			int q = 0;
			Conn con = new Conn();
			Connection connection = con.connection;
			 try {
			        String sql = "select sum(noRooms) from roomBooking where roid ="+roid+";";
			        PreparedStatement stm = connection.prepareStatement(sql);
			        ResultSet rs = stm.executeQuery();
			        while (rs.next()) {
			           q = rs.getInt(1);
			        }
			    } catch (Exception e) {
			        System.out.println(e+"jassem 2");
			    }
			return q;
		}
		
		public static List<RoomBookingDTO> getAllRoomBookingForUser(int hoid, int uid){
			ArrayList<RoomBookingDTO> li = new ArrayList<RoomBookingDTO>();
			Conn con = new Conn();
			Connection connection = con.connection;
			try {
				String sql = "select tid, uid, hoid, roid, noRooms, booking_timestamp, status from roomBooking where hoid="+hoid+" and uid="+uid+";";
				PreparedStatement stm = connection.prepareStatement(sql);
				ResultSet rs = stm.executeQuery();
				while(rs.next()) {
					RoomBookingDTO r = new RoomBookingDTO();
					r.setTid(rs.getInt(1));
					r.setUid(rs.getInt(2));
					r.setHoid(rs.getInt(3));
					r.setRoid(rs.getInt(4));
					r.setNoRooms(rs.getInt(5));
					r.setDate(rs.getString(6));
					r.setStatus(rs.getString(7));
					li.add(r);
				}
			} catch (Exception e) {
				// TODO: handle exception
				System.out.println(e);
			}
			
			return li;
		}
		
		public static String getRoomName(int roid) {
			String name = null;
			Conn con = new Conn();
			Connection connection = con.connection;
			 try {
			        String sql = "select room from room where tid ="+roid+";";
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
		public static double getRoomPrice(int tid) {
			double price = 0;
			Conn con = new Conn();
			Connection connection = con.connection;
			 try {
			        String sql = "select price from room where tid ="+tid;
			        PreparedStatement stm = connection.prepareStatement(sql);
			      
			        ResultSet rs = stm.executeQuery();
			        while (rs.next()) {
			        	price = rs.getDouble(1);
			        }
			    } catch (Exception e) {
			        System.out.println(e);
			    }
			return price;
		}
		
		public static double getRoomDiscount(int tid) {
			double price = 0;
			Conn con = new Conn();
			Connection connection = con.connection;
			 try {
			        String sql = "select discount from room where tid ="+tid;
			        PreparedStatement stm = connection.prepareStatement(sql);
			    
			        ResultSet rs = stm.executeQuery();
			        while (rs.next()) {
			        	price = rs.getDouble(1);
			        }
			    } catch (Exception e) {
			        System.out.println(e);
			    }
			return price;
		}
		
		public static List<RoomBookingDTO> getAllRoomBookingForHotel(int hoid){
			ArrayList<RoomBookingDTO> li = new ArrayList<RoomBookingDTO>();
			Conn con = new Conn();
			Connection connection = con.connection;
			try {
				String sql = "select tid, uid, hoid, roid, noRooms, booking_timestamp, status from roomBooking where hoid="+hoid+";";
				PreparedStatement stm = connection.prepareStatement(sql);
				ResultSet rs = stm.executeQuery();
				while(rs.next()) {
					RoomBookingDTO r = new RoomBookingDTO();
					r.setTid(rs.getInt(1));
					r.setUid(rs.getInt(2));
					r.setHoid(rs.getInt(3));
					r.setRoid(rs.getInt(4));
					r.setNoRooms(rs.getInt(5));
					r.setDate(rs.getString(6));
					r.setStatus(rs.getString(7));
					li.add(r);
				}
			} catch (Exception e) {
				// TODO: handle exception
				System.out.println(e);
			}
			
			return li;
		}
		
		public static int acceptRoomBooking(int tid) {
			int i = 0;
			Conn con = new Conn();
			Connection connection = con.connection;
			String update = "UPDATE roomBooking SET status = 'accept' WHERE tid="+tid+";";				    	
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
		public static int rejectRoomBooking(int tid) {
			int i = 0;
			Conn con = new Conn();
			Connection connection = con.connection;
			String update = "UPDATE roomBooking SET status = 'reject' WHERE tid="+tid+";";				    	
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
		
		public static List<TaxiDTO> getTaxiForUser(int hoid){
			ArrayList<TaxiDTO> li = new ArrayList<TaxiDTO>();
			Conn con = new Conn();
			Connection connection = con.connection;
			try {
				String sql = "select tid,hoid,driver,vehicle,plate,status,active,price from taxi where hoid="+hoid+";";
				PreparedStatement stm = connection.prepareStatement(sql);
				ResultSet rs = stm.executeQuery();
				while(rs.next()) {
					TaxiDTO tx = new TaxiDTO();
					tx.setTid(rs.getInt(1));
					tx.setHoid(rs.getInt(2));
					tx.setDriver(rs.getString(3));
					tx.setVehicle(rs.getString(4));
					tx.setPlate(rs.getString(5));
					tx.setStatus(rs.getString(6));
					tx.setActive(rs.getString(7));
					tx.setPrice(rs.getDouble(8));
					if(tx.getStatus() != null && tx.getStatus().equals("accept")) {
						li.add(tx);
					}
				}
			} catch (Exception e) {
				// TODO: handle exception
				System.out.println(e);
			}
			
			return li;
		}
		
		
		public static int insertCarBooking(int uid, int hoid, int txoid, int km) {
		    int i = 0;
		    Conn con = new Conn();
		    Connection connection = con.connection;

		    try {
		        String sql = "INSERT INTO bookCar (uid, hoid, txoid ,km) VALUES (?, ?, ?, ?)";
		        PreparedStatement statement = connection.prepareStatement(sql);
		        statement.setInt(1, uid);
		        statement.setInt(2, hoid);
		        statement.setInt(3, txoid);
		        statement.setInt(4, km);
		        int rowsAffected = statement.executeUpdate();
		        if (rowsAffected > 0) {
		            i = 1;
		        }
		    } catch (SQLException e) {
		        // Handle SQL exception
		        e.printStackTrace();
		    } finally {
		        // Close the connection
		        if (connection != null) {
		            try {
		                connection.close();
		            } catch (SQLException e) {
		                e.printStackTrace();
		            }
		        }
		    }

		    return i;
		}
		
		public static List<TaxiBookedDTO> getTaxiBookingsForUser(int uid, int hoid){
			ArrayList<TaxiBookedDTO> li = new ArrayList<TaxiBookedDTO>();
			Conn con = new Conn();
		    Connection connection = con.connection;
		    try {
				String sql = "select tid, uid, hoid, txoid, km, booking_timestamp, status from bookCar where uid="+uid+" and hoid="+hoid+";";
				PreparedStatement stm = connection.prepareStatement(sql);
				ResultSet rs = stm.executeQuery();
				while(rs.next()) {
					TaxiBookedDTO tx = new TaxiBookedDTO();
					tx.setTid(rs.getInt(1));
					tx.setUid(rs.getInt(2));
					tx.setHoid(rs.getInt(3));
					tx.setTxoid(rs.getInt(4));
					tx.setKm(rs.getInt(5));
					tx.setDate(rs.getString(6));
					tx.setStatus(rs.getString(7));
					li.add(tx);
				}
			} catch (Exception e) {
				// TODO: handle exception
				System.out.println(e);
			}
		    
		    return li;
			
		}
		public static String getTaxiName(int txoid) {
			String name = null;
			Conn con = new Conn();
			Connection connection = con.connection;
			 try {
			        String sql = "select vehicle from taxi where tid="+txoid+";";
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
		
		public static String getTaxiDriver(int txoid) {
			String name = null;
			Conn con = new Conn();
			Connection connection = con.connection;
			 try {
			        String sql = "select driver from taxi where tid ="+txoid+";";
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
		
		public static String getTaxiPlate(int txoid) {
			String name = null;
			Conn con = new Conn();
			Connection connection = con.connection;
			 try {
			        String sql = "select plate from taxi where tid ="+txoid+";";
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
		
		public static double getTaxiParice(int txoid) {
			double price = 0;
			Conn con = new Conn();
			Connection connection = con.connection;
			 try {
			        String sql = "select price from taxi where tid ="+txoid;
			        PreparedStatement stm = connection.prepareStatement(sql);
			    
			        ResultSet rs = stm.executeQuery();
			        while (rs.next()) {
			        	price = rs.getDouble(1);
			        }
			    } catch (Exception e) {
			        System.out.println(e);
			    }
			return price;
		}
		
		public static List<TaxiBookedDTO> getTaxiBookingsForHotel(int hoid){
			ArrayList<TaxiBookedDTO> li = new ArrayList<TaxiBookedDTO>();
			Conn con = new Conn();
		    Connection connection = con.connection;
		    try {
				String sql = "select tid, uid, hoid, txoid, km, booking_timestamp, status from bookCar where hoid="+hoid+";";
				PreparedStatement stm = connection.prepareStatement(sql);
				ResultSet rs = stm.executeQuery();
				while(rs.next()) {
					TaxiBookedDTO tx = new TaxiBookedDTO();
					tx.setTid(rs.getInt(1));
					tx.setUid(rs.getInt(2));
					tx.setHoid(rs.getInt(3));
					tx.setTxoid(rs.getInt(4));
					tx.setKm(rs.getInt(5));
					tx.setDate(rs.getString(6));
					tx.setStatus(rs.getString(7));
					li.add(tx);
				}
			} catch (Exception e) {
				// TODO: handle exception
				System.out.println(e);
			}
		    
		    return li;
			
		}

}
