package smartMukkam.com.municipality;

import java.sql.Connection;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import com.mysql.cj.x.protobuf.MysqlxDatatypes.Array;

import smartMukkam.com.shop.ShopDTO;
import smartMukkam.connection.Conn;

public class ServicesDTO {
	public static int appointmentSubmit(int uid, String officer, String reason, String date) {
		int i = 0;
		Conn con = new Conn();
		Connection connection  = con.connection;
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");

		try {
		    Date currentDate = new Date();  // Get current system date
		    Date appointmentDate = sdf.parse(date);  // Parse the date parameter from the request
		    
		    // Compare the appointment date with the current date
		    if (appointmentDate.before(currentDate)) {
		    	i =0; 
        		return i;
		    } else {
		    	try {
					String insertQuery = "INSERT INTO appointmets (uid, officer, reason, date) VALUES (?, ?, ?, ?)";
		        	PreparedStatement statement = connection.prepareStatement(insertQuery);
		        	statement.setInt(1, uid);
		        	statement.setString(2, officer);
		        	statement.setString(3, reason);
		        	statement.setString(4, date);
		        	
		        	int rowsInserted = statement.executeUpdate();
		        	
		        	if(rowsInserted > 0) {
		        		i =1; 
		        		return i;
		        	}
					
				} catch (Exception e) {
					// TODO: handle exception
					System.out.println(e);
				}
		    }
		} catch (ParseException e) {
		    // Handle parsing exception
		    e.printStackTrace();
		}
		
		
		
		return i;
	}
	// get all appointments
	public static List<AppointmentDTO> getAllAppointments(){
		ArrayList<AppointmentDTO> li = new ArrayList<AppointmentDTO>();
		Conn con = new Conn();
		Connection connection = con.connection;
		try {
			String sql = "select tid,uid,officer,reason,date,status,action from appointmets;";
			PreparedStatement stm =connection.prepareStatement(sql);
			ResultSet rs = stm.executeQuery();
			while(rs.next()) {
				AppointmentDTO app = new AppointmentDTO();
				app.setTid(rs.getInt(1));
				app.setUid(rs.getInt(2));
				app.setOfficer(rs.getString(3));
				app.setReason(rs.getString(4));
				app.setDate(rs.getString(5));
				app.setStatus(rs.getString(6));
				app.setAction(rs.getString(7));
				li.add(app);
			}
		}catch (Exception e) {
			// TODO: handle exception
			System.out.println(e);
		}
		
		
		return li;
	}
	
