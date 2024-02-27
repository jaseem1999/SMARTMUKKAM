package smartMukkam.com.shop;

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

@WebServlet("/ShopRegistrationServlet")
@MultipartConfig(maxFileSize = 16177215) // Set max file size for uploaded files
public class ShopRegistrationServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String email = request.getParameter("email");
        String name = request.getParameter("name");
        Long phone = Long.parseLong(request.getParameter("phone"));
        String password = request.getParameter("password");
        String type = request.getParameter("shop");
        Part part1 = request.getPart("license");
        InputStream inpPdf = part1.getInputStream();
        Part part2 = request.getPart("image");
        InputStream inpImg = part2.getInputStream();
        String shopname = request.getParameter("shopname");
        String address1 = request.getParameter("address1");
        String address2 = request.getParameter("address2");
        String city = request.getParameter("city");
        String state = request.getParameter("state");

        // JDBC variables
        Connection connection = null;
        PreparedStatement preparedStatement1 = null;
        PreparedStatement preparedStatement2 = null;

        try {
            // Establish a connection
            Conn con = new Conn();
            connection = con.connection;

            // Insert data into the shop table
            String insertShopQuery = "INSERT INTO shop (name, email, password, number, typeOfShop, License) VALUES (?, ?, ?, ?, ?, ?)";
            preparedStatement1 = connection.prepareStatement(insertShopQuery);
            preparedStatement1.setString(1, name);
            preparedStatement1.setString(2, email);
            preparedStatement1.setString(3, password);
            preparedStatement1.setLong(4, phone);
            preparedStatement1.setString(5, type);
            preparedStatement1.setBlob(6, inpPdf);
            preparedStatement1.executeUpdate();

            // Get the generated shopId
            String getShopIdQuery = "SELECT LAST_INSERT_ID() AS last_id FROM shop";
            preparedStatement2 = connection.prepareStatement(getShopIdQuery);
            int shopId = -1;
            if (preparedStatement2.execute()) {
                var resultSet = preparedStatement2.getResultSet();
                if (resultSet.next()) {
                    shopId = resultSet.getInt("last_id");
                }
            }

            // Insert data into the shopDetails table
            String insertShopDetailsQuery = "INSERT INTO shopDetaild (sid, image, shopeName, addressOne, addressTwo, city, state) VALUES (?, ?, ?, ?, ?, ?, ?)";
            preparedStatement1 = connection.prepareStatement(insertShopDetailsQuery);
            preparedStatement1.setInt(1, shopId);
            preparedStatement1.setBlob(2, inpImg);
            preparedStatement1.setString(3, shopname);
            preparedStatement1.setString(4, address1);
            preparedStatement1.setString(5, address2);
            preparedStatement1.setString(6, city);
            preparedStatement1.setString(7, state);

            // Execute the insert statement for shopDetails
            preparedStatement1.executeUpdate();

            // Redirect to a success page
            response.sendRedirect("index.jsp?message=shopRegistrationSuccess");
        } catch (SQLException e) {
            e.printStackTrace();
            // Redirect to a failure page
            response.sendRedirect("index.jsp?message=shopRegistrationFailed");
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
