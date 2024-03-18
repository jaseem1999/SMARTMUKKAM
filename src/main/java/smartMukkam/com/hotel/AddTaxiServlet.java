package smartMukkam.com.hotel;
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

@MultipartConfig(maxFileSize = 16177215)
@WebServlet("/AddTaxiServlet")
public class AddTaxiServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int hoid = Integer.parseInt(request.getParameter("hoid"));
        String driver = request.getParameter("taxi");
        String vehicle = request.getParameter("vehicle");
        String plate = request.getParameter("plate");
        BigDecimal price = new BigDecimal(request.getParameter("price"));

        InputStream inputStream = null;
        Part filePart = request.getPart("image");
        if (filePart != null) {
            inputStream = filePart.getInputStream();
        }
        Conn con = new Conn();
        try (Connection connection = con.connection) {
            String sql = "INSERT INTO taxi (hoid, image, driver, vehicle, plate, price) VALUES (?, ?, ?, ?, ?, ?)";
            try (PreparedStatement statement = connection.prepareStatement(sql)) {
                statement.setInt(1, hoid);
                if (inputStream != null) {
                    statement.setBlob(2, inputStream);
                }
                statement.setString(3, driver);
                statement.setString(4, vehicle);
                statement.setString(5, plate);
                statement.setBigDecimal(6, price);

                int rowsInserted = statement.executeUpdate();
                if (rowsInserted > 0) {
                    response.sendRedirect("hotelTaxi.jsp?message=addSuccess"); // Redirect to success page
                } else {
                	response.sendRedirect("hotelTaxi.jsp?message=addFailed"); // Redirect to error page
                }
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
            response.sendRedirect("hotelTaxi.jsp?message=addFailed"); // Redirect to error page
        } finally {
            if (inputStream != null) {
                inputStream.close();
            }
        }
    }
}

