package smartMukkam.com.hotel;

import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import smartMukkam.connection.Conn;

@WebServlet("/AddRoomServlet")
@MultipartConfig(maxFileSize = 16177215)
public class AddRoomServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public AddRoomServlet() {
        super();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Obtain form parameters
        int hoid = Integer.parseInt(request.getParameter("hoid"));
        String room = request.getParameter("room");
        int noRoom = Integer.parseInt(request.getParameter("no"));
        String description = request.getParameter("description");
        double price = Double.parseDouble(request.getParameter("price"));
        double discount = Double.parseDouble(request.getParameter("discount"));
         // You can set status as per your requirement
        
        InputStream inputStream = null; // For image

        // Part of the form that handles file upload
        Part filePart = request.getPart("image");
        if (filePart != null) {
            // Obtains input stream of the upload file
            inputStream = filePart.getInputStream();
        }

        // Database connection
        Conn con = new Conn();
        Connection connection = con.connection;

        try {
            // Connect to database
            

            // SQL statement to insert data into room table
            String sql = "INSERT INTO room (hoid, image, room, noRoom, description, price, discount) VALUES (?, ?, ?, ?, ?, ?, ?)";
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setInt(1, hoid);
            statement.setBlob(2, inputStream);
            statement.setString(3, room);
            statement.setInt(4, noRoom);
            statement.setString(5, description);
            statement.setDouble(6, price);
            statement.setDouble(7, discount);
           

            // Execute the statement
            int row = statement.executeUpdate();
            if (row > 0) {
                response.sendRedirect("hotelRoomBooking.jsp?message=addSuccess");
            } else {
            	response.sendRedirect("hotelRoomBooking.jsp?message=addFailed");
            }
        } catch (SQLException ex) {
            	System.out.println(ex.getMessage());
        } finally {
            // Close database connection
            if (connection != null) {
                try {
                	connection.close();
                } catch (SQLException ex) {
                    ex.printStackTrace();
                }
            }
            
        }
    }
}

