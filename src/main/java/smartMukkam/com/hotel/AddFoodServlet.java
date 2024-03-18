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

@MultipartConfig(maxFileSize = 16177215)
@WebServlet("/AddFoodServlet")
public class AddFoodServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Conn con = new Conn();
        try (Connection connection = con.connection) {
            int hoid = Integer.parseInt(request.getParameter("hoid"));
            String food = request.getParameter("food");
            int noRoom = Integer.parseInt(request.getParameter("no"));
            String description = request.getParameter("description");
            double price = Double.parseDouble(request.getParameter("price"));
            double discount = Double.parseDouble(request.getParameter("discount"));

            InputStream inputStream = null;
            Part filePart = request.getPart("image");
            if (filePart != null) {
                inputStream = filePart.getInputStream();
            }

            String sql = "INSERT INTO food (hoid, image, food, quandity, description, price, discount) VALUES (?, ?, ?, ?, ?, ?, ?)";
            try (PreparedStatement statement = connection.prepareStatement(sql)) {
                statement.setInt(1, hoid);
                if (inputStream != null) {
                    statement.setBinaryStream(2, inputStream);
                }
                statement.setString(3, food);
                statement.setInt(4, noRoom);
                statement.setString(5, description);
                statement.setDouble(6, price);
                statement.setDouble(7, discount);

                int row = statement.executeUpdate();
                if (row > 0) {
                    response.sendRedirect("hotelFood.jsp?message=addSuccess");
                } else {
                    response.sendRedirect("hotelFood.jsp?message=addFailed");
                }
            } catch (SQLException ex) {
                ex.printStackTrace();
                response.sendRedirect("hotelFood.jsp?message=addFailed");
            } finally {
                if (inputStream != null) {
                    inputStream.close();
                }
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
            response.sendRedirect("hotelFood.jsp?message=addFailed");
        }
    }
}
