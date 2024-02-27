package smartMukkam.com.shop;

import java.io.IOException;
import java.io.InputStream;
import java.math.BigDecimal;
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
 * Servlet implementation class AdsServlet
 */
@MultipartConfig(maxFileSize = 16177215) // 16 MB
@WebServlet("/AdsServlet")
public class AdsServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdsServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		Conn con = new Conn();
    	
        Integer sid = Integer.parseInt(request.getParameter("sid"));
        String product = request.getParameter("product");
        String description = request.getParameter("description");
        BigDecimal price = new BigDecimal(request.getParameter("price"));
        BigDecimal discount = new BigDecimal(request.getParameter("discount"));
        String link = request.getParameter("link");

        InputStream imageInputStream = null;
        Part filePart = request.getPart("image");
        if (filePart != null) {
            imageInputStream = filePart.getInputStream();
        }

        // JDBC code to insert data into the database
        Connection connection = con.connection;
        PreparedStatement preparedStatement = null;

        try {
            // Initialize database connection
            // Connection connection = ...

            // SQL query to insert data
            String sql = "INSERT INTO ads (sid, image, product, description, price, discount, link) VALUES (?, ?, ?, ?, ?, ?, ?)";
            preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setInt(1, sid);
            preparedStatement.setBlob(2, imageInputStream);
            preparedStatement.setString(3, product);
            preparedStatement.setString(4, description);
            preparedStatement.setBigDecimal(5, price);
            preparedStatement.setBigDecimal(6, discount);
            preparedStatement.setString(7, link);

            // Execute the query
            preparedStatement.executeUpdate();

            // Redirect or send a response back to the client
            response.sendRedirect("shopAdvertisement.jsp?message=AdsAddedSuccess"); // Replace with the appropriate URL

        } catch (SQLException e) {
            // Handle exceptions
            e.printStackTrace();
            response.sendRedirect("shopAdvertisement.jsp?message=AdsAddedFailed"); // Replace with the appropriate URL for error handling
        } finally {
            // Close resources (connection, statement, input stream)
            if (preparedStatement != null) {
                try {
                    preparedStatement.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
            if (connection != null) {
                try {
                    connection.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
            if (imageInputStream != null) {
                try {
                    imageInputStream.close();
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }
        }

		
	}

}
