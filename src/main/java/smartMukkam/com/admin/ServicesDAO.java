package smartMukkam.com.admin;

import java.sql.Connection;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import smartMukkam.com.hotel.FoodDTO;
import smartMukkam.com.hotel.RoomDTO;
import smartMukkam.com.hotel.TaxiDTO;
import smartMukkam.com.municipality.login.MunicipalityLoginDTO;
import smartMukkam.com.shop.AdvertisementDTO;
import smartMukkam.com.shop.ProductDTO;
import smartMukkam.com.shop.ShopDTO;
import smartMukkam.com.tourist.TicketDTO;
import smartMukkam.com.tourist.TouristDTO;
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
	
	public static List<FoodDTO> getAllFoodforAdmin(){
		ArrayList<FoodDTO> li = new ArrayList<FoodDTO>();
		Conn con = new Conn();
		Connection connection = con.connection;
		try {
		    String sql = "SELECT tid, hoid, food, quandity, description, price, discount, status, active FROM food;";
		    PreparedStatement stm = connection.prepareStatement(sql);
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
	 public static List<TaxiDTO> getAllTaxiForAdmin() {
	        ArrayList<TaxiDTO> taxiList = new ArrayList<>();
	        Conn con = new Conn();
	        try (Connection connection = con.connection) {
	            String sql = "SELECT * FROM taxi;";
	            try (PreparedStatement statement = connection.prepareStatement(sql)) {
	                
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
	 
	 public static List<TicketDTO> getAllTicket(){
			ArrayList<TicketDTO> li = new ArrayList<TicketDTO>();
			Conn con = new Conn();
			Connection connection = con.connection;
			try {
				String sql = "select tid,toid,ticket,slot,price,status from tickSlot;";
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
	
	 public static List<ShopDTO> getAllShops(){
		    ArrayList<ShopDTO> li = new ArrayList<ShopDTO>();
		    Conn con = new Conn();
		    Connection connection = con.connection;

		    try {
		        String sql = "SELECT s.shopId, s.name, s.email, s.password, s.number, s.typeOfShop, s.status, s.active, sd.shopeName, sd.addressOne, sd.addressTwo, sd.city, sd.state FROM shop s JOIN shopDetaild sd ON s.shopId = sd.sid;";
		        PreparedStatement stm = connection.prepareStatement(sql);
		        ResultSet rs = stm.executeQuery();

		        while (rs.next()) {
		            ShopDTO shop = new ShopDTO(); // Create a new ShopDTO for each row

		            shop.setSid(rs.getInt("shopId"));
		            shop.setName(rs.getString("name"));
		            shop.setEmail(rs.getString("email"));
		            shop.setPassword(rs.getString("password"));
		            shop.setPhone(rs.getLong("number"));
		            shop.setShopType(rs.getString("typeOfShop"));
		            shop.setStatus(rs.getString("status"));
		            shop.setActive(rs.getString("active"));
		            shop.setShopName(rs.getString("shopeName"));
		            shop.setAddressOne(rs.getString("addressOne"));
		            shop.setAddressTwo(rs.getString("addressTwo"));
		            shop.setCity(rs.getString("city"));
		            shop.setState(rs.getString("state"));

		            li.add(shop);
		        }    
		    } catch (Exception e) {
		        // Handle exceptions
		        e.printStackTrace();
		    } finally {
		        // Close resources (connection, statement, etc.) in a finally block if needed
		    }

		    return li;
		}
	 public static List<ProductDTO> getAllProducts(){
			ArrayList<ProductDTO> li =new ArrayList<ProductDTO>();
			Conn con = new Conn();
			Connection connection = con.connection;
			try {
				String sql = "SELECT tid,sid,product,description,price,discount,status from product;";
		        PreparedStatement stm = connection.prepareStatement(sql);
		        ResultSet rs = stm.executeQuery();
		        while(rs.next()) {
		        	ProductDTO pro = new ProductDTO();
		        	pro.setTid(rs.getInt(1));
		        	pro.setSid(rs.getInt(2));
		        	pro.setProduct(rs.getString(3));
		        	pro.setDescription(rs.getString(4));
		        	pro.setPrice(rs.getDouble(5));
		        	pro.setDiscount(rs.getDouble(6));
		        	pro.setStatus(rs.getString(7));
		        	if(pro.getStatus() == null || pro.getStatus().equals("active")){
		        		li.add(pro);
		        	}else {
		        		
		        	}
		        	
		        }
			} catch (Exception e) {
				// TODO: handle exception
				System.out.println(e);
			}
			return li;
		}
	 
	 public static List<AdvertisementDTO> getAllAds(){
			ArrayList<AdvertisementDTO> li = new ArrayList<AdvertisementDTO>();
			Conn con = new Conn();
			Connection connection = con.connection;
			
			try {
				String sql = "select tid,sid,product , description, price, discount, status,link from ads;";

		        PreparedStatement stm = connection.prepareStatement(sql);
		        ResultSet rs = stm.executeQuery();
		        while(rs.next()) {
		        	AdvertisementDTO ads = new AdvertisementDTO();
		        	ads.setTid(rs.getInt(1));
		        	ads.setSid(rs.getInt(2));
		        	ads.setProduct(rs.getString(3));
		        	ads.setDescription(rs.getString(4));
		        	ads.setPrice(rs.getDouble(5));
		        	ads.setDicscount(rs.getDouble(6));
		        	ads.setStatus(rs.getString(7));
		        	ads.setLink(rs.getString(8));
		        	li.add(ads);
		        	
		        }
			} catch (Exception e) {
				// TODO: handle exception
				System.out.println(e);
			}
			
			return li;
		}
	 	
	 public static List<MunicipalityLoginDTO> getMunicipality(){
		 ArrayList<MunicipalityLoginDTO> li = new ArrayList<MunicipalityLoginDTO>();
		 Conn con = new Conn();
		 Connection connection = con.connection;
		 try {
				String sql = "SELECT * FROM municipalityLogin;";
	            PreparedStatement pstmt = connection.prepareStatement(sql);
	            
	            ResultSet rs = pstmt.executeQuery();
	            while (rs.next()) {
	            	MunicipalityLoginDTO m = new MunicipalityLoginDTO();
	            	m.setId(rs.getInt(1));
					m.setEmail(rs.getString(2));
					m.setPassword(rs.getString(3));
					m.setStatus(rs.getString(4));
					li.add(m);
				}
		 }catch (Exception e) {
			// TODO: handle exception
			 System.out.println(e);
		}
		 
		 return li;
	 }
	 
	 public static int updateMunicipalityAccept(int id) {
		 int i = 0;
		 Conn con = new Conn();
		 Connection connection = con.connection;
		 try {
			String sql = "update municipalityLogin set status=NULL where munId = 1;";
			java.sql.Statement statement = connection.createStatement();
	        int rowsAffected = statement.executeUpdate(sql);
	        if(rowsAffected > 0) {
	        	i = 1;
	        	return i;
	        }
	        statement.close();
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println(e);
		}
		 return i;
	 }
	 
	 public static int updateMunicipalityReject(int id) {
		 int i = 0;
		 Conn con = new Conn();
		 Connection connection = con.connection;
		 try {
			String sql = "update municipalityLogin set status='blocked' where munId = 1;";
			java.sql.Statement statement = connection.createStatement();
	        int rowsAffected = statement.executeUpdate(sql);
	        if(rowsAffected > 0) {
	        	i = 1;
	        	return i;
	        }
	        statement.close();
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println(e);
		}
		 return i;
	 }
	 public static String getMunicipalityStatus(String email) {
			String status = null;
			Conn con = new Conn();
			Connection connection = con.connection;
			try {
				String sql = "select status from municipalityLogin where email= ?;";
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
	 
	 
}