	public static int actionAppointment(int tid, String action) {
	    int i = 0;
	    Conn con = new Conn();
	    Connection connection = con.connection;
	    
	    String update = "UPDATE appointmets SET action = ? WHERE tid = ?";

	    try {
	        PreparedStatement statement = connection.prepareStatement(update);
	        statement.setString(1, action);
	        statement.setInt(2, tid);
	        
	        int rowsAffected = statement.executeUpdate();
	        
	        if (rowsAffected > 0) {
	            i = 1;
	        }
	        
	        statement.close();
	        connection.close(); // Don't forget to close the connection
	    } catch (SQLException e) {
	        e.printStackTrace(); // print the error stack trace for debugging
	    }
	    return i;
	}

	
	//accept appointments 
	public static int acceptAppointment(int tid) {
		int i = 0;
		Conn con = new Conn();
		Connection connection = con.connection;
		
		String update = "UPDATE appointmets SET status = 'accept' WHERE tid ="+tid+";";
    	
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
	
	public static int updateOfficerAppointment(int tid, String officer) {
	    int i = 0;
	    Conn con = new Conn();
	    Connection connection = con.connection;

	    String update = "UPDATE appointmets SET officer = ? WHERE tid = ?;";

	    try {
	        // Create a PreparedStatement to safely handle parameterized SQL queries
	        PreparedStatement preparedStatement = connection.prepareStatement(update);
	        
	        // Set the values for the PreparedStatement parameters
	   
	        preparedStatement.setString(1, officer);
	        preparedStatement.setInt(2, tid);

	        // Execute the update query
	        int rowsAffected = preparedStatement.executeUpdate();

	        // Check if any rows were affected
	        if (rowsAffected > 0) {
	            i = 1;
	        }

	        // Close the PreparedStatement
	        preparedStatement.close();
	    } catch (SQLException e) {
	        // Handle any SQL exceptions
	        e.printStackTrace(); // For debugging purposes, consider logging the exception
	    } finally {
	        // Close the database connection
	        try {
	            if (connection != null) {
	                connection.close();
	            }
	        } catch (SQLException e) {
	            e.printStackTrace(); // Handle any closing connection exceptions
	        }
	    }
	    return i;
	}

	
	//reject appointments 
		public static int rejectAppointment(int tid) {
			int i = 0;
			Conn con = new Conn();
			Connection connection = con.connection;
			
			String update = "UPDATE appointmets SET status = 'reject' WHERE tid ="+tid+";";
	    	
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
		
		//get the status of appointments
		public static String getAppointmentStatus(int tid) {
			String status = null;
			Conn con = new Conn();
			Connection connection = con.connection;
			try {
				String sql = "select status from appointmets where tid="+tid+";";
				PreparedStatement stm =connection.prepareStatement(sql);
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
		//getAppointmets Details based uid
		public static List<AppointmentDTO> getBasedIdAppointments(int uid){
			ArrayList<AppointmentDTO> li= new ArrayList<AppointmentDTO>();
			Conn con = new Conn();
			Connection connection = con.connection;
			try {
				String sql = "select tid,uid,officer,reason,date,status,action from appointmets where uid="+uid+";";
				PreparedStatement stm =connection.prepareStatement(sql);
				ResultSet rs = stm.executeQuery();
				while(rs.next()) {
					AppointmentDTO app = new AppointmentDTO();
					app.setTid(rs.getInt(1));
					app.setUid(rs.getInt(2));
					app.setOfficer(rs.getString(3));
					app.setReason(rs.getString(4));
					app.setDate(rs.getString(5));
					app.setStatus(rs.getString(6));
					app.setAction(rs.getString(7));
					li.add(app);
				}
			}catch (Exception e) {
				// TODO: handle exception
				System.out.println(e);
			}
			
			return li;
		}
		//get all project submission
		public static List<ProjectDTO> getAllProject(){
			ArrayList<ProjectDTO> li =new ArrayList<ProjectDTO>();
			Conn con = new Conn();
			Connection connection = con.connection;
			try {
				String sql = "select tid,uid,project,idea,committee,status from projects;";
				PreparedStatement stm =connection.prepareStatement(sql);
				ResultSet rs = stm.executeQuery();
				while(rs.next()) {
					ProjectDTO prj = new ProjectDTO();
					prj.setTid(rs.getInt(1));
					prj.setUid(rs.getInt(2));
					prj.setProject(rs.getString(3));
					prj.setIdea(rs.getString(4));
					prj.setCommittee(rs.getString(5));
					prj.setStatus(rs.getString(6));
					li.add(prj);
				}
			} catch (Exception e) {
				// TODO: handle exception
				System.out.println(e);
			}
			
			return li;
		}
		//get All project submission based on uid
		public static List<ProjectDTO> getAllProjectBaesedId(int uid){
			ArrayList<ProjectDTO> li =new ArrayList<ProjectDTO>();
			Conn con = new Conn();
			Connection connection = con.connection;
			try {
				String sql = "select tid,uid,project,idea,committee,status from projects where uid="+uid+";";
				PreparedStatement stm =connection.prepareStatement(sql);
				ResultSet rs = stm.executeQuery();
				while(rs.next()) {
					ProjectDTO prj = new ProjectDTO();
					prj.setTid(rs.getInt(1));
					prj.setUid(rs.getInt(2));
					prj.setProject(rs.getString(3));
					prj.setIdea(rs.getString(4));
					prj.setCommittee(rs.getString(5));
					prj.setStatus(rs.getString(6));
					li.add(prj);
				}
			} catch (Exception e) {
				// TODO: handle exception
				System.out.println(e);
			}
			
			return li;
		}
		//accept project
		public static int acceptProject(int tid) {
			int i = 0;
			Conn con = new Conn();
			Connection connection = con.connection;
		
			String update = "UPDATE projects SET status = 'accept' WHERE tid ="+tid+";";
	    	
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
		
		//reject project
		public static int rejectProject(int tid) {
			int i = 0;
			Conn con = new Conn();
			Connection connection = con.connection;
			String update = "UPDATE projects SET status = 'reject' WHERE tid ="+tid+";";
			
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
		
		//get all complaints
		public static List<ComplaintDTO> getAllComplaints(){
			ArrayList<ComplaintDTO> li = new ArrayList<ComplaintDTO>();
			Conn con = new Conn();
			Connection connection = con.connection;
			try {
				String sql = "select tid,uid,officer,compint,committee,booking_timestamp ,status from complaint;";
				PreparedStatement stm =connection.prepareStatement(sql);
				ResultSet rs = stm.executeQuery();
				while(rs.next()) {
					ComplaintDTO comp = new ComplaintDTO();
					comp.setTid(rs.getInt(1));
					comp.setUid(rs.getInt(2));
					comp.setOfficer(rs.getString(3));
					comp.setComplaint(rs.getString(4));
					comp.setCommittee(rs.getString(5));
					comp.setDate(rs.getString(6));
					comp.setStatus(rs.getString(7));
					li.add(comp);
				}
			} catch (Exception e) {
				// TODO: handle exception
				System.out.println(e);
			}
			return li;
		}
		//get all complaints
				public static List<ComplaintDTO> getAllComplaintsBasedUId(int uid){
					ArrayList<ComplaintDTO> li = new ArrayList<ComplaintDTO>();
					Conn con = new Conn();
					Connection connection = con.connection;
					try {
						String sql = "select tid,uid,officer,compint,committee,booking_timestamp, status from complaint where uid="+uid+";";
						PreparedStatement stm =connection.prepareStatement(sql);
						ResultSet rs = stm.executeQuery();
						while(rs.next()) {
							ComplaintDTO comp = new ComplaintDTO();
							comp.setTid(rs.getInt(1));
							comp.setUid(rs.getInt(2));
							comp.setOfficer(rs.getString(3));
							comp.setComplaint(rs.getString(4));
							comp.setCommittee(rs.getString(5));
							comp.setDate(rs.getString(6));
							comp.setStatus(rs.getString(7));
							li.add(comp);
						}
					} catch (Exception e) {
						// TODO: handle exception
						System.out.println(e);
					}
					return li;
				}
		//accept complaint
		public static int acceptComplaint(int tid) {
			int i = 0;
			Conn con = new Conn();
			Connection connection = con.connection;
		
			String update = "UPDATE complaint SET status = 'accept' WHERE tid ="+tid+";";
	    	
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
		//reject complaint
		public static int rejectComplaint(int tid) {
			int i = 0;
			Conn con = new Conn();
			Connection connection = con.connection;
				
			String update = "UPDATE complaint SET status = 'reject' WHERE tid ="+tid+";";
			    	
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
		public static List<Councilor> getAllCouncilor(){
			ArrayList<Councilor> li = new ArrayList<Councilor>();
			Conn con = new Conn();
			Connection connection = con.connection;
			try {
				String sql = "select tid,ward,name,position,message,party,status from governorMunicipality;";
				PreparedStatement stm =connection.prepareStatement(sql);
				ResultSet rs = stm.executeQuery();
				while(rs.next()) {
					Councilor co = new Councilor();
					co.setTid(rs.getInt(1));
					co.setWard(rs.getString(2));
					co.setName(rs.getString(3)); 
					co.setPosition(rs.getString(4));
					co.setMessge(rs.getString(5));
					co.setParty(rs.getString(6));
					co.setStatus(rs.getString(7));
					li.add(co);
				}
			} catch (Exception e) {
				// TODO: handle exception
				System.out.println(e);
			}
			return li;
		}
		public static List<HistoryDTO> getAllHistory(){
			ArrayList<HistoryDTO> li = new ArrayList<HistoryDTO>();
			Conn con = new Conn();
			Connection connection = con.connection;
			try {
				String sql = "select tid,chairman,secretary,history,status from municipalityProfile;";
				PreparedStatement stm =connection.prepareStatement(sql);
				ResultSet rs = stm.executeQuery();
				while(rs.next()) {
					HistoryDTO co = new HistoryDTO();
					co.setTid(rs.getInt(1));
					co.setChairman(rs.getString(2));
					co.setSecretary(rs.getString(3)); 
					co.setHistory(rs.getString(4));
					co.setStatus(rs.getString(5));
					li.add(co);
				}
			} catch (Exception e) {
				// TODO: handle exception
				System.out.println(e);
			}
			return li;
		}
		public static List<GalleryDTO> getAllImages(){
			ArrayList<GalleryDTO> li = new ArrayList<GalleryDTO>();
			Conn con = new Conn();
			Connection connection = con.connection;
			try {
				String sql = "select tid,description,status from mGallery;";
				PreparedStatement stm =connection.prepareStatement(sql);
				ResultSet rs = stm.executeQuery();
				while(rs.next()) {
					GalleryDTO g = new GalleryDTO();
					g.setTid(rs.getInt(1));
					g.setDescription(rs.getString(2));
					g.setStatus(rs.getString(3));
					if(g.getStatus() == null) {
						li.add(g);
					}
				}
			} catch (Exception e) {
				// TODO: handle exception
				System.out.println(e);
			}
			
			return li;
		}
		
		public static int deleteGellary(int tid) {
			int i = 0;
			Conn con = new Conn();
			Connection connection = con.connection;
				
			String update = "UPDATE mGallery SET status = 'blocked' WHERE tid ="+tid+";";
			    	
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
		
		//Shop registration waiting list
		public static int getShopEmail(String email){
			int i = 0;
			String status = null;
			Conn con = new Conn();
			Connection connection = con.connection;
			try {
				String sql = "select status from shop where email='"+email+"';";
				PreparedStatement stm =connection.prepareStatement(sql);
				ResultSet rs = stm.executeQuery();
				while(rs.next()) {
					status = rs.getString(1);
					i =1; 
					return i;
				}
			} catch (Exception e) {
				// TODO: handle exception
				System.out.println(e);
			}
			
			return i;
		}
		
		//get All Shop Details
		public static List<ShopDTO> getAllShopDetails() {
		    ArrayList<ShopDTO> shopList = new ArrayList<>();
		    Conn con = new Conn();
		    Connection connection = con.connection;

		    try {
		        String sql = "SELECT s.shopId, s.name, s.email, s.password, s.number, s.typeOfShop, s.status,  sd.shopeName, sd.addressOne, sd.addressTwo, sd.city, sd.state, sd.pin FROM shop s JOIN shopDetaild sd ON s.shopId = sd.sid";
		        PreparedStatement stm = connection.prepareStatement(sql);
		        ResultSet rs = stm.executeQuery();

		        while (rs.next()) {
		            ShopDTO shop = new ShopDTO();
		            shop.setSid(rs.getInt("shopId"));
		            shop.setName(rs.getString("name"));
		            shop.setEmail(rs.getString("email"));
		            shop.setPassword(rs.getString("password"));
		            shop.setPhone(rs.getLong("number"));
		            shop.setShopType(rs.getString("typeOfShop"));
		            shop.setStatus(rs.getString("status"));
		            shop.setShopName(rs.getString("shopeName"));
		            shop.setAddressOne(rs.getString("addressOne"));
		            shop.setAddressTwo(rs.getString("addressTwo"));
		            shop.setCity(rs.getString("city"));
		            shop.setState(rs.getString("state"));
		            shop.setPin(rs.getInt("pin"));

		            shopList.add(shop);
		        }
		    } catch (SQLException e) {
		        e.printStackTrace();
		    } finally {
		        // Close JDBC objects
		        try {
		            if (connection != null) {
		                connection.close();
		            }
		        } catch (SQLException e) {
		            e.printStackTrace();
		        }
		    }

		    return shopList;
		}
		//shop registration accept
		public static int shopRegistrationAccept(int sid) {
			int i = 0;
			Conn con = new Conn();
			Connection connection = con.connection;
				
			String update = "UPDATE shop SET status = 'accept' WHERE shopId="+sid+";";
			    	
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
		//shop registration accept
		public static int shopRegistrationReject(int sid) {
			int i = 0;
			Conn con = new Conn();
			Connection connection = con.connection;
			String update = "UPDATE shop SET status = 'reject' WHERE shopId="+sid+";";				    	
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
