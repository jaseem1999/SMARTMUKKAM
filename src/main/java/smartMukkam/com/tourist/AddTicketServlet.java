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

@WebServlet("/AddTicketServlet")
@MultipartConfig(maxFileSize = 16177215)
public class AddTicketServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public AddTicketServlet() {
        super();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        Conn con = new Conn();
        Connection connection = con.connection;

        // Get form data
        int toId = Integer.parseInt(request.getParameter("toid"));
        System.out.println(toId);
        String ticketName = (String)request.getParameter("ticket");
        System.out.println(ticketName);
        int numberOfSlots = Integer.parseInt(request.getParameter("no"));
        double price = Double.parseDouble(request.getParameter("price"));
        Part filePart = request.getPart("image");
        InputStream imageInputStream = filePart.getInputStream();

        try {
            // Insert data into the tickSlot table
            String insertQuery = "INSERT INTO tickSlot (toid, ticket, slot, price, image) VALUES (?, ?, ?, ?, ?)";
            try (PreparedStatement preparedStatement = connection.prepareStatement(insertQuery)) {
                preparedStatement.setInt(1, toId);
                preparedStatement.setString(2, ticketName);
                preparedStatement.setInt(3, numberOfSlots);
                preparedStatement.setDouble(4, price);
                preparedStatement.setBlob(5, imageInputStream);

                int rowsAffected = preparedStatement.executeUpdate();

                if (rowsAffected > 0) {
                    // Successfully inserted
                    response.sendRedirect("touristTicket.jsp?message=success"); // Redirect to a success page
                } else {
                    // Failed to insert
                    response.sendRedirect("touristTicket.jsp?message=failed"); // Redirect to an error page
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
            response.sendRedirect("error.jsp"); // Redirect to an error page
        }
    }
}
