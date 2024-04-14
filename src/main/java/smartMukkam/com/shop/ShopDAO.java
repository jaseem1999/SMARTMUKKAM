package smartMukkam.com.shop;

import java.sql.Connection;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import smartMukkam.connection.Conn;

public class ShopDAO {
	//login
	public static int shopLogout(int sid) {
		int i = 0;
		Conn con = new Conn();
		Connection connection = con.connection;
	
		String update = "UPDATE shop SET active='inactive' WHERE shopId="+sid+";";
    	
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
	//get product based shop id
	public static List<ProductDTO> getProductBasedOnShopId(int sid){
		ArrayList<ProductDTO> li =new ArrayList<ProductDTO>();
		Conn con = new Conn();
		Connection connection = con.connection;
		try {
			String sql = "SELECT tid,sid,product,description,price,discount,status from product where sid="+sid+";";
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
	        	li.add(pro);
	        }
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println(e);
		}
		return li;
	}
	public static List<ProductDTO> getProductBasedOnShopIdForUsers(int sid){
		ArrayList<ProductDTO> li =new ArrayList<ProductDTO>();
		Conn con = new Conn();
		Connection connection = con.connection;
		try {
			String sql = "SELECT tid,sid,product,description,price,discount,status from product where sid="+sid+";";
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
	//product delete
	public static int productDeleteAccept(int tid) {
		int i = 0;
		Conn con = new Conn();
		Connection connection = con.connection;
					
		String update = "UPDATE product SET status = 'delete' WHERE tid="+tid+";";
				    	
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
	//product active
	public static int productActiveAccept(int tid) {
		int i = 0;
		Conn con = new Conn();
		Connection connection = con.connection;
						
		String update = "UPDATE product SET status ='active' WHERE tid="+tid+";";
					    	
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
	//get all Shops 
	public static List<ShopDTO> getAllShops(){
	    ArrayList<ShopDTO> li = new ArrayList<ShopDTO>();
	    Conn con = new Conn();
	    Connection connection = con.connection;

	    try {
	        String sql = "SELECT s.shopId, s.name, s.email, s.password, s.number, s.typeOfShop, s.status, sd.shopeName, sd.addressOne, sd.addressTwo, sd.city, sd.state FROM shop s JOIN shopDetaild sd ON s.shopId = sd.sid ;";
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
	// get all shop details based sid
	public static List<ShopDTO> getAllShopsBasedSid(int sid){
	    ArrayList<ShopDTO> li = new ArrayList<ShopDTO>();
	    Conn con = new Conn();
	    Connection connection = con.connection;

	    try {
	        String sql = "SELECT s.shopId, s.name, s.email, s.password, s.number, s.typeOfShop, s.status, sd.shopeName, sd.addressOne, sd.addressTwo, sd.city, sd.state FROM shop s JOIN shopDetaild sd ON s.shopId = sd.sid where s.shopId="+sid+";";
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
	
		
		//get product based product id
		public static List<ProductDTO> getProductBasedOnProductId(int pid){
			ArrayList<ProductDTO> li =new ArrayList<ProductDTO>();
			Conn con = new Conn();
			Connection connection = con.connection;
			try {
				String sql = "SELECT tid,sid,product,description,price,discount,status from product where tid="+pid+";";
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
		        	li.add(pro);
		        }
			} catch (Exception e) {
				// TODO: handle exception
				System.out.println(e);
			}
			return li;
		}
	
	public static int updateCart(int uid,int sid,int pid ,int quantity) {
		 int rowsAffected = 0;
	        Conn con = new Conn();
	        Connection connection = con.connection;
	        PreparedStatement preparedStatement = null;

	        try {
	            // Prepare the SQL statement for inserting into the cart table
	            String insertQuery = "INSERT INTO cart (uid, sid, pid, quantity) VALUES (?, ?, ?, ?)";
	            preparedStatement = connection.prepareStatement(insertQuery);

	            // Set values for the parameters
	            preparedStatement.setInt(1, uid);
	            preparedStatement.setInt(2, sid);
	            preparedStatement.setInt(3, pid);
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
	public static List<CartDTO> getAllCart(int sid){
		ArrayList<CartDTO> li = new ArrayList<CartDTO>();
		Conn con = new Conn();
        Connection connection = con.connection;
		try {
			 String sql = "SELECT tid,uid,sid,pid,quantity,booking_timestamp,status from cart where sid ="+sid+";";
		     PreparedStatement stm = connection.prepareStatement(sql);
		     ResultSet rs = stm.executeQuery();
		     while(rs.next()) {
		    	 CartDTO cd = new CartDTO();
		    	 cd.setTid(rs.getInt(1));
		    	 cd.setUid(rs.getInt(2));
		    	 cd.setSid(rs.getInt(3));
		    	 cd.setPid(rs.getInt(4));
		    	 cd.setQ(rs.getInt(5));
		    	 cd.setDate(rs.getString(6));
		    	 cd.setStatus(rs.getString(7));
		    	 
		    	 li.add(cd);
		     }
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println(e);
		}
		return li;
	}
	public static String getProduct(int pid) {
		String r = null;
		Conn con = new Conn();
		Connection connection = con.connection;
		try {
			String sql = "select product from product where tid="+pid;
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
	public static String getProductPrice(int pid) {
		String r = null;
		Conn con = new Conn();
		Connection connection = con.connection;
		try {
			String sql = "select price from product where tid="+pid;
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
	public static String getProductDiscount(int pid) {
		String r = null;
		Conn con = new Conn();
		Connection connection = con.connection;
		try {
			String sql = "select discount from product where tid="+pid;
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
	public static int CartAccept(int tid) {
		int i = 0;
		Conn con = new Conn();
		Connection connection = con.connection;
			
		String update = "UPDATE cart SET status = 'accept' WHERE tid ="+tid+";";
		    	
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
	public static int CartDelivery(int tid) {
		int i = 0;
		Conn con = new Conn();
		Connection connection = con.connection;
			
		String update = "UPDATE cart SET status = 'delivery' WHERE tid ="+tid+";";
		    	
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
	public static int CartDelivered(int tid) {
		int i = 0;
		Conn con = new Conn();
		Connection connection = con.connection;
			
		String update = "UPDATE cart SET status = 'delivered' WHERE tid ="+tid+";";
		    	
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
	
	public static int CartReject(int tid) {
		int i = 0;
		Conn con = new Conn();
		Connection connection = con.connection;
		String update = "UPDATE cart SET status = 'reject' WHERE tid ="+tid+";";
		    	
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
	public static String getShopOnline(int sid) {
		String i = null;
		Conn con = new Conn();
		Connection connection = con.connection;
		try {
			String sql = "select active from shop where shopId="+sid;
			PreparedStatement stm =connection.prepareStatement(sql);
			ResultSet rs = stm.executeQuery();
			while(rs.next()) {
				i = rs.getString(1);
			}
		}catch (Exception e) {
			// TODO: handle exception
			System.out.println(e);
		}
		return i;
	}
	
	public static List<CartDTO> getAllCartwithUid(int sid, int uid){
		ArrayList<CartDTO> li = new ArrayList<CartDTO>();
		Conn con = new Conn();
        Connection connection = con.connection;
		try {
			 String sql = "SELECT tid,uid,sid,pid,quantity,booking_timestamp,status from cart where sid ="+sid+" and uid="+uid+";";
		     PreparedStatement stm = connection.prepareStatement(sql);
		     ResultSet rs = stm.executeQuery();
		     while(rs.next()) {
		    	 CartDTO cd = new CartDTO();
		    	 cd.setTid(rs.getInt(1));
		    	 cd.setUid(rs.getInt(2));
		    	 cd.setSid(rs.getInt(3));
		    	 cd.setPid(rs.getInt(4));
		    	 cd.setQ(rs.getInt(5));
		    	 cd.setDate(rs.getString(6));
		    	 cd.setStatus(rs.getString(7));
		    	 
		    	 li.add(cd);
		     }
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println(e);
		}
		return li;
	}
	//get product based product id and sid
			public static List<ProductDTO> getProductBasedOnProductIdAndSID(int sid,int pid){
				ArrayList<ProductDTO> li =new ArrayList<ProductDTO>();
				Conn con = new Conn();
				Connection connection = con.connection;
				try {
					String sql = "SELECT tid,sid,product,description,price,discount,status from product where tid="+pid+" and sid="+sid+";";
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
			        	li.add(pro);
			        }
				} catch (Exception e) {
					// TODO: handle exception
					System.out.println(e);
				}
				return li;
			}
	// insert product review from user
			public static int postReviewFromUser(int sid, int uid, int pid, String review) {
			    int i = 0;
			    Conn con = new Conn();
			    Connection connection = con.connection;
			    PreparedStatement preparedStatement = null;
			    try {
			        // The SQL query to insert a review
			        String insertQuery = "INSERT INTO reviewProductTable (uid, sid, pid, review) VALUES (?, ?, ?, ?)";

			        preparedStatement = connection.prepareStatement(insertQuery);

			        // Set values for the parameters
			        preparedStatement.setInt(1, uid);
			        preparedStatement.setInt(2, sid);
			        preparedStatement.setInt(3, pid);
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
		// get product review for users 
			public static List<ReviewDTO> getReviewBasedSidPid(int sid, int pid){
				ArrayList<ReviewDTO> li = new ArrayList<ReviewDTO>();
				Conn con = new Conn();
				Connection connection = con.connection;
				
				try {
					String sql = "SELECT tid, uid, sid, pid, review, comment, status " +"FROM reviewProductTable " +"WHERE sid = " + sid + " AND pid = " + pid + " " +"ORDER BY tid DESC;";

			        PreparedStatement stm = connection.prepareStatement(sql);
			        ResultSet rs = stm.executeQuery();
			        while(rs.next()) {
			        	ReviewDTO re = new ReviewDTO();
			        	re.setTid(rs.getInt(1));
			        	re.setUid(rs.getInt(2));
			        	re.setSid(rs.getInt(3));
			        	re.setPid(rs.getInt(4));
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
			
			//customer verification
			public static int getVerifyCustomer(int pid, int uid) {
				int i = 0;
				Conn con = new Conn();
				Connection connection = con.connection;
				try {
					String sql = "select tid from cart where uid="+uid+" and pid="+pid+";";
					PreparedStatement stm =connection.prepareStatement(sql);
					ResultSet rs = stm.executeQuery();
					while(rs.next()) {
						int tid = rs.getInt(1);
						i =1;
					}
				}catch (Exception e) {
					// TODO: handle exception
					System.out.println(e);
				}
				return i;
			}
			
			public static List<ReviewDTO> getReviewBasedSid(int sid){
				ArrayList<ReviewDTO> li = new ArrayList<ReviewDTO>();
				Conn con = new Conn();
				Connection connection = con.connection;
				
				try {
					String sql = "SELECT tid, uid, sid, pid, review, comment, status " +"FROM reviewProductTable " +"WHERE sid = " + sid + " ORDER BY tid DESC;";

			        PreparedStatement stm = connection.prepareStatement(sql);
			        ResultSet rs = stm.executeQuery();
			        while(rs.next()) {
			        	ReviewDTO re = new ReviewDTO();
			        	re.setTid(rs.getInt(1));
			        	re.setUid(rs.getInt(2));
			        	re.setSid(rs.getInt(3));
			        	re.setPid(rs.getInt(4));
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
			
		public static String getProducts(int pid) {
			String product = null;
			Conn con = new Conn();
			Connection connection = con.connection;
			try {
				String sql = "select product from product where tid="+pid;
				PreparedStatement stm =connection.prepareStatement(sql);
				ResultSet rs = stm.executeQuery();
				while(rs.next()) {
					product = rs.getString(1);
				}
			}catch (Exception e) {
				// TODO: handle exception
				System.out.println(e);
			}
			
			return product;
		}
		
		public static int updateProductReviewComment(int tid, String comment) {
			int i = 0;
			Conn con = new Conn();
			Connection connection = con.connection;
			String update = "UPDATE reviewProductTable SET comment=? WHERE tid=?";
			    	
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
		
		public static List<AdvertisementDTO> getAllAds(int sid){
			ArrayList<AdvertisementDTO> li = new ArrayList<AdvertisementDTO>();
			Conn con = new Conn();
			Connection connection = con.connection;
			
			try {
				String sql = "select tid,sid,product , description, price, discount, status,link from ads where sid ="+sid+";";

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
		
		public static List<AdvertisementDTO> getAllAdsBaseSid(int sid){
			ArrayList<AdvertisementDTO> li = new ArrayList<AdvertisementDTO>();
			Conn con = new Conn();
			Connection connection = con.connection;
			
			try {
				String sql = "select tid,sid,product , description, price, discount, status,link from ads where sid ="+sid+";";

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
		        	if(ads.getStatus() == null) {
		        		li.add(ads);
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
		        	if(ads.getStatus() == null) {
		        		li.add(ads);
		        	}else {
		        		
		        	}
		        	
		        	
		        }
			} catch (Exception e) {
				// TODO: handle exception
				System.out.println(e);
			}
			
			return li;
		}
		
		public static int updateAdsActive(int tid) {
			int i = 0;
			Conn con = new Conn();
			Connection connection = con.connection;
			String update = "UPDATE ads SET status=null WHERE tid=?";
			    	
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
		public static int updateAdsDelete(int tid) {
			int i = 0;
			Conn con = new Conn();
			Connection connection = con.connection;
			String update = "UPDATE ads SET status='delete' WHERE tid=?";
			    	
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
		
		
		public static List<ShopGalleryDTO> getGalleryBaseSidForUser(int sid) {
			ArrayList<ShopGalleryDTO> li = new ArrayList<ShopGalleryDTO>();
			Conn con = new Conn();
			Connection connection = con.connection;
			try {
				String sql ="select tid,sid,description,status from sGallery where sid="+sid+";";
				PreparedStatement stm = connection.prepareStatement(sql);
			    ResultSet rs = stm.executeQuery();
			    while(rs.next()) {
			    	ShopGalleryDTO g = new ShopGalleryDTO();
			    	g.setTid(rs.getInt(1));
			    	g.setSid(rs.getInt(2));
			    	g.setDescription(rs.getString(3));
			    	g.setStatus(rs.getString(4));
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
		
		public static List<ShopGalleryDTO> getGalleryBaseSidForShop(int sid) {
			ArrayList<ShopGalleryDTO> li = new ArrayList<ShopGalleryDTO>();
			Conn con = new Conn();
			Connection connection = con.connection;
			try {
				String sql ="select tid,sid,description,status from sGallery where sid="+sid+";";
				PreparedStatement stm = connection.prepareStatement(sql);
			    ResultSet rs = stm.executeQuery();
			    while(rs.next()) {
			    	ShopGalleryDTO g = new ShopGalleryDTO();
			    	g.setTid(rs.getInt(1));
			    	g.setSid(rs.getInt(2));
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
		public static int updateGalleryDelete(int tid) {
			int i = 0;
			Conn con = new Conn();
			Connection connection = con.connection;
			String update = "UPDATE sGallery SET status='delete' WHERE tid=?";
			    	
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
		
		public static int passWordChange(String email) {
			int i =0;
			int k = 0;
			int sid = 0;
			String pass = null;
			Conn con = new Conn();
			Connection connection = con.connection;
			try {
				String sql = "select shopId, password from shop where email = ?;";
				PreparedStatement stm = connection.prepareStatement(sql);
				stm.setString(1, email);
				ResultSet rs = stm.executeQuery();
				while(rs.next()) {
					sid = rs.getInt(1);
					pass = rs.getString(2);
					k =1;
				}
				if(k > 0) {
					String insert = "insert into shopRequestChangePassword(sid, email, password) value (?, ?, ?);";
					PreparedStatement stm1 = connection.prepareStatement(insert);
					stm1.setInt(1, sid);
					stm1.setString(2, email);
					stm1.setString(3, pass);
					i = stm1.executeUpdate();
					if(i>0) {
						return i;
					}else {
						i=0;
						return i;
					}
				}else {
					i =0;
					return i;
				}
			} catch (Exception e) {
				// TODO: handle exception
				System.out.println(e);
			}
			return i;
		}
		
		 public static String getNameByShopId(int shopId) {
		        String name = null;
		        Conn con = new Conn();
		        Connection connection = con.connection;
		        try {
		            String query = "SELECT shopeName FROM shopDetaild WHERE sid = ?";
		            try (PreparedStatement preparedStatement = connection.prepareStatement(query)) {
		                preparedStatement.setInt(1, shopId);
		                try (ResultSet resultSet = preparedStatement.executeQuery()) {
		                    if (resultSet.next()) {
		                        name = resultSet.getString("shopeName");
		                    }
		                }
		            }
		        } catch (SQLException e) {
		            e.printStackTrace();
		        }
		        return name;
		    }


}
