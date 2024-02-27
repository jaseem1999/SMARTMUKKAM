package smartMukkam.com.shop;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.mysql.cj.xdevapi.Session;

import smartMukkam.connection.Conn;

/**
 * Servlet implementation class ShopLoginServlet
 */
@WebServlet("/ShopLoginServlet")
public class ShopLoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ShopLoginServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		HttpSession session = request.getSession();
		Conn con = new Conn();
		Connection connection = con.connection;
		int i = 0;
		String email =(String) request.getParameter("email");
		String pass =(String) request.getParameter("pass");
		ShopDTO shop = new ShopDTO();
		try {
			String sql = "SELECT s.shopId, s.name, s.email, s.password, s.number, s.typeOfShop, s.status,  sd.shopeName, sd.addressOne, sd.addressTwo, sd.city, sd.state FROM shop s JOIN shopDetaild sd ON s.shopId = sd.sid where s.email='"+email+"' and s.password='"+pass+"';";
	        PreparedStatement stm = connection.prepareStatement(sql);
	        ResultSet rs = stm.executeQuery();
	        while (rs.next()) {
	        	
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
	            i=1;
			}
	        if(i>0) {
	        	if (shop.getStatus() != null && shop.getStatus().equals("accept")) {
	                // Set all the relevant attributes in the session
	                session.setAttribute("sid", shop.getSid());
	                session.setAttribute("name", shop.getName());
	                session.setAttribute("shopemail", shop.getEmail());
	                session.setAttribute("phone", shop.getPhone());
	                session.setAttribute("shopType", shop.getShopType());
	                session.setAttribute("status", shop.getStatus());
	                session.setAttribute("shopName", shop.getShopName());
	                session.setAttribute("addressOne", shop.getAddressOne());
	                session.setAttribute("addressTwo", shop.getAddressTwo());
	                session.setAttribute("city", shop.getCity());
	                session.setAttribute("state", shop.getState());
	                String update = "UPDATE shop SET active = 'active' WHERE shopId="+shop.getSid()+";";
			    	
	    	    	try {
	    	    		java.sql.Statement statement = connection.createStatement();
	    		        int rowsAffected = statement.executeUpdate(update);
	    		        if(rowsAffected > 0) {
	    		        	response.sendRedirect("shopHome.jsp");
	    		        }
	    		        statement.close();
	    			} catch (Exception e) {
	    				System.out.println(e);
	    			}
	                
	                
	            }else {
	            	response.sendRedirect("index.jsp?message=shopLoginFailedPleaseContactMunicipality");
	            } 	
	            
	        }else {
	        	response.sendRedirect("index.jsp?message=shopLoginFailed");
	        }
	        
	        
		} catch (Exception e) {
			// TODO: handle exception
		}
	}

}
