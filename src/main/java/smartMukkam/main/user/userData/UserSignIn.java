package smartMukkam.main.user.userData;

import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Random;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import smartMukkam.connection.Conn;

/**
 * Servlet implementation class UserSignIn
 */
@MultipartConfig
@WebServlet("/UserSignIn")
public class UserSignIn extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UserSignIn() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
		 String email = request.getParameter("email");
	        String name = request.getParameter("name");
	        long phone = Long.parseLong(request.getParameter("phone"));
	        Part part = request.getPart("image");
	        
	        InputStream pimg = part.getInputStream();
	        
	        String password = request.getParameter("password");
	        String confirmPassword = request.getParameter("conPassword");
	        String country = request.getParameter("country");
	        String surname = request.getParameter("surname");
	        String address1 = request.getParameter("address1");
	        String address2 = request.getParameter("address2");
	        String city = request.getParameter("city");
	        String state = request.getParameter("state");
	        Integer pin = Integer.parseInt(request.getParameter("pin"));

	       

	        // Your further logic goes here
	        
	        Conn conn = new Conn();
	        Connection connection = conn.connection;
	        
	        try {
	        	String insertQuery = "INSERT INTO User (name, email, password, number, country) VALUES (?, ?, ?, ?, ?)";
	        	PreparedStatement statement = connection.prepareStatement(insertQuery);
	        	
	        	statement.setString(1, name);
	        	statement.setString(2, email);
	        	statement.setString(3, password);
	        	statement.setLong(4, phone);
	        	statement.setString(5, country);
	        	System.out.println(name);
	        	int rowsInserted = statement.executeUpdate();
	        	
	        	if(rowsInserted > 0) {
	        		int uid = 0;
	        		try {
	        			String sql = "select userId from User where email='"+email+"';";
		    			PreparedStatement stm =connection.prepareStatement(sql);
		    			ResultSet rs=stm.executeQuery();
		    			while(rs.next()) {
		    				uid = rs.getInt(1);
		    			}
		    			
		    			
		    			try {
		    				String insertQueryToAddress ="INSERT INTO userAddress (uid, image, surname, addressOne, addressTwo, city, state, PIN) VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
		    				PreparedStatement statementToAddress = connection.prepareStatement(insertQueryToAddress);
		    				statementToAddress.setInt(1, uid);
		    				statementToAddress.setBlob(2, pimg);
		    				statementToAddress.setString(3, surname);
		    				statementToAddress.setString(4, address1);
		    				statementToAddress.setString(5, address2);
		    				statementToAddress.setString(6, city);
		    				statementToAddress.setString(7, state);
		    				statementToAddress.setInt(8, pin);
		    				int rowsInsertedAddress = statementToAddress.executeUpdate();
		    				if(rowsInsertedAddress > 0) {
		    					response.sendRedirect("index.jsp?message=userSigninSuccess");
		    					System.out.println("success");
		    				}else {
		    					response.sendRedirect("index.jsp?message=userSigninFailed");
		    				}
		    				
						} catch (Exception e) {
							// TODO: handle exception
							System.out.println(e);
						}
		    			
		    			
					} catch (Exception e) {
						// TODO: handle exception
						System.out.println(e);
					}
	        		
	    			
	        	}else {
	        		response.sendRedirect("userSignup.jsp?message=userSigninFailed");
	        	}
	  
	        	
			} catch (Exception e) {
				// TODO: handle exception
				System.out.println(e);
				response.sendRedirect("userSignup.jsp?message=userSigninFailed");
			}
			
	        
	        
	        // Optionally, you can send a response back to the client
		
		
	}

}
