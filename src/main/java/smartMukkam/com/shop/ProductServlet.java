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

@WebServlet("/ProductServlet")
@MultipartConfig(maxFileSize = 16177215) // 16 MB
public class ProductServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    	Conn con = new Conn();
    	
        Integer sid = Integer.parseInt(request.getParameter("sid"));
        String product = request.getParameter("product");
        String description = request.getParameter("description");
        BigDecimal price = new BigDecimal(request.getParameter("price"));
        BigDecimal discount = new BigDecimal(request.getParameter("discount"));

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
            String sql = "INSERT INTO product (sid, image, product, description, price, discount) VALUES (?, ?, ?, ?, ?, ?)";
            preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setInt(1, sid);
            preparedStatement.setBlob(2, imageInputStream);
            preparedStatement.setString(3, product);
            preparedStatement.setString(4, description);
            preparedStatement.setBigDecimal(5, price);
            preparedStatement.setBigDecimal(6, discount);

            // Execute the query
            preparedStatement.executeUpdate();

            // Redirect or send a response back to the client
            response.sendRedirect("shopAddproduct.jsp?message=productAddedSuccess"); // Replace with the appropriate URL

        } catch (SQLException e) {
            // Handle exceptions
            e.printStackTrace();
            response.sendRedirect("shopAddproduct.jsp?message=productAddedFailed"); // Replace with the appropriate URL for error handling
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
