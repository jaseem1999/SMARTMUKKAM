package smartMukkam.com.tourist;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import smartMukkam.connection.Conn;

@WebServlet("/BookTicketServlet")
public class BookTicketServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public BookTicketServlet() {
        super();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        Conn con = new Conn();
        Connection connection = con.connection;

        String uid = request.getParameter("uid");
        String toid = request.getParameter("toid");
        String ticketId = request.getParameter("ticketId");
        String ticket = request.getParameter("ticket");
        String slot = request.getParameter("slot");
        String price = request.getParameter("price");
        
        int totalSlot = TouristDAO.getSlot(Integer.parseInt(ticketId));
        int bookSlot = TouristDAO.getSlotOnBooked(Integer.parseInt(ticketId));
        
        if((totalSlot - bookSlot) > Integer.parseInt(slot)) {

	        try {
	            // Create a prepared statement to insert data into the ticketBooking table
	            String insertQuery = "INSERT INTO ticketBooking (toid, uid, ticketId, slot) VALUES (?, ?, ?, ?)";
	            PreparedStatement preparedStatement = connection.prepareStatement(insertQuery);
	
	            // Set values for the prepared statement
	            preparedStatement.setInt(1, Integer.parseInt(toid));
	            preparedStatement.setInt(2, Integer.parseInt(uid));
	            preparedStatement.setInt(3, Integer.parseInt(ticketId));
	            preparedStatement.setInt(4, Integer.parseInt(slot));
	    
	
	            // Execute the prepared statement to insert data
	            int rowsAffected = preparedStatement.executeUpdate();
	
	            // Check if the data insertion was successful
	            if (rowsAffected > 0) {
	                
	                // You can redirect the user to a confirmation page or perform additional actions
	                response.sendRedirect("userTouristPages.jsp?id="+Integer.parseInt(toid)+"&message=ticketSuccess");
	            } else {
	                
	                // Handle the case where ticket booking fails
	                // You may want to redirect the user to an error page or display an error message
	                response.sendRedirect("userTouristPages.jsp?id="+Integer.parseInt(toid)+"&message=ticketFailed");
	            }
	
	        } catch (SQLException e) {
	            System.out.println("SQLException: " + e.getMessage());
	            // Handle the SQLException
	            // You may want to redirect the user to an error page or display an error message
	            
	        } finally {
	            // Close the database connection
	            try {
	                if (connection != null) {
	                    connection.close();
	                }
	            } catch (SQLException e) {
	                e.printStackTrace();
	            }
	        }
        }else {
        	response.sendRedirect("userTouristPages.jsp?id="+Integer.parseInt(toid)+"&message=ticketFull");
        }
    }
}
