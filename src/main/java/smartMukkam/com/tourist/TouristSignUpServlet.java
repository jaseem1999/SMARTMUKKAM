package smartMukkam.com.tourist;

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

/**
 * Servlet implementation class TouristSignUpServlet
 */
@MultipartConfig(maxFileSize = 16177215)
@WebServlet("/TouristSignUpServlet")
public class TouristSignUpServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public TouristSignUpServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
			String email = request.getParameter("email");
	        String name = request.getParameter("name");
	        Long phone = Long.parseLong(request.getParameter("phone"));
	        String password = request.getParameter("password");
	        Part part1 = request.getPart("license");
	        InputStream inpPdf = part1.getInputStream();
	        Part part2 = request.getPart("image");
	        InputStream inpImg = part2.getInputStream();
	        String touristname = request.getParameter("touristname");
	        String address1 = request.getParameter("address1");
	        String address2 = request.getParameter("address2");
	        String city = request.getParameter("city");
	        String state = request.getParameter("state");
	        Integer pin =Integer.parseInt(request.getParameter("pin"));

	        // JDBC variables
	        Connection connection = null;
	        PreparedStatement preparedStatement1 = null;
	        PreparedStatement preparedStatement2 = null;

	        try {
	            // Establish a connection
	            Conn con = new Conn();
	            connection = con.connection;

	            // Insert data into the shop table
	            String insertShopQuery = "INSERT INTO tourist(name, email, password, phone, License) VALUES (?, ?, ?, ?, ?)";
	            preparedStatement1 = connection.prepareStatement(insertShopQuery);
	            preparedStatement1.setString(1, name);
	            preparedStatement1.setString(2, email);
	            preparedStatement1.setString(3, password);
	            preparedStatement1.setLong(4, phone);
	            preparedStatement1.setBlob(5, inpPdf);
	            preparedStatement1.executeUpdate();

	            // Get the generated shopId
	            String getShopIdQuery = "SELECT LAST_INSERT_ID() AS last_id FROM tourist";
	            preparedStatement2 = connection.prepareStatement(getShopIdQuery);
	            int tourisId = -1;
	            if (preparedStatement2.execute()) {
	                var resultSet = preparedStatement2.getResultSet();
	                if (resultSet.next()) {
	                	tourisId = resultSet.getInt("last_id");
	                }
	            }

	            // Insert data into the shopDetails table
	            String insertShopDetailsQuery = "INSERT INTO tourist_details (toid, image, touristPlace, addressOne, addressTwo, city, state ,pin) VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
	            preparedStatement1 = connection.prepareStatement(insertShopDetailsQuery);
	            preparedStatement1.setInt(1, tourisId);
	            preparedStatement1.setBlob(2, inpImg);
	            preparedStatement1.setString(3, touristname);
	            preparedStatement1.setString(4, address1);
	            preparedStatement1.setString(5, address2);
	            preparedStatement1.setString(6, city);
	            preparedStatement1.setString(7, state);
	            preparedStatement1.setInt(8, pin);

	            // Execute the insert statement for shopDetails
	            preparedStatement1.executeUpdate();

	            // Redirect to a success page
	            response.sendRedirect("index.jsp?message=touristRegistrationSuccess");
	        } catch (SQLException e) {
	            e.printStackTrace();
	            // Redirect to a failure page
	            response.sendRedirect("index.jsp?message=touristRegistrationFailed");
	        } finally {
	            // Close JDBC objects
	            try {
	                if (preparedStatement1 != null) {
	                    preparedStatement1.close();
	                }
	                if (preparedStatement2 != null) {
	                    preparedStatement2.close();
	                }
	                if (connection != null) {
	                    connection.close();
	                }
	            } catch (SQLException e) {
	                e.printStackTrace();
	            }

	            // Close the InputStreams
	            if (inpPdf != null) {
	                inpPdf.close();
	            }
	            if (inpImg != null) {
	                inpImg.close();
	            }
	        }
	}

}
